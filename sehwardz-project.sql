create database HospitalDB;
use HospitalDB;

create table Patients(
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    name varchar(100) not null,
    gender varchar(10),
    age int,
    phone varchar(15));
insert into Patients (name, gender, age, phone) values
('Rahul Sharma','Male',25,'9876543210'),
('Priya Singh','Female',30,'9876543211'),
('Amit Kumar','Male',40,'9876543212'),
('Neha Verma','Female',28,'9876543213'),
('Arjun Patel','Male',35,'9876543214');

create table Doctors(
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    name varchar(100) not null,
    specialization varchar(100),
    consultation_fee decimal(10,2));
insert into Doctors (name, specialization, consultation_fee) values
('Dr. Mehta','Cardiologist',800),
('Dr. Rao','Dermatologist',500),
('Dr. Khan','Orthopedic',700),
('Dr. Sharma','Neurologist',900);

create table Appointments(
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id int,
    doctor_id int,
    appointment_date date,
    status varchar(20),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id));
insert into Appointments (patient_id, doctor_id, appointment_date, status) values
(1,1,'2025-01-10','Completed'),
(2,2,'2025-01-11','Completed'),
(3,1,'2025-01-12','Pending'),
(4,3,'2025-01-13','Completed'),
(5,4,'2025-01-14','Completed'),
(1,2,'2025-01-15','Completed');

create table Treatments(
    treatment_id INT PRIMARY KEY AUTO_INCREMENT,
    appointment_id int,
    diagnosis varchar(255),
    cost decimal(10,2),
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id));
insert into Treatments (appointment_id, diagnosis, cost) values
(1,'Heart Checkup',2000),
(2,'Skin Allergy',1500),
(4,'Fracture Treatment',3000),
(5,'Brain Scan',4000),
(6,'Skin Infection',1800);

select*from Patients;

select*from Doctors;

select*from Appointments;

select*from Treatments;

select name, specialization from Doctors;

select * from Appointments where status='Completed';

select * from Patients where age > 30;

select COUNT(*) as total_patients from Patients;

select p.name, d.name as doctor from Appointments a JOIN Patients p on a.patient_id=p.patient_id JOIN Doctors d on a.doctor_id=d.doctor_id;

select p.name, a.appointment_date from Patients p join Appointments a on p.patient_id=a.patient_id;

select d.name, COUNT(a.appointment_id) as total_appointments from Doctors d left join Appointments a on d.doctor_id=a.doctor_id group by d.name;

select p.name, t.diagnosis from Treatments t join Appointments a on t.appointment_id=a.appointment_id join Patients p on a.patient_id=p.patient_id;

create view AppointmentDetails as select a.appointment_id,p.name as patient,d.name as doctor,d.specialization,a.appointment_date,a.status from Appointments a join Patients p on a.patient_id = p.patient_id join Doctors d on a.doctor_id = d.doctor_id;
select * from AppointmentDetails;

select SUM(cost) as total_revenue from Treatments;

select AVG(cost) as avg_treatment_cost from Treatments;

select MAX(cost) as highest_treatment from Treatments;

select COUNT(*) from Appointments where status='Pending';

select * from Doctors order by consultation_fee DESC;

select * from Patients order by age;

select * from Treatments where cost > 2000;

select name from Patients where gender='Female';

select * from Appointments where appointment_date='2025-01-10';

select name from Doctors where doctor_id in (select doctor_id from Appointments);

select p.name, COUNT(a.appointment_id) as visits from Patients p join Appointments a on p.patient_id=a.patient_id group by  p.name;

select specialization, COUNT(*) as doctor_count from Doctors group by specialization;

update Patients set phone='9999999999' where patient_id=1;

select DATE_FORMAT(appointment_date,'%Y-%m') as month,COUNT(*) as total_appointments from Appointments group by month;



