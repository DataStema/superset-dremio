# superset-dremio
The Docker image for Apache Superset with Dremio connector


```
docker image build --tag datastemalux/superset-dremio:1.0.0 .
docker push datastemalux/superset-dremio:1.0.0

docker tag datastemalux/superset-dremio:1.0.0 datastemalux/superset-dremio:latest
docker push datastemalux/superset-dremio:latest

```


Setup the container:

```
docker run -d -p 8080:8088 --name superset datasetmalux/superset-dremio:latest

docker exec -it superset superset fab create-admin \
              --username admin \
              --firstname Superset \
              --lastname Admin \
              --email admin@superset.com \
              --password admin


docker exec -it superset superset db upgrade

# This step is optional - it populates Apache Superset with examples
docker exec -it superset superset load_examples

docker exec -it superset superset init
```

Login and take a look -- navigate to http://localhost:8080/login/
user: admin  
password: admin  

