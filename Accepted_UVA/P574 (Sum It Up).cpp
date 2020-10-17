/**************************
 Problem: 574 - Sum It Up
 Author: Miguel A. Revilla
 Solved by Andrey Grigorov
 **************************/

#include <stdio.h>

const int maxn = 12;

int t,nn,b[maxn],c[maxn],path[maxn];
bool find;

void rec(int i, int sum){
	int j,g,s;
	if (i == nn){
		if (!sum){
			find = true;
			s = t;
			for (j = 0; j < nn; j++)
				for (g = 1; g <= path[j]; g++){
					s -= b[j];
					printf("%d",b[j]);
					if (s)
						printf("+");
				}
			printf("\n");
		}
	}
	else
		for (j = c[i]; j >= 0; j--)
			if (sum-b[i]*j >= 0){
				path[i] = j;
				rec(i+1,sum-b[i]*j);
			}
}

int main(){
	int i,n,a[maxn];
	scanf("%d %d",&t,&n);
	while (n){
		for (i = 0; i < n; i++)
			scanf("%d",&a[i]);
		nn = 0;
		b[0] = a[0];
		c[0] = 1;
		for (i = 1; i < n; i++)
			if (a[i] == a[i-1])
				c[nn]++;
			else{
				b[++nn] = a[i];
				c[nn] = 1;
			}
		nn++;
		printf("Sums of %d:\n",t);
		find = false;
		rec(0,t);
		if (!find)
			printf("NONE\n");
		scanf("%d %d",&t,&n);
	}
	return 0;
}