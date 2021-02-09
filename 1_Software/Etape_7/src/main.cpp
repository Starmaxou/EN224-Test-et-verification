#include "pgcd.hpp"
#define CATCH_CONFIG_MAIN
#include "catch.hpp"

TEST_CASE ( "Fonctionnement normal", "[PGCD]"){
	SECTION("A > B"){
		REQUIRE( PGCD(1250,570) == 10 );
		REQUIRE( PGCD(5615,1248) == 10 );
		REQUIRE( PGCD(247,570) == 10 );
		REQUIRE( PGCD(14796,570) == 10 );
	}
	SECTION("A < B"){
		REQUIRE( PGCD(6580,9896) == 4 );
		REQUIRE( PGCD(1250,570) == 10 );
		REQUIRE( PGCD(1250,570) == 10 );
		REQUIRE( PGCD(1250,570) == 10 );
	}
}