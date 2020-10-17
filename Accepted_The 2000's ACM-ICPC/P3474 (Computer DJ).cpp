/*****************************************************
 Problem: 3474 - Computer DJ
 ACM ICPC - Latin America - South America - 2005/2006
 Solved by Andrey Grigorov
 *****************************************************/
#include <stdio.h>

int main(){
    const long int maxk = 1000000000;
    char s[26][105];
    int i,j,g,n,q,a[33];
    long int k;
    long long int nn[32],sn[32],num;

    scanf("%d %d",&n,&q);
    while (n || q){
        for (i = 0; i < n; i++)
            scanf("%s",&s[i]);
        if (n != 1){
            nn[0] = 1;
            i = 0;
            while (nn[i] <= maxk){
                nn[i+1] = nn[i]*n;
                i++;
            }
            sn[0] = 0;
            i = 0;
            while (sn[i] <= maxk){
                sn[i+1] = sn[i]+(i+1)*nn[i+1];
                i++;
            }
        }
        for (i = 1; i <= q; i++){
            scanf("%ld",&k);
            if (n == 1)
                printf("%s\n",s[0]);
            else{
                j = 1;
                while (!((sn[j-1] < k) && (k <= sn[j])))
                    j++;
                num = (k-sn[j-1]-1)/j;
                g = j-1;
                while (num){
                    a[g--] = num % n;
                    num /= n;
                }
                while (g > -1)
                    a[g--] = 0;
                printf("%s\n",s[a[(k-sn[j-1]-1)%j]]);
            }
        }
        scanf("%d %d",&n,&q);
        printf("\n");
    }
    return 0;
}