#include "types.h"
#include "x86.h"
#include "defs.h"
#include "date.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"

#define MAXARGS 10


int
sys_fork(void)
{
  return fork();
}

int
sys_exit(void)
{
  exit();
  return 0;  // not reached
}

int
sys_wait(void)
{
  return wait();
}

int
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
  return kill(pid);
}

int
sys_getpid(void)
{
  return proc->pid;
}

int
sys_sbrk(void)
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = proc->sz;
  if(growproc(n) < 0)
    return -1;
  return addr;
}

int
sys_sleep(void)
{
  int n;
  uint ticks0;
  
  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
    if(proc->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
  uint xticks;
  
  acquire(&tickslock);
  xticks = ticks;
  release(&tickslock);
  return xticks;
}

//JV-date - KERNEL function for new date system call
//returns current UTC date through rtcdate struct d (tied to r in date.c)
int
sys_date(void)
{
	struct rtcdate *d; //create struct of type rtcdate to hold datetime
	argptr(0, (void*)&d, sizeof(*d)); //retrieve 0th arg of system call and make d's address that of r (in date.c)
	cmostime(d); //d updated

	return 0;
}

//JV-time - KERNEL function for new time system call
//measures time it takes to complete a process
int
sys_time(void)
{
	cprintf("\n---IN THE SYSTEM MOFO---\n");

	char *shell_args[MAXARGS];
	struct rtcdate *parent_t, *child_t; //time of parent/child processes

	argptr(0, (void*)&shell_args, sizeof(*shell_args));
	argptr(1, (void*)&parent_t, sizeof(*parent_t));
	argptr(2, (void*)&child_t, sizeof(*child_t));


	return 0;
}


//JV-getgid - KERNEL function for new getgid() system call
//returns the group identificaiton number of the currently running process
int
sys_getgid(void)
{
  cprintf("Getting GID = %d\n", proc->gid);
  return proc->gid;
}

//JV-getuid - KERNEL function for new getuid() system call
//returns the user identification number of the currently running process
int
sys_getuid(void)
{
  return proc->uid;
}

//JV-geppid - KERNEL function for new getppid() system call
//returns the process identificaiton number of the currently running process'
//parent
int
sys_getppid(void)
{
  return 0;
}

//JV-setgid - KERNEL function for new setgid() system call
//assigns a gid to current process using fed in int
int
sys_setgid(int value)
{
  uint *test;

  cprintf("First arg: %d\n", argptr(0, (void*)&test, sizeof(*test)));
  cprintf("First arg: %d\n", argptr(1, (void*)&test, sizeof(*test)));
  cprintf("First arg: %d\n", argptr(2, (void*)&test, sizeof(*test)));

  return 0;
}

//JV-setuid - KERNEL function for new setuid() system call
//assigns a pid to current process using fed in int
int
sys_setuid(int value)
{
  return 0;
}
