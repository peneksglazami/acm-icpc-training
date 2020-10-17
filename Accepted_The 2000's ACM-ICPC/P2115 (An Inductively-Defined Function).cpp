/*****************************************************
 Problem: 2115 - An Inductively-Defined Function
 ACM ICPC - North America - North Central - 2000/2001
 Solved by Andrey Grigorov
 *****************************************************/

#include <stdio.h>

long f(long n){
    if (n == 1) return 1;
    if (n % 2) return f(n/2)+f(n/2+1);
    return n/2;
}

int main(){
    long n;
    scanf("%ld",&n);
    while (n != -1){
        printf("f(%ld) = %ld\n",n,f(n));
        scanf("%ld",&n);
        if (n != -1) printf("\n");
    }
    return 0;
}