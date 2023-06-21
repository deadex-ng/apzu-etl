CREATE PROCEDURE `create_pepfar_cohort_disaggregated_male_aggregation`(IN _startDate DATE,IN _endDate DATE, IN _location VARCHAR(255),IN _defaultCutOff INT,IN _birthDateDivider INT)
BEGIN

call create_last_art_outcome_at_facility(_endDate,_location);
call create_hiv_cohort(_startDate,_endDate,_location,_birthDateDivider);

insert into pepfar_cohort_disaggregated(age_group,gender,tx_new,tx_curr,tx_curr_ipt,
tx_curr_screened_tb)

SELECT "All" as age_group, gender,
	COUNT(IF(initial_visit_date BETWEEN _startDate AND _endDate and gender = "M"  and transfer_in_date is null and patient_id NOT IN (
	select patient_id from omrs_patient_identifier where type = "ARV Number" and location != _location) 
    and patient_id IN(select patient_id from omrs_patient_identifier where type = "ARV Number" and location = _location) , 1, NULL)) as tx_new,
    COUNT(IF((state = 'On antiretrovirals' and floor(datediff(_endDate,last_appt_date)) <=  _defaultCutOff), 1, NULL)) as tx_curr,
    COUNT(IF(state = 'On antiretrovirals' and floor(datediff(_endDate,last_appt_date)) <=  _defaultCutOff 
    and last_ipt_date between _startDate and _endDate, 1, NULL)) as tx_curr_ipt,
    COUNT(IF(state = 'On antiretrovirals' and floor(datediff(_endDate,last_appt_date)) <=  _defaultCutOff 
    and patient_id in (select distinct(patient_id) from mw_art_followup where visit_date BETWEEN DATE_SUB(_endDate, INTERVAL 1 YEAR) AND _endDate
    and tb_status is not null and patient_id = patient_id), 1, NULL)) as tx_curr_screened_tb
from
(
	select * from hiv_cohort where gender = "M"
) sub1;
 
 END
