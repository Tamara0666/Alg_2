#začnemo z Linux okoljem - ubuntu
FROM ubuntu:22.04
#namestimo c++ container - apt get update osveži pakete
#apt get install g++ namesti c++ compailer
#up. gnu g++ saj brez tega ne moremo kompilirati c++ kode
RUN apt-get update && apt-get install -y g++
#delovna mapa - torej se vse nadaljne operacije dogajajo v /app -> projektna mapa v containerju
WORKDIR /app
#kopiranje datotek - kopiramo iz lokalnega sistema v container
COPY radix_sort.cpp .
COPY vhod.txt .
#kompilacija - ustvarimo izvršljiv program : app -> to se zgodi že v build fazi image-a
RUN g++ -o app radix_sort.cpp
#zaženemo container - tedaj se avtomatsko požene program, kot input dobi vhod.txt
CMD ["./app", "vhod.txt"]
