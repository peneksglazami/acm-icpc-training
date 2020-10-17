/*************************************
 Problem: 10979 - How many triangles?
 Return of the Newbies 2005
 Problemsetter: Mak Yan Kei
 Solved by Andrey Grigorov
 *************************************/

#include <stdio.h>
#include <math.h>

const double approx = 1e-10;
const int maxn = 10;

typedef struct{
	double x,y;
}point;

typedef struct{
	point p1,p2;
}segment;

segment ss[maxn*maxn*maxn];
int scnt;

double vect(point& p1, point& p2, point& p3, point& p4){
	return (p2.x-p1.x)*(p4.y-p3.y)-(p2.y-p1.y)*(p4.x-p3.x);
}

double scalar(point& p1, point& p2, point& p3, point& p4){
	return (p2.x-p1.x)*(p4.x-p3.x)+(p2.y-p1.y)*(p4.y-p3.y);
}

double max(double& a, double& b){
	return (a > b) ? a : b;
}

double min(double& a, double& b){
	return (a < b) ? a : b;
}

bool pointonsegment(point& p, segment& s){
	return (fabs(vect(s.p1,s.p2,s.p1,p)) < approx) && (scalar(s.p1,p,s.p2,p) < approx);
}

bool onsegment(point& p1, point& p2){
	int i;
	for (i = 0; i < scnt; i++)
		if (pointonsegment(p1,ss[i])&&pointonsegment(p2,ss[i]))
			return true;
	return false;
}

bool intersect(segment& s1, segment& s2){
	double maxx1,maxy1,minx1,miny1,maxx2,maxy2,minx2,miny2,v1,v2,v3,v4;
	maxx1 = max(s1.p1.x,s1.p2.x);
	minx1 = min(s1.p1.x,s1.p2.x);
	maxy1 = max(s1.p1.y,s1.p2.y);
	miny1 = min(s1.p1.y,s1.p2.y);
	maxx2 = max(s2.p1.x,s2.p2.x);
	minx2 = min(s2.p1.x,s2.p2.x);
	maxy2 = max(s2.p1.y,s2.p2.y);
	miny2 = min(s2.p1.y,s2.p2.y);
	v1 = vect(s1.p1,s1.p2,s1.p1,s2.p1);
	v2 = vect(s1.p1,s1.p2,s1.p1,s2.p2);
	v3 = vect(s2.p1,s2.p2,s2.p1,s1.p1);
	v4 = vect(s2.p1,s2.p2,s2.p1,s1.p2);
	return (maxx1 >= minx2) && (maxy1 >= miny2) &&
		   (minx1 <= maxx2) && (miny1 <= maxy2) &&
		   (v1*v2 <= 0) && (v3*v4 <= 0);
}

bool samepoint(point& p1, point& p2){
	return (fabs(p1.x-p2.x) < approx) && (fabs(p1.y-p2.y) < approx);
}

bool same(segment& s1, segment& s2){
	return (samepoint(s1.p1,s2.p1) && samepoint(s1.p2,s2.p2)) ||
		   (samepoint(s1.p1,s2.p2) && samepoint(s1.p2,s2.p1));
}

int main(){
	point pbuf,p[2*maxn*maxn],pp[4];
	segment s[maxn];
	double a1,a2,b1,b2,c1,c2,d,d1,d2;
	int i,j,g,k,l,n,pcnt,tcnt;
	bool nadoelo,b[maxn*maxn*maxn][maxn*maxn*maxn],ok;
	while (scanf("%d",&n) == 1){
		for (i = 0; i < n; i++)
			scanf("%lf %lf %lf %lf",&s[i].p1.x,&s[i].p1.y,&s[i].p2.x,&s[i].p2.y);
		pcnt = 2*n;
		for (i = 1; i <= n; i++){
			p[2*i-1] = s[i-1].p1;
			p[2*i] = s[i-1].p2;
		}			
		for (i = 0; i < n-1; i++)
			for (j = i+1; j < n; j++)
				if (intersect(s[i],s[j]))
					if (fabs(vect(s[i].p1,s[i].p2,s[j].p1,s[j].p2)) > approx){
						pcnt++;
						a1 = s[i].p2.y-s[i].p1.y;
						b1 = s[i].p1.x-s[i].p2.x;
						c1 = -a1*s[i].p1.x-b1*s[i].p1.y;
						a2 = s[j].p2.y-s[j].p1.y;
						b2 = s[j].p1.x-s[j].p2.x;
						c2 = -a2*s[j].p1.x-b2*s[j].p1.y;
						d = a1*b2-b1*a2;
						d1 = -c1*b2+c2*b1;
						d2 = -a1*c2+a2*c1;
						p[pcnt].x = d1/d;
						p[pcnt].y = d2/d;
					}
		for (i = 0; i < n; i++)
			ss[i] = s[i];
		scnt = n;
		for (i = 0; i < maxn*maxn; i++)
			for (j = 0; j < maxn*maxn; j++)
				b[i][j] = false;
		do{
			nadoelo = true;
			for (i = 0; i < scnt; i++)
				for (j = i+1; j < scnt; j++)
					if (!b[i][j]){
						if (intersect(ss[i],ss[j]))
							if (fabs(vect(ss[i].p1,ss[i].p2,ss[j].p1,ss[j].p2)) < approx){
								nadoelo = false;
								pp[0] = ss[i].p1;
								pp[1] = ss[i].p2;
								pp[2] = ss[j].p1;
								pp[3] = ss[j].p2;
								for (g = 0; g < 3; g++)
									for (k = g+1; k < 4; k++){
										ok = true;
										for (l = 0; l < 4; l++)
											if ((l != g) && (l != k))
												ok = ok && (scalar(pp[g],pp[l],pp[k],pp[l]) < approx);
										if (ok){
											ss[scnt].p1 = pp[g];
											ss[scnt].p2 = pp[k];
											for (k = 0; k < scnt; k++)
												ok = ok && (!same(ss[k],ss[scnt]));
											if (ok){
												b[i][scnt] = true;
												b[j][scnt] = true;
												scnt++;
											}

										}
									}
								
							}
						b[i][j] = true;
					}
		}while (!nadoelo);
		for (i = 1; i <= pcnt-1; i++)
			for (j = i+1; j <= pcnt; j++)
				if ((p[i].x > p[j].x) || ((p[i].x == p[j].x)&&(p[i].y > p[j].y))){
					pbuf = p[i]; p[i] = p[j]; p[j] = pbuf;
				}
		j = 1;
		for (i = 2; i <= pcnt; i++)
			if ((fabs(p[i].x-p[i-1].x) > approx) || (fabs(p[i].y-p[i-1].y) > approx))
				p[++j] = p[i];
		pcnt = j;	
		tcnt = 0;
		for (i = 1; i <= pcnt-2; i++)
			for (j = i+1; j <= pcnt-1; j++)
				if (onsegment(p[i],p[j]))
					for (k = j+1; k <= pcnt; k++)
						if (fabs(vect(p[i],p[j],p[i],p[k])) > approx)
							if (onsegment(p[j],p[k]) && onsegment(p[i],p[k]))
								tcnt++;
		printf("%d\n",tcnt);
	}
	return 0;
}