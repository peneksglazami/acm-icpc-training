/************************************
 Problem: 2697 - Big Number
 ACM ICPC - Asia - Dhaka - 2002/2003
 Solve by Andrey Grigorov
 ************************************/
 
#include <stdio.h>
#include <math.h>

int main(){
    long int test,i,n;
    double digits;
    scanf("%ld",&test);
    while (test--){
        scanf("%ld",&n);
        digits = 1.0;
        for (i = 1; i <= n; i++)
            digits += log10((double)i);
        printf("%ld\n",(long int)digits);
    }
    return 0;
}