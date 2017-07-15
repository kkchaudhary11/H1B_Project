bag1 = load '/user/hive/warehouse/h1b.db/h1b_final' using PigStorage() as (s_no:int,case_status:chararray,employer_name:chararray,soc_name:chararray,job_title:chararray,full_time_position:chararray,prevailing_wage:int,year:int,worksite:chararray,long:double,lati:double);
bag2 = filter bag1 by ($1 MATCHES 'CERTIFIED');
bag3 = group bag2 by (year,worksite);
bag4 = foreach bag3 generate group,COUNT(bag2) as total;
bag5 = foreach bag4 generate FLATTEN(group),total;
bag6 = group bag5 by year;
bag7 = foreach bag6{
sorted = order bag5 by total desc;
top5 = limit sorted 5;
generate flatten(top5);
};
dump bag7;


 
