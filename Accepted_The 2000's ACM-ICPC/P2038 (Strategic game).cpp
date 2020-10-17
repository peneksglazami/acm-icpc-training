/*********************************************
 Problem: 2038 - Strategic game
 ACM ICPC - Europe - Southeastern - 2000/2001
 Solved by Andrey Grigorov
 *********************************************/

#include <stdio.h>
#include <string.h>

const int maxn = 1500;

int n,a[maxn+1][maxn+1],p[maxn+1],pn,qn,pp[maxn+1],qq[maxn+1],qqq[maxn+1];
bool v[maxn+1];

void dfs(int i, bool c){
    v[i] = true;
    if (c)
        pp[++pn] = i;
    else{
        qq[++qn] = i;
        qqq[i] = qn;
    }
    for (int j = 1; j <= a[i][0]; j++)
        if (!v[a[i][j]])
            dfs(a[i][j],!c);
}

bool TryFind(int i){
    if (v[i]) return false;
    v[i] = true;
    for (int j = 1; j <= a[pp[i]][0]; j++)
        if (!p[qqq[a[pp[i]][j]]] || TryFind(p[qqq[a[pp[i]][j]]])){
            p[qqq[a[pp[i]][j]]] = i;
            return true;
        }
    return false;
}

int main(){
    int nn,x,y,cnt;
    while (scanf("%d",&n) != EOF){
        for (int i = 1; i <= n; i++)
            a[i][0] = 0;
        for (int i = 1; i <= n; i++){
            scanf("%d: (%d)",&x,&nn);
            x++;
            for (int j = 1; j <= nn; j++){
                scanf("%d",&y);
                y++;
                a[x][0]++; a[y][0]++;
                a[x][a[x][0]] = y;
                a[y][a[y][0]] = x;
            }
        }
        memset(v,false,sizeof(bool)*(n+1));
        pn = qn = 0;
        dfs(1,false);
        cnt = 0;
        memset(p,0,sizeof(int)*(qn+1));
        for (int i = 1; i <= pn; i++){
            memset(v,false,sizeof(bool)*(pn+1));
            if (TryFind(i))
                cnt++;
        }
        printf("%d\n",cnt);
    }
    return 0;
}
