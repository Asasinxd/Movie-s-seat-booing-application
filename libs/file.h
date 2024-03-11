#pragma once
#include <iostream>
#include <cstdlib>
#include <stdio.h>
#include <fstream>
#include <ctime>
#include <chrono>

class File{
private:

    std::string file;

public:
    std::ofstream sessionData;

    File(std::string f): file(f){
        sessionData.open(file);
    }

    ~File(){
        sessionData.close();
    }

    virtual void saveData(std::string data) = 0;
};