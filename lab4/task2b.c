#include<stdio.h>
#include <string.h>
#include <stdlib.h>
#include<stdbool.h>
#define MAXCHAR 1000

int main()
{
	FILE* fp;
    FILE* fp1;
    fp = fopen("hss_electives.csv","r");
    fp1= fopen("task2b.sql","w");

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
            fprintf(fp1,"insert into hss_table01(sno,roll_number,sname,cid,cname) values('%s','%s','%s','%s','%s');\n",temp[0],temp[1],temp[2],temp[3],temp[4]);
        }

        j++;
    }
    
    
    fclose(fp1);
    fclose(fp);
    
}
