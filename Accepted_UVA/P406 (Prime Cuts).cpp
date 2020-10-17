/***************************
 Problem: 406 - Prime Cuts
 Soved by Andrey Grigorov
 ***************************/

#include <stdio.h>

bool p[1001];
int cnt[1001];

void create_prime(){
	p[1] = true;
	cnt[1] = 1;
	for (int i = 2; i <= 1000; i++){
		p[i] = true;
		for (int j = 2; j*j <= i; j++)
			p[i] = p[i] && (i % j != 0);
        cnt[i] = (p[i]) ? cnt[i-1]+1 : cnt[i-1];
	}
}

int main(){
	int i,j,N,C,start,finish;
	create_prime();
	scanf("%d %d",&N,&C);
	do {
		printf("%d %d:",N,C);
		C = (cnt[N] % 2 == 0) ? C*=2 : C = 2*C-1;
		start = (C >= cnt[N]) ? 1 : (cnt[N]-C)/2+1;
		finish = (C >= cnt[N]) ? N : cnt[N]-(cnt[N]-C)/2;
		j = 0;
		for (i = 1; i <= N; i++)
			if (p[i]){
				j++;
				if ((j >= start) && (j <= finish))
					printf(" %d",i);
			}
        printf("\n");
	} while (scanf("%d %d",&N,&C) == 2);
	return 0;
}