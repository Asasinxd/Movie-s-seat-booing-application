#define CROW_STATIC_ENDPOINT "/<path>"
#include <iostream>
#include "libs/crow_all.h"
#include "libs/getterData.h"
#include "libs/setterData.h"
#include "libs/logger.h"
#include "libs/raport.h"
#include "libs/file.h"
#include <map>
#include <mariadb/mysql.h>


int main()
{

    crow::SimpleApp app;
    crow::mustache::set_global_base("static");
    getterData get;
    setterData set;

    Logger::GenerateName T;
    Logger logger(T);
    Raport raport;
    File *log = &logger;
    File *rap = &raport;
    

    CROW_ROUTE(app, "/")([]() {
        auto page = crow::mustache::load("index.html");
        crow::response res;
        res = page.render();
        return res;
    });


    CROW_ROUTE(app, "/movies")
    ([&]() {
        std::map<std::string, std::map<std::string, std::string>> movies;
        movies = get.getMovies();
        crow::json::wvalue jsonMap;
        for (const auto& outerPair : movies) 
        {
            jsonMap[outerPair.first] = crow::json::wvalue::object();
            for (const auto& innerPair : outerPair.second) 
            {
                jsonMap[outerPair.first][innerPair.first] = innerPair.second;
            }
        }
        raport.incrementRequestCount();
        return jsonMap;
    });


   CROW_ROUTE(app, "/hall").methods("POST"_method)
    ([&](const crow::request& req){
            std::map<int,int> seats;
            auto data = crow::json::load(req.body);
            std::string title = data["title"].s();
            int hallId = data["hall"].i();
            seats = get.getSeats(title,hallId);
            crow::json::wvalue jsonMap;

            for (const auto& pair : seats) 
            {
                jsonMap[std::to_string(pair.first)] = pair.second;
            }
            raport.incrementRequestCount();
           return jsonMap;
    });


    CROW_ROUTE(app, "/reservation").methods("POST"_method)
    ([&](const crow::request& req){
            std::vector<int> seatsVector;
            auto data = crow::json::load(req.body);
            std::string name = data["name"].s();
            std::string surname = data["surname"].s();
            int number = data["number"].i();
            auto seats = data["seats"];
            int hall_id = data["hall_id"].i();
            std::string movie_title = data["movie_title"].s();
            int seatsCount = 0;

            for (const auto& seat : seats) 
            {   
                seatsVector.push_back(seat.i());
                seatsCount++;
            }
            
            std::string sessionData = "Imię Nazwisko: " +name+" "+ surname+ "\n" +
            "Numer telefonu: " + std::to_string(number) + "\n" + "Liczba zarezerwowanych miejsc: " + std::to_string(seatsCount) + "\n";
            log -> saveData(sessionData);
            rap -> saveData(sessionData);
            
            set.setReservation(name, surname, number, seatsCount, seatsVector, movie_title, hall_id);
            raport.incrementReservationCount();
            raport.incrementRequestCount();
            return crow::response(200);
    });

    app.port(1410).multithreaded().run();

    
}