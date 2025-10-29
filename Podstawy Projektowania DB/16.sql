CREATE TABLE clients (
    client_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    family_name TEXT NOT NULL,
    street TEXT NOT NULL,
    zip TEXT NOT NULL,
    place TEXT NOT NULL
);

INSERT INTO clients (first_name, family_name, street, zip, place)
SELECT DISTINCT first_name, family_name, street, zip, place
FROM halva_sales
ORDER BY ROWID;

create table halva(halva_id integer primary key, [type] text not null, price float not null)

INSERT INTO halva (type, price)
SELECT DISTINCT hs.type, hs.price
FROM halva_sales AS hs
JOIN (
    SELECT type, MAX(date) AS last_date
    FROM halva_sales
    GROUP BY type
) AS latest
ON hs.type = latest.type AND hs.date = latest.last_date
ORDER BY CASE hs.type
    WHEN 'Turkish' THEN 1
    WHEN 'Persian' THEN 2
    WHEN 'Greek' THEN 3
    ELSE 4 END;


CREATE TABLE halva_sales_new (order_id INTEGER PRIMARY KEY AUTOINCREMENT, client_id INTEGER NOT NULL, halva_id INTEGER NOT NULL, amount FLOAT NOT NULL, price FLOAT NOT NULL, value FLOAT NOT NULL, [date] TEXT NOT NULL, FOREIGN KEY (client_id) REFERENCES clients(client_id), FOREIGN KEY (halva_id) REFERENCES halva(halva_id));
insert into  halva_sales_new(client_id,halva_id,amount,price,value,[date]) select client_id,halva_id,amount,halva_sales.price,value,[date] from halva_sales join clients on  halva_sales.first_name = clients.first_name AND halva_sales.family_name = clients.family_name join halva on halva_sales.type = halva.type
drop table halva_sales
alter table halva_sales_new rename to halva_sales