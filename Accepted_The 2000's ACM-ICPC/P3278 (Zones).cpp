/***********************************************
 Problem 3278 - Zones
 ACM ICPC - World Finals - Shanghai - 2004/2005
 Solved by Andrey Grigorov
 ***********************************************/

#include <stdio.h>

const int maxn = 20, maxm = 10;

long int n,m,p,a[maxn+1],s[maxm+1],n_case = 0, best;
int i,j,b[maxm+1][maxn+1],t[maxm+1],pp[maxn+1],best_pp[maxn+1];

void rec(int k, int last){
    int i,j,g,cnt;
    long int sum;
    bool ok,in;
    if (k == p+1){
        sum = 0;
        for (i = 1; i <= p; i++)
            sum += a[pp[i]];
        for (i = 1; i <= m; i++){
            cnt = 0;
            for (j = 1; j <= p; j++){
                ok = false;
                for (g = 1; (g <= t[i]) && !ok; g++)
                   ok = (pp[j] == b[i][g]);
                if (ok)
                    cnt++;
            }
            if (cnt > 1)
                sum -= s[i]*(cnt-1);
        };
        if (sum > best){
            best = sum;
            for (i = 1; i <= p; i++)
                best_pp[i] = pp[i];
        }
    }
    else{
        if (p-k+1 <= n-last)
            for (i = last+1; i <= n; i++){
                pp[k] = i;
                rec(k+1,i);
            }
    }
}

int main(){
    scanf("%d %d",&n,&p);
    while (n || p){
        for (i = 1; i <= n; i++)
            scanf("%ld",&a[i]);
        scanf("%d",&m);
        for (i = 1; i <= m; i++){
            scanf("%d",&t[i]);
            for (j = 1; j <= t[i]; j++)
                scanf("%d",&b[i][j]);
            scanf("%ld",&s[i]);
        }
        best = 0;
        rec(1,0);
        printf("Case Number  %d\n",++n_case);
        printf("Number of Customers: %ld\n",best);
        printf("Locations recommended:");
        for (i = 1; i <= p; i++)
            printf(" %d",best_pp[i]);
        printf("\n");
        printf("\n");
        scanf("%d %d",&n,&p);
    }
    return 0;
}
