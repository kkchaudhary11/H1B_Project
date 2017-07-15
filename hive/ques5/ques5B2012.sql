select job_title,year,count(job_title),case_status as count from h1b.h1b_final where year=2012 and case_status =='CERTIFIED' group by job_title,year,case_status order by count desc limit 10;
