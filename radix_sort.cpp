#include <iostream>
#include <vector>
#include <fstream>

std::vector<unsigned char> readInput(const std::string& filename){
    std::ifstream in(filename);
    if(!in){
        std::cerr << "Error: can not open the file: "<< filename << "\n";
        return {};
    }
}