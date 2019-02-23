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
