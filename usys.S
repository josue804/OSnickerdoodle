#include "syscall.h"
#include "traps.h"

#define SYSCALL(name) \
  .globl name; \
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
SYSCALL(exit)
SYSCALL(wait)
SYSCALL(pipe)
SYSCALL(read)
SYSCALL(write)
SYSCALL(close)
SYSCALL(kill)
SYSCALL(exec)
SYSCALL(open)
SYSCALL(mknod)
SYSCALL(unlink)
SYSCALL(fstat)
SYSCALL(link)
SYSCALL(mkdir)
SYSCALL(chdir)
SYSCALL(dup)
SYSCALL(getpid)
SYSCALL(sbrk)
SYSCALL(sleep)
SYSCALL(uptime)
SYSCALL(date) //JV-date - defines system call date and stores it into IDT
SYSCALL(getgid) //JV-getgid - defines system call getgid and stores it into IDT (this is referenced in user.h)
SYSCALL(getuid) //JV-getuid - defines system call getuid and stores it into IDT (this is referenced in user.h)
SYSCALL(getppid) //JV-getppid - defines system call getppid
SYSCALL(setgid) //JV-setgid - defines system call setgid
SYSCALL(setuid) //JV-setuid - defines system call setuid
