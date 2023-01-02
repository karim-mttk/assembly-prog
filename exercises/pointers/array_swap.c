//using pointers to swap two arrays with each other//

#include<stdio.h>

void swap (int *x, int *y, int size){
	int temp;

	for(int i = 0; i<size; i++){
	temp = *x;
	*x = *y;
	*y = temp;
	x++;
	y++;
	}
}

int main(){
	int arr1 [] = {12, 13, 14, 15, 16};
	int arr2 [] = {0, 1, 2,  3, 4};

	swap(arr1, arr2, 5);

	for(int i = 0; i<5; i++){
	printf("%d ", arr1[i]);
	
	}

	printf("\n");

	for(int i = 0; i<5; i++){
	printf("%d ", arr2[i]);
	
	}


return 0;
}
