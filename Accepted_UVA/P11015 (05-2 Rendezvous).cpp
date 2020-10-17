/*********************************
 Problem: 11015 - 05-2 Rendezvous
 Problem setter: Timotius Sakti
 Solved by Andrey Grigorov
 *********************************/

#include <stdio.h>

const long int maxint = 100000;
const int maxn = 22;
const int maxl = 10;

int main(){
	long int a[maxn][maxn],min,sum,l;
	int i,j,k,n,m,n_case,i_min,x,y;
	char st[maxn][maxl+1];
	n_case = 0;
	scanf("%d %d",&n,&m);
	while (n || m){
		for (i = 0; i < n; i++)
			for (j = 0; j < n; j++)
				a[i][j] = maxint;
		for (i = 0; i < n; i++)
			a[i][i] = 0;
		gets(st[0]);
		for (i = 0; i < n; i++)
			gets(st[i]);
		for (i = 0; i < m; i++){
			scanf("%d %d %ld",&x,&y,&l);
			a[x-1][y-1] = l;
			a[y-1][x-1] = l;
		}
		for (k = 0; k < n; k++)
			for (i = 0; i < n; i++)
				for (j = 0; j < n; j++)
					if (a[i][j] > a[i][k]+a[k][j])
						a[i][j] = a[i][k]+a[k][j];
		min = maxint;
		for (i = 0; i < n; i++){
			sum = 0;
			for (j = 0; j < n; j++)
				sum+=a[i][j];
			if (sum < min){
				min = sum;
				i_min = i;
			}
		}
		printf("Case #%d : %s\n",++n_case,st[i_min]);
		scanf("%d %d",&n,&m);
	}
	return 0;
}