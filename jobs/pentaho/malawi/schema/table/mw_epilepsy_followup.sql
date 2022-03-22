CREATE TABLE mw_epilepsy_followup (
  epilepsy_followup_visit_id 			int NOT NULL AUTO_INCREMENT,
  patient_id 					int NOT NULL,
  visit_date 					date NOT NULL,
  location 					varchar(255) NOT NULL,
  height 					int,
  weight 					int,
  bmi 						varchar(255),
  seizure_since_last_visit 			varchar(255),
  number_of_seizures 				int,
  any_triggers 				varchar(255),
  alcohol_trigger 				varchar(255),
  fever_trigger 				varchar(255),
  sound_light_and_touch_trigger 		varchar(255),
  emotional_stress_anger_boredom_trigger 	varchar(255),
  sleep_deprivation_and_overtired_trigger 	varchar(255),
  missed_medication_trigger 			varchar(255),
  menstruation_trigger 			varchar(255),
  silent_makers 				varchar(255),
  hospitalized_since_last_visit 		varchar(255),
  pregnant 					varchar(255),
  family_planning 				varchar(255),
  med_carbamazepine 				varchar(255),
  med_Phenobarbital 				varchar(255),
  med_Phenytoin 				varchar(255),
  med_Sodium_Valproate 			varchar(255),
  med_other 					varchar(255),
  comments 					varchar(2000) ,
  next_appointment_date 			date,
  PRIMARY KEY (epilepsy_followup_visit_id)
);