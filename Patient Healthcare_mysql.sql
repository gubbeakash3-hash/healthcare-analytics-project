create database Patient_Healthcare;
use Patient_healthcare;

show tables;
#TOTAL PATIENT

SELECT COUNT(patient_id) AS total_patients
FROM patient;

	
select count(distinct patient_id)AS total_patients
FROM patient;

#TOTAL DOCTORS
select count(distinct Doctor_ID) AS total_doctors
From doctor;

#TOTAL VISITS
SELECT COUNT(*) AS total_visits
FROM visit;

#AVG AGE OF PATIENTS
SELECT ROUND(AVG(age)) AS avg_patient_age
FROM patient;


#TOP 5 DIAGONISED CONDITIONS
SELECT diagnosis, COUNT(*) AS total_cases
FROM visit
GROUP BY diagnosis
ORDER BY total_cases DESC
LIMIT 5;

# FOLLOW UP RATE
SELECT 
    SUM(treatment_cost + visit_charge) AS total_revenue
FROM visits;
SELECT 
doctor_id,
    (COUNT(CASE WHEN Follow_Up_Required = 'Yes' THEN 1 END) * 100.0) 
    / COUNT(*) AS follow_up_rate
FROM visit
GROUP BY doctor_id;

# TREATMENT COST PER VISIT(AVG)
SELECT AVG(Treatment_Cost) AS avg_treatment_cost
FROM Treatment;

# TOTAL LAB TEST CONDUCTED
SELECT COUNT(*) AS total_lab_tests
FROM Lab_Test;

# PERCENTAGE OF ABNORMAL LAB RESULTS
SELECT 
    (COUNT(CASE WHEN Test_Result = 'Abnormal' THEN 1 END) * 100.0) /
    COUNT(*) AS abnormal_percentage
FROM lab_test;

#10 DOCTOR WORKLOAD(AVG PATIENTS PER DOCTOR)
SELECT 
    ROUND(AVG(patient_count), 2) AS avg_patients_per_doctor
FROM (
    SELECT 
        doctor_id,
        COUNT(DISTINCT patient_id) AS patient_count
    FROM visit
    GROUP BY doctor_id
) t;

# TOTAL REVENUE-SUM(TREATMENT COST)+SUM(VISIT CHARGES)
SELECT 
    Round(SUM(Treatment_Cost + Cost),2) AS total_revenue
FROM Treatment;

































