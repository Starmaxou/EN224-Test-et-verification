#include "pgcd.hpp"
#define CATCH_CONFIG_MAIN
#include "catch.hpp"

TEST_CASE ( "Fonctionnement normal", "[PGCD]"){
	SECTION("A > B"){
		REQUIRE( PGCD(1250,570) == 10 );
		REQUIRE( PGCD(5615,1248) == 1 );
		REQUIRE( PGCD(247,570) == 19 );
		REQUIRE( PGCD(14796,570) == 6 );
	}
	SECTION("A < B"){
		REQUIRE( PGCD(6580,9896) == 4 );
		REQUIRE( PGCD(1250,3245) == 5 );
		REQUIRE( PGCD(1250,2000) == 250 );
		REQUIRE( PGCD(1250,1251) == 1 );
	}
		SECTION("A = B"){
		REQUIRE( PGCD(25,25) == 25 );
		REQUIRE( PGCD(1250,1250) == 1250 );
		REQUIRE( PGCD(100,100) == 100 );
		REQUIRE( PGCD(8000,8000) == 8000 );
	}
}

TEST_CASE ( "Fonctionnement anormal", "[PGCD]"){
	SECTION("A = 0"){
		REQUIRE( PGCD(0,570) == 570 );
		REQUIRE( PGCD(0,1248) == 1248 );
		REQUIRE( PGCD(0,570) == 570 );
		REQUIRE( PGCD(0,42) == 42 );
	}
	SECTION("B = 0"){
		REQUIRE( PGCD(6580,0) == 6580 );
		REQUIRE( PGCD(12,0) == 12 );
		REQUIRE( PGCD(1,0) == 1 );
		REQUIRE( PGCD(65000,0) == 65000 );
	}
}