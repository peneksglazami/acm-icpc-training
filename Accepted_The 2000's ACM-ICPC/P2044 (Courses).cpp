/*********************************************
 Problem: 2044 - Courses
 ACM ICPC - Europe - Southeastern - 2000/2001
 Solved by Andrey Grigorov
 *********************************************/

#include <stdio.h>
#include <string.h>

const int maxp = 100, maxn = 300;

int p,n,a[maxp+1][maxn+1],pp[maxn+1];
bool v[maxp+1];

bool TryFind(int i){
    if (v[i]) return false;
    v[i] = true;
    for (int j = 1; j <= a[i][0]; j++)
        if (!pp[a[i][j]] || TryFind(pp[a[i][j]])){
            pp[a[i][j]] = i;
            return true;
        }
    return false;
}

int main(){
    int test;
    scanf("%d",&test);
    while (test--){
        scanf("%d %d",&p,&n);
        for (int i = 1; i <= p; i++){
            scanf("%d",&a[i][0]);
            for (int j = 1; j <= a[i][0]; j++)
                scanf("%d",&a[i][j]);
        }
        memset(pp,0,sizeof(int)*(n+1));
        int cnt = 0;
        for (int i = 1; i <= p; i++){
            memset(v,false,sizeof(bool)*(p+1));
            if (TryFind(i))
                cnt++;
        }
        if (cnt == p)
            printf("YES\n");
        else
            printf("NO\n");
    }
    return 0;
}
