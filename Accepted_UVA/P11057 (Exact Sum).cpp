/*******************************************
 Problem: 11057 - Exact Sum
 Problem setter: Sergio Queiroz de Medeiros
 Solved by Andrey Grigorov
********************************************/

#include <stdio.h>
#include <string.h>

const int maxn = 10000, maxc = 1000000;
long int a[maxn],b[maxc+1];

int main(){
    long int i,j,n,m,l1,l2;

    while (scanf("%ld",&n) != EOF){
        memset(b,0,(maxc+1)*sizeof(b[0]));
        for (i = 0; i < n; i++){
            scanf("%ld",&a[i]);
            b[a[i]]++;
        }
        l1 = 0;
        l2 = maxc+1;
        scanf("%ld",&m);
        for (i = 0; i < n; i++)
            if ((a[i] <= m/2) && (m-a[i] <= maxc))
                if (b[m-a[i]])
                    if ((a[i] != m-a[i]) || ((a[i] == m-a[i]) && (b[a[i]] > 1)))
                        if ((m-a[i])-a[i] < l2-l1){
                            l1 = a[i];
                            l2 = m-a[i];
                        }
        printf("Peter should buy books whose prices are %ld and %ld.\n",l1,l2);
        printf("\n");
    }
    return 0;
}