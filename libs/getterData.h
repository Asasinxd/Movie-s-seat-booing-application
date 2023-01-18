#pragma once
#include "baseConnection.h"
#include <map>
#include <mariadb/mysql.h>
#include <string>

class getterData: baseConnect {

    private:
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
        std::map<std::string, std::map<std::string, std::string>> getMovies(){
            
            std::map<std::string, std::map<std::string, std::string>> movies;

            MYSQL_RES* result = getFromDatabase("SELECT title, date, time FROM movies");

            if(result){
                MYSQL_ROW row;
                while((row = mysql_fetch_row(result))){
                    std::map<std::string, std::string> movieData{
                        {"Date", row[1]},
                        {"Time", row[2]}
                    };

                    movies[row[0]] = movieData;
                }
                mysql_free_result(result);
            }
            return movies;
        }

        std::map<int, int> getSeats(std::string title, int hall_id){
            std::map<int, int> seats;
            int movie_Id = getMovieID(title);
            std::string query = "SELECT seat_nr, reserved FROM seats WHERE hall_Id=" + std::to_string(hall_id)
             + " AND movie_Id=" + std::to_string(movie_Id);

            MYSQL_RES* result = getFromDatabase(query);

            if(result){
                MYSQL_ROW row;
                while((row = mysql_fetch_row(result))){
                    seats[std::stoi(row[0])] = std::stoi(row[1]);
                }
                mysql_free_result(result);
            }

            return seats;
        }

};