#pragma once
#include <iostream>
#include <cstdlib>
#include <stdio.h>
#include <fstream>
#include <ctime>
#include <chrono>
#include "file.h"


class Logger: public File {
public:
    class GenerateName{
        public:
        std::chrono::system_clock::time_point now = std::chrono::system_clock::now();
        std::time_t now_c = std::chrono::system_clock::to_time_t(now);
        std::string date = std::ctime(&now_c);
        std::string file;
        GenerateName(){
            file = "logs/logs" + date + ".txt";
        }
    };
 
    Logger(GenerateName& d): File(d.file) {
        if(sessionData.good() == true){
            sessionData << "Rejestr - ELEMENTY DODANE DO BAZY"<<std::endl<<"-----------------------------------------"<<std::endl;
        }
    }

    void saveData(std::string data) {
        if(sessionData.good() == true){
            sessionData << data;
            sessionData << "-----------------------------------------"<<std::endl;
        } else std::cout << "Dostep do pliku zostal zabroniony!" << std::endl;

    }

};