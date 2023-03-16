// Ridhiman Dhindsa, roll no. 210101088

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include<stdbool.h>
#define FALSE 0
#define TRUE 1
#define MAXCHAR 1000

struct student{
    char name[50];
    long long int roll_no;
};

struct course{
    int sem_no;
    char course_no[10];
    char name[50];
    int l,t,p,c;
};

struct grades{
    long long int roll_no;
    char course_no[10];
    char grade[3];
};

struct output{
    char stud_name[50];
    char course_name[50];
    int credits;
    char op_grade[3];
};

int comparator(struct output a,struct output b)
{
    if(strcmp(b.stud_name,a.stud_name) > 0)
    return 1;
    if(strcmp(a.stud_name,b.stud_name)==0 && a.credits>b.credits)
    {return 1;}
    if(strcmp(a.stud_name,b.stud_name)==0 && a.credits==b.credits && strcmp(a.op_grade,b.op_grade)<0)
    {return 1;}
    return 0;
}

void swap(struct output *A, struct output *B) {
    struct output temp = *A;
    *A = *B;
    *B = temp;
}

int partition(struct output array[], int low, int high)
{

    struct output pivot = array[high];
    int i = (low - 1);

    for (int j = low; j < high; j++)
    {
        if (comparator(array[j],pivot)>0)
        {
            i++;
            swap(&array[i], &array[j]);
        }
    }

    swap(&array[i + 1], &array[high]);
    return (i + 1);
}

void quickSort(struct output array[], int low, int high)
{
    if (low < high)
    {
        int pi = partition(array, low, high);
        quickSort(array, low, pi - 1);
        quickSort(array, pi + 1, high);
    }
}


int main()
{
    struct student a[160];
    struct course b[65];
    struct grades c[10000];
    struct output d[10000];

    /////////////////////////////////////////

    FILE* fp;
    fp=fopen("students01.csv","r");
    char row[MAXCHAR];
    char *token;

    int j=0;
    while (feof(fp) != true)
    {
        fgets(row, MAXCHAR, fp);

        token = strtok(row, ",");
        char* temp[2];

        int i=0;
        while(token != NULL)
        {
            temp[i]=token;
            token = strtok(NULL, ",");
            i++;
        }

        strcpy(a[j].name,temp[0]);
        a[j].roll_no= atoi(temp[1]);

        j++;
    }
    fclose(fp);

    ////////////////////////////////////

    FILE* fp3;
    fp3=fopen("courses01.csv","r");
    char row1[MAXCHAR];
    char *token1;

    int j1=0;
    while (feof(fp3) != true)
    {
        fgets(row1, MAXCHAR, fp3);

        token1 = strtok(row1, ",");
        char* temp[7];

        int i=0;
        while(token1 != NULL)
        {
            temp[i]=token1;
            token1 = strtok(NULL, ",");
            i++;
        }

        b[j1].sem_no = atoi(temp[0]);
        strcpy(b[j1].course_no,temp[1]);
        strcpy(b[j1].name,temp[2]);
        b[j1].l = atoi(temp[3]);
        b[j1].t = atoi(temp[4]);
        b[j1].p = atoi(temp[5]);
        b[j1].c = atoi(temp[6]);

        j1++;
    }
    fclose(fp3);

    ///////////////////////////////////////

    FILE* fp5;
    fp5=fopen("grades01.csv","r");
    char row3[MAXCHAR];
    char *token3;

    int j2=0;
    while (feof(fp5) != true)
    {
        fgets(row3, MAXCHAR, fp5);

        token3 = strtok(row3, ",");
        char* temp[3];

        int i=0;
        while(token3 != NULL)
        {
            temp[i]=token3;
            token3 = strtok(NULL, ",");
            i++;
        }

        c[j2].roll_no= atoi(temp[0]);
        strcpy(c[j2].course_no, temp[1]);
        strcpy(c[j2].grade, temp[2]);

        j2++;
    }
    fclose(fp5);

    //////////////////////////////////////

    for(int i=0;i<9954;i++)
    {
        for(int j=0;j<158;j++)
        {
            if(a[j].roll_no==c[i].roll_no) 
            { strcpy(d[i].stud_name, a[j].name); } //student name
        }

        for(int k=0;k<63;k++)
        {
            if(strcmp(b[k].course_no,c[i].course_no)==0)
            {
                strcpy(d[i].course_name, b[k].name); //course name
                d[i].credits= b[k].c; //credits
            }
        }

        strcpy(d[i].op_grade, c[i].grade); //grade
    }

    quickSort(d,0,9953);

    FILE* fp7;
    fp7=fopen("lab2op_qsort.txt","w");

    for(int i=0;i<9954;i++)
    {
        fprintf(fp7,"%s, %s, %d, %s\n",d[i].stud_name,d[i].course_name,d[i].credits,d[i].op_grade);
    }

    fclose(fp7);
}


