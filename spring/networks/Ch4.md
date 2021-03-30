# Software Router and Network Function Virtualization
Inside each router, there is a **routing table**, which just 
lists the routing information. 
**Routing protocols** are used to construct the routing table.
Sometimes we make **static routes**, which are set in the router's table
and are not dynamic.

The **forwarding information base** is a simpler routing table made from 
the routing table.
in this table there are only the interfaces chosen by the routing algorithms.
When a packet comes to an interface on the router, we can quickly consult the FIB
for the appropriate output interface.
This is perhaps quicker than having to consult the routing table for every packet,
since the FIB can come in a pre-compiled format optimized for lookups.

Thus, the central route calculation can take place in the **control plane**,
and the actual simple forwarding can take place in the **data plane**.
Separating the two could lead to more flexibility when performing the
network topology calculation and the actual grunt forwarding job.

## Virtual Interfaces
A **VIF** can is an abstract representation of a network interface.
This could either represent a physical mapping from the virtual interface to an 
actual output interface or not.

For example, the *loopback interface* is a virtual interface that maps to the 
same computer the application is running on.
This loopback interface will just send the packet right up the network stack once
it receives a request.

## Virtual Routing and Forwarding
This is similar to having multiple routing tables simultaneously in the router.
It has its own independent routing table entries, independent from the core router
or other VRF instances.

Inside of a typical router, the NOS layer of the router is the vendor-specific.
The NOS contains the management and routing functionality, so I would guess here 
is where the VRF and everything else is carried out.

The issue with having integrated control and data plane is that this architecture is not 
scalable. 
The forwarding part is not used as efficiently as it could be, and it might be challenging
to change.
Congestion follows since we have to constantly check the routing table for all the info,
and different interfaces might be trying to do this.

A separated control plane would have better view of the entire system, including 
network topology as well as the indvidual router.
Using the `zebra` daemon, we could through software push a route to the FIB or 
otherwise learn that information.

## ONOS vRouter Overview
The **Open Network Operating System** can configure routes in the switch.
This is part of the control plane.

In order to achieve the separation of the data plane and control plane, 
we need to have a way for the quagga host (which manages routing) to connect
to the data plane.
There has to be a physical connection between quagga and the onos server.
