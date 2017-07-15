select jobtile,year,count(jobtile),case_status as count from h1b.h1b_final where year=2014 and case_status =='CERTIFIED' group by jobtile,year,case_status order by count desc limit 10;
