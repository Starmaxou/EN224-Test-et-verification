#include "stdio.h"
#include "stdlib.h"
#include "stdbool.h"
#include "math.h"
#include "time.h"
#include "assert.h"

#define MAX_RAND 65535
#define MIN_RAND 0 

int PGCD1(int A, int B)
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

int PGCD2(int A, int B){
	int reste;

	while(B != 0){
		reste = A % B;
		A = B;
		B = reste;
	}
	return A;
}

int RandA(void){
	int A = (rand() % (MAX_RAND + 1 - MIN_RAND)) + MIN_RAND;
	assert((A <= MAX_RAND) & (A >= MIN_RAND));	//check if A is in range
    return A;
}

int RandB(void){
	int B = (rand() % (MAX_RAND + 1 - MIN_RAND)) + MIN_RAND;;
	assert((B <= MAX_RAND) & (B >= MIN_RAND));	//check if B is in range
    return B;
}

int main (int argc, char * argv []){
	int A,B,pgcd_1,pgcd_2;
	bool test = false;
	srand(time(NULL));

	printf("(II) Starting PGCD program\n");

	printf("i\tA\tB\tPGCD(A,B)\tVerif\n");
	for(int i = 0 ; i < 65536 ; i++){
		A = RandA();
		B = RandB();
		pgcd_1 = PGCD1(A,B);
		pgcd_2 = PGCD2(A,B);
		test = (pgcd_1==pgcd_2)?true:false;
		printf("%d\t%d\t%d\t%d\t%d\n", i, A, B,PGCD1(A, B), test);
	}
	
	printf("(II) End of PGCD program\n");
  	return 0;
}
