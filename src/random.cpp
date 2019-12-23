/****************************************************************************\
 *                 Mersenne-Twister Algorithm 19937, 64-bit                 *
 *                                                                          *
 *                      Copyright © 2019 ARQADIUM, LLC                      *
 *                           All rights reserved.                           *
\****************************************************************************/

#include <mt19937/random.h>

#include <cassert>
#include <climits>
#include <cstdlib>
#include <random>

struct mt_prng
{
	std::mt19937_64 eng;
};

extern "C" struct mt_prng* mt_prng_init( void )
{
	std::random_device rd;
	std::mt19937_64 eng( rd( ) );

	struct mt_prng* ret =
	  (struct mt_prng*)malloc( sizeof( struct mt_prng ) );

	if( ret == nullptr )
	{
		return ret;
	}

	ret->eng = eng;

	return ret;
}

extern "C" void mt_prng_fini( struct mt_prng* rng )
{
	assert( rng != nullptr );

	free( rng );
}

extern "C" int mt_range_s32( struct mt_prng* rng, int min, int max )
{
	assert( rng != nullptr );
	std::uniform_int_distribution<int> dist( min, max );

	return dist( rng->eng );
}

extern "C" unsigned mt_range_u32(
  struct mt_prng* rng, unsigned min, unsigned max )
{
	assert( rng != nullptr );
	std::uniform_int_distribution<unsigned> dist( min, max );

	return dist( rng->eng );
}

extern "C" long long mt_range_s64(
  struct mt_prng* rng, long long min, long long max )
{
	assert( rng != nullptr );
	std::uniform_int_distribution<long long> dist( min, max );

	return dist( rng->eng );
}

extern "C" unsigned long long mt_range_u64(
  struct mt_prng* rng, unsigned long long min, unsigned long long max )
{
	assert( rng != nullptr );
	std::uniform_int_distribution<unsigned long long> dist( min, max );

	return dist( rng->eng );
}

int mt_random_s32( struct mt_prng* rng )
{
	return mt_range_s32( rng, INT_MIN, INT_MAX );
}

extern "C" unsigned mt_random_u32( struct mt_prng* rng )
{
	return mt_range_u32( rng, 0, UINT_MAX );
}

extern "C" long long mt_random_s64( struct mt_prng* rng )
{
	return mt_range_s64( rng, LLONG_MIN, LLONG_MAX );
}

extern "C" unsigned long long mt_random_u64( struct mt_prng* rng )
{
	return mt_range_u64( rng, 0, ULLONG_MAX );
}
