/***************************
 Problem: 612 - DNA Sorting
 Author: Miguel A. Revilla
 Solved by Andrey Grigorov
 ***************************/

#include <stdio.h>
#include <string.h>

const int maxn = 50;
const int maxm = 100;

typedef char str[maxn+1];

int n;

int num_inv(char* st){
	int i,j,cnt;
	cnt = 0;
	for (i = 0; i < n-1; i++)
		for (j = i+1; j < n; j++)
			if (st[i] > st[j])
				cnt++;
	return cnt;
}

int main(){
	str st[maxm+1],buf;
	int i,j,m,test,ibuf,a[maxm+1],inv[maxm+1];
	scanf("%d",&test);
	while (test){
		scanf("");
		scanf("%d %d",&n,&m);
		for (i = 1; i <= m; i++){
			scanf("%s",st[i]);
			st[i][n] = '\0';
			a[i] = i;
			inv[i] = num_inv(st[i]);
		}
		for (i = 1; i < m; i++)
			for (j = i+1; j <= m; j++)
				if ((inv[i] > inv[j]) || ((inv[i] == inv[j]) && (a[i] > a[j]))){
					strcpy(buf,st[i]);
					strcpy(st[i],st[j]);
					strcpy(st[j],buf);
					ibuf = a[i];
					a[i] = a[j];
					a[j] = ibuf;
					ibuf = inv[i];
					inv[i] = inv[j];
					inv[j] = ibuf;
				}
		for (i = 1; i <= m; i++)
			printf("%s\n",st[i]);
		test--;
		if (test)
			printf("\n");
	}
	return 0;
}