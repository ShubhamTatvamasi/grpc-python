# grpc-python

run grpc server:
```bash
docker run --rm -it --name grpc-python \
  shubhamtatvamasi/grpc-python \
  python greeter_server.py
```

on new terminal run client:
```bash
docker exec -it grpc-python \
  python greeter_client.py
```
