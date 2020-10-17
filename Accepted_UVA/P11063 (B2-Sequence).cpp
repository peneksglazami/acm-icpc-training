/*******************************************
 Problem: 11063 - B2-Sequence
 Problem setter: Sergio Queiroz de Medeiros
 Solved by Andrey Grigorov
 *******************************************/

#include <stdio.h>
#include <string.h>

int main(){
    const long int maxn = 100, maxs = 20000;
    long int a[maxn];
    bool ok,b[maxs+1];
    int i,j,n,n_case = 0;

    while (scanf("%d",&n) != EOF){
        ok = true;
        for (i = 0; i < n; i++){
            scanf("%ld",&a[i]);
            ok = ok && (a[i] >= 1);
        }
        if (ok){
            for (i = 1; i < n; i++)
                if (a[i-1] >= a[i]){
                    ok = false;
                    break;
                }
            if (ok){
                memset(b,false,(maxs+1)*sizeof(b[0]));
                for (i = 0; i < n; i++)
                    for (j = i; j < n; j++)
                        if (b[a[i]+a[j]])
                            ok = false;
                        else
                            b[a[i]+a[j]] = true;
            }
        }
        if (ok)
            printf("Case #%ld: It is a B2-Sequence.\n",++n_case);
        else
            printf("Case #%ld: It is not a B2-Sequence.\n",++n_case);
        printf("\n");
    }
    return 0;
}