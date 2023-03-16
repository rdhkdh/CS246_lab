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

    //int arr[n];
    int x;

    for (int i = 0; i < n; i++)
    {
        fscanf(fp, "%d", &x);
        arr[i] = x;
    }

    printf("array of size %d read\n",n);

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
    clock_t start, end1, end2,end3,end4,end5,end6;
    double only_sort1,sort_write1,only_sort2,sort_write2,only_sort3,sort_write3;
     
    start = clock();
    integer_read("i10k.txt", 10000);
    BubbleSort(arr,10000);
    end1=clock();
    integer_write("bi10k.txt",10000);
    end2=clock();

    only_sort1 = ((double) (end1 - start)) / CLOCKS_PER_SEC;
    sort_write1 = ((double) (end2 - start)) / CLOCKS_PER_SEC;
    
    start = clock();
    integer_read("i20k.txt", 20000); 
    BubbleSort(arr,20000);
    end3=clock();
    integer_write("bi20k.txt",20000);
    end4=clock();

    only_sort2 = ((double) (end3 - start)) / CLOCKS_PER_SEC;
    sort_write2 = ((double) (end4 - start)) / CLOCKS_PER_SEC;

    start = clock();
    integer_read("i40k.txt", 40000);
    BubbleSort(arr,40000);
    end5=clock();
    integer_write("bi40k.txt",40000);
    end6=clock();

    only_sort3 = ((double) (end5 - start)) / CLOCKS_PER_SEC;
    sort_write3 = ((double) (end6 - start)) / CLOCKS_PER_SEC;

    // integer_read("i80k.txt", 80000); //starts taking a lot of time
    // BubbleSort(arr,80000);
    // integer_write("bi80k.txt",80000);

    // integer_read("i160k.txt", 160000);
    // BubbleSort(arr,160000);
    // integer_write("bi160k.txt",160000);

    // integer_read("i320k.txt", 320000);
    // BubbleSort(arr,320000);
    // integer_write("bi320k.txt",320000);

    // integer_read("i640k.txt", 640000);
    // BubbleSort(arr,640000);
    // integer_write("bi640k.txt",640000);

    // integer_read("i1280k.txt", 1280000);
    // BubbleSort(arr,1280000);
    // integer_write("bi1280k.txt",1280000);

    // integer_read("i2560k.txt", 2560000);
    // BubbleSort(arr,2560000);
    // integer_write("bi2560k.txt",2560000);

    // integer_read("i5120k.txt", 5120000);
    // BubbleSort(arr,5120000);
    // integer_write("bi5120k.txt",5120000);

    FILE *fp2;
    fp2=fopen("210101088_output.txt","w");

    fprintf(fp2,"Bubble Sort\n");
    fprintf(fp2,"Description\t\tOnly Sorting\tSorting and writing\n");
    fprintf(fp2,"Integers 10k\t%f\t%f\n",only_sort1,sort_write1);
    fprintf(fp2,"Integers 20k\t%f\t%f\n",only_sort2,sort_write2);
    fprintf(fp2,"Integers 40k\t%f\t%f\n",only_sort3,sort_write3);
    fprintf(fp2,"\n");

    fclose(fp2);
}