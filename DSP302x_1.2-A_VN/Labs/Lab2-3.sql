-- Truy vấn A1: Nhập một truy vấn không thành công (khi đó bạn sẽ nhận được một lỗi) để truy xuất tất cả nhân viên có mức lương nhiều hơn mức lương trung bình:
select * from employees where salary > AVG(salary)

-- Truy vấn A2: Nhập truy vấn thành công bằng cách sử dụng lệnh chọn con để truy xuất tất cả nhân viên có mức lương nhiều hơn mức lương trung bình:
select EMP_ID, F_NAME, L_NAME, SALARY from employees where SALARY > (select AVG(SALARY) from employees); 

-- Truy vấn A3: Nhập truy vấn không thành công (khi đó bạn sẽ nhận được một lỗi) để truy xuất tất cả bản ghi nhân viên và mức lương trung bình ở mọi hàng:
select EMP_ID, SALARY, AVG(SALARY) AS AVG_SALARY from employees ;

-- Truy vấn A4: Nhập Biểu thức Column (Cột) để truy xuất tất cả bản ghi nhân viên và mức lương trung bình ở mọi hàng 
select EMP_ID, SALARY, ( select AVG(SALARY) from employees ) AS AVG_SALARY from employees ; 

-- Truy vấn A5: Nhập Biểu thức Table, biểu thức sẽ chỉ truy xuất các cột có dữ liệu nhân viên không nhạy cảm 
select * from ( select EMP_ID, F_NAME, L_NAME, DEP_ID from employees) AS EMP4ALL ;



-- Phần 2: Truy cập nhiều bảng với các truy vấn con
-- Truy vấn B1: Chỉ lấy các bản ghi EMPLOYEES tương ứng với các phòng ban trong bảng DEPARTMENTS 
select * from employees where DEP_ID IN ( select DEPT_ID_DEP from departments );

-- Truy vấn B2: Chỉ lấy danh sách nhân viên từ vị trí L0002 
select * from employees where DEP_ID IN ( select DEPT_ID_DEP from departments where LOC_ID = 'L0002' ); 

-- Truy vấn B3: Truy xuất ID và tên phòng ban cho những nhân viên kiếm được hơn 70.000 đô la
select DEPT_ID_DEP, DEP_NAME from departments where DEPT_ID_DEP IN ( select DEP_ID from employees where SALARY > 70000 ) ; 

-- Truy vấn B4: Chỉ định 2 bảng trong mệnh đề FROM 
select * from employees, departments;

-- Accessing Multiple Tables with Implicit Joins Truy cập nhiều bảng với kết hợp ngầm định
-- Truy vấn B5: Chỉ truy xuất các bản ghi EMPLOYEES tương ứng với các phòng ban trong bảng DEPARTMENTS:
select * from employees, departments where employees.DEP_ID = departments.DEPT_ID_DEP; 

-- Truy vấn B6: Sử dụng bí danh ngắn hơn cho tên bảng
 select * from employees E, departments D where E.DEP_ID = D.DEPT_ID_DEP; 

-- Truy vấn B7: Chỉ truy xuất Employee ID (ID nhân viên) và Department name (tên phòng ban) trong truy vấn trên 
select EMP_ID, DEP_NAME from employees E, departments D where E.DEP_ID = D.DEPT_ID_DEP; 

-- Truy vấn B8: Trong truy vấn trên, hãy chỉ định tên cột đủ điều kiện với bí danh trong mệnh đề SELECT 
select E.EMP_ID, D.DEP_NAME from employees E, departments D where E.DEP_ID = D.DEPT_ID_DEP
