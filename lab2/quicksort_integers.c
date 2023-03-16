//(read, quick_sort, write, time) for INTEGERS
#include <time.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
int arr[5120010];

void swap(int *p, int *q)
{
    int temp;
    temp = *p;
    *p = *q;
    *q = temp;
}

int partition(int array[], int low, int high)
{

    int pivot = array[high];
    int i = (low - 1);

    for (int j = low; j < high; j++)
    {
        if (array[j] <= pivot)
        {
            i++;
            swap(&array[i], &array[j]);
        }
    }

    swap(&array[i + 1], &array[high]);
    return (i + 1);
}

void quickSort(int array[], int low, int high)
{
    if (low < high)
    {
        int pi = partition(array, low, high);
        quickSort(array, low, pi - 1);
        quickSort(array, pi + 1, high);
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
    char str[20];
    printf("Enter file name to read from: ");
    scanf("%s",str);

    int n;
    printf("Enter file size: ");
    scanf("%d",&n);

    char str2[20];
    printf("Enter file name to write to:");
    scanf("%s",str2);

    FILE *fp2;
    fp2=fopen("210101088_output.txt","a");
    clock_t start, end1, end2;
    double only_sort,sort_write;

    start = clock();
    integer_read(str, n);
    quickSort(arr,0,n-1);
    end1=clock();
    integer_write(str2,n);
    end2=clock();

    only_sort = ((double) (end1 - start)) / CLOCKS_PER_SEC;
    sort_write = ((double) (end2 - start)) / CLOCKS_PER_SEC;

    fprintf(fp2,"Integers %d\t\t%f\t%f\n",n,only_sort,sort_write);

    fclose(fp2);

}