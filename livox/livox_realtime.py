# Prof. Jason's attempt to talk to the lidar using livox-sdk. I don't know if this ever worked.
# pip install livox-sdk

import livox_sdk as livox

# Initialize the Livox driver
lidar = livox.Lidar()

# Connect to a Livox LiDAR sensor
#lidar.connect("IP_ADDRESS_OF_LIDAR")
lidar.connect("92.168.1.128")

# Start data acquisition
lidar.start()

# Process point cloud data
for frame in lidar:
    # Access point cloud data (e.g., XYZ coordinates, intensity)
    print(frame.points)

# Stop data acquisition
lidar.stop()

# Disconnect from the LiDAR sensor
lidar.disconnect()

