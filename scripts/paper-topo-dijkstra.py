#!/usr/bin/env python

"""
"""
from mininet.topo import Topo

class Tower( Topo ):
    "Internet Topology Zoo Specimen."

    def addSwitch( self, name, **opts ):
        kwargs = { 'protocols' : 'OpenFlow13' }
        kwargs.update( opts )
        return super(Tower, self).addSwitch( name, **kwargs )

    def __init__(self):
        Topo.__init__(self)
        switches = []
        for i in range(20):
            sn = i + 1
            switch = self.addSwitch( 's%d' % sn )
            switches.append(switch)
            if (i == 0 or i == 5 or i == 19):
                host = self.addHost( 'h%d' % sn )
                self.addLink(host, switch)
        links = {		
            1 : [
                2,3,4,5
            ],
            2: [
            ],
            3: [
            ],
            4: [
            ],
            5: [
                11
            ],
            6: [
                7,12
            ],
            7: [
            ],
            8: [
            ],
            9: [
            ],
            10: [
            ],
            11 : [
                16
            ],
            12: [
                13,17
            ],
            13: [
            ],
            14: [
            ],
            15: [
            ],
            16: [
                19
            ],
            17: [
                18
            ],
            18: [
                20
            ],
            19: [
                20
            ],
            20: []
        }
        for a,b_list in links.items():
            for b in b_list:
                self.addLink(switches[a-1],switches[b-1])

topos = { 'tower': ( lambda: Tower() ) }

if __name__ == '__main__':
    from onosnet import run
    run( Tower() )
