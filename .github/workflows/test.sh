#!/bin/bash
#vklopimo debug način: vsaka vrstica se izpiše preden se izvede
set -x
#počistimo stare datoteke - odstranimo prejšne rezultate
#-f ne javi napake če datoteka ne obstaja
rm -f out.txt napaka.txt
#up. gnu g++ - ustvari se program
g++ -o program radix_sort.cpp
#preverjamo uspeh - $? exit code zadnjega ukaza, -ne 0 pa da ni uspelo
if [ $? -ne 0 ]; then
  #če faila se zapiše datoteka in prekine se script
  echo "COMPILATION ERROR" > napaka.txt
  exit 1
fi
#zaženemo program - program prejme input file
./program ./vhod.txt
#runtime check: če program crasha se izpiše napaka
if [ $? -ne 0 ]; then
  echo "RUNTIME ERROR" > napaka.txt
  exit 1
fi
#preverimo output datoteke - preveri ali program sploh generira output
if [ ! -f out.txt ]; then
  #če manjka se izpiše napaka
  echo "NO OUTPUT FILE" > napaka.txt
  exit 1
fi
#prikaz outputa: debug izpis rezultatov
echo "OUTPUT:"
cat out.txt
#normalizacija outputa
#tr -s ' ' odstrani več presledkov
#xargs odstrani začetne ali končne presledke
#rezultat je čist string števil
result=$(tr -s ' ' < out.txt | xargs)
#sortiranje reference - up. gnu sort
#razbije string na vrstice, sortira številčno (-n), spet združi v string
sorted=$(echo "$result" | tr ' ' '\n' | sort -n | xargs)
#preverimo pravilnost sortiranja - primerjamo output programa, praavilno sortiran seznam
if [ "$result" != "$sorted" ]; then
  #če ni pravilno se izpiše napaka
  echo "NOT SORTED" > napaka.txt
  exit 1
fi
#če je test pravilen se izpiše to
echo "" > napaka.txt
echo "TEST PASSED"
