#!/bin/bash 
show_menu()
{
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Red
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    echo -e "${MENU}\e[1m\e[47m\e[95m******************************H1B DashBoard******************************************${NORMAL}"
echo -e "${MENU} \e[39m#Use the following options to perform the operation on H1B dataset # ${NORMAL}"
    echo -e "${MENU}${NUMBER} 1)${MENU}  Is the number of petitions with Data Engineer job title increasing over time? ${NORMAL}"
    echo -e "${MENU}${NUMBER} 2)${MENU}  Find top 5 job titles who are having highest avg growth in applications.
 ${NORMAL}"
    echo -e "${MENU}${NUMBER} 3)${MENU}  Which part of the US has the most Data Engineer jobs for each year? ${NORMAL}"
    echo -e "${MENU}${NUMBER} 4)${MENU}  find top 5 locations in the US who have got certified visa for each year.
 ${NORMAL}"
    echo -e "${MENU}${NUMBER} 5)${MENU} Which industry(SOC_NAME) has the most number of Data Scientist positions?
 ${NORMAL}"
    echo -e "${MENU}${NUMBER} 6)${MENU} Which top 5 employers file the most petitions each year? - Case Status - ALL
 ${NORMAL}"
    echo -e "${MENU}${NUMBER} 7)${MENU} Find the most popular top 10 job positions for H1B visa applications for each year for all the applications${NORMAL}"
    echo -e "${MENU}${NUMBER} 8)${MENU} Find the most popular top 10 job positions for H1B visa applications for each year for all certified applications${NORMAL}"
echo -e "${MENU}${NUMBER} 9)${MENU} Find the percentage of each case status on total applications for each year. "${NORMAL}
echo -e "${MENU}${NUMBER} 10)${MENU} Depict the number of applications for each year ${NORMAL}"
echo -e "${MENU}${NUMBER} 11)${MENU} Find the average Prevailing Wage for each Job for each Year for full time only?Output in desc order ${NORMAL}"
echo -e "${MENU}${NUMBER} 12)${MENU}  Find the average Prevailing Wage for each Job for each Year for part time only?Output in desc order ${NORMAL}"
echo -e "${MENU}${NUMBER} 13)${MENU} Which are the employers along with the number of petitions who have the success rate more than 70%  in petitions. (total petitions filed more than 1000) ? ${NORMAL}"
echo -e "${MENU}${NUMBER} 14)${MENU} Which are the jobpositions along with the number of petitions who have the success rate more than 70%  in petitions. (total petitions filed more than 1000) ? ${NORMAL}"
echo -e "${MENU}${NUMBER} 15)${MENU} Export result for question no 10 to MySql database.${NORMAL}"


    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${ENTER_LINE}Please enter a menu option and enter or ${RED_TEXT}enter to exit. ${NORMAL}"
    read opt
}
function option_picked() 
{
    COLOR='\033[01;31m' # bold red
    RESET='\033[00;00m' # normal white
    MESSAGE="$1"  #modified to post the correct option selected
    echo -e "${COLOR}${MESSAGE}${RESET}"
}

function getpinCodeBank(){
	echo "in getPinCodebank"
	echo $1
	echo $2
	#hive -e "Select * from AppData where PinCode = $1 AND Bank = '$2'"
}

clear
show_menu
while [ opt != '' ]
    do
    if [[ $opt = "" ]]; then 
            exit;
    else
        case $opt in
        1) clear;
        hadoop jar h1b.jar Ques1a /user/hive/warehouse/h1b.db/h1b_final /h1b/output/ans1a;
 	hadoop fs -cat /h1b/ans1a/p*;

        show_menu;
        ;;

        2) clear;
	hadoop jar h1b.jar Ques1b /user/hive/warehouse/h1b.db/h1b_final /h1b/output/ans1b;
	hadoop fs -cat /h1b/ans1b/p*;

        show_menu;
        ;;
            
        3) clear;
      	pig pig/ques2a.pig;
        show_menu;
        ;;
	
        4) clear;
	pig pig/ques2b.pig;
        show_menu;
        ;;
        5) clear;
      	hive -f hive/ques3.sql;
        show_menu;
        ;;
       6) clear;
       pig pig/ques4.pig;
       show_menu;
        ;;
7) clear;
 option_picked "Search Based on Year";
   
        echo -e "${MENU}**${NUMBER} 1)${MENU} 2011 ${NORMAL}"
        echo -e "${MENU}**${NUMBER} 2)${MENU} 2012 ${NORMAL}"
        echo -e "${MENU}**${NUMBER} 3)${MENU} 2013 ${NORMAL}"
        echo -e "${MENU}**${NUMBER} 4)${MENU} 2014 ${NORMAL}"
        echo -e "${MENU}**${NUMBER} 5)${MENU} 2015 ${NORMAL}"
        echo -e "${MENU}**${NUMBER} 6)${MENU} 2016 ${NORMAL}"
	    read n
	    case $n in
                1)	echo "For 2011"
                    hive -f hive/ques5/ques5A2011.sql;
                    ;;			
                    
                2) echo "For 2012"
                    hive -f hive/ques5/ques5A2012.sql;
                    ;;
                    
                3) echo "for 2013"
                    hive -f hive/ques5/ques5A2013.sql;
                    ;;
                    
                4) echo "For 2014"
                    hive -f hive/ques5/ques5A2014.sql;
                    ;;
                    
                5) echo "For 2015"
                    hive -f hive/ques5/ques5A2015.sql;
                    ;;
                6) echo "For 2016"
                    hive -f hive/ques5/ques5A2016.sql;
                    ;;
                *) echo "Please Select one among the option[1-6]";;
        esac
        show_menu;
        ;;

8) clear;
 option_picked "Search Based on Year";
   
        echo -e "${MENU}**${NUMBER} 1)${MENU} 2011 ${NORMAL}"
        echo -e "${MENU}**${NUMBER} 2)${MENU} 2012 ${NORMAL}"
        echo -e "${MENU}**${NUMBER} 3)${MENU} 2013 ${NORMAL}"
        echo -e "${MENU}**${NUMBER} 4)${MENU} 2014 ${NORMAL}"
        echo -e "${MENU}**${NUMBER} 5)${MENU} 2015 ${NORMAL}"
        echo -e "${MENU}**${NUMBER} 6)${MENU} 2016 ${NORMAL}"
	    read n
	    case $n in
                1)	echo "For 2011"
                    hive -f hive/ques5/ques5B2011.sql;
                    ;;			
                    
                2) 	echo "For 2012"
                    hive -f hive/ques5/ques5B2012.sql;
                    ;;
                    
                3) 	echo "for 2013"
                    hive -f hive/ques5/ques5B2013.sql;
                    ;;
                    
                4) 	echo "For 2014"
                    hive -f hive/ques5/ques5B2014.sql;
                    ;;
                    
                5) 	echo "For 2015"
                    hive -f hive/ques5/ques5B2015.sql;
                    ;;
                6) 	echo "For 2016"
                    hive -f hive/ques5/ques5B2016.sql;
                    ;;
                *) echo "Please Select one among the option[1-6]";;
        esac
        show_menu;
        ;;

       9) clear;
       pig pig/ques6.pig ;
        show_menu;
        ;;
    
        10) clear;
        hadoop jar h1b.jar Ques7 /user/hive/warehouse/h1b.db/h1b_final h1b/output/ans7;
 	hadoop fs -cat /output/ans7/p*;

        show_menu;
        ;;
      11) clear;
       hive -e "select year,job_title,AVG(prevailing_wage) as average from h1b.h1b_finalByCat where full_time_position ='Y'and prevailing_wage >0 group by job_title,year order by average desc;" 

        show_menu;
        ;;
 12) clear;
       hive -e "select year,job_title,AVG(prevailing_wage) as average from h1b.h1b_finalByCat where full_time_position ='N'and prevailing_wage >0 group by job_title,year order by average desc;" 

        show_menu;
        ;;
        

 13) clear;
	hadoop jar h1b.jar Ques9 /user/hive/warehouse/h1b.db/h1b_final h1b/output/ans9;
	hadoop fs -cat /output/ans9/p*;
 	show_menu;
        ;;
14) clear;
	hadoop jar h1b.jar Ques10 /user/hive/warehouse/h1b.db/h1b_final h1b/output/ans10;
	hadoop fs -cat /output/ans10/p*;
 	show_menu;
        ;;
15) clear;
        option_picked "Now lets export the Ans10 to MySql";
	sqoop export --connect jdbc:mysql://localhost/h1b --username root --password '1231' --table exportques10 --export-dir /h1b/ques10output --input-fields-terminated-by '\t' ;
;;

       
\n) exit;
        ;;

        *) clear;
        option_picked "Pick an option from the menu";
        show_menu;
        ;;
    esac
fi



done



