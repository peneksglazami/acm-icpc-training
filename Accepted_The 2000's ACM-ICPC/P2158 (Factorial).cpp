/****************************************
 Problem: 2158 - Factorial
 ACM ICPC - Europe - Central - 2000/2001
 Solved by Andrey Grigorov
 ****************************************/

#include <stdio.h>

const long int MaxN = 1000000000;

long int f[15];

long int fives(long int n){
    long int sum = 0;
    for (int i = 1; f[i] <= n; i++)
        sum += n / f[i];
    return sum;
}

int main(){
    int test;
    long int n;
    f[0] = 1;
    for (int i = 1; f[i-1] < MaxN; i++)
        f[i] = 5*f[i-1];
    scanf("%d",&test);
    while (test--){
        scanf("%ld",&n);
        printf("%ld\n",fives(n));
    }
    return 0;
}