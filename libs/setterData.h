#pragma once
#include "baseConnection.h"
#include <map>
#include <mariadb/mysql.h>
#include <string>
#include <vector>

class setterData: public baseConnect {

    private:
        int getReservationID(std::string Name, std::string Second_Name, std::string Tel){
            std::string query = "SELECT reservation_ID FROM reservation WHERE Name='" + Name + "' AND Second_Name='" + Second_Name + "' AND Tel='" + Tel + "'";
            int id;

            MYSQL_RES* result = getFromDatabase(query);

            if(result){
                MYSQL_ROW row = mysql_fetch_row(result);
                if(row){
                    id = std::stoi(row[0]);
                }
            }
            
            return id;
        }

        int getMovieID(std::string title){
            std::string query = "SELECT movie_id FROM movies WHERE title='" + title + "'";
            int id;

            MYSQL_RES* result = getFromDatabase(query);

            if(result){
                MYSQL_ROW row = mysql_fetch_row(result);
                if(row){
                    id = std::stoi(row[0]);
                }
            }

            return id;
        }

    public:
        void setReservation(std::string Name, std::string Second_Name, int Tel, int seatsCount, std::vector<int> seatsVector, std::string movie_title, int hall_id){
            std::string query = "INSERT INTO reservation (Name, Second_Name, Tel) VALUES ('" + Name + "', '" + Second_Name +"', '" + std::to_string(Tel) +"')";

            addToDatabase(query);

            int id = getReservationID(Name, Second_Name, std::to_string(Tel));

            int movie_id = getMovieID(movie_title);

            int seat_nr;

            for(int i = 0; i < seatsCount; i++){
                seat_nr = seatsVector[i];
                std::string query_2 = "UPDATE seats SET reserved=1, reservation_Id=" + std::to_string(id) + " WHERE seat_nr="+ std::to_string(seat_nr) + " AND movie_id=" + std::to_string(movie_id) + " AND hall_id=" + std::to_string(hall_id);
                updateDatabase(query_2);
            }
        }
    
};