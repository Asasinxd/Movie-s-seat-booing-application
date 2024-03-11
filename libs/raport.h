#pragma once
#include <iostream>
#include <cstdlib>
#include <stdio.h>
#include <fstream>
#include <ctime>
#include <chrono>
#include "file.h"

class Raport: public File {
private:
    time_t startTime;
    int requestCount = 0;
    int reservationCount = 0;

public:

    Raport(std::string file = "raport/raport.txt"): File(file) {
        startTime = time(0);
        sessionData << "Raport - ELEMENTY DODANE DO BAZY"<<std::endl<<"-----------------------------------------"<<std::endl;
    }

    ~Raport(){
        time_t now = time(0);
        time_t uptime = now - startTime;
        saveData("-----------------------------------------\n");
        saveData("Czas działania serwera: " + std::to_string(uptime)+ " sekund" + "\n");
        saveData("Liczba zapytań: " + std::to_string(requestCount)+ "\n");
        saveData("Liczba rezerwacji: " + std::to_string(reservationCount)+ "\n");
        saveData("------------------------------------------");
    }

    void incrementRequestCount(){
        requestCount++;
    }

    void incrementReservationCount(){
        reservationCount++;
    }

    void saveData(std::string data) {
        if(sessionData.good() == true){
            sessionData << data;
        } else std::cout << "Dostep do pliku zostal zabroniony!" << std::endl;

    }

};