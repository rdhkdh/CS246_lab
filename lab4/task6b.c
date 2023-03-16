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
    FILE* fp3;
    fp = fopen("hss_electives.csv","r");
    fp1= fopen("task6b.sql","w");
    fp2=fopen("hss_courses.csv","r");
    fp3=fopen("violate_fk.csv","r");

    //insert hss_courses.csv into hss_course01
    char row2[MAXCHAR];
    char *token2;
    int j2=0;
    while (feof(fp2) != true)
    {
        fgets(row2, MAXCHAR, fp2);
        token2 = strtok(row2, ",");
        char* temp[2];
        int i2=0;
        while(token2 != NULL)
        {
            temp[i2]=token2;
            //printf("token2: %s\n", token2);
            token2 = strtok(NULL, ",");
            i2++;
        }
        //printf("%s\n",temp[0]);
        if(j2<=20)
        {
            fprintf(fp1,"insert into hss_course01(cid,cname) values('%s','%s');\n",temp[0],temp[1]);
        }
        j2++;
    }

    // insert hss_electives.csv into hss_table05
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
            fprintf(fp1,"insert into hss_table05(sno,roll_number,sname,cid,cname) values('%s','%s','%s','%s','%s');\n",temp[0],temp[1],temp[2],temp[3],temp[4]);
        }
        j++;
    }

    // insert violate_fk.csv into hss_table05
    char row3[MAXCHAR];
    char *token3;
    int j3=0;
    while (feof(fp3) != true)
    {
        fgets(row3, MAXCHAR, fp3);
        token3 = strtok(row3, ",");
        char* temp[5];
        int i3=0;
        while(token3 != NULL)
        {
            temp[i3]=token3;
            //printf("token3: %s\n", token3);
            token3 = strtok(NULL, ",");
            i3++;
        }
        //printf("%s\n",temp[0]);
        if(j3<=8)
        {
            fprintf(fp1,"insert into hss_table05(sno,roll_number,sname,cid,cname) values('%s','%s','%s','%s','%s');\n",temp[0],temp[1],temp[2],temp[3],temp[4]);
        }
        j3++;
    }
    
    fclose(fp3);
    fclose(fp2);
    fclose(fp1);
    fclose(fp);
    
}
