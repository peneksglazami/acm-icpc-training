/***********************************
 Problem: 10099 - The Tourist Guide
 Author: Rezaul Alam Chowdhury
 Solved by Andrey Grigorov
 ***********************************/

#include <stdio.h>

long int min(long int& a, long int& b){
	return (a < b) ? a : b;
}

int main(){
	const int maxn = 100;
	int i,j,N,R,S,F,T,x,y,n_case,imax;
	long int trip,l,max,a[maxn+1][maxn+1],d[maxn+1];
	bool b[maxn+1];
	n_case = 0;
	scanf("%d %d",&N,&R);
	while ((N != 0) || (R != 0)){
		for (i = 1; i <= N; i++)
			for (j = 1; j <= N; j++)
				a[i][j] = 0;
		for (i = 1; i <= R; i++){
			scanf("%d %d %ld",&x,&y,&l);
			a[x][y] = l;
			a[y][x] = l;
		}
		scanf("%d %d %d",&S,&F,&T);
		for (i = 1; i <= N; i++){
			d[i] = a[S][i];
			b[i] = true;
		};
		b[S] = false;
		while (b[F]){
			max = 0;
			for (i = 1; i <= N; i++)
				if (b[i])
					if (d[i] > max){
						max = d[i];
						imax = i;
					}
			b[imax] = false;
			for (i = 1; i <= N; i++)
				if (b[i])
					if (d[i] < min(d[imax],a[imax][i]))
						d[i] = min(d[imax],a[imax][i]);
		}
		n_case++;
		printf("Scenario #%d\n",n_case);
		trip = (T % (d[F]-1)) ? (T / (d[F]-1))+1 : T / (d[F]-1);
		printf("Minimum Number of Trips = %ld\n",trip);
		scanf("%d %d",&N,&R);
		printf("\n");
	}
	return 0;
}