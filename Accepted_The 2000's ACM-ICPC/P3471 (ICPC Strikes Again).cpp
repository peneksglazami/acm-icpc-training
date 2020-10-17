/*****************************************************
 Problem: 3471 - ICPC Strikes Again
 ACM ICPC - Latin America - South America - 2005/2006
 Solved by Andrey Grigorov
 *****************************************************/

#include <stdio.h>
#include <string.h>
#include <vector>
#include <stack>

using namespace std;

const int maxt = 1000, maxe = 1000;

bool a[maxt+1][maxt+1],ee[maxe+1][maxt+1],v[maxt+1];
long int tt[maxt+1],bs[maxt+1];
int t,e,numin[maxt+1],num[maxt+1],rev[maxt+1],nm;
stack <int,vector<int> > st;

long int sign(int i){
    if (tt[i] == -1){
        tt[i] = bs[i];
        for (int j = 1; j <= t; j++)
            if (a[i][j])
                tt[i] += sign(j);
    }
    return tt[i];
}

void dfs(int i, bool p){
    int j;
    v[i] = p;
    for (j = num[i]+1; j <= t; j++)
        if (v[rev[j]] && a[i][rev[j]])
            dfs(rev[j],false);
}

int main(){
    int i,j,g,x,ne,nd;
    long int sum;

    scanf("%d %d",&t,&e);
    while (t || e){
        for (i = 1; i <= t; i++)
            for (j = 1; j <= t; j++)
                a[i][j] = false;
        for (i = 1; i <= e; i++)
            for (j = 1; j <= t; j++)
                ee[i][j] = false;
        memset(numin,0,(t+1)*sizeof(numin[0]));
        for (i = 1; i <= t; i++){
            scanf("%ld %d %d",&bs[i],&nd,&ne);
            for (j = 1; j <= nd; j++){
                scanf("%d",&x);
                a[i][x] = true;
                numin[x]++;
            }
            for (j = 1; j <= ne; j++){
                scanf("%d",&x);
                ee[x][i] = true;
            }
        }
        //topological sort
        for (i = 1; i <= t; i++)
            if (!numin[i])
                st.push(i);
        nm = 0;
        while (!st.empty()){
            x = st.top();
            st.pop();
            num[x] = ++nm;
            for (i = 1; i <= t; i++)
                if (a[x][i]){
                    numin[i]--;
                    if (!numin[i])
                        st.push(i);
                }
        }
        for (i = 1; i <= t; i++)
            rev[num[i]] = i;

        for (i = 1; i <= t; i++)
            tt[i] = -1;
        for (i = 1; i <= t; i++)
            if (tt[i] == -1)
                tt[i] = sign(i);
        printf("*****\n");
        for (i = 1; i <= e; i++){
            sum = 0;
            memset(v,true,(t+1)*sizeof(v[0]));
            for (j = 1; j <= t; j++)
                if (ee[i][rev[j]] && v[rev[j]])
                    dfs(rev[j],true);
            for (j = 1; j <= t; j++)
                if (ee[i][j] && v[j])
                    sum += tt[j];
            printf("%d %ld\n",i,sum);
        }
        scanf("%d %d",&t,&e);
    }
    return 0;
}