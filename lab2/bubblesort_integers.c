//(read, bubble_sort, write, time) for INTEGERS
#include<time.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>
#define FALSE 0
#define TRUE 1
int arr[5120010];

void swap(int *p, int *q)
{
    int temp;
    temp = *p;
    *p = *q;
    *q = temp;
}

void BubbleSort(int arr[], int n)
{
    for (int j = 0; j < n; j++)
    {
        bool swap_status = FALSE;
        for (int i = 0; i < n - j - 1; i++)
        {
            if (arr[i] > arr[i + 1])
            {
                swap(&arr[i], &arr[i + 1]);
                swap_status = TRUE;
            }
        }
        if (swap_status == FALSE)
        {
            break;
        }
    }
}

void integer_read(char *str, int n)
{
    FILE *fp;
    fp = fopen(str, "r");

    int x;
    for (int i = 0; i < n; i++)
    {
        fscanf(fp, "%d", &x);
        arr[i] = x;
    }

    fclose(fp);
}

void integer_write(char *str,int n)
{
    FILE *fp;
    fp = fopen(str, "w");

    for (int i = 0; i < n; i++)
    {
        fprintf(fp,"%d\n",arr[i]); 
    }

    fclose(fp);
}

int main()
{
    char str[20];
    printf("Enter file name to read from: ");
    scanf("%s",str);

    int n;
    printf("Enter file size: ");
    scanf("%d",&n);

    char str2[20];
    printf("Enter file name to write to:");
    scanf("%s",str2);


    clock_t start, end1, end2,end3,end4,end5,end6;
    double only_sort1,sort_write1,only_sort2,sort_write2,only_sort3,sort_write3;
     
    start = clock();
    integer_read(str, n);
    BubbleSort(arr,n);
    end1=clock();
    integer_write(str2,n);
    end2=clock();

    only_sort1 = ((double) (end1 - start)) / CLOCKS_PER_SEC;
    sort_write1 = ((double) (end2 - start)) / CLOCKS_PER_SEC;
    

    FILE *fp2;
    fp2=fopen("210101088_output.txt","a");
    fprintf(fp2,"Integers %d\t\t%f\t%f\n",n,only_sort1,sort_write1);

    fclose(fp2);
}