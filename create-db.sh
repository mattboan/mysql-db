cd ..

# Getting the database name from the user

read -p "Docker name: " db_name
read -p "Docker network name: " db_network
read -p "Docker volume name: " db_volume
read -p "Database name: " db_name
read -p "Database username: " db_user_name
read -sp "Database user password: " db_password
read -sp "Database root password: " db_root_password

# Create the docker network
docker network create $db_network

docker volume create $db_volume

docker run -v potholes-db-volume:/var/lib/mysql --network=potholes-network -p 3306:3306 --detach --env MARIA_DATABASE=$db_name --env MARIA_USER=$db_user_name --env MARIADB_PASSWORD=$db_password --env MARIADB_ROOT_PASSWORD=$db_root_password --name potholes-db mariadb:latest

echo 'Done!'
