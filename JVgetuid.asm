
_JVgetuid:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "user.h"

int
main (int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp

  exit();
   6:	e8 68 02 00 00       	call   273 <exit>

0000000b <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
   b:	55                   	push   %ebp
   c:	89 e5                	mov    %esp,%ebp
   e:	57                   	push   %edi
   f:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  10:	8b 4d 08             	mov    0x8(%ebp),%ecx
  13:	8b 55 10             	mov    0x10(%ebp),%edx
  16:	8b 45 0c             	mov    0xc(%ebp),%eax
  19:	89 cb                	mov    %ecx,%ebx
  1b:	89 df                	mov    %ebx,%edi
  1d:	89 d1                	mov    %edx,%ecx
  1f:	fc                   	cld    
  20:	f3 aa                	rep stos %al,%es:(%edi)
  22:	89 ca                	mov    %ecx,%edx
  24:	89 fb                	mov    %edi,%ebx
  26:	89 5d 08             	mov    %ebx,0x8(%ebp)
  29:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  2c:	5b                   	pop    %ebx
  2d:	5f                   	pop    %edi
  2e:	5d                   	pop    %ebp
  2f:	c3                   	ret    

00000030 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  30:	55                   	push   %ebp
  31:	89 e5                	mov    %esp,%ebp
  33:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  36:	8b 45 08             	mov    0x8(%ebp),%eax
  39:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  3c:	90                   	nop
  3d:	8b 45 08             	mov    0x8(%ebp),%eax
  40:	8d 50 01             	lea    0x1(%eax),%edx
  43:	89 55 08             	mov    %edx,0x8(%ebp)
  46:	8b 55 0c             	mov    0xc(%ebp),%edx
  49:	8d 4a 01             	lea    0x1(%edx),%ecx
  4c:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  4f:	0f b6 12             	movzbl (%edx),%edx
  52:	88 10                	mov    %dl,(%eax)
  54:	0f b6 00             	movzbl (%eax),%eax
  57:	84 c0                	test   %al,%al
  59:	75 e2                	jne    3d <strcpy+0xd>
    ;
  return os;
  5b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  5e:	c9                   	leave  
  5f:	c3                   	ret    

00000060 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  60:	55                   	push   %ebp
  61:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  63:	eb 08                	jmp    6d <strcmp+0xd>
    p++, q++;
  65:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  69:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  6d:	8b 45 08             	mov    0x8(%ebp),%eax
  70:	0f b6 00             	movzbl (%eax),%eax
  73:	84 c0                	test   %al,%al
  75:	74 10                	je     87 <strcmp+0x27>
  77:	8b 45 08             	mov    0x8(%ebp),%eax
  7a:	0f b6 10             	movzbl (%eax),%edx
  7d:	8b 45 0c             	mov    0xc(%ebp),%eax
  80:	0f b6 00             	movzbl (%eax),%eax
  83:	38 c2                	cmp    %al,%dl
  85:	74 de                	je     65 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  87:	8b 45 08             	mov    0x8(%ebp),%eax
  8a:	0f b6 00             	movzbl (%eax),%eax
  8d:	0f b6 d0             	movzbl %al,%edx
  90:	8b 45 0c             	mov    0xc(%ebp),%eax
  93:	0f b6 00             	movzbl (%eax),%eax
  96:	0f b6 c0             	movzbl %al,%eax
  99:	29 c2                	sub    %eax,%edx
  9b:	89 d0                	mov    %edx,%eax
}
  9d:	5d                   	pop    %ebp
  9e:	c3                   	ret    

0000009f <strlen>:

uint
strlen(char *s)
{
  9f:	55                   	push   %ebp
  a0:	89 e5                	mov    %esp,%ebp
  a2:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  a5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  ac:	eb 04                	jmp    b2 <strlen+0x13>
  ae:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  b2:	8b 55 fc             	mov    -0x4(%ebp),%edx
  b5:	8b 45 08             	mov    0x8(%ebp),%eax
  b8:	01 d0                	add    %edx,%eax
  ba:	0f b6 00             	movzbl (%eax),%eax
  bd:	84 c0                	test   %al,%al
  bf:	75 ed                	jne    ae <strlen+0xf>
    ;
  return n;
  c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  c4:	c9                   	leave  
  c5:	c3                   	ret    

000000c6 <memset>:

void*
memset(void *dst, int c, uint n)
{
  c6:	55                   	push   %ebp
  c7:	89 e5                	mov    %esp,%ebp
  c9:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
  cc:	8b 45 10             	mov    0x10(%ebp),%eax
  cf:	89 44 24 08          	mov    %eax,0x8(%esp)
  d3:	8b 45 0c             	mov    0xc(%ebp),%eax
  d6:	89 44 24 04          	mov    %eax,0x4(%esp)
  da:	8b 45 08             	mov    0x8(%ebp),%eax
  dd:	89 04 24             	mov    %eax,(%esp)
  e0:	e8 26 ff ff ff       	call   b <stosb>
  return dst;
  e5:	8b 45 08             	mov    0x8(%ebp),%eax
}
  e8:	c9                   	leave  
  e9:	c3                   	ret    

000000ea <strchr>:

char*
strchr(const char *s, char c)
{
  ea:	55                   	push   %ebp
  eb:	89 e5                	mov    %esp,%ebp
  ed:	83 ec 04             	sub    $0x4,%esp
  f0:	8b 45 0c             	mov    0xc(%ebp),%eax
  f3:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
  f6:	eb 14                	jmp    10c <strchr+0x22>
    if(*s == c)
  f8:	8b 45 08             	mov    0x8(%ebp),%eax
  fb:	0f b6 00             	movzbl (%eax),%eax
  fe:	3a 45 fc             	cmp    -0x4(%ebp),%al
 101:	75 05                	jne    108 <strchr+0x1e>
      return (char*)s;
 103:	8b 45 08             	mov    0x8(%ebp),%eax
 106:	eb 13                	jmp    11b <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 108:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 10c:	8b 45 08             	mov    0x8(%ebp),%eax
 10f:	0f b6 00             	movzbl (%eax),%eax
 112:	84 c0                	test   %al,%al
 114:	75 e2                	jne    f8 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 116:	b8 00 00 00 00       	mov    $0x0,%eax
}
 11b:	c9                   	leave  
 11c:	c3                   	ret    

0000011d <gets>:

char*
gets(char *buf, int max)
{
 11d:	55                   	push   %ebp
 11e:	89 e5                	mov    %esp,%ebp
 120:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 123:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 12a:	eb 4c                	jmp    178 <gets+0x5b>
    cc = read(0, &c, 1);
 12c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 133:	00 
 134:	8d 45 ef             	lea    -0x11(%ebp),%eax
 137:	89 44 24 04          	mov    %eax,0x4(%esp)
 13b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 142:	e8 44 01 00 00       	call   28b <read>
 147:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 14a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 14e:	7f 02                	jg     152 <gets+0x35>
      break;
 150:	eb 31                	jmp    183 <gets+0x66>
    buf[i++] = c;
 152:	8b 45 f4             	mov    -0xc(%ebp),%eax
 155:	8d 50 01             	lea    0x1(%eax),%edx
 158:	89 55 f4             	mov    %edx,-0xc(%ebp)
 15b:	89 c2                	mov    %eax,%edx
 15d:	8b 45 08             	mov    0x8(%ebp),%eax
 160:	01 c2                	add    %eax,%edx
 162:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 166:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 168:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 16c:	3c 0a                	cmp    $0xa,%al
 16e:	74 13                	je     183 <gets+0x66>
 170:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 174:	3c 0d                	cmp    $0xd,%al
 176:	74 0b                	je     183 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 178:	8b 45 f4             	mov    -0xc(%ebp),%eax
 17b:	83 c0 01             	add    $0x1,%eax
 17e:	3b 45 0c             	cmp    0xc(%ebp),%eax
 181:	7c a9                	jl     12c <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 183:	8b 55 f4             	mov    -0xc(%ebp),%edx
 186:	8b 45 08             	mov    0x8(%ebp),%eax
 189:	01 d0                	add    %edx,%eax
 18b:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 18e:	8b 45 08             	mov    0x8(%ebp),%eax
}
 191:	c9                   	leave  
 192:	c3                   	ret    

00000193 <stat>:

int
stat(char *n, struct stat *st)
{
 193:	55                   	push   %ebp
 194:	89 e5                	mov    %esp,%ebp
 196:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 199:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1a0:	00 
 1a1:	8b 45 08             	mov    0x8(%ebp),%eax
 1a4:	89 04 24             	mov    %eax,(%esp)
 1a7:	e8 07 01 00 00       	call   2b3 <open>
 1ac:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1af:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1b3:	79 07                	jns    1bc <stat+0x29>
    return -1;
 1b5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1ba:	eb 23                	jmp    1df <stat+0x4c>
  r = fstat(fd, st);
 1bc:	8b 45 0c             	mov    0xc(%ebp),%eax
 1bf:	89 44 24 04          	mov    %eax,0x4(%esp)
 1c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1c6:	89 04 24             	mov    %eax,(%esp)
 1c9:	e8 fd 00 00 00       	call   2cb <fstat>
 1ce:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 1d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1d4:	89 04 24             	mov    %eax,(%esp)
 1d7:	e8 bf 00 00 00       	call   29b <close>
  return r;
 1dc:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 1df:	c9                   	leave  
 1e0:	c3                   	ret    

000001e1 <atoi>:

int
atoi(const char *s)
{
 1e1:	55                   	push   %ebp
 1e2:	89 e5                	mov    %esp,%ebp
 1e4:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 1e7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 1ee:	eb 25                	jmp    215 <atoi+0x34>
    n = n*10 + *s++ - '0';
 1f0:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1f3:	89 d0                	mov    %edx,%eax
 1f5:	c1 e0 02             	shl    $0x2,%eax
 1f8:	01 d0                	add    %edx,%eax
 1fa:	01 c0                	add    %eax,%eax
 1fc:	89 c1                	mov    %eax,%ecx
 1fe:	8b 45 08             	mov    0x8(%ebp),%eax
 201:	8d 50 01             	lea    0x1(%eax),%edx
 204:	89 55 08             	mov    %edx,0x8(%ebp)
 207:	0f b6 00             	movzbl (%eax),%eax
 20a:	0f be c0             	movsbl %al,%eax
 20d:	01 c8                	add    %ecx,%eax
 20f:	83 e8 30             	sub    $0x30,%eax
 212:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 215:	8b 45 08             	mov    0x8(%ebp),%eax
 218:	0f b6 00             	movzbl (%eax),%eax
 21b:	3c 2f                	cmp    $0x2f,%al
 21d:	7e 0a                	jle    229 <atoi+0x48>
 21f:	8b 45 08             	mov    0x8(%ebp),%eax
 222:	0f b6 00             	movzbl (%eax),%eax
 225:	3c 39                	cmp    $0x39,%al
 227:	7e c7                	jle    1f0 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 229:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 22c:	c9                   	leave  
 22d:	c3                   	ret    

0000022e <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 22e:	55                   	push   %ebp
 22f:	89 e5                	mov    %esp,%ebp
 231:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 234:	8b 45 08             	mov    0x8(%ebp),%eax
 237:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 23a:	8b 45 0c             	mov    0xc(%ebp),%eax
 23d:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 240:	eb 17                	jmp    259 <memmove+0x2b>
    *dst++ = *src++;
 242:	8b 45 fc             	mov    -0x4(%ebp),%eax
 245:	8d 50 01             	lea    0x1(%eax),%edx
 248:	89 55 fc             	mov    %edx,-0x4(%ebp)
 24b:	8b 55 f8             	mov    -0x8(%ebp),%edx
 24e:	8d 4a 01             	lea    0x1(%edx),%ecx
 251:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 254:	0f b6 12             	movzbl (%edx),%edx
 257:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 259:	8b 45 10             	mov    0x10(%ebp),%eax
 25c:	8d 50 ff             	lea    -0x1(%eax),%edx
 25f:	89 55 10             	mov    %edx,0x10(%ebp)
 262:	85 c0                	test   %eax,%eax
 264:	7f dc                	jg     242 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 266:	8b 45 08             	mov    0x8(%ebp),%eax
}
 269:	c9                   	leave  
 26a:	c3                   	ret    

0000026b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 26b:	b8 01 00 00 00       	mov    $0x1,%eax
 270:	cd 40                	int    $0x40
 272:	c3                   	ret    

00000273 <exit>:
SYSCALL(exit)
 273:	b8 02 00 00 00       	mov    $0x2,%eax
 278:	cd 40                	int    $0x40
 27a:	c3                   	ret    

0000027b <wait>:
SYSCALL(wait)
 27b:	b8 03 00 00 00       	mov    $0x3,%eax
 280:	cd 40                	int    $0x40
 282:	c3                   	ret    

00000283 <pipe>:
SYSCALL(pipe)
 283:	b8 04 00 00 00       	mov    $0x4,%eax
 288:	cd 40                	int    $0x40
 28a:	c3                   	ret    

0000028b <read>:
SYSCALL(read)
 28b:	b8 05 00 00 00       	mov    $0x5,%eax
 290:	cd 40                	int    $0x40
 292:	c3                   	ret    

00000293 <write>:
SYSCALL(write)
 293:	b8 10 00 00 00       	mov    $0x10,%eax
 298:	cd 40                	int    $0x40
 29a:	c3                   	ret    

0000029b <close>:
SYSCALL(close)
 29b:	b8 15 00 00 00       	mov    $0x15,%eax
 2a0:	cd 40                	int    $0x40
 2a2:	c3                   	ret    

000002a3 <kill>:
SYSCALL(kill)
 2a3:	b8 06 00 00 00       	mov    $0x6,%eax
 2a8:	cd 40                	int    $0x40
 2aa:	c3                   	ret    

000002ab <exec>:
SYSCALL(exec)
 2ab:	b8 07 00 00 00       	mov    $0x7,%eax
 2b0:	cd 40                	int    $0x40
 2b2:	c3                   	ret    

000002b3 <open>:
SYSCALL(open)
 2b3:	b8 0f 00 00 00       	mov    $0xf,%eax
 2b8:	cd 40                	int    $0x40
 2ba:	c3                   	ret    

000002bb <mknod>:
SYSCALL(mknod)
 2bb:	b8 11 00 00 00       	mov    $0x11,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret    

000002c3 <unlink>:
SYSCALL(unlink)
 2c3:	b8 12 00 00 00       	mov    $0x12,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret    

000002cb <fstat>:
SYSCALL(fstat)
 2cb:	b8 08 00 00 00       	mov    $0x8,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <link>:
SYSCALL(link)
 2d3:	b8 13 00 00 00       	mov    $0x13,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <mkdir>:
SYSCALL(mkdir)
 2db:	b8 14 00 00 00       	mov    $0x14,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <chdir>:
SYSCALL(chdir)
 2e3:	b8 09 00 00 00       	mov    $0x9,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <dup>:
SYSCALL(dup)
 2eb:	b8 0a 00 00 00       	mov    $0xa,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <getpid>:
SYSCALL(getpid)
 2f3:	b8 0b 00 00 00       	mov    $0xb,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <sbrk>:
SYSCALL(sbrk)
 2fb:	b8 0c 00 00 00       	mov    $0xc,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <sleep>:
SYSCALL(sleep)
 303:	b8 0d 00 00 00       	mov    $0xd,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <uptime>:
SYSCALL(uptime)
 30b:	b8 0e 00 00 00       	mov    $0xe,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <date>:
SYSCALL(date) //JV-date - defines system call date and stores it into IDT
 313:	b8 16 00 00 00       	mov    $0x16,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <time>:
SYSCALL(time) //JV-time - defines system call time and stores it into IDT
 31b:	b8 17 00 00 00       	mov    $0x17,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <getgid>:
SYSCALL(getgid) //JV-getgid - defines system call getgid and stores it into IDT (this is referenced in user.h)
 323:	b8 18 00 00 00       	mov    $0x18,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <getuid>:
SYSCALL(getuid) //JV-getuid - defines system call getuid and stores it into IDT (this is referenced in user.h)
 32b:	b8 19 00 00 00       	mov    $0x19,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <getppid>:
SYSCALL(getppid) //JV-getppid - defines system call getppid
 333:	b8 1a 00 00 00       	mov    $0x1a,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <setgid>:
SYSCALL(setgid) //JV-setgid - defines system call setgid
 33b:	b8 1b 00 00 00       	mov    $0x1b,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <setuid>:
SYSCALL(setuid) //JV-setuid - defines system call setuid
 343:	b8 1c 00 00 00       	mov    $0x1c,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 34b:	55                   	push   %ebp
 34c:	89 e5                	mov    %esp,%ebp
 34e:	83 ec 18             	sub    $0x18,%esp
 351:	8b 45 0c             	mov    0xc(%ebp),%eax
 354:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 357:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 35e:	00 
 35f:	8d 45 f4             	lea    -0xc(%ebp),%eax
 362:	89 44 24 04          	mov    %eax,0x4(%esp)
 366:	8b 45 08             	mov    0x8(%ebp),%eax
 369:	89 04 24             	mov    %eax,(%esp)
 36c:	e8 22 ff ff ff       	call   293 <write>
}
 371:	c9                   	leave  
 372:	c3                   	ret    

00000373 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 373:	55                   	push   %ebp
 374:	89 e5                	mov    %esp,%ebp
 376:	56                   	push   %esi
 377:	53                   	push   %ebx
 378:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 37b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 382:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 386:	74 17                	je     39f <printint+0x2c>
 388:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 38c:	79 11                	jns    39f <printint+0x2c>
    neg = 1;
 38e:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 395:	8b 45 0c             	mov    0xc(%ebp),%eax
 398:	f7 d8                	neg    %eax
 39a:	89 45 ec             	mov    %eax,-0x14(%ebp)
 39d:	eb 06                	jmp    3a5 <printint+0x32>
  } else {
    x = xx;
 39f:	8b 45 0c             	mov    0xc(%ebp),%eax
 3a2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 3a5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 3ac:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 3af:	8d 41 01             	lea    0x1(%ecx),%eax
 3b2:	89 45 f4             	mov    %eax,-0xc(%ebp)
 3b5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3b8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3bb:	ba 00 00 00 00       	mov    $0x0,%edx
 3c0:	f7 f3                	div    %ebx
 3c2:	89 d0                	mov    %edx,%eax
 3c4:	0f b6 80 44 0a 00 00 	movzbl 0xa44(%eax),%eax
 3cb:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 3cf:	8b 75 10             	mov    0x10(%ebp),%esi
 3d2:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3d5:	ba 00 00 00 00       	mov    $0x0,%edx
 3da:	f7 f6                	div    %esi
 3dc:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3df:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 3e3:	75 c7                	jne    3ac <printint+0x39>
  if(neg)
 3e5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 3e9:	74 10                	je     3fb <printint+0x88>
    buf[i++] = '-';
 3eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3ee:	8d 50 01             	lea    0x1(%eax),%edx
 3f1:	89 55 f4             	mov    %edx,-0xc(%ebp)
 3f4:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 3f9:	eb 1f                	jmp    41a <printint+0xa7>
 3fb:	eb 1d                	jmp    41a <printint+0xa7>
    putc(fd, buf[i]);
 3fd:	8d 55 dc             	lea    -0x24(%ebp),%edx
 400:	8b 45 f4             	mov    -0xc(%ebp),%eax
 403:	01 d0                	add    %edx,%eax
 405:	0f b6 00             	movzbl (%eax),%eax
 408:	0f be c0             	movsbl %al,%eax
 40b:	89 44 24 04          	mov    %eax,0x4(%esp)
 40f:	8b 45 08             	mov    0x8(%ebp),%eax
 412:	89 04 24             	mov    %eax,(%esp)
 415:	e8 31 ff ff ff       	call   34b <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 41a:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 41e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 422:	79 d9                	jns    3fd <printint+0x8a>
    putc(fd, buf[i]);
}
 424:	83 c4 30             	add    $0x30,%esp
 427:	5b                   	pop    %ebx
 428:	5e                   	pop    %esi
 429:	5d                   	pop    %ebp
 42a:	c3                   	ret    

0000042b <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 42b:	55                   	push   %ebp
 42c:	89 e5                	mov    %esp,%ebp
 42e:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 431:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 438:	8d 45 0c             	lea    0xc(%ebp),%eax
 43b:	83 c0 04             	add    $0x4,%eax
 43e:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 441:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 448:	e9 7c 01 00 00       	jmp    5c9 <printf+0x19e>
    c = fmt[i] & 0xff;
 44d:	8b 55 0c             	mov    0xc(%ebp),%edx
 450:	8b 45 f0             	mov    -0x10(%ebp),%eax
 453:	01 d0                	add    %edx,%eax
 455:	0f b6 00             	movzbl (%eax),%eax
 458:	0f be c0             	movsbl %al,%eax
 45b:	25 ff 00 00 00       	and    $0xff,%eax
 460:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 463:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 467:	75 2c                	jne    495 <printf+0x6a>
      if(c == '%'){
 469:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 46d:	75 0c                	jne    47b <printf+0x50>
        state = '%';
 46f:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 476:	e9 4a 01 00 00       	jmp    5c5 <printf+0x19a>
      } else {
        putc(fd, c);
 47b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 47e:	0f be c0             	movsbl %al,%eax
 481:	89 44 24 04          	mov    %eax,0x4(%esp)
 485:	8b 45 08             	mov    0x8(%ebp),%eax
 488:	89 04 24             	mov    %eax,(%esp)
 48b:	e8 bb fe ff ff       	call   34b <putc>
 490:	e9 30 01 00 00       	jmp    5c5 <printf+0x19a>
      }
    } else if(state == '%'){
 495:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 499:	0f 85 26 01 00 00    	jne    5c5 <printf+0x19a>
      if(c == 'd'){
 49f:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 4a3:	75 2d                	jne    4d2 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 4a5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4a8:	8b 00                	mov    (%eax),%eax
 4aa:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 4b1:	00 
 4b2:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 4b9:	00 
 4ba:	89 44 24 04          	mov    %eax,0x4(%esp)
 4be:	8b 45 08             	mov    0x8(%ebp),%eax
 4c1:	89 04 24             	mov    %eax,(%esp)
 4c4:	e8 aa fe ff ff       	call   373 <printint>
        ap++;
 4c9:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4cd:	e9 ec 00 00 00       	jmp    5be <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 4d2:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 4d6:	74 06                	je     4de <printf+0xb3>
 4d8:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 4dc:	75 2d                	jne    50b <printf+0xe0>
        printint(fd, *ap, 16, 0);
 4de:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4e1:	8b 00                	mov    (%eax),%eax
 4e3:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 4ea:	00 
 4eb:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 4f2:	00 
 4f3:	89 44 24 04          	mov    %eax,0x4(%esp)
 4f7:	8b 45 08             	mov    0x8(%ebp),%eax
 4fa:	89 04 24             	mov    %eax,(%esp)
 4fd:	e8 71 fe ff ff       	call   373 <printint>
        ap++;
 502:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 506:	e9 b3 00 00 00       	jmp    5be <printf+0x193>
      } else if(c == 's'){
 50b:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 50f:	75 45                	jne    556 <printf+0x12b>
        s = (char*)*ap;
 511:	8b 45 e8             	mov    -0x18(%ebp),%eax
 514:	8b 00                	mov    (%eax),%eax
 516:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 519:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 51d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 521:	75 09                	jne    52c <printf+0x101>
          s = "(null)";
 523:	c7 45 f4 f7 07 00 00 	movl   $0x7f7,-0xc(%ebp)
        while(*s != 0){
 52a:	eb 1e                	jmp    54a <printf+0x11f>
 52c:	eb 1c                	jmp    54a <printf+0x11f>
          putc(fd, *s);
 52e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 531:	0f b6 00             	movzbl (%eax),%eax
 534:	0f be c0             	movsbl %al,%eax
 537:	89 44 24 04          	mov    %eax,0x4(%esp)
 53b:	8b 45 08             	mov    0x8(%ebp),%eax
 53e:	89 04 24             	mov    %eax,(%esp)
 541:	e8 05 fe ff ff       	call   34b <putc>
          s++;
 546:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 54a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 54d:	0f b6 00             	movzbl (%eax),%eax
 550:	84 c0                	test   %al,%al
 552:	75 da                	jne    52e <printf+0x103>
 554:	eb 68                	jmp    5be <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 556:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 55a:	75 1d                	jne    579 <printf+0x14e>
        putc(fd, *ap);
 55c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 55f:	8b 00                	mov    (%eax),%eax
 561:	0f be c0             	movsbl %al,%eax
 564:	89 44 24 04          	mov    %eax,0x4(%esp)
 568:	8b 45 08             	mov    0x8(%ebp),%eax
 56b:	89 04 24             	mov    %eax,(%esp)
 56e:	e8 d8 fd ff ff       	call   34b <putc>
        ap++;
 573:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 577:	eb 45                	jmp    5be <printf+0x193>
      } else if(c == '%'){
 579:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 57d:	75 17                	jne    596 <printf+0x16b>
        putc(fd, c);
 57f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 582:	0f be c0             	movsbl %al,%eax
 585:	89 44 24 04          	mov    %eax,0x4(%esp)
 589:	8b 45 08             	mov    0x8(%ebp),%eax
 58c:	89 04 24             	mov    %eax,(%esp)
 58f:	e8 b7 fd ff ff       	call   34b <putc>
 594:	eb 28                	jmp    5be <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 596:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 59d:	00 
 59e:	8b 45 08             	mov    0x8(%ebp),%eax
 5a1:	89 04 24             	mov    %eax,(%esp)
 5a4:	e8 a2 fd ff ff       	call   34b <putc>
        putc(fd, c);
 5a9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5ac:	0f be c0             	movsbl %al,%eax
 5af:	89 44 24 04          	mov    %eax,0x4(%esp)
 5b3:	8b 45 08             	mov    0x8(%ebp),%eax
 5b6:	89 04 24             	mov    %eax,(%esp)
 5b9:	e8 8d fd ff ff       	call   34b <putc>
      }
      state = 0;
 5be:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5c5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 5c9:	8b 55 0c             	mov    0xc(%ebp),%edx
 5cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5cf:	01 d0                	add    %edx,%eax
 5d1:	0f b6 00             	movzbl (%eax),%eax
 5d4:	84 c0                	test   %al,%al
 5d6:	0f 85 71 fe ff ff    	jne    44d <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5dc:	c9                   	leave  
 5dd:	c3                   	ret    

000005de <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5de:	55                   	push   %ebp
 5df:	89 e5                	mov    %esp,%ebp
 5e1:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5e4:	8b 45 08             	mov    0x8(%ebp),%eax
 5e7:	83 e8 08             	sub    $0x8,%eax
 5ea:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5ed:	a1 60 0a 00 00       	mov    0xa60,%eax
 5f2:	89 45 fc             	mov    %eax,-0x4(%ebp)
 5f5:	eb 24                	jmp    61b <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5f7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5fa:	8b 00                	mov    (%eax),%eax
 5fc:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5ff:	77 12                	ja     613 <free+0x35>
 601:	8b 45 f8             	mov    -0x8(%ebp),%eax
 604:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 607:	77 24                	ja     62d <free+0x4f>
 609:	8b 45 fc             	mov    -0x4(%ebp),%eax
 60c:	8b 00                	mov    (%eax),%eax
 60e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 611:	77 1a                	ja     62d <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 613:	8b 45 fc             	mov    -0x4(%ebp),%eax
 616:	8b 00                	mov    (%eax),%eax
 618:	89 45 fc             	mov    %eax,-0x4(%ebp)
 61b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 61e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 621:	76 d4                	jbe    5f7 <free+0x19>
 623:	8b 45 fc             	mov    -0x4(%ebp),%eax
 626:	8b 00                	mov    (%eax),%eax
 628:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 62b:	76 ca                	jbe    5f7 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 62d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 630:	8b 40 04             	mov    0x4(%eax),%eax
 633:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 63a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 63d:	01 c2                	add    %eax,%edx
 63f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 642:	8b 00                	mov    (%eax),%eax
 644:	39 c2                	cmp    %eax,%edx
 646:	75 24                	jne    66c <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 648:	8b 45 f8             	mov    -0x8(%ebp),%eax
 64b:	8b 50 04             	mov    0x4(%eax),%edx
 64e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 651:	8b 00                	mov    (%eax),%eax
 653:	8b 40 04             	mov    0x4(%eax),%eax
 656:	01 c2                	add    %eax,%edx
 658:	8b 45 f8             	mov    -0x8(%ebp),%eax
 65b:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 65e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 661:	8b 00                	mov    (%eax),%eax
 663:	8b 10                	mov    (%eax),%edx
 665:	8b 45 f8             	mov    -0x8(%ebp),%eax
 668:	89 10                	mov    %edx,(%eax)
 66a:	eb 0a                	jmp    676 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 66c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 66f:	8b 10                	mov    (%eax),%edx
 671:	8b 45 f8             	mov    -0x8(%ebp),%eax
 674:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 676:	8b 45 fc             	mov    -0x4(%ebp),%eax
 679:	8b 40 04             	mov    0x4(%eax),%eax
 67c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 683:	8b 45 fc             	mov    -0x4(%ebp),%eax
 686:	01 d0                	add    %edx,%eax
 688:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 68b:	75 20                	jne    6ad <free+0xcf>
    p->s.size += bp->s.size;
 68d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 690:	8b 50 04             	mov    0x4(%eax),%edx
 693:	8b 45 f8             	mov    -0x8(%ebp),%eax
 696:	8b 40 04             	mov    0x4(%eax),%eax
 699:	01 c2                	add    %eax,%edx
 69b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 69e:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6a1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6a4:	8b 10                	mov    (%eax),%edx
 6a6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a9:	89 10                	mov    %edx,(%eax)
 6ab:	eb 08                	jmp    6b5 <free+0xd7>
  } else
    p->s.ptr = bp;
 6ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b0:	8b 55 f8             	mov    -0x8(%ebp),%edx
 6b3:	89 10                	mov    %edx,(%eax)
  freep = p;
 6b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b8:	a3 60 0a 00 00       	mov    %eax,0xa60
}
 6bd:	c9                   	leave  
 6be:	c3                   	ret    

000006bf <morecore>:

static Header*
morecore(uint nu)
{
 6bf:	55                   	push   %ebp
 6c0:	89 e5                	mov    %esp,%ebp
 6c2:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 6c5:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 6cc:	77 07                	ja     6d5 <morecore+0x16>
    nu = 4096;
 6ce:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 6d5:	8b 45 08             	mov    0x8(%ebp),%eax
 6d8:	c1 e0 03             	shl    $0x3,%eax
 6db:	89 04 24             	mov    %eax,(%esp)
 6de:	e8 18 fc ff ff       	call   2fb <sbrk>
 6e3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 6e6:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 6ea:	75 07                	jne    6f3 <morecore+0x34>
    return 0;
 6ec:	b8 00 00 00 00       	mov    $0x0,%eax
 6f1:	eb 22                	jmp    715 <morecore+0x56>
  hp = (Header*)p;
 6f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6f6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 6f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6fc:	8b 55 08             	mov    0x8(%ebp),%edx
 6ff:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 702:	8b 45 f0             	mov    -0x10(%ebp),%eax
 705:	83 c0 08             	add    $0x8,%eax
 708:	89 04 24             	mov    %eax,(%esp)
 70b:	e8 ce fe ff ff       	call   5de <free>
  return freep;
 710:	a1 60 0a 00 00       	mov    0xa60,%eax
}
 715:	c9                   	leave  
 716:	c3                   	ret    

00000717 <malloc>:

void*
malloc(uint nbytes)
{
 717:	55                   	push   %ebp
 718:	89 e5                	mov    %esp,%ebp
 71a:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 71d:	8b 45 08             	mov    0x8(%ebp),%eax
 720:	83 c0 07             	add    $0x7,%eax
 723:	c1 e8 03             	shr    $0x3,%eax
 726:	83 c0 01             	add    $0x1,%eax
 729:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 72c:	a1 60 0a 00 00       	mov    0xa60,%eax
 731:	89 45 f0             	mov    %eax,-0x10(%ebp)
 734:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 738:	75 23                	jne    75d <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 73a:	c7 45 f0 58 0a 00 00 	movl   $0xa58,-0x10(%ebp)
 741:	8b 45 f0             	mov    -0x10(%ebp),%eax
 744:	a3 60 0a 00 00       	mov    %eax,0xa60
 749:	a1 60 0a 00 00       	mov    0xa60,%eax
 74e:	a3 58 0a 00 00       	mov    %eax,0xa58
    base.s.size = 0;
 753:	c7 05 5c 0a 00 00 00 	movl   $0x0,0xa5c
 75a:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 75d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 760:	8b 00                	mov    (%eax),%eax
 762:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 765:	8b 45 f4             	mov    -0xc(%ebp),%eax
 768:	8b 40 04             	mov    0x4(%eax),%eax
 76b:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 76e:	72 4d                	jb     7bd <malloc+0xa6>
      if(p->s.size == nunits)
 770:	8b 45 f4             	mov    -0xc(%ebp),%eax
 773:	8b 40 04             	mov    0x4(%eax),%eax
 776:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 779:	75 0c                	jne    787 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 77b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 77e:	8b 10                	mov    (%eax),%edx
 780:	8b 45 f0             	mov    -0x10(%ebp),%eax
 783:	89 10                	mov    %edx,(%eax)
 785:	eb 26                	jmp    7ad <malloc+0x96>
      else {
        p->s.size -= nunits;
 787:	8b 45 f4             	mov    -0xc(%ebp),%eax
 78a:	8b 40 04             	mov    0x4(%eax),%eax
 78d:	2b 45 ec             	sub    -0x14(%ebp),%eax
 790:	89 c2                	mov    %eax,%edx
 792:	8b 45 f4             	mov    -0xc(%ebp),%eax
 795:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 798:	8b 45 f4             	mov    -0xc(%ebp),%eax
 79b:	8b 40 04             	mov    0x4(%eax),%eax
 79e:	c1 e0 03             	shl    $0x3,%eax
 7a1:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 7a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7a7:	8b 55 ec             	mov    -0x14(%ebp),%edx
 7aa:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 7ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7b0:	a3 60 0a 00 00       	mov    %eax,0xa60
      return (void*)(p + 1);
 7b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7b8:	83 c0 08             	add    $0x8,%eax
 7bb:	eb 38                	jmp    7f5 <malloc+0xde>
    }
    if(p == freep)
 7bd:	a1 60 0a 00 00       	mov    0xa60,%eax
 7c2:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 7c5:	75 1b                	jne    7e2 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 7c7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7ca:	89 04 24             	mov    %eax,(%esp)
 7cd:	e8 ed fe ff ff       	call   6bf <morecore>
 7d2:	89 45 f4             	mov    %eax,-0xc(%ebp)
 7d5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7d9:	75 07                	jne    7e2 <malloc+0xcb>
        return 0;
 7db:	b8 00 00 00 00       	mov    $0x0,%eax
 7e0:	eb 13                	jmp    7f5 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e5:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7eb:	8b 00                	mov    (%eax),%eax
 7ed:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 7f0:	e9 70 ff ff ff       	jmp    765 <malloc+0x4e>
}
 7f5:	c9                   	leave  
 7f6:	c3                   	ret    
