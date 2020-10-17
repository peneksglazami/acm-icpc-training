/*******************************
 Problem: 10986 - Sending email
 Problemsetter: Igor Naverniouk
 Solved by Andrey Grigorov
 *******************************/

#include <stdio.h>
#include <queue>

using namespace std;

const long int maxn = 20000, inf = 1000000000;

struct node{
	long int y;
	long int w;
	node *next;
};

node *a[maxn];
long int d[maxn];

class cmp{
	public:
		bool operator()(long int x, long int y){
			return d[x] > d[y];
		}
};

void add(long int x, long int y, long int w){
	node *t = new node;
	t->y = y;
	t->w = w;
	t->next = a[x];
	a[x] = t;	
}

void delete_list(long int n){
	long int i;
	node *t,*p;
	for (i = 0; i < n; i++){
		t = a[i];
		while (t){
			p = t;
			t = p->next;
			delete p;
		}
	}
}

int main(){
	priority_queue <long int, vector<long int>, cmp > pq;
	bool b[maxn];
	long int i,n,m,S,T,x,y,w,v;
	int test,n_case;
	node *t;

	scanf("%d",&test);
	n_case = 0;
	while (test--){
		scanf("%ld %ld %ld %ld",&n,&m,&S,&T);
		memset(a,0,n*sizeof(node*));
		memset(b,false,n*sizeof(bool));
		for (i = 1; i <= m; i++){
			scanf("%ld %ld %ld",&x,&y,&w);
			add(x,y,w);
			add(y,x,w);
		}

		for (i = 0; i < n; i++)
			d[i] = inf;

		t = a[S];
		while (t){
			d[t->y] = t->w;
			t = t->next;
		}
		
		while (!pq.empty())
			pq.pop();
		for (i = 0; i < n; i++)
			if (i != S)
				pq.push(i);
		d[S] = 0;
		b[S] = true;

		while ((!b[T]) && (!pq.empty())){
			v = pq.top();
			pq.pop();
			t = a[v];
			while (t){
				if (d[t->y] > d[v] + (t->w)){
					d[t->y] = d[v] + (t->w);
					pq.push(t->y);
				}
				t = t->next;
			}			
			b[v] = true;
		}

		printf("Case #%d: ",++n_case);
		if (d[T] != inf)
			printf("%ld\n",d[T]);
		else
			printf("unreachable\n");

		delete_list(n);
	}
	return 0;
}