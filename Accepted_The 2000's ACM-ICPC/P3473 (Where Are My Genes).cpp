/*****************************************************
 Problem: 3473 - Where Are My Genes
 ACM ICPC - Latin America - South America - 2005/2006
 Solved by Andrey Grigorov
 *****************************************************/

#include <stdio.h>

int main(){
    const int maxr = 1000;
    long int i,j,n,nn,q,r,rev[maxr][2],n_case = 0;
    scanf("%ld",&n);
    while (n){
        printf("Genome %ld\n",++n_case);
        scanf("%ld",&r);
        for (i = 0; i < r; i++)
            scanf("%ld %ld",&rev[i][0],&rev[i][1]);
        scanf("%ld",&q);
        for (i = 1; i <= q; i++){
            scanf("%ld",&nn);
            for (j = 0; j < r; j++)
                if ((rev[j][0] <= nn) && (nn <= rev[j][1]))
                    nn = rev[j][1]-nn+rev[j][0];
            printf("%ld\n",nn);
        }
        scanf("%ld",&n);
    }
    return 0;
}