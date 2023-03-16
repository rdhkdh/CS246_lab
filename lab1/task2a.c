#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void integer_read(char *str, int n)
{
    FILE *fp;
    fp = fopen(str, "r");

    int arr[n];
    int x;

    for (int i = 0; i < n; i++)
    {
        fscanf(fp, "%d", &x);
        arr[i] = x;
    }

    //printf("%d\n",arr[1]);

    fclose(fp);
}

int main()
{
    integer_read("i10k.txt", 10000);
    integer_read("i20k.txt",20000);
    integer_read("i40k.txt",40000);
    integer_read("i80k.txt",80000);
    integer_read("i160k.txt",160000);
    integer_read("i320k.txt",320000);
    integer_read("i640k.txt",640000);
    integer_read("i1280k.txt",1280000); //does only till here, due to memory constraints
    //integer_read("i2560k.txt",2560000);
    //integer_read("i5120k.txt",5120000);
}