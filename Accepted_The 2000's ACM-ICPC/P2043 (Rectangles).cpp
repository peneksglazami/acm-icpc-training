/*********************************************
 Problem: 2043 - Rectangles
 ACM ICPC - Europe - Southeastern - 2000/2001
 Solved by Andrey Grigorov
 *********************************************/

#include <stdio.h>
#include <algorithm>

using namespace std;

const int maxn = 10000;

struct rectangle{
    int x1,y1,x2,y2;
};

rectangle r[maxn];
int n,cnt;
bool covered[maxn];

int cmp(const void* aa, const void* bb){
    rectangle a = *(rectangle*)aa, b = *(rectangle*)bb;
    if ((a.x1 < b.x1) || ((a.x1 == b.x1) && (a.y1 < b.y1))
     ||((a.x1 == b.x1) && (a.y1 == b.y1) && (a.x2 > b.x2))
     ||((a.x1 == b.x1) && (a.y1 == b.y1) && (a.x2 == b.x2) && (a.y2 > b.y2)))
        return -1;
    if ((a.x1 == b.x1) && (a.y1 == b.y1) && (a.x2 == b.x2) && (a.y2 == b.y2))
        return 0;
    return 1;
}

bool point_in(const rectangle& r, int x, int y){
    return (x >= r.x1) && (x <= r.x2) && (y >= r.y1) && (y <= r.y2);
}

bool cover(const rectangle& r1, const rectangle& r2){
    return point_in(r1,r2.x1,r2.y1) && point_in(r1,r2.x2,r2.y2);
}

int main(){
    while (scanf("%d",&n) != EOF){
        for (int i = 0; i < n; i++){
            scanf("%d %d %d %d",&r[i].x1,&r[i].x2,&r[i].y1,&r[i].y2);
            covered[i] = false;
        }
        qsort(r,n,sizeof(r[0]),cmp);
        cnt = 0;
        for (int i = 0; i < n; i++)
            if (!covered[i]){
                for (int j = i+1; (j < n) && ((r[j].x2 < r[i].x2) || ((r[j].x2 == r[i].x2) && (r[j].y2 <= r[i].y2))); j++){
                    if (!covered[j] && cover(r[i],r[j])){
                        covered[j] = true;
                        cnt++;
                    };
                    if (!covered[i] && cover(r[j],r[i])){
                        covered[i] = true;
                        cnt++;
                    };
                }
            }
        printf("%d\n",cnt);
    }
    return 0;
}