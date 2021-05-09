FROM python

ARG GRPC_VERSION=1.37.1

ARG PROTOC_VERSION=3.16.0

ARG PROTOC_ZIP=protoc-${PROTOC_VERSION}-linux-x86_64.zip

RUN wget -P /tmp \
  https://github.com/protocolbuffers/protobuf/releases/download/v${PROTOC_VERSION}/${PROTOC_ZIP}

RUN unzip -o /tmp/${PROTOC_ZIP} -d /usr/local bin/protoc

RUN unzip -o /tmp/${PROTOC_ZIP} -d /usr/local 'include/*'

RUN pip install grpcio grpcio-tools

WORKDIR /home

RUN wget https://github.com/grpc/grpc/archive/refs/tags/v${GRPC_VERSION}.zip

RUN unzip v${GRPC_VERSION}.zip

WORKDIR /home/grpc-${GRPC_VERSION}/examples/python/helloworld

RUN python -m grpc_tools.protoc \
      -I../../protos \
      --python_out=. \
      --grpc_python_out=. \
      ../../protos/helloworld.proto
