/******************************************************
 Problem: 3579 - Permutation Recovery
 ACM ICPC - North America - Rocky Mountain - 2006/2007
 Solved by Andrey Grigorov
 ******************************************************/

#include <stdio.h>
#include <string.h>

const int maxn = 500;

int main(){
    int n,j,x,a[maxn+1];
    scanf("%d",&n);
    while (n){
        memset(a,0,sizeof(int)*(n+1));
        for (int i = 1; i <= n; i++){
            scanf("%d",&x);
            x++; j = 1;
            while (x){
                if (!a[j])
                    x--;
                j++;
            }
            a[j-1] = i;
        }
        printf("%d",a[1]);
        for (int i = 2; i <= n; i++)
            printf(",%d",a[i]);
        printf("\n");
        scanf("%d",&n);
    }
    return 0;
}