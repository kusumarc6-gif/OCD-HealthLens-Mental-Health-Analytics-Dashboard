SELECT * FROM HOSPITALL
LIMIT 2;

-- count and pct of f and male that have ocd and avg obsession scored by gender

SELECT
    gender,
    COUNT(*) AS patient_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM hospitall),2) AS percentage,
    ROUND(AVG(y_bocs_score_obsessions),2) AS avg_obsession_score
FROM hospitall
GROUP BY gender;

# -- 2. Count of Patients by Ethnicity and their respective Average Obsession Scoreselct

select
	ethnicity,
	count(*) as patient_count,
	avg(y_bocs_score_obsessions) as  obsession_scoreselect
from hospitall
group by ethnicity;

# -- 3. Number of people diagnosed with OCD MoM

# -- alter table health_data.ocd_patient_dataset
# -- modify `OCD Diagnosis Date` date;
SELECT
    DATE_TRUNC(
        'month',
        TO_DATE(ocd_diagnosis_date,'DD-MM-YYYY')
    ) AS month,
    COUNT(patient_id) AS patient_count
FROM hospitall
GROUP BY 1
ORDER BY 1;

# -- 4. What is the most common Obsession Type (Count) & it's respective Average Obsession Score

SELECT
    obsession_type,
    COUNT(patient_id) AS patient_count,
    ROUND(AVG(y_bocs_score_obsessions),2) AS obs_score
FROM hospitalL
GROUP BY obsession_type
ORDER BY patient_count DESC;


# -- 5. What is the most common Compulsion type (Count) & it's respective Average Obsession Score

SELECT
    compulsion_type,
    COUNT(patient_id) AS patient_count,
    ROUND(AVG(y_bocs_score_compulsions),2) AS comp_score
FROM hospitall
GROUP BY compulsion_type
ORDER BY patient_count DESC;















