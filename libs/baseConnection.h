#pragma once
#include <cstddef>
#include <cstdlib>
#include <iostream>
#include <string>
#include <mariadb/mysql.h>

class baseConnect{
    private:
        MYSQL* conn;
        std::string host = "127.0.0.1";
        std::string username = "root";
        std::string password = "";
        std::string database = "movies";

    public:
        baseConnect(){
            conn = mysql_init(0);
            conn = mysql_real_connect(conn, host.c_str(), username.c_str(), password.c_str(), database.c_str(), 0, NULL, 0);
            if (conn) {
                std::cout << "Połączenie z bazą danych zostało nawiązane. " << "\n";
            }else{
                std::cout << "Błąd podczas nawiązywania połączenia z bazą danych: " << mysql_error(conn) << "\n";
            }
        }

        void addToDatabase(std::string query){
            int query_state = mysql_query(conn, query.c_str());
            if(!query_state){
                std::cout << "Dodano rekord do bazy danych " << "\n"; 
            }else {
                std::cout << "Błąd podczas dodawania rekordu  do bazy danych " << mysql_error(conn) << "\n";
            }
        }

        MYSQL_RES* getFromDatabase(std::string query){
            int query_state = mysql_query(conn, query.c_str());
            if(!query_state){
                MYSQL_RES* result = mysql_store_result(conn);
                if(result){
                    std::cout << "Pobrano dane z bazy danych" << "\n";
                    return result;
                }else{
                    std::cout << "Błąd podczas pobierania wyniku zapytania: " << mysql_error(conn) << "\n";
                    return nullptr;
                }
            }else {
                std::cout << "Błąd podczas dodawania rekordu  do bazy danych " << mysql_error(conn) << "\n";
                return nullptr;
            }
        }

        void deleteFromDataBase(std::string query){
            int query_state = mysql_query(conn, query.c_str());
            if(!query_state){
                std::cout << "Usunięto dane z bazy danych " << "\n"; 
            }else {
                std::cout << "Błąd podczas usuwania danych do bazy danych " << mysql_error(conn) << "\n";
            }
        }


        void  updateDatabase(std::string query){
            int query_state = mysql_query(conn, query.c_str());
            if(!query_state){
                std::cout << "Zaktualizowano dane z bazy danych " << "\n"; 
            }else {
                std::cout << "Błąd podczas aktualizowania danych w bazy danych " << mysql_error(conn) << "\n";
            }
        }

};