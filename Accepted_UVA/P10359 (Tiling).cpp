/***************************************************
 Problem: 10359 - Tiling
 Problem source: University of Alberta Local Contest
 Solved by Andrey Grigorov
 ***************************************************/

#include <stdio.h>

const int osn = 10;
const int maxn = 100;
typedef int tlong[maxn];

void sum(tlong a, tlong b, tlong& c){
  int i,n;
  for (i = 0; i <= maxn-1; i++)
    c[i] = 0;
  n = (a[0] > b[0]) ? a[0] : b[0];
  for (i = 1; i <= n; i++){
    c[i+1] = (a[i]+b[i]+c[i])/osn;
    c[i] = (a[i]+b[i]+c[i])%osn;
  }
  c[0] = (c[n+1] > 0) ? n+1 : n;
}

void printlong(tlong a){
  int i;
  for (i = a[0]; i >= 1; i--)
    printf("%d",a[i]);
  printf("\n");
}

int main(){
  tlong b,a[251];
  int i,j,n;
  for (i = 0; i <= 1; i++)
    for (j = 0; j <= maxn-1; j++)
      a[i][j] = 0;
  a[0][0] = 1;
  a[0][1] = 1;
  a[1][0] = 1;
  a[1][1] = 1;
  for (i = 2; i <= 250; i++){
    sum(a[i-1],a[i-2],b);
    sum(a[i-2],b,a[i]);
  }
  while (scanf("%d",&n)!=EOF){
    printlong(a[n]);  
  }
  return 0;
}