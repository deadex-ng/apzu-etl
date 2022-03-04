CREATE PROCEDURE create_rpt_mh_data(IN _endDate DATE, IN _location VARCHAR(255)) BEGIN

  -- Get initial cohort to operate on (for convenience)
  DROP TABLE IF EXISTS rpt_ic3_patient_ids;
  CREATE TEMPORARY TABLE rpt_ic3_patient_ids AS
    SELECT DISTINCT(patient_id)
    FROM mw_mental_health_initial

    UNION

    SELECT DISTINCT(patient_id)
    FROM mw_mental_health_followup;

  CREATE INDEX patient_id_index ON rpt_ic3_patient_ids(patient_id);

  -- Create lookup (row-per-patient) table to calculate ic3 indicators
  DROP TABLE IF EXISTS rpt_mh_data_table;
  CREATE TABLE rpt_mh_data_table AS
    -- Define columns
    SELECT
      ic3.patient_id,
      birthdate,
      gender,
      epilepsyDx,
      mhIntakeVisitDate,
      YEAR(mhIntakeVisitDate) - YEAR(birthdate)
      - (DATE_FORMAT(mhIntakeVisitDate, '%m%d') < DATE_FORMAT(birthdate, '%m%d')) as ageAtIntake,
      mhIntakeLocation,
      dx_organic_mental_disorder_chronic,
      dx_date_organic_mental_disorder_chronic,
      mentalHealthVisit.nextMHAppt,
      mentalStatusExam
    FROM 			rpt_ic3_patient_ids ic3
      INNER JOIN 		(SELECT patient_id,
                      birthdate,
                      gender
                    FROM mw_patient
                   ) pdetails
        ON pdetails.patient_id = ic3.patient_id
      LEFT JOIN 		(SELECT patient_id,
                      CASE WHEN diagnosis IS NOT NULL THEN 'X' END AS epilepsyDx
                    FROM mw_ncd_diagnoses
                    WHERE diagnosis = "Epilepsy"
                          AND diagnosis_date < _endDate
                    GROUP BY patient_id
                   ) epilepsyDx
        ON epilepsyDx.patient_id = ic3.patient_id
      INNER JOIN		(SELECT *
                    FROM 	(SELECT patient_id,
                             visit_date AS mhIntakeVisitDate,
                             location AS mhIntakeLocation,
                             diagnosis_organic_mental_disorder_chronic as dx_organic_mental_disorder_chronic,
                             CASE WHEN diagnosis_date_organic_mental_disorder_chronic IS NULL THEN visit_date
                              ELSE diagnosis_date_organic_mental_disorder_chronic
                             END AS dx_date_organic_mental_disorder_chronic
                           FROM mw_mental_health_initial
                           WHERE visit_date < _endDate and location= _location
                           ORDER BY visit_date DESC
                          ) mhInner GROUP BY patient_id
                   ) mhIntake ON mhIntake.patient_id = ic3.patient_id
      LEFT JOIN		(SELECT *
                    FROM 	(SELECT patient_id,
                             visit_date AS lastMentalHealthVisitDate,
                             hospitalized_since_last_visit as mentalHospitalizedSinceLastVisit,
                             mental_health_drug_side_effect as mentalHealthRxSideEffectsAtLastVisit,
                             mental_status_exam as mentalStatusExam,
                             mental_stable as mentalStableAtLastVisit,
                             next_appointment_date AS nextMHAppt
                           FROM mw_ncd_visits
                           WHERE mental_health_followup = 1
                                 AND visit_date < _endDate
                           ORDER BY visit_date DESC
                          ) mhFollowupInner GROUP BY patient_id
                   ) mentalHealthVisit ON mentalHealthVisit.patient_id = ic3.patient_id
  ;


  DROP TABLE IF EXISTS rpt_ic3_patient_ids;

END
