

#include "types.h"
#include "user.h"
#include "date.h"

int
main(){

	struct rtcdate starting_time;
	int ending_seconds; 
	
	printf(1, "JVtimetest: Sleeping for 5 seconds...\n"); //not using sleep because concurrency makes it weird, i think (i tried)

	if(date(&starting_time))
	{
		printf(2, "date() failed at line %d", __LINE__);
		exit();
	}
	ending_seconds = starting_time.second + 5;

	while(starting_time.second != ending_seconds) {
		date(&starting_time);
	}


	exit();
				
}
