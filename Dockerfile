FROM ubuntu:22.04

RUN apt-get update && apt-get install -y g++

WORKDIR /app

COPY radix_sort.cpp .
COPY vhod.txt .

RUN g++ -o app radix_sort.cpp

CMD ["./app", "vhod.txt"]
