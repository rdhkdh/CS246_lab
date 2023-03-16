#include<stdio.h>
//#include<time.h>
#include<stdlib.h>

void integer_generate(char* str,int n)
{
    FILE *fp;
    fp= fopen(str,"w");
    for(int i=1;i<=n;i++) { fprintf(fp,"%d\n",rand()%1000001); }
    fclose(fp);
}

int main()
{
    integer_generate("i10k.txt",10000);
    integer_generate("i20k.txt",20000);
    integer_generate("i40k.txt",40000);
    integer_generate("i80k.txt",80000);
    integer_generate("i160k.txt",160000);
    integer_generate("i320k.txt",320000);
    integer_generate("i640k.txt",640000);
    integer_generate("i1280k.txt",1280000);
    integer_generate("i2560k.txt",2560000);
    integer_generate("i5120k.txt",5120000);
}