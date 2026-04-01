-- Step 1: Isolate the patients with high-risk labs using a Common Table Expression
WITH HighRiskLabs AS (
    SELECT 
        patient_id, 
        date AS lab_date, 
        test_name, 
        result
    FROM lab_results
    WHERE test_name = 'Cholesterol' 
      AND CAST(result AS FLOAT) > 200
)

-- Step 2: Join with patients, doctors, and appointments to find the "Gaps in Care"
SELECT
    p.patient_id,
    p.name AS patient_name,
    p.dob,
    d.name AS primary_care_provider,
    hrl.test_name,
    hrl.result AS abnormal_result,
    hrl.lab_date,
    a.date AS next_appt_date
FROM HighRiskLabs hrl
JOIN patients p 
    ON hrl.patient_id = p.patient_id
JOIN doctors d 
    ON p.pcp_id = d.doctor_id
LEFT JOIN appointments a
    ON hrl.patient_id = a.patient_id
    AND a.date > hrl.lab_date     
    AND a.status != 'No-Show'     
WHERE a.appt_id IS NULL;
