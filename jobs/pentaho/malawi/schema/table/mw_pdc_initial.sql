CREATE TABLE mw_pdc_initial (
  pdc_initial_visit_id 				int NOT NULL AUTO_INCREMENT,
  patient_id 					int NOT NULL,
  visit_date 					date DEFAULT NULL,
  location 					varchar(255) DEFAULT NULL,
  transfer_in_date				date DEFAULT NULL,
  phone_number					int DEFAULT NULL,
  relation_to_patient				varchar(255) DEFAULT NULL,
  agrees_to_fup					varchar(10) DEFAULT NULL,
  guardian_name 				varchar(255) DEFAULT NULL,
  guardian_age					varchar(255) DEFAULT NULL,
  marital_status				varchar(255) DEFAULT NULL,
  level_of_education				varchar(255) DEFAULT NULL,
  number_of_children				int DEFAULT NULL,
  income_source					varchar(255) DEFAULT NULL,
  mother_hiv_reactive				varchar(255) DEFAULT NULL,
  mother_on_art					varchar(255) DEFAULT NULL,
  child_hiv_reactive				varchar(255) DEFAULT NULL,
  child_on_art					varchar(255) DEFAULT NULL,
  eligible_for_poser				varchar(10) DEFAULT NULL,
  referral_form_filled				varchar(10) DEFAULT NULL,
  birth_site					varchar(255) DEFAULT NULL,
  birth_history_svd				varchar(255) DEFAULT NULL,
  birth_history_cs				varchar(255) DEFAULT NULL,
  birth_history_agpar				varchar(255) DEFAULT NULL,
  birth_history_bwt				varchar(255) DEFAULT NULL,
  perinatal_infection				varchar(255) DEFAULT NULL,
  perinatal_infection_specify			varchar(255) DEFAULT NULL,
  antibiotics					varchar(10) DEFAULT NULL,
  antibiotics_duration				varchar(255) DEFAULT NULL,
  currently_on_medication			varchar(255) DEFAULT NULL,
  currently_on_medication_specify		varchar(255) DEFAULT NULL,
  type_of_feed_breast_milk			varchar(255) DEFAULT NULL,
  type_of_feed_infant_formula			varchar(255) DEFAULT NULL,
  type_of_feed_mixed_feeding			varchar(255) DEFAULT NULL,
  type_of_feed_solids				varchar(255) DEFAULT NULL,
  feeding_method_bf				varchar(255) DEFAULT NULL,
  feeding_method_cup				varchar(255) DEFAULT NULL,
  feeding_method_ogt				varchar(255) DEFAULT NULL,
  feeding_method_other				varchar(255) DEFAULT NULL,
  notes						varchar(255) DEFAULT NULL,
  reason_for_referral_premature_birth  		varchar(255) DEFAULT NULL,
  reason_for_referral_hie			varchar(255) DEFAULT NULL,
  reason_for_referral_low_birth_weight 		varchar(255) DEFAULT NULL,
  reason_for_referral_hydrocephalus		varchar(255) DEFAULT NULL,
  reason_for_referral_cleft_lip			varchar(255) DEFAULT NULL,
  reason_for_referral_cleft_palate		varchar(255) DEFAULT NULL,
  reason_for_referral_cns_infection		varchar(255) DEFAULT NULL,
  reason_for_referral_cns_infection_specify 	varchar(255) DEFAULT NULL,
  reason_for_referral_other			varchar(255) DEFAULT NULL,
  reason_for_referral_other_specify		varchar(255) DEFAULT NULL,
  reason_for_referral_trisomy_21		varchar(255) DEFAULT NULL,
  reason_for_referral_severe_malnutrition 	varchar(255) DEFAULT NULL,
  reason_for_referral_epilepsy 			varchar(255) DEFAULT NULL,
  enrolled_in_pdc		 		varchar(255) DEFAULT NULL,
  premature_birth 				varchar(255) DEFAULT NULL,
  hie						varchar(255) DEFAULT NULL,
  low_birth_weight				varchar(255) DEFAULT NULL,
  hydrocephalus					varchar(255) DEFAULT NULL,
  cleft_lip					varchar(255) DEFAULT NULL,
  cleft_palate					varchar(255) DEFAULT NULL,
  cns_infection					varchar(255) DEFAULT NULL,
  cns_infection_specify				varchar(255) DEFAULT NULL,
  diagnosis_other				varchar(255) DEFAULT NULL,
  diagnosis_other_specify			varchar(255) DEFAULT NULL,
  trisomy_21					varchar(255) DEFAULT NULL,
  severe_malnutrition 				varchar(255) DEFAULT NULL,
  epilepsy 					varchar(255) DEFAULT NULL,
  care_linked					varchar(255) DEFAULT NULL,
  clinical_care					varchar(255) DEFAULT NULL,
  nru						varchar(255) DEFAULT NULL,
  ic3						varchar(255) DEFAULT NULL,
  advanced_ncd					varchar(255) DEFAULT NULL,
  mental_health_clinic				varchar(255) DEFAULT NULL,
  palliative					varchar(255) DEFAULT NULL,
  physiotherapy					varchar(255) DEFAULT NULL,
  other_support					varchar(255) DEFAULT NULL,
  PRIMARY KEY (pdc_initial_visit_id)
) ;