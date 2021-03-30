# Virtual Local Address Network
A **local area network** refers to a network with a single addressing 
space.
So all the IP addresses in the subnet could form a LAN, but usually refers
to a small contained location.

**Virtual Local Access Networks** refer to machines that are located on the
same address network but act as two different networks.
If we wanted to group only some devices within a LAN, we could create logical
connections between the machines, even if they don't share a cable.

We would need to modify the Ehternet frame header with 4 bytes of information.
For example, one of the bits is the ID of the vlan on the network.

Since one of the fields is the ID, we can encapsulate the IDs one inside another.
This is done whenever there are a large number of users.
VXLAN, or **extensible** VLAN, can have virtual networks that reside on 
different physical networks altogether, by creating a tunnel between the 
routers of the network.

## Ethernet VPN
This refers to creating a layer 2 (data link) VPN.
The idea is to carry ethernet frames using a VPN.

There are many protocols that make this happen:
1. BGP: Border Gateway Protocol, which sends data through vary distant networks.
2. MPLS: Uses short labels to perform the lookup on the switch/router.
3. VXLAN: Grouping the physical devices from different networks as if they are
on a single one.
4. PBB: Algorithm which wraps a datagram inside of another datagram.

Since Ethernet floods the network with packets, to modify Ehternet to run
in different scenarios with connection-oriented connections we would have to 
treat MAC addresses as routing information.
