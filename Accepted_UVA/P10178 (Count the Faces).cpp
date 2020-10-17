/*********************************
 Problem: 10178 - Count the Faces
 Author: Shahriar Manzoor
 Solved by Andrey Grigorov
 *********************************/

#include <stdio.h>
#include <string.h>

const int maxn = 52;
bool a[maxn][maxn];
int n,nn,v[maxn];
char vertex[maxn];

int char_to_int(char& ch){
	int i;
	for (i = 0; i <= nn; i++)
		if (vertex[i] == ch)
			return i;
	vertex[++nn] = ch;
	return nn;
}

void dfs(int& i, int& g){
	int j;
	v[i] = g;
	for (j = 0; j < n; j++)
		if (!v[j] && a[i][j])
			dfs(j,g);
}

int main(){
	char st[5];
	int i,e,g;
	while (scanf("%d %d",&n,&e) == 2){
		gets(st);
		memset(a,0,sizeof(a));
		nn = -1;
		for (i = 1; i <= e; i++){
			gets(st);
			a[char_to_int(st[0])][char_to_int(st[2])] = true;
			a[char_to_int(st[2])][char_to_int(st[0])] = true;
		}
		memset(v,0,sizeof(v));
		g = 0;
		for (i = 0; i < n; i++)
			if (!v[i])
				dfs(i,++g);
		printf("%d\n",1+e-n+g);
	}
	return 0;
}