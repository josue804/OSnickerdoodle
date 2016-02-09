struct stat;
struct rtcdate;
struct args;

// system calls
int fork(void);
int exit(void) __attribute__((noreturn));
int wait(void);
int pipe(int*);
int write(int, void*, int);
int read(int, void*, int);
int close(int);
int kill(int);
int exec(char*, char**);
int open(char*, int);
int mknod(char*, short, short);
int unlink(char*);
int fstat(int fd, struct stat*);
int link(char*, char*);
int mkdir(char*);
int chdir(char*);
int dup(int);
int getpid(void);
char* sbrk(int);
int sleep(int);
int uptime(void);
int date(struct rtcdate * r); //JV-date - system call for date, runs sys_date
int time(char *p[], struct rtcdate * t1, struct rtcdate * t2); //JV-time - system call for time, runs sys_time
int getgid(void); //JV-getgid - system call for getgid
int getuid(void); //JV-getuid - system call for getuid
int getppid(void); //JV-getppid - system call for returning parent PID
int setgid(int new_gid); //JV-setuid - system call for setting uid to int
int setuid(int new_uid); //JV-setgid - system call for setting gid to int

//JV - my supplemental functions
int dayofweek(int year, int month, int day); //JV - function that finds day of week, credit to //en.wikipedia.org/wiki/Determination_of_the_day_of_the_week#Implementation-dependent_methods and to Ethan Grinnell for finding it.
int years_since_alamo(int year); //calculates years passed since alamo

// ulib.c
int stat(char*, struct stat*);
char* strcpy(char*, char*);
void *memmove(void*, void*, int);
char* strchr(const char*, char c);
int strcmp(const char*, const char*);
void printf(int, char*, ...);
char* gets(char*, int max);
uint strlen(char*);
void* memset(void*, int, uint);
void* malloc(uint);
void free(void*);
int atoi(const char*);
