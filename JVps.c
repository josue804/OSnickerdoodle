#include "types.h"
#include "user.h"
#include "JVps.h"

#define MAX_UPROC 20 //defines the max size of an array of uprocs

int
main(int argc, char *argv[])
{
  int entries_used = 0;
  struct uproc table[MAX_UPROC];
  int i;

  entries_used = getprocs(MAX_UPROC, table);

  printf(1, "There are %d processes\n\n", entries_used);

  for(i = 0; i < entries_used; ++i){

    printf(1,"NAME:%s   PID:%d\n   UID:%d   GID:%d\n   PPID:%d   STATE:%s\n   SIZE:%d\n\n\n", 
            table[i].name, table[i].pid, table[i].uid, table[i].gid, table[i].ppid, table[i].state, table[i].size);

  }


  exit();
}

