SELECT 
    d.department,
    d.name AS doctor_name,
    
    -- 1. Count every single appointment for this doctor
    COUNT(a.appt_id) AS total_scheduled_visits,
    
    -- 2. Count ONLY the appointments where the status is 'No-Show'
    SUM(CASE WHEN a.status = 'No-Show' THEN 1 ELSE 0 END) AS total_no_shows,
    
    -- 3. Calculate the percentage: (No-Shows / Total Visits) * 100
    ROUND(
        (SUM(CASE WHEN a.status = 'No-Show' THEN 1 ELSE 0 END) * 100.0) / COUNT(a.appt_id), 
        2
    ) AS no_show_rate_percentage

FROM doctors d
JOIN appointments a 
    ON d.doctor_id = a.doctor_id
GROUP BY 
    d.department,
    d.name
ORDER BY 
    no_show_rate_percentage DESC;no_show_analysis.sql
