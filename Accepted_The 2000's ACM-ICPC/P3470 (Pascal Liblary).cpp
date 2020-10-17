/*****************************************************
 Problem: 3470 - Pascal Liblary
 ACM ICPC - Latin America - South America - 2005/2006
 Solved by Andrey Grigorov
 *****************************************************/

#include <stdio.h>
#include <string.h>

int main(){
    const int maxn = 100;
    int i,j,n,d,x,v[maxn];
    bool ok;
    scanf("%d %d",&n,&d);
    while (n || d){
        memset(v,1,n*sizeof(v[0]));
        for (i = 1; i <= d; i++)
            for (j = 0; j < n; j++){
                scanf("%d",&x);
                v[j] = (v[j]&&x);
            }
        ok = false;
        for (i = 0; !ok&&(i < n); i++)
            ok = v[i];
        if (ok)
            printf("yes\n");
        else
            printf("no\n");
        scanf("%d %d",&n,&d);
    }
    return 0;
}