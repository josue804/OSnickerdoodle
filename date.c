#include "types.h"
#include "user.h"
#include "date.h"

int
main (int argc, char *argv[])
{
	char * months[12] = {"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
	char * days[7] = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
	struct rtcdate r;

	if(date(&r)) {
		printf(2, "date_failed\n");
		exit();
	}

	printf(1, "%s %s %d %d:%d:%d UTC %d\n", days[dayofweek(r.year,r.month,r.day)], months[r.month - 1], r.day, r.hour, r.minute, r.second, r.year);

	if(years_since_alamo(r.year) >= 0)
		printf(1, "%d years. Remember the Alamo.\n", years_since_alamo(r.year));


	exit();
}


//Finds day of week from year, month, and day
//source: //en.wikipedia.org/wiki/Determination_of_the_day_of_the_week#Implementation-dependent_methods
//Thanks to Ethan Grinnell for sharing the find! 
int
dayofweek(int year, int month, int day)
{
	static int t[] = {0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4};
	year -= month < 3;
	return (year + year/4 - year/100 + year/400 + t[month-1] + day) % 7;
}

//calculates amount of years since the alamo, never forget
int
years_since_alamo(int year)
{
	if(year < 1836)
		return -1;

	return year - 1836;
}
