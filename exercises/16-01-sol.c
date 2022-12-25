#include <stdio.h>

double v[4] = {2.5, 5.4, 3.3, 8.7};
double a = 2.0;

int main(){
	double* p1 = v;
	double* p2 = &a;
	for(int i=0; i<4; i++){
		*p1 = *p1 + *p2;
		a = *p1;
		p1 = p1 + 1;
	}
	printf("%0.1f %d\n", v[1], (int)sizeof(v));
	
	for(int i=0; i<4; i++){
	printf("%0.1f\n", v[i]);}
}