#include "stdio.h"
#include "stdlib.h"
#include "math.h"
#include "assert.h"

int PGCD(int A, int B)
{
	assert(A>=0);
	assert(B>=0);
	assert(A<=65535);
	assert(B<=65535);
	while(A != B){
		if (A > B){
			A = A - B;
		} else {
			B = B - A;
		}
	}
	return A;
}

int main (int argc, char * argv []){
	printf("(II) Starting PGCD program\n");

	printf("PGCD(1024,800) = %d\n",PGCD(1024,800));
	printf("PGCD(800,1024) = %d\n",PGCD(800,1024));
	printf("PGCD(32767,65535) = %d\n",PGCD(32767,65535));
	printf("PGCD(65535,32767) = %d\n",PGCD(65535,32767));
	printf("PGCD(512,2048) = %d\n",PGCD(512,2048));
	printf("PGCD(2048,512) = %d\n",PGCD(2048,512));
	printf("PGCD(458,6272) = %d\n",PGCD(458,6272));
	printf("PGCD(6272,458) = %d\n",PGCD(6272,458));
	printf("PGCD(783,125) = %d\n",PGCD(783,125));
	printf("PGCD(125,783) = %d\n",PGCD(125,783));

	printf("(II) End of PGCD program\n");
  return 0;
}
