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