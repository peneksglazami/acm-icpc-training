/****************************************
 Problem: 3291 - Understanding Recursion
 ACM ICPC - Asia - Dhaka - 2005/2006
 Solved by Andrey Grigorov
 ****************************************/

#include <stdio.h>
#include <algorithm>

using namespace std;

int cmp(const void *a, const void *b){
    long int aa = *(long int*)a, bb = *(long int*)b;
    if (aa < bb)
        return 1;
    else
        if (aa > bb)
            return -1;
    return 0;
}

const long int maxn = 40000;
long int i,n,a[maxn],res,cnt;
int n_case;

int main(){
    scanf("%ld",&n);
    n_case = 0;
    while (n){
        for (i = 0; i < n; i++)
            scanf("%ld",&a[i]);
        qsort(a,n,sizeof(a[0]),cmp);
        res = 0;
        cnt = 1;
        for (i = 1; i < n; i++)
            if (a[i] == a[i-1])
                cnt++;
            else{
                res += cnt*(n-i);
                cnt = 1;
            }            
        printf("Case %d: %ld\n",++n_case,res);
        scanf("%ld",&n);
    }
    return 0;
}