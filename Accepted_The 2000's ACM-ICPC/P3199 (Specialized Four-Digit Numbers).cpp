/*********************************************************
 Problem: 3199 - Specialized Four-Digit Numbers
 ACM ICPC - North America - Pacific Northwest - 2004/2005
 Solved by Andrey Grigorov
 *********************************************************/

#include <stdio.h>

long int sum(long int i, long int n){
    long int s = 0;
    while (i){
        s += i % n;
        i /= n;
    }
    return s;
}

int main(){
    long int i,l,r,sum10;
    scanf("%ld %ld",&l,&r);
    while (l || r){
        for (i = l; i <= r; i++){
            sum10 = sum(i,10);
            if ((sum10 == sum(i,16)) && (sum10 == sum(i,12)))
                printf("%ld\n",i);
        }
        scanf("%ld %ld",&l,&r);
        if (l || r)
            printf("\n");
    }
    return 0;
}