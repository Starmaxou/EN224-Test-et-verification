int PGCD(int A, int B)
{
	assert((A>0) & (B>0));
	while(A != B){
		if(A == 0) return B;
		if(B == 0) return A;
		if (A > B){
			A = A - B;
		} else {
			B = B - A;
		}
	}
	assert(A > 0);
	return A;
}