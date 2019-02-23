# phpcart
Simple shopping cart created by PHP 7 and MySQL without framework.

Let's say there are 4 products in an online shop, an apple is 0.3$, a beer is 2$, water is 1$ each bottle and cheese is 3.74$ each kg. They have been stored in Mysql DB;

## Simple interface where:
- You can add/remove products to my virtual shopping cart in any quantities
- You can see my current cart status
- You have to choose a shipping option between 'pick up' (USD 0) and 'UPS' (USD 5). No option is chosen by default, so if i don't choose one and click on “Pay”, the interface asks me to select one. 
- After clicking on 'pay' (Originally my balance is USD 100 and after the purchase the remaining balance is stored) I want to see the previous balance, total purchase cost and my remaining balance after paying. 
- Near each product there is a rating scale from 1 to 5, I can rate it and I can see current average rating of each product. Rates are updated after each visit and they are stored using Mysql DB.

## Code features
- Code writen using PHP7.2 OOP;
- DRY;
- Neat and consistent style;
- Understandable names;
- Clear logic flow (no spaghetti code), short methods;
- Minimal reliance on global state: e.g. usage of superglobals. A separate place processing them should be dedicated;

## OOP features
- Logic inside classes including ajax controller (but except, Views);
- Separation of concerns: one class is responsible for a single thing;
- Minimum (or zero) amount of static methods;
- Encapsulation;
- Existence of entities / models like ShoppingCart;

## Installation

Requirements
------------
These services are required for normal operation:
* [php](https://secure.php.net/downloads.php) 7.2.2+
* a webserver
* [mysql](https://www.mysql.com/downloads/) 5.6 or compatible DBMS

Installation
------------
1. Make sure the required services are up and running;
2. Clone this repository and checkout needed branch;
3. Create a dedicated clean MySQL (or compatible) database;
4. Update config/connect.php file with DB information;
5. import database.sql file to the database;
6. Check if everything's up by visiting your page in the web browser, and you are done!

Admin Login
------------
- http://your script url/admin
- Username : admin@admin.com
- Password : abc123
