#include "types.h"
#include "user.h"
#include "date.h"

#define MAXARGS 10

int
main(int argc, char *argv[])
{
	int i, pid;
	char *p[MAXARGS];
	struct rtcdate parent_t, child_t;
	
	if(argc >= (MAXARGS-1)) {
		printf(2, "Slow down Kiddo! Too many arguments!\n");
		exit();
	}

	
	for(i=0; i<argc-1; ++i) {	   //for each argument
		p[i] = malloc(strlen(argv[i+1] + 1)); //allocate memory for str
		strcpy(p[i], argv[i+1]);  //cpy args to p,not 0th! (system call)
	}

	p[i] = '\0'; //make sure last character is NULL 

	//grab the time of current process (date returns 0 if success)
	if(date(&parent_t)){
		printf(2, "date() failed at line %d :(\n", __LINE__);
		exit();
	}	

	//fork current process. pid == 0 if current process is child
	//otherwise if pid > 0, current process is parentt
	pid = fork();


	if(pid < 0) {	//fail, probably ran out of resources
		printf(2, "fork() failed! --/--E\n");
		exit();
	} else if (pid == 0) {	//current process = child!
		exec(p[0], p);	//exec args in p. returns to parent if success!
		printf(2, "exec() failed. %s needs a full path Hombre\n", p[0]);
		exit();
	} else { //current process = parent!
		pid = wait(); //wait for child to finish
		if(date(&child_t)){ //grab the time of child process
			printf(2, "date() failed at line %d :(\n", __LINE__);
			exit();
		}
	}

	int time_elapsed =  (child_t.second + child_t.minute*60 + child_t.hour*3600) - (parent_t.second + parent_t.minute*60 + parent_t.hour*3600);

	if(time_elapsed < 0) {
		printf(1, "JVtime: %d seconds elapsed\n", -1*time_elapsed);
		exit();
	} else {
		printf(1, "JVtime: %d seconds elapsed\n", time_elapsed);
		exit();
	}	

	exit();
}
