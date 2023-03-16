#include<stdio.h>
//#include<time.h>
#include<stdlib.h>

void date_generate(char* str,int n)
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
        else if(year==2023) { mnth= "Jan"; date=1; }
        else { mnth=months[rand()%12]; }

        
        if(year==1947 && mnth=="Aug") {date=15+rand()%17;}
        else if(mnth=="Apr"||"Jun"||"Sep"||"Nov") {date= 1+rand()%30;}
        else if(mnth=="Feb") {date=1+rand()%28;}
        else {date=1+rand()%31;}

        fprintf(fp,"%02d-%s-%d\n",date,mnth,year);
    }

    fclose(fp);
}

int main()
{
    date_generate("d10k.txt",10000);
    date_generate("d20k.txt",20000);
    date_generate("d40k.txt",40000);
    date_generate("d80k.txt",80000);
    date_generate("d160k.txt",160000);
    date_generate("d320k.txt",320000);
    date_generate("d640k.txt",640000);
    date_generate("d1280k.txt",1280000);
    date_generate("d2560k.txt",2560000);
    date_generate("d5120k.txt",5120000);
}