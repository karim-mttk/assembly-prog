//using only pointers to copy from one array to another

#include <stdio.h>

void copy(int *x, int *y, int size){
	for(int i = 0; i<size; i++){
	*y = *x;
	
	printf("Dest_array[%d]: %d\n", i ,*y);
	*x++;
     *y++;

	}
}

int main(){

	int arr1[] = {4,8,1,2,3};
	int arr2[5];

	copy(arr1, arr2, 5);

return 0;
}

