create database Healthcare;
use Healthcare;

select * from `dialysis - I` ;
select * from `dialysis - II`;

rename table `dialysis - I` to dialysis1;
rename table `dialysis - II` to dialysis2;

select * from dialysis1;
select * from dialysis2;

SELECT * FROM dialysis1
JOIN dialysis2
ON dialysis1.city = dialysis2.city;


##Number of Patients across various summaries
select 
Sum ( `No of patients included in the transfusion summary`) as 'transfusion summary',
Sum ( `Number of patients in hypercalcemia summary`) as 'hypercalcemia summary',
Sum ( `No of patients in Serum phosphorus summary`) as 'Serum phosphorus summary',
Sum ( `No of patients included in hospitalization summary`) as 'hospitalization summary',
Sum ( `No of hospitalizations included in hospital readmission summary`) as 'hospital readmission summary',
Sum ( `Number of Patients included in survival summary`) as 'survival summary',
Sum ( `Number of Patients included in fistula summary`) as 'fistula summary',
Sum ( `Number of patients in long term catheter summary`) as 'long term catheter summary',
Sum ( `Number of patients in nPCR summary`) as 'nPCR summary'
from dialysis1;

##kpi2
SELECT 
    COUNT(CASE WHEN `Profit or Non-profit` = 'Profit' THEN 1 END) AS profit_count,
    COUNT(CASE WHEN `Profit or Non-profit` = 'Non-Profit' THEN 1 END) AS non_profit_count
FROM
dialysis1    ;

##kpi3
SELECT
    dialysis1.`Chain Organization`,
    COUNT(dialysis2.`Total Performance Score`) AS 'no_score'
FROM
    dialysis1
LEFT JOIN dialysis2 ON dialysis1.`Facility Name` = dialysis2.`Facility Name`
                     AND dialysis2.`Total Performance Score` = 'No Score'
GROUP BY
    dialysis1.`Chain Organization`;

##KPI4
select 
avg(`# of Dialysis Stations`) as avg_Dialysis_station,
max( `# of Dialysis Stations`) as max_Dialysis_station,
min(`# of Dialysis Stations`) as min_Dialysis_station,
sum(`# of Dialysis Stations`) as total_Dialysis_station
from dialysis1;

##kpi5
select 
count(case when `Patient Transfusion category text` = 'As Expected' then 1 end) as Patient_Transfusion_category,
count(case when `Patient hospitalization category text` = 'As Expected' then 1 end) as Patient_hospitalization_category,
count(case when `Patient Hospital Readmission Category` = 'As Expected' then 1 end) as Patient_Hospital_category,
count(case when `Patient Survival Category Text` = 'As Expected' then 1 end) as Patient_Survival_category,
count(case when `Fistula Category Text` = 'As Expected' then 1 end) as Fistula_category,
count(case when `Patient Infection category text` = 'As Expected' then 1 end) as Patient_Infection_category,
count(case when `SWR category text` = 'As Expected' then 1 end) as SWR_category,
count(case when `PPPW category text` = 'As Expected' then 1 end) as PPPW_category
from dialysis1;

##kpi6
select avg(`PY2020 Payment Reduction Percentage`)*100 from dialysis2;