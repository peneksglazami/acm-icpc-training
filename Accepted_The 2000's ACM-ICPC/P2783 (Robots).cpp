/***************************************************
 Problem: 2783 - Robots
 ACM ICPC - North America - Mid Central - 2003/2004
 Solved by Andrey Grigorov
 ***************************************************/

#include <stdio.h>
#include <vector>
#include <queue>

using namespace std;

typedef struct{
            int row,col;
        } garbage;

class Compare{
    public:
        bool operator()(garbage a, garbage b){
            return ((a.row > b.row) || ((a.row == b.row) && (a.col > b.col)));
        }
};

int main(){
    priority_queue <garbage, vector<garbage>, Compare > pq1,pq2;
    int r,c,rob_cnt;
    garbage g,cur_g;
    scanf("%d %d",&r,&c);
    while ((r != -1) || (c != -1)){
        while (!pq1.empty())
            pq1.pop();
        while (!pq2.empty())
            pq2.pop();
        do{
            g.row = r;
            g.col = c;
            pq1.push(g);
            scanf("%d %d",&r,&c);
        }while (r || c);
        rob_cnt = 0;
        while (!pq1.empty()){
            rob_cnt++;
            g.row = 0; g.col = 0;
            while (!pq1.empty()){
                cur_g = pq1.top();
                pq1.pop();
                if ((g.row <= cur_g.row) && (g.col <= cur_g.col)){
                    g = cur_g;
                }
                else
                    pq2.push(cur_g);
            }
            while (!pq2.empty()){
                pq1.push(pq2.top());
                pq2.pop();
            }
        }
        printf("%d\n",rob_cnt);
        scanf("%d %d",&r,&c);
    }
    return 0;
}