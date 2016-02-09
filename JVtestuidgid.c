#include "types.h"
#include "user.h"

int
main(int argc, char *argv[])
{

  int uid, gid, ppid;

  uid = getuid();
  printf(2, "Current UID is: %d\n", uid);
  printf(2, "Setting UID to 21 \n");
  setuid(21);
  uid = getuid();
  printf(2, "Current UID is %d\n\n", uid);


  gid = getgid();
  printf(2, "Current GID is %d\n", gid);
  printf(2, "Setting GID to 22\n");
  setgid(22);
  gid = getgid();
  printf(2, "Current GID is %d\n", gid);

  ppid = getppid();
  printf(2, "My parent process is %d\n", ppid);
  printf(2, "All Done!\n");

  exit();

}
