#include <cstddef>
#include <cstdlib>
#include <iostream>
#include <string>
#include <mariadb/mysql.h>
#include "sql_test.h"


struct connection_details{
    const char *server, *user, *password, *database;
};


MYSQL* mysql_connection_setup(struct connection_details mysql_details){
    MYSQL *connection = mysql_init(NULL);

    if(!mysql_real_connect(connection, mysql_details.server, mysql_details.user, mysql_details.password, mysql_details.database, 0, NULL, 0)){
        std::cout << "Connection Error: " << mysql_error(connection) << std::endl;
        exit(1);
    }

    return connection;
}


MYSQL_RES* mysql_execute_query(MYSQL  *connection, const char *sql_query){
    if (mysql_query(connection, sql_query)){
        std::cout << "MySQL Query Error: " << mysql_error(connection) << std::endl;
        exit(1);
    }
    return mysql_use_result(connection);
}

std::string exec(){
    MYSQL *con;
    MYSQL_RES *res;
    MYSQL_ROW row;

    struct connection_details mysqlD;
    mysqlD.server = "localhost";
    mysqlD.user = "local";
    mysqlD.password = "local";
    mysqlD.database = "base";

    con = mysql_connection_setup(mysqlD);
    res = mysql_execute_query(con, "select * from first;");
    
    std::string output;
    int licznik = 0;
    while ((row = mysql_fetch_row(res)) != NULL) {
        for(int i = 0; i < 4; i++){
            output += row[i];
            output += " | ";
        }
        output += " \n ";
    }

    mysql_free_result(res);
    mysql_close(con);

    return output;
}