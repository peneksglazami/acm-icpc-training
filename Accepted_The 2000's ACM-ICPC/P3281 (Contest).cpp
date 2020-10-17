/***********************************************
 Problem: 3281 - Contest
 ACM ICPC - Oceania - South Pacific - 2005/2006
 Solved by Andrey Grigorov
 ***********************************************/

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>

const int maxp = 10, maxt = 10;

int a[maxp],ac[maxt],p[maxt],sub[maxt],num[maxt];
bool acc[maxt][maxp];
char st[10];

int char_to_int(char ch){
	return (int)(ch-'A');
}

bool greater(int i, int j){
	return (p[i] < p[j]) || ((p[i] == p[j]) && (ac[i] > ac[j])) ||
		((p[i] == p[j]) && (ac[i] == ac[j]) && (sub[i] > sub[j])) ||
		((p[i] == p[j]) && (ac[i] == ac[j]) && (sub[i] == sub[j]) && (num[i] > num[j]));
}

void swap(int i, int j){
	int buf;
	buf = p[i]; p[i] = p[j]; p[j] = buf;
	buf = ac[i]; ac[i] = ac[j]; ac[j] = buf;
	buf = sub[i]; sub[i] = sub[j]; sub[j] = buf;
	buf = num[i]; num[i] = num[j]; num[j] = buf;
}

int main(){
	int i,j,t,pr,s,team,n_case;
	scanf("%d %d",&t,&pr);
	n_case = 0;
	while (t || pr){
		memset(ac,0,sizeof(ac));
		memset(p,0,sizeof(p));
		memset(sub,0,sizeof(sub));
		memset(acc,false,sizeof(acc));
		for (i = 0; i < t; i++)
			num[i] = i+1;
		for (i = 0; i < pr; i++)
			scanf("%d",&a[i]);
		scanf("%d",&s);
		while (s--){
			scanf("%d",&team);
			gets(st);
			if (!acc[team-1][char_to_int(st[1])]){
				if (st[3] == 'A'){
					ac[team-1]++;
					p[team-1]+=a[char_to_int(st[1])];
				}
				sub[team-1]++;
			}
		}
		for (i = 0; i < t-1; i++)
			for (j = i+1; j < t; j++)
				if (greater(i,j))
					swap(i,j);
		printf("%d\n",++n_case);
		for (i = 0; i < t; i++)
			printf("%d %d\n",num[i],p[i]);
		scanf("%d %d",&t,&pr);
	}
	return 0;
}