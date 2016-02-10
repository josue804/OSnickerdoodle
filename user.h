struct stat;
struct rtcdate;
struct args;
struct uproc; //JV - declaration of uproc which is defined in JVps.h

//JV_systemcalls - user available functions for calling system calls
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


//JV - system calls below added by Josue 
int date(struct rtcdate * r); 
int time(char *p[], struct rtcdate * t1, struct rtcdate * t2); 
int getgid(void); 
int getuid(void); 
int getppid(void); 
int setgid(int new_gid); //sets gid to new_gid
int setuid(int new_uid); //sets uid to new_uid
int getprocs(int max, struct uproc *table); //returns processes through array of uproc table, which has a max number of processes stored


//JV - my supplemental functions; NOT system calls
int dayofweek(int year, int month, int day); //JV - function that finds day of week, credit to //en.wikipedia.org/wiki/Determination_of_the_day_of_the_week#Implementation-dependent_methods and to Ethan Grinnell for finding it.
int years_since_alamo(int year); //calculates years passed since alamo

//***************end JV*****************

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
