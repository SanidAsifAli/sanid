# read data from metadata tables   -- This is one time load. But if any new entry is added in meta table, then we have to run this gain.
dbt run --select meta_cyc_ctrl
dbt run --select meta_step_ctrl
dbt run --select meta_process_ctrl
dbt run --select meta_rule_ctrl


# call abc framework cycle start procedures
dbt run-operation call_meta_cyc_ctrl_start_sp --args '{"cyc_sk":"100", "force_ind":"N"}'

    # call abc framework step start procedures  (raw to stage data load step)
    dbt run-operation call_meta_step_ctrl_start_sp --args '{"step_sk":"10010"}'

        # table 1 data load & call abc framework process start & end procedures
        dbt run-operation call_meta_process_ctrl_start_sp --args '{"process_sk":"100100004", "step_sk":"10010"}'
        dbt run --select cur_valuation2
        
        #table 2  data load & call abc framework process start & end procedures
        dbt run-operation call_meta_process_ctrl_start_sp --args '{"process_sk":"100100002", "step_sk":"10010"}'
        
		dbt run --select cur_valuation1
        
        #table 3, 4, .... 

    # call abc framework step end procedures  (raw to stage data load step)
    dbt run-operation call_meta_step_ctrl_end_sp --args '{"step_sk":"10010"}'
 

    # call abc framework step start procedures  (dq check)
    dbt run-operation call_meta_step_ctrl_start_sp --args '{"step_sk":"10015"}' 
    
        # table 1 all dq check & call abc framework process start & end procedures
        dbt run-operation call_meta_process_ctrl_start_sp --args '{"process_sk":"100150004", "step_sk":"10015"}'
        dbt test --select cur_valuation2
        # table 1 update dq flag for all dq checks
        dbt run --select not_nulls_dq_update_raw_valuation2
        dbt run --select unique_dq_update_raw_valuation2
		
		dbt run-operation call_dq_meta_process_ctrl_end_sp --args '{"process_sk":"100150004"}'
        
        # table 2 all dq check & call abc framework process start & end procedures
        dbt run-operation call_meta_process_ctrl_start_sp --args '{"process_sk":"100150002", "step_sk":"10015"}'
		
		
        dbt test --select cur_valuation1
		
		
        # table 2 update dq flag for all dq checks
        dbt run --select not_nulls_dq_update_raw_valuation1
        dbt run --select unique_dq_update_raw_valuation1
        	dbt run-operation call_dq_meta_process_ctrl_end_sp --args '{"process_sk":"100150002"}'
        #table 3, 4, .... 
    
    # call abc framework step end procedures  (dq check)
    dbt run-operation call_meta_step_ctrl_end_sp --args '{"step_sk":"10015"}'   
    

# call abc framework cycle end procedures
dbt run-operation call_meta_cyc_ctrl_end_sp --args '{"cyc_sk":"100"}'


1. Cycle Start : Job #1 : 384461

2. Raw_To_Stage_Load_Start : Job #2 : 384463

3. Raw to Stage Table 1 Load: Job# 3 : 384465     

3. Raw to Stage Table 2 Load : Job# 4 : 384467

4. Raw to Stage Load End : Job #5 : 384468

5. Data Quality Start : Job #6 : 384469

6. Data Quality Table 1 Test: Job #7 : 384470

6. Data Quality Table 2 Test: Job #8: 384472

7. Data Quality End: Job #9: 384473

8. Cycle End: Job #10: 384475


