CREATE TABLE tblUser(
    user_id AUTOINCREMENT PRIMARY KEY,
    UserPassword VARCHAR(50) 
    bank_id LONG,
    wishlist_id LONG,
    cart_id LONG,
    Email VARCHAR(50), 
    catalog_id LONG, -- we shoudl change long to int maybe 
);