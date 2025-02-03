# Livox LIDAR, especially for the Avia

## General Setup

Manual for our Livox Avia: <https://www.oxts.com/wp-content/uploads/2021/08/Livox-AVIA-User-Manual_EN_compressed.pdf>

Wiki: <https://livox-wiki-en.readthedocs.io/en/latest/>

* "All Avia LiDAR sensors are set to static IP address
mode by default with an IP address of 192.168.1.1XX (XX stands for the last two digits on the serial number of
the Avia LiDAR sensor). The default subnet masks of the Avia LiDAR sensors are all 255.255.255.0, and their
default gateways are 192.168.1.1."
* Set the static IP address of the laptop computer to `192.168.1.50` and the subnet mask to `255.255.255.0` and gateway `192.168.1.1`.
* The `auto_connect` in the GUI or python seems to find it just fine. If not...
* I scaned the whole subnet with `nmap 192.168.1.*` and found a response on `192.168.1.128`. I can `ping 192.168.1.128` and it responds. The last number in the IP address is initially configured to match the serial number, but it could have changed.

## Livox-SDK-Communication-Protocol

A document on what messages go over the ethernet:
<https://github.com/Livox-SDK/Livox-SDK/wiki/Livox-SDK-Communication-Protocol>
It includes Avia as of 2020/10/26


## Software Libraries

* <https://www.livoxtech.com/sdk> has a link to lots of official and semi-official things. Avia uses the SDK, not the SDK2.
* <https://github.com/Livox-SDK/Livox-SDK> is the official C++ SDK.
* <https://github.com/Livox-SDK/openpylivox> is older and forked from <https://github.com/ryan-brazeal-ufl/OpenPyLivox> and is a "near complete, fully pythonic, implementation of the Livox SDK." It's not written for the Avia, but seems to kind of work. Maybe we can add to it. You can call things like `setLidarReturnMode(2)` for the strongest 2 returns, but not `setLidarReturnMode(3)`, which we should do for the Aiva. If you look at the [code](https://github.com/ryan-brazeal-ufl/OpenPyLivox/blob/master/openpylivox/openpylivox.py#L2976), it quiestly skips everything but 0, 1, and 2. We should be able to update this by reading the [SDK-Communication-Protocol](https://github.com/Livox-SDK/Livox-SDK/wiki/Livox-SDK-Communication-Protocol).
* <https://github.com/Livox-SDK/livox_high_precision_mapping> seems promising.

## Reading data in realtime:

See 

## Coordinate Systems

Avionics and drones (DJI, MAVLink, PX4, Ardupilot) typically use a coordinate system where the z axis points down, probably so that increasing yaw angle (right-handed rotation with your thumb down along the z axis) leads to increasing compass orientation.

The world coordinates for the drone flight controller are:
* X North, Y East, Z Down (NED) "Ned"

Drone body coordinates are:
* X Forward, Y Right, Z Down (FRD) or "Fred"

Unfortunately, Livox (p16 of Avia manual) and robot operating system (ROS) use slightly different systems where the Z axis points up and there are no cute names:
* X Forward, Y Left, Z Up (FLU) and
* X East, Y North, Z Up (ENU)

But these are a simply re-ordering and negation.

Fortunately, all 4 of these are right handed in the sense that x cross y = z. Otherwise cross products and quarternion rotations don't work.

## Analysis

* [Livox Coordinate System](<https://livox-wiki-en.readthedocs.io/en/latest/introduction/Point_Cloud_Characteristics_and_Coordinate_System%20.html#coordinate-system>):
    - X points out of the Front
    - Y poiints to the Left as you're looking from the back, along the way way that the laser is pointing.
    - Z point Up
    - This forms a right-handed coordinate system, but is not the same as the Front-Right-Down (FRD) system of a drone or the North-East-Down (NED) global coordinates for drones.
* The Avia manual has a drawing and says, "The origin O' of IMU coordinate is defined in the point cloud coordinates as (-41.65, -23.26, 28.40) (Unit: mm)."
* IMU data
    - gyro_x, gyro_y, and gyro_z have Unit: rad/s
    - acc_x, acc_y, and acc_z, have Unit: g
    - x, y, and z have units of integer mm if returned as int32
    - Reflectivity is 0-255
    - Tag is a bitmask reporting confidence. See [Tag Information](https://livox-wiki-en.readthedocs.io/en/latest/tutorials/new_product/mid360/livox_eth_protocol_mid360.html#2.4-Tag-Information)