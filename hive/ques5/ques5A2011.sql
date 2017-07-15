select job_title,year,count(job_title) as count from h1b.h1b_final where year=2011 group by job_title,year order by count desc limit 10;

