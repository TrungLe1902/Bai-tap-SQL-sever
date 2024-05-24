Create Database QuanLyQuanCafe

use QuanLyQuanCafe
Go
Create table TableFood
(
	id INT IDENTITY PRIMARY KEY,
	name nvarchar(100) NOT NULL DEFAULT N'Bàn chua có tên',
	status nvarchar(100) NOT NULL DEFAULT N'Trống'
)
GO
CREATE TABLE Account
(
	id INT IDENTITY PRIMARY KEY,
	DisplayName nvarchar(100) NOT NULL DEFAULT N'Kter',
	UserName nvarchar(100) NOT NULL DEFAULT 0,
	PassWord nvarchar (1000) NOT NULL DEFAULT 0,
	Type INT NOT NULL DEFAULT 0 
)

GO
create table FoodCategory
(
	id INT IDENTITY PRIMARY KEY,
	name nvarchar(100) NOT NULL DEFAULT N'Chua đặt tên'
)

Go
create table Food
(
	id INT IDENTITY PRIMARY KEY,
	name nvarchar(100) NOT NULL DEFAULT N'Chua đặt tên', 
	idCategory INT NOT NULL,
	price FLOAT NOT NULL DEFAULT 0

	FOREIGN KEY (idCategory) REFERENCES [dbo].[FoodCategory](id)
)

GO
create table Bill
(
	id INT IDENTITY PRIMARY KEY,
	DateCheckIN DATE NOT NULL,
	DateCheckOut DATE,
	idTable INT NOT NULL,
	status INT NOT NULL DEFAULT 0

	FOREIGN KEY (idTable) REFERENCES dbo.TableFood(id)
)
GO
create table BillInfo
(
	id INT IDENTITY PRIMARY KEY,
	idBill INT NOT NULL,
	idFood INT NOT NULL,
	count INT NOT NULL DEFAULT 0

	FOREIGN KEY (idBill) REFERENCES [dbo].[Bill](id),
	FOREIGN KEY (idFood) REFERENCES [dbo].[Food](id)
)


Go
INSERT INTO [dbo].[Account]
		(
			[UserName],
			[DisplayName],
			[PassWord],
			[Type]
		) 
VALUES (	N'K9', --Username -- nvarchar(100)
			N'RongK9', --DisplayName - nvarchar(1000)
			N'1', --PassWord -nvarchar(1000)
			1 -- Type-int
		)
INSERT INTO [dbo].[Account]
		(
			[UserName],
			[DisplayName],
			[PassWord],
			[Type]
		) 
VALUES (	N'staff', --Username -- nvarchar(100)
			N'staff', --DisplayName - nvarchar(1000)
			N'1', --PassWord -nvarchar(1000)
			0 -- Type-int
		)

select * from [dbo].[Account]

EXEC dbo.USP_GetTableList

--thêm category
INSERT dbo.FoodCategory
		(name)
VALUES (N'Hải sản')

INSERT dbo.FoodCategory
		(name)
VALUES (N'Nông sản')

INSERT dbo.FoodCategory
		(name)
VALUES (N'Lâm sản')

INSERT dbo.FoodCategory
		(name)
VALUES (N'Sản sản')

INSERT dbo.FoodCategory
		(name)
VALUES (N'Nước')

--thêm món ăn
INSERT dbo.Food
		(name,idCategory,price)
VALUES	(N'Mực một nắng nước sa tế',1,120000)

INSERT dbo.Food
		(name,idCategory,price)
VALUES	(N'Nghêu hấp xả',1,50000)

INSERT dbo.Food
		(name,idCategory,price)
VALUES	(N'Dú dê nướng sữa',2,55000)

INSERT dbo.Food
		(name,idCategory,price)
VALUES	(N'Rồng vượt biển xanh',2,50000)



INSERT dbo.Food
		(name,idCategory,price)
VALUES	(N'Heo rừng nướng muối ớt',3,50000)

INSERT dbo.Food
		(name,idCategory,price)
VALUES	(N'Cơm chiên ',3,50000)

INSERT dbo.Food
		(name,idCategory,price)
VALUES	(N'Cơm rang dưa muối ',4,25000)

INSERT dbo.Food
		(name,idCategory,price)
VALUES	(N'Cơm tấm ',4,35000)

INSERT dbo.Food
		(name,idCategory,price)
VALUES	(N'7up',5,20000)

INSERT dbo.Food
		(name,idCategory,price)
VALUES	(N'Coca Cola',5,20000)

INSERT dbo.Food
		(name,idCategory,price)
VALUES	(N'Pepsi',5,20000)


UPDATE [dbo].[Food]
SET price = 25000
WHERE id =4


-----THÔNG TIN BILL
INSERT dbo.Bill
	([DateCheckIN],
	[DateCheckOut],
	[idTable],
	[status]
	)
VALUES (GETDATE(),
		NULL,
		1,
		0
		)
UPDATE dbo.Bill
SET [DateCheckOut] = '2024-05-22'
WHERE id =1
INSERT dbo.Bill
	([DateCheckIN],
	[DateCheckOut],
	[idTable],
	[status]
	)
VALUES (GETDATE(),
		GETDATE(),
		2,
		0
		)

INSERT [dbo].[BillInfo]
		([idBill],[idFood],[count])
VALUES (1,1,2)


INSERT [dbo].[BillInfo]
		([idBill],[idFood],[count])
VALUES (1,3,4)
INSERT [dbo].[BillInfo]
		([idBill],[idFood],[count])
VALUES (2,5,1)
INSERT [dbo].[BillInfo]
		([idBill],[idFood],[count])
VALUES (2,6,2)
INSERT [dbo].[BillInfo]
		([idBill],[idFood],[count])
VALUES (3,4,2)
Select * from [dbo].[FoodCategory]



SELECT f.name, bi.count, f.price, 
		f.price * bi.count AS totalPrice
FROM dbo.BillInfo AS bi, dbo.Bill AS b,dbo.Food AS f 
WHERE bi.idBill=b.id AND bi.idFood = f.id AND b.idTable=2


SELECT * FROM dbo.BillInfo
SELECT * FROM dbo.Food
SELECT * FROM dbo.FoodCategory

