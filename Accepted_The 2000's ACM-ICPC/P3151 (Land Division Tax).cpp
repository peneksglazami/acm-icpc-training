/******************************************************
 Problem: 3151 - Land Division Tax
 Problem A - Latin America - South America - 2004/2005
 Solved by Andrey Grigorov
*******************************************************/

#include <stdio.h>

const int MaxN = 201;
long int a[MaxN],b[MaxN];
long int d[MaxN][MaxN];
float tt[MaxN][MaxN];
int n;
float f;

float max(float a, float b){
  return (a > b) ? a : b;
}

float min(float a, float b){
  return (a < b) ? a : b;
}

int next(int i){
  return (i < n) ? i+1 : 1;
}

int back(int i){
  return (i > 1) ? i-1 : n;
}

float t(int l, int r){
  int i;
  if (tt[l][r] < 0)
    if (l < r)
	  for (i = l; i <= r-1; i++)
        if (tt[l][r] < 0)
		  tt[l][r] = f*max(d[l][i],d[i+1][r])+t(l,i)+t(i+1,r);
	    else
		  tt[l][r] = min(f*max(d[l][i],d[i+1][r])+t(l,i)+t(i+1,r),tt[l][r]);
	else{
	  for (i = l; i <= n; i++)
        if (tt[l][r] < 0)
		  tt[l][r] = f*max(d[l][i],d[next(i)][r])+t(l,i)+t(next(i),r);
	    else
		  tt[l][r] = min(f*max(d[l][i],d[next(i)][r])+t(l,i)+t(next(i),r),tt[l][r]);
      for (i = 1; i <= r-1; i++)
        if (tt[l][r] < 0)
		  tt[l][r] = f*max(d[l][i],d[i+1][r])+t(l,i)+t(i+1,r);
	    else
		  tt[l][r] = min(f*max(d[l][i],d[i+1][r])+t(l,i)+t(i+1,r),tt[l][r]);
	}	
  return tt[l][r];
}

int main(){
  int i,j; 
  float minS;
  scanf("%d %f",&n,&f);
  while (!((n == 0) && (f == 0))){
	minS = 0;
    for (i = 1; i <= n; i++)
      scanf("%d",&a[i]);
	if (n != 1){
	  minS = -1;
	  b[0] = 0;
	  for (i = 1; i <= n; i++)
	    b[i] = b[i-1]+a[i];
	  for (i = 1; i <= n; i++)
	    for (j = 1; j <= n; j++)
	      if (i <= j)
		    d[i][j] = b[j]-b[i-1];
          else
		    d[i][j] = b[n]-b[i-1]+b[j];   
      for (i = 1; i <= n; i++)
        for (j = 1; j <= n; j++)
	      tt[i][j] = -1;
	  for (i = 1; i <= n; i++)
	    tt[i][i] = 0;
	  for (i = 1; i <= n; i++)
	    for (j = i; j <= n; j++)
		  if (minS < 0)
            minS = f*max(d[i][j],d[next(j)][back(i)])+t(i,j)+t(next(j),back(i));
	      else
	        if (minS > f*max(d[i][j],d[next(j)][back(i)])+t(i,j)+t(next(j),back(i)))
              minS = f*max(d[i][j],d[next(j)][back(i)])+t(i,j)+t(next(j),back(i));
	}
	printf("%0.2f\n",minS);
	scanf("%d %f",&n,&f);	
  }
  return 0;
}