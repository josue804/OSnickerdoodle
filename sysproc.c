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


//***********************JV-systemcalls***********************
//This is where system calls are implemented for KERNEL use.
//Functions below written by Josue
//************************************************************



//returns current UTC date through rtcdate struct d (tied to r in date.c)
int
sys_date(void)
{
	struct rtcdate *d; //create struct of type rtcdate to hold datetime
	argptr(0, (void*)&d, sizeof(*d)); //retrieve 0th arg of system call and make d's address that of r (in date.c)
	cmostime(d); //d updated

	return 0;
}



//returns the group identificaiton number of the currently running process
int
sys_getgid(void)
{
  int gid = proc->gid;
  return gid;
}



//returns the user identification number of the currently running process
int
sys_getuid(void)
{
  int uid = proc->uid;
  return uid;
}



//returns the process identificaiton number of the currently running process'
//parent
int
sys_getppid(void)
{
  return proc->parent->pid;
}



//assigns a gid to current process using fed in int
int
sys_setgid(void)
{
  int *test = 0; 
  argint(0, test); //JV - make test point to first arg as integer

  proc->gid = *test; //JV - process gid gets value of fed in int

  return *test;
}



//assigns a pid to current process using fed in int
int
sys_setuid(void)
{
  int *test = 0; 
  argint(0, test); //JV - make test point to first arg as integer

  proc->uid = *test; //JV - process gid gets value of fed in int

  return *test;
}

int
sys_getprocs(void)
{
  cprintf("It working\n");
  return 0;
}
