create table prices(id integer primary key autoincrement,model text not null, dollar float not null, euro float not null)
insert into prices(model, dollar,euro) select distinct model,price as dollar, round(price * 0.8,2) as euro from cell_phones where color = "black"
