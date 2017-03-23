# Hello World Dockerised Node.js application

Build the Docker image:
```
$docker build -t helloword .
```

Run the Docker image:
```
$docker run -it helloword
```

Run Docker image with port binding:
```
docker run -it -p 8080:3000 -t helloworld
```

Build + run the Docker image with port binding:
```
docker build -t helloworld . && docker run -p 8080:3000 -it -t helloworld
```

Once running app is available on: http://localhost:8080/
