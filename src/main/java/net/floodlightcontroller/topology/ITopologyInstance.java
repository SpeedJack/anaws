package net.floodlightcontroller.topology;

import java.util.List;

import org.projectfloodlight.openflow.types.DatapathId;
import org.projectfloodlight.openflow.types.OFPort;

import net.floodlightcontroller.routing.Path;

public interface ITopologyInstance
{
	public Path getPath(DatapathId srcId, DatapathId dstId);
	public Path getPath(DatapathId srcId, OFPort srcPort, DatapathId dstId, OFPort dstPort);

	public List<Path> getPathsFast(DatapathId src, DatapathId dst, int k);
	public List<Path> getPathsSlow(DatapathId src, DatapathId dst, int k);

	public boolean pathExists(DatapathId srcId, DatapathId dstId);
}
