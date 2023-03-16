//(read, bubble_sort, write) for DATES

#include<time.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>
#define FALSE 0
#define TRUE 1

struct Date
{
    int dd, mm, yy;
};

int compare(struct Date d1,struct Date d2)
{
    if(d1.yy < d2.yy)
    {return 1;}
    if(d1.yy == d2.yy && d1.mm < d2.mm)
    {return 1;}
    if(d1.yy == d2.yy && d1.mm == d2.mm && d1.dd < d2.dd) 
    {return 1;}

    return 0;
}

void BubbleSort(struct Date arr[], int n)
{
    for (int j = 0; j < n; j++)
    {
        bool swap_status = FALSE;
        for (int i = 0; i < n - j - 1; i++)
        {
            if (compare(arr[i+1],arr[i]))
            {
                struct Date temp = arr[i];
                arr[i]= arr[i+1];
                arr[i+1]= temp;
                swap_status = TRUE;
            }
        }
        if (swap_status == FALSE) {break;}
    }
}

int main()
{
    char str[20];
    printf("Enter file name to read from: ");
    scanf("%s",str);

    int n;
    printf("Enter file size: ");
    scanf("%d",&n);

    FILE* fp=fopen(str,"r");
    struct Date arr[n];

    char s[12];
    for (int i = 0; i < n; i++)
    {
        fscanf(fp,"%s",s);
        arr[i].dd = (s[0]-'0')*10 + (s[1] - '0');

        if(s[3] == 'J' && s[4]== 'a' &&s[5]== 'n') {arr[i].mm = 1;}
        if(s[3] == 'F' && s[4]== 'e' &&s[5]== 'b') {arr[i].mm = 2;}       
        if(s[3] == 'M' && s[4]== 'a' &&s[5]== 'r') {arr[i].mm = 3;}  
        if(s[3] == 'A' && s[4]== 'p' &&s[5]== 'r') {arr[i].mm = 4;}       
        if(s[3] == 'M' && s[4]== 'a' &&s[5]== 'y') {arr[i].mm = 5;}       
        if(s[3] == 'J' && s[4]== 'u' &&s[5]== 'n') {arr[i].mm = 6;}       
        if(s[3] == 'J' && s[4]== 'u' &&s[5]== 'l') {arr[i].mm = 7;}       
        if(s[3] == 'A' && s[4]== 'u' &&s[5]== 'g') {arr[i].mm = 8;}       
        if(s[3] == 'S' && s[4]== 'e' &&s[5]== 'p') {arr[i].mm = 9;}        
        if(s[3] == 'O' && s[4]== 'c' &&s[5]== 't') {arr[i].mm = 10;}      
        if(s[3] == 'N' && s[4]== 'o' &&s[5]== 'v') {arr[i].mm = 11;}
        if(s[3] == 'D' && s[4]== 'e' &&s[5]== 'c') {arr[i].mm = 12;}
        
        arr[i].yy = (s[7]-'0')*1000 + (s[8] - '0')*100 + (s[9]-'0')*10 + (s[10] - '0');
    }

    FILE *fp3;
    fp3=fopen("210101088_output.txt","a");
    clock_t start, end1, end2;
    double only_sort,sort_write;

    start = clock();
    BubbleSort(arr,n);
    end1=clock();

    fclose(fp);
    
    char str2[20];
    printf("Enter file name to write to:");
    scanf("%s",str2);

    FILE* fp2 = fopen(str2,"w");
    for (int i = 0; i < n; i++)
    {
        fprintf(fp2,"%d-%d-%d\n",arr[i].dd,arr[i].mm,arr[i].yy);
    }
    end2=clock();
    fclose(fp2);

    only_sort = ((double) (end1 - start)) / CLOCKS_PER_SEC;
    sort_write = ((double) (end2 - start)) / CLOCKS_PER_SEC;

    fprintf(fp3,"Dates %d\t\t%f\t%f\n",n,only_sort,sort_write);

    fclose(fp3);
}