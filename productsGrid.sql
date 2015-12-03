CREATE database productsGrid
use productsGrid
Create table products
(
	productID int identity(1,1),
	productName varchar(84),
	productPrice money
);


use productsGrid
SET IDENTITY_INSERT [dbo].[products] ON
GO
use productsGrid
insert into [dbo].[products]([productID],[productName],[productPrice]) values (1, 'The Shake Phone', 19.95);
insert into [dbo].[products]([productID],[productName],[productPrice]) values (2, 'The Chess Dragon', 25.95);
insert into [dbo].[products]([productID],[productName],[productPrice]) values (3, 'The Number Fourteen', 1000.00);

use productsGrid
select * 
from products

use productsGrid
Select * 
from products
Where productID like '%' OR productName like '%' OR productPrice like '%'

use productsGrid
insert into [dbo].[products] (productImage)  values ('athf5_screen1.jpg');
insert into [dbo].[products] (productImage) values ('2028125-chessdragon.jpg');
insert into [dbo].[products] (productImage) values ('Fourteen.jpg');

use productsGrid
alter table [dbo].[products] add prodDescription nvarchar(1000);

update products
set productImage = 'athf5_screen1.jpg'
where productID = 1;

update products
set productImage = '2028125-chessdragon.jpg'
where productID = 2;


update products
set productImage = 'Fourteen.jpg'
where productID = 3;

select * 
from products

delete from products 
where productID = 6;

update products
set prodDescription = 'The shake phone, for all of your communication needs'
where productID = 1;

update products
set prodDescription = 'The Chess Dragon, Engage him at your own risk. "Not Legal in Canada"'
where productID = 2;

update products
set prodDescription = 'The Number Fourteen, make it yours'
where productID = 3;