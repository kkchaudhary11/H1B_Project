select year,job_title,AVG(prevailing_wage) as average from h1bapplication.h1b_finalByCat where full_time_position ='N'and prevailing_wage >0 group by job_title,year order by average desc;
