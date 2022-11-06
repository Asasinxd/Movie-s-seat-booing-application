#include <iostream>
#include <string>
#include "crow_all.h"
#include "sql_test.h"


int main(){

    crow::SimpleApp app;

    CROW_ROUTE(app, "/")([](){
        return exec();
    });
    

    app.port(18080).run();
    
}