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
    FILE *fp2;
    fp2=fopen("210101088_output.txt","a");
    clock_t start, end1, end2;
    double only_sort,sort_write;
     
    start = clock();
    integer_read("i10k.txt", 10000);
    quickSort(arr,0,9999);
    end1 = clock();
    integer_write("qi10k.txt",10000);
    end2 = clock();

    only_sort = ((double) (end1 - start)) / CLOCKS_PER_SEC;
    sort_write = ((double) (end2 - start)) / CLOCKS_PER_SEC;

    fprintf(fp2,"\nQuick Sort\n");
    fprintf(fp2,"Description\t\tOnly Sorting\tSorting and writing\n");
    fprintf(fp2,"Integers 10k\t%f\t%f\n",only_sort,sort_write);

    start = clock();
    integer_read("i20k.txt", 20000); 
    quickSort(arr,0,19999);
    end1 = clock();
    integer_write("qi20k.txt",20000);
    end2 = clock();

    only_sort = ((double) (end1 - start)) / CLOCKS_PER_SEC;
    sort_write = ((double) (end2 - start)) / CLOCKS_PER_SEC;
    fprintf(fp2,"Integers 20k\t%f\t%f\n",only_sort,sort_write);

    start = clock();
    integer_read("i40k.txt", 40000);
    quickSort(arr,0,39999);
    end1 = clock();
    integer_write("qi40k.txt",40000);
    end2 = clock();

    only_sort = ((double) (end1 - start)) / CLOCKS_PER_SEC;
    sort_write = ((double) (end2 - start)) / CLOCKS_PER_SEC;
    fprintf(fp2,"Integers 40k\t%f\t%f\n",only_sort,sort_write);

    start = clock();
    integer_read("i80k.txt", 80000);
    quickSort(arr,0,79999);
    end1 = clock();
    integer_write("qi80k.txt",80000);
    end2 = clock();

    only_sort = ((double) (end1 - start)) / CLOCKS_PER_SEC;
    sort_write = ((double) (end2 - start)) / CLOCKS_PER_SEC;
    fprintf(fp2,"Integers 80k\t%f\t%f\n",only_sort,sort_write);

    start = clock();
    integer_read("i160k.txt", 160000);
    quickSort(arr,0,159999);
    end1 = clock();
    integer_write("qi160k.txt",160000);
    end2 = clock();

    only_sort = ((double) (end1 - start)) / CLOCKS_PER_SEC;
    sort_write = ((double) (end2 - start)) / CLOCKS_PER_SEC;
    fprintf(fp2,"Integers 160k\t%f\t%f\n",only_sort,sort_write);

    start = clock();
    integer_read("i320k.txt", 320000);
    quickSort(arr,0,319999);
    end1 = clock();
    integer_write("qi320k.txt",320000);
    end2 = clock();

    only_sort = ((double) (end1 - start)) / CLOCKS_PER_SEC;
    sort_write = ((double) (end2 - start)) / CLOCKS_PER_SEC;
    fprintf(fp2,"Integers 320k\t%f\t%f\n",only_sort,sort_write);

    start = clock();
    integer_read("i640k.txt", 640000);
    quickSort(arr,0,639999);
    end1 = clock();
    integer_write("qi640k.txt",640000);
    end2 = clock();

    only_sort = ((double) (end1 - start)) / CLOCKS_PER_SEC;
    sort_write = ((double) (end2 - start)) / CLOCKS_PER_SEC;
    fprintf(fp2,"Integers 640k\t%f\t%f\n",only_sort,sort_write);

    start = clock();
    integer_read("i1280k.txt", 1280000);
    quickSort(arr,0,1279999);
    end1 = clock();
    integer_write("qi1280k.txt",1280000);
    end2 = clock();

    only_sort = ((double) (end1 - start)) / CLOCKS_PER_SEC;
    sort_write = ((double) (end2 - start)) / CLOCKS_PER_SEC;
    fprintf(fp2,"Integers 1280k\t%f\t%f\n",only_sort,sort_write);

    start = clock();
    integer_read("i2560k.txt", 2560000);
    quickSort(arr,0,2559999);
    end1 = clock();
    integer_write("qi2560k.txt",2560000);
    end2 = clock();

    only_sort = ((double) (end1 - start)) / CLOCKS_PER_SEC;
    sort_write = ((double) (end2 - start)) / CLOCKS_PER_SEC;
    fprintf(fp2,"Integers 2560k\t%f\t%f\n",only_sort,sort_write);

    start = clock();
    integer_read("i5120k.txt", 5120000);
    quickSort(arr,0,5119999);
    end1 = clock();
    integer_write("qi5120k.txt",5120000);
    end2 = clock();

    only_sort = ((double) (end1 - start)) / CLOCKS_PER_SEC;
    sort_write = ((double) (end2 - start)) / CLOCKS_PER_SEC;
    fprintf(fp2,"Integers 5120k\t%f\t%f\n",only_sort,sort_write);

    



    fclose(fp2);

}