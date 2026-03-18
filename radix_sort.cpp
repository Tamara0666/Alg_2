#include <iostream>
#include <vector>
#include <fstream>

std::vector<unsigned char> readInput(const std::string& filename){
    std::ifstream in(filename);
    if(!in){
        std::cerr << "Error: can not open the file: "<< filename << "\n";
        return {};
    }
    std::vector<unsigned char> numbers;
    int x;
    while(in >> x) {
        if (x < 0 || x > 255)
        {
            std::cerr << "Error: number" << x << "is out of range (0, 255). \n";
            continue;
        }
        numbers.push_back((unsigned char)x);
    }
    return numbers;
}

void countingSortBit(std::vector<unsigned char> &A, int k){
    int s = A.size();
    std::vector<unsigned char> B(s);
    int C[2] = {0, 0}; 
    for(int i = 0; i < s; i++){
        C[(A[i] >> k) & 1]++;
    }
    
    C[1] += C[0];

    for(int i = s-1; i >= 0; i--){
        int bit = (A[i] >> k) & 1;
        B[--C[bit]] = A[i];
    }
    
    A = B;
}