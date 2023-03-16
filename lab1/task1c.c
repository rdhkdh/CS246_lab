#include<stdio.h>
//#include<time.h>
#include<stdlib.h>

void date_time_generate(char* str,int n)
{
    FILE *fp;
    fp= fopen(str,"w");

    char *months[12]={"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};

    for(int i=1;i<=n;i++)
    {
        int year= 1947+rand()%77 ;

        char *mnth;
        int date;
        if(year==1947)
        {
            mnth= months[7+rand()%5];
        }
        else if(year==2023) { mnth= "Jan"; date=1+rand()%9; }
        else { mnth=months[rand()%12]; }

        
        if(year==1947 && mnth=="Aug") {date=15+rand()%17;}
        else if(mnth=="Apr"||"Jun"||"Sep"||"Nov") {date= 1+rand()%30;}
        else if(mnth=="Feb") {date=1+rand()%28;}
        else {date=1+rand()%31;}

        int hr,min,sec;
        hr=rand()%24;
        min=rand()%60;
        sec=rand()%60;
        fprintf(fp,"%02d-%s-%d %02d:%02d:%02d\n",date,mnth,year,hr,min,sec);
    }

    fclose(fp);
}

int main()
{
    date_time_generate("dt10k.txt",10000);
    date_time_generate("dt20k.txt",20000);
    date_time_generate("dt40k.txt",40000);
    date_time_generate("dt80k.txt",80000);
    date_time_generate("dt160k.txt",160000);
    date_time_generate("dt320k.txt",320000);
    date_time_generate("dt640k.txt",640000);
    date_time_generate("dt1280k.txt",1280000);
    date_time_generate("dt2560k.txt",2560000);
    date_time_generate("dt5120k.txt",5120000);
}