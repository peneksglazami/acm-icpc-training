/****************************************************
 Problem: 2826 - EKG Sequence
 ACM ICPC - North America - East Central - 2003/2004
 Solved by Andrey Grigorov
 ****************************************************/
 
#include <stdio.h>
#include <string.h>

const long int maxn = 300000, maxl = 1000000, maxp = 78500;

long int a[maxl+1],prime[maxp],loc[maxn+1],small[maxl+1],quot[maxl+1],gap[maxl+1];
bool hit[maxl+1];

void create_primes(){
    long int j;
    bool ok;
    prime[0] = 1;
    prime[1] = 2;
    for (long int i = 3; i <= maxl; i+=2){
        ok = true;
        j = 1;
        while (ok && (j <= prime[0]) && (prime[j]*prime[j] <= i))
            ok = i % prime[j++];
        if (ok){
            prime[++prime[0]] = i;
            small[i] = i;
            quot[i] = 1;
        }
    }
}

long int give_small(long int n){
    for (long int i = 1; ; i++)
        if (!(n % prime[i]))
            return prime[i];
}

long int give_quot(long int n){
    long int small_p = small[n];
    while (!(n % small_p))
        n /= small_p;
    return n;
}

long int min(long int a, long int b){
    return (a < b) ? a : b;
}

void create_EKG(){
    long int i,p,B,BB,k,min_not_hit;
    memset(hit,false,(maxl+1)*sizeof(hit[0]));
    a[1] = 1; loc[1] = 1; hit[1] = true;
    a[2] = 2; loc[2] = 2; hit[2] = true;
    gap[2] = 4;
    for (i = 2; i <= prime[0]; i++)
        gap[prime[i]] = prime[i];
    min_not_hit = 3;
    i = 2;
    while (min_not_hit <= maxn){
        k = a[i];
        B = maxl;
        do{
            p = small[k];
            B = min(B,gap[p]);
            k = quot[k];
        }while (k != 1);
        a[++i] = B;
        if (B <= maxn)
            loc[B] = i;
        hit[B] = true;
        if (B == min_not_hit)
            while (hit[min_not_hit])
                min_not_hit++;
        BB = B;
        while (B > 1){
            p = small[B];
            if (gap[p] == BB)
                while ((gap[p]+p <= maxl) && (hit[gap[p]]))
                    gap[p] += p;
            while (!(B % p))
                B /= p;
        }
    }
}

int main(){
    long int i,n;

    memset(small,0,(maxl+1)*sizeof(small[0]));
    create_primes();
    for (i = 2; i <= maxl; i++)
        if (!small[i]){
            small[i] = give_small(i);
            quot[i] = give_quot(i);
        }
    create_EKG();    
    
    scanf("%ld",&n);
    while (n){
        printf("The number %ld appears in location %ld.\n",n,loc[n]);
        scanf("%ld",&n);
    }
    return 0;
}