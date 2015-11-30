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