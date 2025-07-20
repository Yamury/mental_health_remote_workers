-- En y�ksek verimlilik skoruna sahip 10 �al��an
SELECT TOP 10 Employee_ID, Name, Job_Role, Productivity_Score
FROM dbo.mental_health_remote_workers
ORDER BY Productivity_Score DESC;

-- �al��ma moduna g�re ortalama verimlilik
SELECT Work_Mode, AVG(Productivity_Score) AS Ort_Verimlilik
FROM dbo.mental_health_remote_workers
GROUP BY Work_Mode;

--G�nl�k egzersiz yapanlar ile yapmayanlar�n burnout fark�
SELECT Exercise_Frequency, AVG(Burnout_Score) AS Ort_Tukenmislik
FROM dbo.mental_health_remote_workers
GROUP BY Exercise_Frequency;

--  ��-ya�am dengesi ortalamas� (�lkelere g�re)
SELECT Country, AVG(Work_Life_Balance_Rating) AS Ort_Is_Yasam_Dengesi_Ulkeler
FROM dbo.mental_health_remote_workers
GROUP BY Country
ORDER BY Ort_Is_Yasam_Dengesi_Ulkeler DESC;

-- Terapiste eri�imi olanlarla olmayanlar�n i�-ya�am dengesi fark�
SELECT Has_Access_To_Therapist, AVG(Work_Life_Balance_Rating) AS Ort_Is_Yasam_Dengesi_Terapist
FROM dbo.mental_health_remote_workers
GROUP BY Has_Access_To_Therapist;

-- Ya� gruplar�na g�re ortalama verimlilik
SELECT
    CASE
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 39 THEN '30s'
        WHEN Age BETWEEN 40 AND 49 THEN '40s'
        ELSE '50+'
    END AS Age_Group,
    AVG(Productivity_Score) AS Ort_Verimlilik
FROM dbo.mental_health_remote_workers
GROUP BY
    CASE
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 39 THEN '30s'
        WHEN Age BETWEEN 40 AND 49 THEN '40s'
        ELSE '50+'
    END;

--  Cinsiyete g�re remote setup memnuniyet ortalamas�
SELECT Gender, AVG(Remote_Setup_Satisfaction) AS Ort_Remote_Memnuniyet
FROM dbo.mental_health_remote_workers
GROUP BY Gender;

--  �lkeye g�re ortalama burnout skoru
SELECT Country, AVG(Burnout_Score) AS Ort_Burnout
FROM dbo.mental_health_remote_workers
GROUP BY Country
ORDER BY Ort_Burnout DESC;

-- �� rol�ne g�re ortalama �al��ma saati
SELECT Job_Role, AVG(Hours_Worked_Per_Week) AS Ort_Saat
FROM dbo.mental_health_remote_workers
GROUP BY Job_Role
ORDER BY Ort_Saat DESC;
