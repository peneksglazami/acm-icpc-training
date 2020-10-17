/*****************************************************
 Problem: 3468 - Tornado!
 ACM ICPC - Latin America - South America - 2005/2006
 Solved by Andrey Grigorov
 *****************************************************/

#include <stdio.h>
#include <string.h>

const int maxn = 5000;

int n;

int next(int i){
    return (i+1)%n;
}

int main(){
    int i,ans,x[maxn],step;
    bool v[maxn];
    scanf("%d",&n);
    while(n){
        for (i = 0; i < n; i++)
            scanf("%d",&x[i]);
        i = n-1;
        while ((i > -1) && !x[i])
            i--;
        if (i == -1){
            ans = n / 2;
            if (n % 2)
                ans++;
        }
        else{
            memset(v,false,n*sizeof(v[0]));
            ans = 0;
            while(!v[i]){
                v[i] = true;
                if (x[i]){
                    step = 1;
                }
                else{
                    step++;
                    if (step % 2)
                        ans++;
                }
                i = next(i);
            }
        }
        printf("%d\n",ans);
        scanf("%d",&n);
    }
    return 0;
}