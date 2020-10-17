/********************************************
 Problem: 10926 - How Many Dependencies
 Problem setter: Joao Paulo Fernandes Farias
 Solved by Andrey Grigorov
 ********************************************/

#include <stdio.h>

int main(){
	const int maxn = 100;
	bool a[maxn][maxn];
	int i,j,t,n,imax,max;
	scanf("%d",&n);
	while (n){
		for (i = 0; i < n; i++)
			for (j = 0; j < n; j++)
				a[i][j] = false;
		for (i = 0; i < n; i++){
			scanf("%d",&t);
			while (t--){
				scanf("%d",&j);
				a[i][j-1] = true;
			}
		}
		for (t = 0; t < n; t++)
			for (i = 0; i < n; i++)
				for (j = 0; j < n; j++)
					a[i][j] = a[i][j] || (a[i][t] && a[t][j]);
		max = -1;
		for (i = 0; i < n; i++){
			t = 0;
			for (j = 0; j < n; j++)
				if (a[i][j])
					t++;
			if (t > max){
				max = t;
				imax = i;
			}
		}
		printf("%d\n",imax+1);
		scanf("%d",&n);
	}
	return 0;
}