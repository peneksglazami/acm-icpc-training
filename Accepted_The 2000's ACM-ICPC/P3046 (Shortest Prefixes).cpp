/******************************************************
 Problem: 3046 - Shortest Prefixes
 ACM ICPC - North America - Rocky Mountain - 2004/2005
 Solved by Andrey Grigorov
 ******************************************************/

#include <stdio.h>
#include <string.h>

const int maxn = 1000, maxl = 20;

struct node{
	int cnt;
	node *next[26];
};

void delete_tree(node* t){
	for (int i = 0; i < 26; i++)
		if (t->next[i])
			delete_tree(t->next[i]);
	delete t;
}

int chartoint(char ch){
	return (int)(ch-'a');
}

void add(node* t, char* st){
	if (!t->next[chartoint(st[0])]){
		t->next[chartoint(st[0])] = new node;
		t->next[chartoint(st[0])]->cnt = 1;
		for (int i = 0; i < 26; i++)
			t->next[chartoint(st[0])]->next[i] = 0;
	}
	else
		t->next[chartoint(st[0])]->cnt++;
	if (strlen(st) > 1)
		add(t->next[chartoint(st[0])],&st[1]);
}

void print_abb(node* t, char* st){
	printf("%c",st[0]);
	if (t->next[chartoint(st[0])]->cnt > 1)
		if (strlen(st) == 1)
			printf("\n");
		else
			print_abb(t->next[chartoint(st[0])],&st[1]);
	else
		printf("\n");
}

int main(){
	char s[maxn][maxl+1],st[maxl+1];
	int i,n,test;
	node *tree = 0;
	scanf("%d",&test);
	gets(st);
	gets(st);
	while (test--){
		n = 0;
		tree = new node;
		for (i = 0; i < 26; i++)
			tree->next[i] = 0;
		while (gets(s[n]) && strcmp(s[n],"")){
			add(tree,s[n]);
			n++;
		};
		for (i = 0; i < n; i++){
			printf("%s ",s[i]);
			print_abb(tree,s[i]);
		}
		if (test)
			printf("\n");
		delete_tree(tree);
	}
	return 0;
}