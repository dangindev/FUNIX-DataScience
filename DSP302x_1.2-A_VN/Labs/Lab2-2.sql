use hr;
drop table if exists PETRESCUE;
create table PETRESCUE (
	ID INTEGER PRIMARY KEY NOT NULL,
	ANIMAL VARCHAR(20),
	QUANTITY INTEGER,
	COST DECIMAL(6,2),
	RESCUEDATE DATE
	);
insert into PETRESCUE values 
	(1,'Cat',9,450.09,'2018-05-29'),
	(2,'Dog',3,666.66,'2018-06-01'),
	(3,'Dog',1,100.00,'2018-06-04'),
	(4,'Parrot',2,50.00,'2018-06-04'),
	(5,'Dog',1,75.75,'2018-06-10'),
	(6,'Hamster',6,60.60,'2018-06-11'),
	(7,'Cat',1,44.44,'2018-06-11'),
	(8,'Goldfish',24,48.48,'2018-06-14'),
	(9,'Dog',2,222.22,'2018-06-15')
;



-- Truy vấn A1: Nhập một hàm tính tổng chi phí của tất cả những lần cứu hộ động vật trong bảng PETRESCUE.
select  sum(COST) as `total cost`
from    PETRESCUE
-- Truy vấn A2: Nhập một hàm hiển thị tổng chi phí của tất cả những lần cứu hộ động vật trong bảng PETRESCUE trong cột SUM_OF_COST.
select  sum(COST) as `SUM_OF_COST`
from    PETRESCUE
-- Truy vấn A3: Nhập một hàm hiển thị số lượng động vật tối đa được cứu hộ.
select MAX(QUANTITY) from PETRESCUE;
-- Truy vấn A4: Nhập một hàm hiển thị chi phí trung bình của động vật được cứu hộ.
select AVG(QUANTITY) from PETRESCUE;
-- Truy vấn A5: Nhập một hàm hiển thị chi phí cứu hộ trung bình cho một chú chó.
select AVG( COST / QUANTITY ) from PETRESCUE where ANIMAL = 'Dog';

-- Truy vấn B1: Nhập một hàm hiển thị chi phí làm tròn của mỗi lần cứu hộ.
select ROUND(COST) from PETRESCUE;

-- Truy vấn B2: Nhập hàm hiển thị độ dài của tên từng con vật.

select  length(ANIMAL)
from    PETRESCUE
-- Truy vấn B3: Nhập hàm hiển thị tên con vật trong mỗi lần cứu hộ bằng chữ hoa.
select UCASE(ANIMAL) from PETRESCUE;

-- Truy vấn B4: Nhập hàm hiển thị tên con vật trong mỗi lần cứu hộ bằng chữ hoa và không trùng lặp.
select DISTINCT(UCASE(ANIMAL)) from PETRESCUE;
-- Truy vấn B5: Nhập một truy vấn hiển thị tất cả các cột từ bảng PETRESCUE, trong đó (các) con vật được cứu hộ là mèo. Sử dụng cat chữ thường trong truy vấn.
select * from PETRESCUE where LCASE(ANIMAL) = 'cat';


-- Truy vấn C1: Nhập một hàm hiển thị ngày trong tháng mèo được cứu hộ.
select DAY(RESCUEDATE) from PETRESCUE where ANIMAL = 'Cat';
-- Truy vấn C2: Nhập hàm hiển thị số lần cứu hộ vào tháng thứ 5.
select SUM(QUANTITY) from PETRESCUE where MONTH(RESCUEDATE)='05';
-- Truy vấn C3: Nhập hàm hiển thị số lần cứu hộ vào ngày 14 trong tháng.
select SUM(QUANTITY) from PETRESCUE where DAY(RESCUEDATE)='14';
-- Truy vấn C4: Động vật được cứu hộ nên được đưa tới phòng khám thú y trong vòng ba ngày kể từ ngày được cứu hộ. Nhập một hàm hiển thị ngày thứ ba từ mỗi lần cứu hộ.
select (RESCUEDATE + 3 DAYS) from PETRESCUE;
-- Truy vấn B5: Nhập một truy vấn hiển thị tất cả các cột từ bảng PETRESCUE, trong đó (các) con vật được cứu hộ là mèo. Sử dụng cat chữ thường trong truy vấn.
select (CURRENT DATE - RESCUEDATE) from PETRESCUE;
