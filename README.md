
# TimeService App

SimpleTimeService is a lightweight microservice that returns the current timestamp in IST and the client's IP address.This service is built with Flask and runs inside a Docker container.


## Authors

- [@Ritesh Kumar Nayak](https://github.com/ritesh-kumar-nayak)


## Documentation

🚀 Quick Start

Since the Docker image is already pushed to Docker Hub, you can run it directly without building it.

1️⃣ Pull the Docker Image
docker pull ritesh1999/simple-time-service

2️⃣ Run the Container
docker run -p 3000:3000 ritesh1999/simple-time-service:latest

Now, the service is running on http://localhost:3000 🎉
## API Reference

### GET /

Returns the current timestamp (in IST) and client IP address.



{
  "timestamp": "2025-02-11T10:30:45+05:30",
  "ip": "172.17.0.1"
}


## License

[MIT](https://choosealicense.com/licenses/mit/)
This project is open-source and available under the MIT License.

