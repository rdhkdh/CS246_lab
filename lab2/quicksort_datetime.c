// read, quicksort, write for DATES
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<time.h>

struct Date
{
    int dd,mm,yy,hr,min,sec;
};

void swap(long long int *p, long long int *q)
{
    long long int temp;
    temp = *p;
    *p = *q;
    *q = temp;
}

int partition(long long int array[], int low, int high)
{

    int pivot = array[high];
    int i = (low - 1);

    for (int j = low; j < high; j++)
    {
        if (array[j] < pivot)
        {
            i++;
            swap(&array[i], &array[j]);
        }
    }

    swap(&array[i + 1], &array[high]);
    return (i + 1);
}

void quickSort(long long int array[], int low, int high)
{
    if (low < high)
    {
        int pi = partition(array, low, high);
        quickSort(array, low, pi - 1);
        quickSort(array, pi + 1, high);
    }
}

int32_t main()
{
    char str[20];
    printf("Enter file name to read from: ");
    scanf("%s",str);

    int n;
    printf("Enter file size: ");
    scanf("%d",&n);

    FILE* fp=fopen(str,"r");
    struct Date arr[n];
    long long int converted[n];

    char s[12],t[9];
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

        fscanf(fp,"%s",t);
        arr[i].hr = (t[0]-'0')*10 + (t[1] - '0');
        arr[i].min = (t[3]-'0')*10 + (t[4] - '0');
        arr[i].sec = (t[6]-'0')*10 + (t[7] - '0');

        converted[i]= 1000000*arr[i].yy+ 10000*arr[i].mm+ 100*arr[i].dd+ arr[i].hr;
    }

    clock_t start, end1, end2;
    double only_sort,sort_write;

    start = clock();
    quickSort(converted,0,n-1);
    end1 = clock();

    fclose(fp);
    
    char str2[20];
    printf("Enter file name to write to:");
    scanf("%s",str2);

    FILE* fp2 = fopen(str2,"w");
    for (int i = 0; i < n; i++)
    {
        int year= converted[i]/1000000;
        converted[i]= converted[i]%1000000;

        int month= converted[i]/10000;
        converted[i]= converted[i]%10000;

        int date= converted[i]/100;
        int hour= converted[i]%100;


        fprintf(fp2,"%d-%d-%d %d:%d:%d\n",date,month,year,hour,arr[i].min,arr[i].sec);
    }
    end2 = clock();
    fclose(fp2);

    only_sort = ((double) (end1 - start)) / CLOCKS_PER_SEC;
    sort_write = ((double) (end2 - start)) / CLOCKS_PER_SEC;

    FILE *fp3;
    fp3=fopen("210101088_output.txt","a");
    fprintf(fp3,"Date_time %d\t\t%f\t%f\n",n,only_sort,sort_write);

    fclose(fp3);
}