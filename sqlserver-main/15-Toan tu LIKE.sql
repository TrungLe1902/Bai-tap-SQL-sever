-- Hãy lọc ra tất cả các khách hàng đến từ các quốc gia (Country)
-- bắt đầu bằng chữ ‘A’
SELECT *
FROM [dbo].[Customers]
WHERE [Country] LIKE 'A%';

-- Lấy danh sách các đơn đặt được gửi đến các thành phố có chứa chữ ‘a’.
SELECT *
FROM [dbo].[Orders]
WHERE [ShipCity] LIKE '%a%';

-- Hãy lọc ra tất cả các đơn hàng với điều kiện:
-- ShipCountry  LIKE ‘U_’
-- ShipCountry LIKE ‘U%’

SELECT *
FROM [dbo].[Orders]
WHERE [ShipCountry] LIKE 'U_';

SELECT *
FROM [dbo].[Orders]
WHERE [ShipCountry] LIKE 'U%';
-- Hãy cho biết những quốc gia bắt đầu bằng chữ ‘A’ hoặc ‘G’ 
-- và có số lương đơn hàng lớn hơn 29.

SELECT [ShipCountry],COUNT ([OrderID])
FROM[dbo].[Orders]
WHERE[ShipCountry] LIKE '[AG]%'
GROUP BY[ShipCountry]
HAVING COUNT ([OrderID]) > 29




