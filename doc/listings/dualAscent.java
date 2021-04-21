protected BroadcastTree dualAscent(Map<DatapathId, Set<Link>> links,
	DatapathId src, DatapathId dst,
	Map<Link, Integer> linkCost, boolean isDstRooted)
{
	Graph completeGraph = new Graph(links);
	Graph auxiliaryGraph = new Graph();
	connections = new HashMap<>();

	if (linkCost == null)
		linkCost = new HashMap<>();
	reducedCost.clear();
	finalRootComponents.clear();

	auxiliaryGraph.setRoot(isDstRooted ? dst : src);
	if (!completeGraph.hasNode(auxiliaryGraph.getRoot()))
		return new BroadcastTree();

	for (DatapathId node: completeGraph.getNodes()) {
		if (!node.equals(auxiliaryGraph.getRoot()))
			auxiliaryGraph.addTarget(node);
		connections.put(node, new HashMap<DatapathId, Boolean>());
		for (DatapathId internalNode: completeGraph.getNodes())
			connections.get(node).put(internalNode, (node.equals(internalNode)));
		for (Link link: completeGraph.getLinks(node)) {
			if (linkCost.get(link) == null)
				linkCost.put(link, 1);
			reducedCost.put(link, linkCost.get(link));
		}
	}

	Set<DatapathId> rootComponent;
	while ((rootComponent = findRootComp(completeGraph, auxiliaryGraph)) != null) {
		Link minLink = findMinArc(rootComponent, completeGraph, auxiliaryGraph);
		if (minLink == null)
			finalRootComponents.add(rootComponent);
		editCosts(rootComponent, minLink, completeGraph);
		addArc(minLink, auxiliaryGraph, completeGraph);
	}

	HashSet<DatapathId> toRemove = new HashSet<>();
	for (DatapathId node: auxiliaryGraph.getNodes())
		if (!areConnected(auxiliaryGraph.getRoot(), node))
			toRemove.add(node);
	for (DatapathId node: toRemove)
		auxiliaryGraph.remove(node);

	if (isDstRooted) {
		Map<DatapathId, Set<Link>> newLinks = new HashMap<>();
		for (DatapathId node: auxiliaryGraph.getNodes()) {
			newLinks.put(node, new HashSet<>());
			for (Link directLink: auxiliaryGraph.getLinks(node))
				for (Link oppositeLink: completeGraph.getLinks(node)) {
					DatapathId directSrc = directLink.getSrc();
					DatapathId directDst = directLink.getDst();
					DatapathId oppositeSrc = oppositeLink.getSrc();
					DatapathId oppositeDst = oppositeLink.getDst();
					if (directSrc.equals(oppositeDst) &&
						directDst.equals(oppositeSrc))
						newLinks.get(node).add(oppositeLink);
				}
		}
		for (DatapathId node: auxiliaryGraph.getNodes()) {
			auxiliaryGraph.getLinks(node).clear();
			for (Link oppositeLink: newLinks.get(node))
				auxiliaryGraph.addLink(oppositeLink);
		}
	}

	BroadcastTree tree = buildBroadcastTree(linkCost, auxiliaryGraph, isDstRooted);
	return tree;
}
