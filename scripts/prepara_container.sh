
# usare ctrl+p+q per abbandonare il container senza fermarlo
# usare sudo docker container logs <container-id> per vedere l'output del container
# usare sudo docker ps -a per trovare il container e il suo id
# usare sudo docker exec -it <id-container> bash per aprire una shell sul container
# usare sudo docker stop <id-container> per fermare un container
# usare sudo docker rm <id-container> per togliere un container
# usare sudo docker images per vedere la lista di immagini
# usare sudo docker rmi <id-image> per rimuovere una immagine
sudo docker rmi floodlight_image
sudo docker build -t floodlight_image ../
sudo docker run -it -p 6653:6653 -p 1044:1044 --name floodlight floodlight_image
