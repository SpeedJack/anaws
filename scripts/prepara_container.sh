docker build -t floodlight_image ../
docker run -it --privileged --name floodlight floodlight_image
