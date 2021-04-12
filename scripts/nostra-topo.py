#!/usr/bin/env python

"""
"""
from mininet.topo import Topo

class Tower( Topo ):
    "Internet Topology Zoo Specimen."

    def addSwitch( self, name, **opts ):
        kwargs = { 'protocols' : 'OpenFlow15' }
        kwargs.update( opts )
        return super(Tower, self).addSwitch( name, **kwargs )

    def __init__(self):
        Topo.__init__(self)
        switches = []
        for i in range(10):
            sn = i + 1
            switch = self.addSwitch( 's%d' % sn )
            switches.append(switch)
            if (i % 3 == 0):
                host = self.addHost( 'h%d' % sn )
                self.addLink(host, switch)
        links = {		
            1 : [
                2,3,4,5
            ],
            2: [
                3,6,7
            ],
            3: [
                4,7,8,9
            ],
            4: [
                5,9,10
            ],
            5: [],
            6: [
                7
            ],
            7: [
                8,9
            ],
            8: [
                9
            ],
            9: [
                10
            ],
            10: []
        }
        for a,b_list in links.items():
            for b in b_list:
                self.addLink(switches[a-1],switches[b-1])

topos = { 'tower': ( lambda: Tower() ) }

if __name__ == '__main__':
    from onosnet import run
    run( Tower() )
