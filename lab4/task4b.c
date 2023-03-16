#include<stdio.h>
#include <string.h>
#include <stdlib.h>
#include<stdbool.h>
#define MAXCHAR 1000

int main()
{
	FILE* fp;
    FILE* fp1;
    FILE* fp2;
    fp = fopen("hss_electives.csv","r");
    fp1= fopen("task4b.sql","w"); 
    fp2=fopen("additional_hss_course.csv","r");

    char row[MAXCHAR];
    char *token;

    int j=0;
    while (feof(fp) != true)
    {
        fgets(row, MAXCHAR, fp);

        token = strtok(row, ",");
        char* temp[5];

        int i=0;
        while(token != NULL)
        {
            temp[i]=token;
            //printf("Token: %s\n", token);
            token = strtok(NULL, ",");
            i++;
        }

        //printf("%s\n",temp[0]);
        if(j<=1430)
        {
            fprintf(fp1,"insert into hss_table03(sno,roll_number,sname,cid,cname) values('%s','%s','%s','%s','%s');\n",temp[0],temp[1],temp[2],temp[3],temp[4]);
        }

        j++;
    }

    char row2[MAXCHAR];
    char *token2;

    int j2=0;
    while (feof(fp2) != true)
    {
        fgets(row2, MAXCHAR, fp2);

        token2 = strtok(row2, ",");
        char* temp[5];

        int i2=0;
        while(token2 != NULL)
        {
            temp[i2]=token2;
            //printf("token2: %s\n", token2);
            token2 = strtok(NULL, ",");
            i2++;
        }

        //printf("%s\n",temp[0]);
        if(j2<=8)
        {
            fprintf(fp1,"insert into hss_table03(sno,roll_number,sname,cid,cname) values('%s','%s','%s','%s','%s');\n",temp[0],temp[1],temp[2],temp[3],temp[4]);
        }

        j2++;
    }
    
    fclose(fp2);
    fclose(fp1);
    fclose(fp);
    
}
