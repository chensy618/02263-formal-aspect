# start the docker environment
docker-compose up -d
# start the rsl 
docker-compose exec rsl bash
# shutdown the docker environment
docker-compose down 

1. `docker-compose exec rsl bash`
2. `pushd exmaples`
3. `rsltc -m SYSTEM_OF_COORDINATES.rsl`
4. `sml <SYSTEM_OF_COORDINATES.sml`