#include "stdio.h"
#include "stdlib.h"
#include "math.h"
#include "time.h"
#include "assert.h"

#define MAX_RAND 65535
#define MIN_RAND 0 

int PGCD(int A, int B)
{
	while(A != B){
		if (A==0) return B;
		if (B==0) return A;
		if (A > B){
			A = A - B;
		} else {
			B = B - A;
		}
	}
	return A;
}

int RandA(void){
	int A = (rand() % (MAX_RAND + 1 - MIN_RAND)) + MIN_RAND;
    return A;
}

int RandB(void){
	int B = (rand() % (MAX_RAND + 1 - MIN_RAND)) + MIN_RAND;
    return B;
}

int main (int argc, char * argv []){
	int A,B;
	srand(time(NULL));

	printf("(II) Starting PGCD program\n");

	printf("i \t A \t B \t PGCD(A,B)\n");
	for(int i = 0 ; i < 200000 ; i++){
		A = RandA();
		B = RandB();
		printf("%d\t%d\t%d\t%d\n", i, A, B,PGCD(A, B));
	}
	
	printf("(II) End of PGCD program\n");
  	return 0;
}
