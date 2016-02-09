
_clear:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "user.h"

int
main() {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp

	int i;

	for(i = 0; i < 2; ++i) {	//left as for loop just in case it ever needs updating (e.g. clear more screen)
   9:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
  10:	00 
  11:	eb 19                	jmp    2c <main+0x2c>
		printf(1, "\n\n\n\n\n\n\n\n\n\n");
  13:	c7 44 24 04 24 08 00 	movl   $0x824,0x4(%esp)
  1a:	00 
  1b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  22:	e8 31 04 00 00       	call   458 <printf>
int
main() {

	int i;

	for(i = 0; i < 2; ++i) {	//left as for loop just in case it ever needs updating (e.g. clear more screen)
  27:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  2c:	83 7c 24 1c 01       	cmpl   $0x1,0x1c(%esp)
  31:	7e e0                	jle    13 <main+0x13>
		printf(1, "\n\n\n\n\n\n\n\n\n\n");
	}

	exit();
  33:	e8 68 02 00 00       	call   2a0 <exit>

00000038 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  38:	55                   	push   %ebp
  39:	89 e5                	mov    %esp,%ebp
  3b:	57                   	push   %edi
  3c:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  3d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  40:	8b 55 10             	mov    0x10(%ebp),%edx
  43:	8b 45 0c             	mov    0xc(%ebp),%eax
  46:	89 cb                	mov    %ecx,%ebx
  48:	89 df                	mov    %ebx,%edi
  4a:	89 d1                	mov    %edx,%ecx
  4c:	fc                   	cld    
  4d:	f3 aa                	rep stos %al,%es:(%edi)
  4f:	89 ca                	mov    %ecx,%edx
  51:	89 fb                	mov    %edi,%ebx
  53:	89 5d 08             	mov    %ebx,0x8(%ebp)
  56:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  59:	5b                   	pop    %ebx
  5a:	5f                   	pop    %edi
  5b:	5d                   	pop    %ebp
  5c:	c3                   	ret    

0000005d <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  5d:	55                   	push   %ebp
  5e:	89 e5                	mov    %esp,%ebp
  60:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  63:	8b 45 08             	mov    0x8(%ebp),%eax
  66:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  69:	90                   	nop
  6a:	8b 45 08             	mov    0x8(%ebp),%eax
  6d:	8d 50 01             	lea    0x1(%eax),%edx
  70:	89 55 08             	mov    %edx,0x8(%ebp)
  73:	8b 55 0c             	mov    0xc(%ebp),%edx
  76:	8d 4a 01             	lea    0x1(%edx),%ecx
  79:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  7c:	0f b6 12             	movzbl (%edx),%edx
  7f:	88 10                	mov    %dl,(%eax)
  81:	0f b6 00             	movzbl (%eax),%eax
  84:	84 c0                	test   %al,%al
  86:	75 e2                	jne    6a <strcpy+0xd>
    ;
  return os;
  88:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  8b:	c9                   	leave  
  8c:	c3                   	ret    

0000008d <strcmp>:

int
strcmp(const char *p, const char *q)
{
  8d:	55                   	push   %ebp
  8e:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  90:	eb 08                	jmp    9a <strcmp+0xd>
    p++, q++;
  92:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  96:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  9a:	8b 45 08             	mov    0x8(%ebp),%eax
  9d:	0f b6 00             	movzbl (%eax),%eax
  a0:	84 c0                	test   %al,%al
  a2:	74 10                	je     b4 <strcmp+0x27>
  a4:	8b 45 08             	mov    0x8(%ebp),%eax
  a7:	0f b6 10             	movzbl (%eax),%edx
  aa:	8b 45 0c             	mov    0xc(%ebp),%eax
  ad:	0f b6 00             	movzbl (%eax),%eax
  b0:	38 c2                	cmp    %al,%dl
  b2:	74 de                	je     92 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  b4:	8b 45 08             	mov    0x8(%ebp),%eax
  b7:	0f b6 00             	movzbl (%eax),%eax
  ba:	0f b6 d0             	movzbl %al,%edx
  bd:	8b 45 0c             	mov    0xc(%ebp),%eax
  c0:	0f b6 00             	movzbl (%eax),%eax
  c3:	0f b6 c0             	movzbl %al,%eax
  c6:	29 c2                	sub    %eax,%edx
  c8:	89 d0                	mov    %edx,%eax
}
  ca:	5d                   	pop    %ebp
  cb:	c3                   	ret    

000000cc <strlen>:

uint
strlen(char *s)
{
  cc:	55                   	push   %ebp
  cd:	89 e5                	mov    %esp,%ebp
  cf:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  d2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  d9:	eb 04                	jmp    df <strlen+0x13>
  db:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  df:	8b 55 fc             	mov    -0x4(%ebp),%edx
  e2:	8b 45 08             	mov    0x8(%ebp),%eax
  e5:	01 d0                	add    %edx,%eax
  e7:	0f b6 00             	movzbl (%eax),%eax
  ea:	84 c0                	test   %al,%al
  ec:	75 ed                	jne    db <strlen+0xf>
    ;
  return n;
  ee:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  f1:	c9                   	leave  
  f2:	c3                   	ret    

000000f3 <memset>:

void*
memset(void *dst, int c, uint n)
{
  f3:	55                   	push   %ebp
  f4:	89 e5                	mov    %esp,%ebp
  f6:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
  f9:	8b 45 10             	mov    0x10(%ebp),%eax
  fc:	89 44 24 08          	mov    %eax,0x8(%esp)
 100:	8b 45 0c             	mov    0xc(%ebp),%eax
 103:	89 44 24 04          	mov    %eax,0x4(%esp)
 107:	8b 45 08             	mov    0x8(%ebp),%eax
 10a:	89 04 24             	mov    %eax,(%esp)
 10d:	e8 26 ff ff ff       	call   38 <stosb>
  return dst;
 112:	8b 45 08             	mov    0x8(%ebp),%eax
}
 115:	c9                   	leave  
 116:	c3                   	ret    

00000117 <strchr>:

char*
strchr(const char *s, char c)
{
 117:	55                   	push   %ebp
 118:	89 e5                	mov    %esp,%ebp
 11a:	83 ec 04             	sub    $0x4,%esp
 11d:	8b 45 0c             	mov    0xc(%ebp),%eax
 120:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 123:	eb 14                	jmp    139 <strchr+0x22>
    if(*s == c)
 125:	8b 45 08             	mov    0x8(%ebp),%eax
 128:	0f b6 00             	movzbl (%eax),%eax
 12b:	3a 45 fc             	cmp    -0x4(%ebp),%al
 12e:	75 05                	jne    135 <strchr+0x1e>
      return (char*)s;
 130:	8b 45 08             	mov    0x8(%ebp),%eax
 133:	eb 13                	jmp    148 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 135:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 139:	8b 45 08             	mov    0x8(%ebp),%eax
 13c:	0f b6 00             	movzbl (%eax),%eax
 13f:	84 c0                	test   %al,%al
 141:	75 e2                	jne    125 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 143:	b8 00 00 00 00       	mov    $0x0,%eax
}
 148:	c9                   	leave  
 149:	c3                   	ret    

0000014a <gets>:

char*
gets(char *buf, int max)
{
 14a:	55                   	push   %ebp
 14b:	89 e5                	mov    %esp,%ebp
 14d:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 150:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 157:	eb 4c                	jmp    1a5 <gets+0x5b>
    cc = read(0, &c, 1);
 159:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 160:	00 
 161:	8d 45 ef             	lea    -0x11(%ebp),%eax
 164:	89 44 24 04          	mov    %eax,0x4(%esp)
 168:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 16f:	e8 44 01 00 00       	call   2b8 <read>
 174:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 177:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 17b:	7f 02                	jg     17f <gets+0x35>
      break;
 17d:	eb 31                	jmp    1b0 <gets+0x66>
    buf[i++] = c;
 17f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 182:	8d 50 01             	lea    0x1(%eax),%edx
 185:	89 55 f4             	mov    %edx,-0xc(%ebp)
 188:	89 c2                	mov    %eax,%edx
 18a:	8b 45 08             	mov    0x8(%ebp),%eax
 18d:	01 c2                	add    %eax,%edx
 18f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 193:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 195:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 199:	3c 0a                	cmp    $0xa,%al
 19b:	74 13                	je     1b0 <gets+0x66>
 19d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1a1:	3c 0d                	cmp    $0xd,%al
 1a3:	74 0b                	je     1b0 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1a8:	83 c0 01             	add    $0x1,%eax
 1ab:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1ae:	7c a9                	jl     159 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1b0:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1b3:	8b 45 08             	mov    0x8(%ebp),%eax
 1b6:	01 d0                	add    %edx,%eax
 1b8:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1bb:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1be:	c9                   	leave  
 1bf:	c3                   	ret    

000001c0 <stat>:

int
stat(char *n, struct stat *st)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1c6:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1cd:	00 
 1ce:	8b 45 08             	mov    0x8(%ebp),%eax
 1d1:	89 04 24             	mov    %eax,(%esp)
 1d4:	e8 07 01 00 00       	call   2e0 <open>
 1d9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1dc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1e0:	79 07                	jns    1e9 <stat+0x29>
    return -1;
 1e2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1e7:	eb 23                	jmp    20c <stat+0x4c>
  r = fstat(fd, st);
 1e9:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ec:	89 44 24 04          	mov    %eax,0x4(%esp)
 1f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1f3:	89 04 24             	mov    %eax,(%esp)
 1f6:	e8 fd 00 00 00       	call   2f8 <fstat>
 1fb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 1fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
 201:	89 04 24             	mov    %eax,(%esp)
 204:	e8 bf 00 00 00       	call   2c8 <close>
  return r;
 209:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 20c:	c9                   	leave  
 20d:	c3                   	ret    

0000020e <atoi>:

int
atoi(const char *s)
{
 20e:	55                   	push   %ebp
 20f:	89 e5                	mov    %esp,%ebp
 211:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 214:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 21b:	eb 25                	jmp    242 <atoi+0x34>
    n = n*10 + *s++ - '0';
 21d:	8b 55 fc             	mov    -0x4(%ebp),%edx
 220:	89 d0                	mov    %edx,%eax
 222:	c1 e0 02             	shl    $0x2,%eax
 225:	01 d0                	add    %edx,%eax
 227:	01 c0                	add    %eax,%eax
 229:	89 c1                	mov    %eax,%ecx
 22b:	8b 45 08             	mov    0x8(%ebp),%eax
 22e:	8d 50 01             	lea    0x1(%eax),%edx
 231:	89 55 08             	mov    %edx,0x8(%ebp)
 234:	0f b6 00             	movzbl (%eax),%eax
 237:	0f be c0             	movsbl %al,%eax
 23a:	01 c8                	add    %ecx,%eax
 23c:	83 e8 30             	sub    $0x30,%eax
 23f:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 242:	8b 45 08             	mov    0x8(%ebp),%eax
 245:	0f b6 00             	movzbl (%eax),%eax
 248:	3c 2f                	cmp    $0x2f,%al
 24a:	7e 0a                	jle    256 <atoi+0x48>
 24c:	8b 45 08             	mov    0x8(%ebp),%eax
 24f:	0f b6 00             	movzbl (%eax),%eax
 252:	3c 39                	cmp    $0x39,%al
 254:	7e c7                	jle    21d <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 256:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 259:	c9                   	leave  
 25a:	c3                   	ret    

0000025b <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 25b:	55                   	push   %ebp
 25c:	89 e5                	mov    %esp,%ebp
 25e:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 261:	8b 45 08             	mov    0x8(%ebp),%eax
 264:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 267:	8b 45 0c             	mov    0xc(%ebp),%eax
 26a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 26d:	eb 17                	jmp    286 <memmove+0x2b>
    *dst++ = *src++;
 26f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 272:	8d 50 01             	lea    0x1(%eax),%edx
 275:	89 55 fc             	mov    %edx,-0x4(%ebp)
 278:	8b 55 f8             	mov    -0x8(%ebp),%edx
 27b:	8d 4a 01             	lea    0x1(%edx),%ecx
 27e:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 281:	0f b6 12             	movzbl (%edx),%edx
 284:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 286:	8b 45 10             	mov    0x10(%ebp),%eax
 289:	8d 50 ff             	lea    -0x1(%eax),%edx
 28c:	89 55 10             	mov    %edx,0x10(%ebp)
 28f:	85 c0                	test   %eax,%eax
 291:	7f dc                	jg     26f <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 293:	8b 45 08             	mov    0x8(%ebp),%eax
}
 296:	c9                   	leave  
 297:	c3                   	ret    

00000298 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 298:	b8 01 00 00 00       	mov    $0x1,%eax
 29d:	cd 40                	int    $0x40
 29f:	c3                   	ret    

000002a0 <exit>:
SYSCALL(exit)
 2a0:	b8 02 00 00 00       	mov    $0x2,%eax
 2a5:	cd 40                	int    $0x40
 2a7:	c3                   	ret    

000002a8 <wait>:
SYSCALL(wait)
 2a8:	b8 03 00 00 00       	mov    $0x3,%eax
 2ad:	cd 40                	int    $0x40
 2af:	c3                   	ret    

000002b0 <pipe>:
SYSCALL(pipe)
 2b0:	b8 04 00 00 00       	mov    $0x4,%eax
 2b5:	cd 40                	int    $0x40
 2b7:	c3                   	ret    

000002b8 <read>:
SYSCALL(read)
 2b8:	b8 05 00 00 00       	mov    $0x5,%eax
 2bd:	cd 40                	int    $0x40
 2bf:	c3                   	ret    

000002c0 <write>:
SYSCALL(write)
 2c0:	b8 10 00 00 00       	mov    $0x10,%eax
 2c5:	cd 40                	int    $0x40
 2c7:	c3                   	ret    

000002c8 <close>:
SYSCALL(close)
 2c8:	b8 15 00 00 00       	mov    $0x15,%eax
 2cd:	cd 40                	int    $0x40
 2cf:	c3                   	ret    

000002d0 <kill>:
SYSCALL(kill)
 2d0:	b8 06 00 00 00       	mov    $0x6,%eax
 2d5:	cd 40                	int    $0x40
 2d7:	c3                   	ret    

000002d8 <exec>:
SYSCALL(exec)
 2d8:	b8 07 00 00 00       	mov    $0x7,%eax
 2dd:	cd 40                	int    $0x40
 2df:	c3                   	ret    

000002e0 <open>:
SYSCALL(open)
 2e0:	b8 0f 00 00 00       	mov    $0xf,%eax
 2e5:	cd 40                	int    $0x40
 2e7:	c3                   	ret    

000002e8 <mknod>:
SYSCALL(mknod)
 2e8:	b8 11 00 00 00       	mov    $0x11,%eax
 2ed:	cd 40                	int    $0x40
 2ef:	c3                   	ret    

000002f0 <unlink>:
SYSCALL(unlink)
 2f0:	b8 12 00 00 00       	mov    $0x12,%eax
 2f5:	cd 40                	int    $0x40
 2f7:	c3                   	ret    

000002f8 <fstat>:
SYSCALL(fstat)
 2f8:	b8 08 00 00 00       	mov    $0x8,%eax
 2fd:	cd 40                	int    $0x40
 2ff:	c3                   	ret    

00000300 <link>:
SYSCALL(link)
 300:	b8 13 00 00 00       	mov    $0x13,%eax
 305:	cd 40                	int    $0x40
 307:	c3                   	ret    

00000308 <mkdir>:
SYSCALL(mkdir)
 308:	b8 14 00 00 00       	mov    $0x14,%eax
 30d:	cd 40                	int    $0x40
 30f:	c3                   	ret    

00000310 <chdir>:
SYSCALL(chdir)
 310:	b8 09 00 00 00       	mov    $0x9,%eax
 315:	cd 40                	int    $0x40
 317:	c3                   	ret    

00000318 <dup>:
SYSCALL(dup)
 318:	b8 0a 00 00 00       	mov    $0xa,%eax
 31d:	cd 40                	int    $0x40
 31f:	c3                   	ret    

00000320 <getpid>:
SYSCALL(getpid)
 320:	b8 0b 00 00 00       	mov    $0xb,%eax
 325:	cd 40                	int    $0x40
 327:	c3                   	ret    

00000328 <sbrk>:
SYSCALL(sbrk)
 328:	b8 0c 00 00 00       	mov    $0xc,%eax
 32d:	cd 40                	int    $0x40
 32f:	c3                   	ret    

00000330 <sleep>:
SYSCALL(sleep)
 330:	b8 0d 00 00 00       	mov    $0xd,%eax
 335:	cd 40                	int    $0x40
 337:	c3                   	ret    

00000338 <uptime>:
SYSCALL(uptime)
 338:	b8 0e 00 00 00       	mov    $0xe,%eax
 33d:	cd 40                	int    $0x40
 33f:	c3                   	ret    

00000340 <date>:
SYSCALL(date) //JV-date - defines system call date and stores it into IDT
 340:	b8 16 00 00 00       	mov    $0x16,%eax
 345:	cd 40                	int    $0x40
 347:	c3                   	ret    

00000348 <time>:
SYSCALL(time) //JV-time - defines system call time and stores it into IDT
 348:	b8 17 00 00 00       	mov    $0x17,%eax
 34d:	cd 40                	int    $0x40
 34f:	c3                   	ret    

00000350 <getgid>:
SYSCALL(getgid) //JV-getgid - defines system call getgid and stores it into IDT (this is referenced in user.h)
 350:	b8 18 00 00 00       	mov    $0x18,%eax
 355:	cd 40                	int    $0x40
 357:	c3                   	ret    

00000358 <getuid>:
SYSCALL(getuid) //JV-getuid - defines system call getuid and stores it into IDT (this is referenced in user.h)
 358:	b8 19 00 00 00       	mov    $0x19,%eax
 35d:	cd 40                	int    $0x40
 35f:	c3                   	ret    

00000360 <getppid>:
SYSCALL(getppid) //JV-getppid - defines system call getppid
 360:	b8 1a 00 00 00       	mov    $0x1a,%eax
 365:	cd 40                	int    $0x40
 367:	c3                   	ret    

00000368 <setgid>:
SYSCALL(setgid) //JV-setgid - defines system call setgid
 368:	b8 1b 00 00 00       	mov    $0x1b,%eax
 36d:	cd 40                	int    $0x40
 36f:	c3                   	ret    

00000370 <setuid>:
SYSCALL(setuid) //JV-setuid - defines system call setuid
 370:	b8 1c 00 00 00       	mov    $0x1c,%eax
 375:	cd 40                	int    $0x40
 377:	c3                   	ret    

00000378 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 378:	55                   	push   %ebp
 379:	89 e5                	mov    %esp,%ebp
 37b:	83 ec 18             	sub    $0x18,%esp
 37e:	8b 45 0c             	mov    0xc(%ebp),%eax
 381:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 384:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 38b:	00 
 38c:	8d 45 f4             	lea    -0xc(%ebp),%eax
 38f:	89 44 24 04          	mov    %eax,0x4(%esp)
 393:	8b 45 08             	mov    0x8(%ebp),%eax
 396:	89 04 24             	mov    %eax,(%esp)
 399:	e8 22 ff ff ff       	call   2c0 <write>
}
 39e:	c9                   	leave  
 39f:	c3                   	ret    

000003a0 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	56                   	push   %esi
 3a4:	53                   	push   %ebx
 3a5:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3a8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 3af:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 3b3:	74 17                	je     3cc <printint+0x2c>
 3b5:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 3b9:	79 11                	jns    3cc <printint+0x2c>
    neg = 1;
 3bb:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 3c2:	8b 45 0c             	mov    0xc(%ebp),%eax
 3c5:	f7 d8                	neg    %eax
 3c7:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3ca:	eb 06                	jmp    3d2 <printint+0x32>
  } else {
    x = xx;
 3cc:	8b 45 0c             	mov    0xc(%ebp),%eax
 3cf:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 3d2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 3d9:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 3dc:	8d 41 01             	lea    0x1(%ecx),%eax
 3df:	89 45 f4             	mov    %eax,-0xc(%ebp)
 3e2:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3e5:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3e8:	ba 00 00 00 00       	mov    $0x0,%edx
 3ed:	f7 f3                	div    %ebx
 3ef:	89 d0                	mov    %edx,%eax
 3f1:	0f b6 80 7c 0a 00 00 	movzbl 0xa7c(%eax),%eax
 3f8:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 3fc:	8b 75 10             	mov    0x10(%ebp),%esi
 3ff:	8b 45 ec             	mov    -0x14(%ebp),%eax
 402:	ba 00 00 00 00       	mov    $0x0,%edx
 407:	f7 f6                	div    %esi
 409:	89 45 ec             	mov    %eax,-0x14(%ebp)
 40c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 410:	75 c7                	jne    3d9 <printint+0x39>
  if(neg)
 412:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 416:	74 10                	je     428 <printint+0x88>
    buf[i++] = '-';
 418:	8b 45 f4             	mov    -0xc(%ebp),%eax
 41b:	8d 50 01             	lea    0x1(%eax),%edx
 41e:	89 55 f4             	mov    %edx,-0xc(%ebp)
 421:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 426:	eb 1f                	jmp    447 <printint+0xa7>
 428:	eb 1d                	jmp    447 <printint+0xa7>
    putc(fd, buf[i]);
 42a:	8d 55 dc             	lea    -0x24(%ebp),%edx
 42d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 430:	01 d0                	add    %edx,%eax
 432:	0f b6 00             	movzbl (%eax),%eax
 435:	0f be c0             	movsbl %al,%eax
 438:	89 44 24 04          	mov    %eax,0x4(%esp)
 43c:	8b 45 08             	mov    0x8(%ebp),%eax
 43f:	89 04 24             	mov    %eax,(%esp)
 442:	e8 31 ff ff ff       	call   378 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 447:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 44b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 44f:	79 d9                	jns    42a <printint+0x8a>
    putc(fd, buf[i]);
}
 451:	83 c4 30             	add    $0x30,%esp
 454:	5b                   	pop    %ebx
 455:	5e                   	pop    %esi
 456:	5d                   	pop    %ebp
 457:	c3                   	ret    

00000458 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 458:	55                   	push   %ebp
 459:	89 e5                	mov    %esp,%ebp
 45b:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 45e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 465:	8d 45 0c             	lea    0xc(%ebp),%eax
 468:	83 c0 04             	add    $0x4,%eax
 46b:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 46e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 475:	e9 7c 01 00 00       	jmp    5f6 <printf+0x19e>
    c = fmt[i] & 0xff;
 47a:	8b 55 0c             	mov    0xc(%ebp),%edx
 47d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 480:	01 d0                	add    %edx,%eax
 482:	0f b6 00             	movzbl (%eax),%eax
 485:	0f be c0             	movsbl %al,%eax
 488:	25 ff 00 00 00       	and    $0xff,%eax
 48d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 490:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 494:	75 2c                	jne    4c2 <printf+0x6a>
      if(c == '%'){
 496:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 49a:	75 0c                	jne    4a8 <printf+0x50>
        state = '%';
 49c:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 4a3:	e9 4a 01 00 00       	jmp    5f2 <printf+0x19a>
      } else {
        putc(fd, c);
 4a8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4ab:	0f be c0             	movsbl %al,%eax
 4ae:	89 44 24 04          	mov    %eax,0x4(%esp)
 4b2:	8b 45 08             	mov    0x8(%ebp),%eax
 4b5:	89 04 24             	mov    %eax,(%esp)
 4b8:	e8 bb fe ff ff       	call   378 <putc>
 4bd:	e9 30 01 00 00       	jmp    5f2 <printf+0x19a>
      }
    } else if(state == '%'){
 4c2:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 4c6:	0f 85 26 01 00 00    	jne    5f2 <printf+0x19a>
      if(c == 'd'){
 4cc:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 4d0:	75 2d                	jne    4ff <printf+0xa7>
        printint(fd, *ap, 10, 1);
 4d2:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4d5:	8b 00                	mov    (%eax),%eax
 4d7:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 4de:	00 
 4df:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 4e6:	00 
 4e7:	89 44 24 04          	mov    %eax,0x4(%esp)
 4eb:	8b 45 08             	mov    0x8(%ebp),%eax
 4ee:	89 04 24             	mov    %eax,(%esp)
 4f1:	e8 aa fe ff ff       	call   3a0 <printint>
        ap++;
 4f6:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4fa:	e9 ec 00 00 00       	jmp    5eb <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 4ff:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 503:	74 06                	je     50b <printf+0xb3>
 505:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 509:	75 2d                	jne    538 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 50b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 50e:	8b 00                	mov    (%eax),%eax
 510:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 517:	00 
 518:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 51f:	00 
 520:	89 44 24 04          	mov    %eax,0x4(%esp)
 524:	8b 45 08             	mov    0x8(%ebp),%eax
 527:	89 04 24             	mov    %eax,(%esp)
 52a:	e8 71 fe ff ff       	call   3a0 <printint>
        ap++;
 52f:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 533:	e9 b3 00 00 00       	jmp    5eb <printf+0x193>
      } else if(c == 's'){
 538:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 53c:	75 45                	jne    583 <printf+0x12b>
        s = (char*)*ap;
 53e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 541:	8b 00                	mov    (%eax),%eax
 543:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 546:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 54a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 54e:	75 09                	jne    559 <printf+0x101>
          s = "(null)";
 550:	c7 45 f4 2f 08 00 00 	movl   $0x82f,-0xc(%ebp)
        while(*s != 0){
 557:	eb 1e                	jmp    577 <printf+0x11f>
 559:	eb 1c                	jmp    577 <printf+0x11f>
          putc(fd, *s);
 55b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 55e:	0f b6 00             	movzbl (%eax),%eax
 561:	0f be c0             	movsbl %al,%eax
 564:	89 44 24 04          	mov    %eax,0x4(%esp)
 568:	8b 45 08             	mov    0x8(%ebp),%eax
 56b:	89 04 24             	mov    %eax,(%esp)
 56e:	e8 05 fe ff ff       	call   378 <putc>
          s++;
 573:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 577:	8b 45 f4             	mov    -0xc(%ebp),%eax
 57a:	0f b6 00             	movzbl (%eax),%eax
 57d:	84 c0                	test   %al,%al
 57f:	75 da                	jne    55b <printf+0x103>
 581:	eb 68                	jmp    5eb <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 583:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 587:	75 1d                	jne    5a6 <printf+0x14e>
        putc(fd, *ap);
 589:	8b 45 e8             	mov    -0x18(%ebp),%eax
 58c:	8b 00                	mov    (%eax),%eax
 58e:	0f be c0             	movsbl %al,%eax
 591:	89 44 24 04          	mov    %eax,0x4(%esp)
 595:	8b 45 08             	mov    0x8(%ebp),%eax
 598:	89 04 24             	mov    %eax,(%esp)
 59b:	e8 d8 fd ff ff       	call   378 <putc>
        ap++;
 5a0:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5a4:	eb 45                	jmp    5eb <printf+0x193>
      } else if(c == '%'){
 5a6:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5aa:	75 17                	jne    5c3 <printf+0x16b>
        putc(fd, c);
 5ac:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5af:	0f be c0             	movsbl %al,%eax
 5b2:	89 44 24 04          	mov    %eax,0x4(%esp)
 5b6:	8b 45 08             	mov    0x8(%ebp),%eax
 5b9:	89 04 24             	mov    %eax,(%esp)
 5bc:	e8 b7 fd ff ff       	call   378 <putc>
 5c1:	eb 28                	jmp    5eb <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5c3:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 5ca:	00 
 5cb:	8b 45 08             	mov    0x8(%ebp),%eax
 5ce:	89 04 24             	mov    %eax,(%esp)
 5d1:	e8 a2 fd ff ff       	call   378 <putc>
        putc(fd, c);
 5d6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5d9:	0f be c0             	movsbl %al,%eax
 5dc:	89 44 24 04          	mov    %eax,0x4(%esp)
 5e0:	8b 45 08             	mov    0x8(%ebp),%eax
 5e3:	89 04 24             	mov    %eax,(%esp)
 5e6:	e8 8d fd ff ff       	call   378 <putc>
      }
      state = 0;
 5eb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5f2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 5f6:	8b 55 0c             	mov    0xc(%ebp),%edx
 5f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5fc:	01 d0                	add    %edx,%eax
 5fe:	0f b6 00             	movzbl (%eax),%eax
 601:	84 c0                	test   %al,%al
 603:	0f 85 71 fe ff ff    	jne    47a <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 609:	c9                   	leave  
 60a:	c3                   	ret    

0000060b <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 60b:	55                   	push   %ebp
 60c:	89 e5                	mov    %esp,%ebp
 60e:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 611:	8b 45 08             	mov    0x8(%ebp),%eax
 614:	83 e8 08             	sub    $0x8,%eax
 617:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 61a:	a1 98 0a 00 00       	mov    0xa98,%eax
 61f:	89 45 fc             	mov    %eax,-0x4(%ebp)
 622:	eb 24                	jmp    648 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 624:	8b 45 fc             	mov    -0x4(%ebp),%eax
 627:	8b 00                	mov    (%eax),%eax
 629:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 62c:	77 12                	ja     640 <free+0x35>
 62e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 631:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 634:	77 24                	ja     65a <free+0x4f>
 636:	8b 45 fc             	mov    -0x4(%ebp),%eax
 639:	8b 00                	mov    (%eax),%eax
 63b:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 63e:	77 1a                	ja     65a <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 640:	8b 45 fc             	mov    -0x4(%ebp),%eax
 643:	8b 00                	mov    (%eax),%eax
 645:	89 45 fc             	mov    %eax,-0x4(%ebp)
 648:	8b 45 f8             	mov    -0x8(%ebp),%eax
 64b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 64e:	76 d4                	jbe    624 <free+0x19>
 650:	8b 45 fc             	mov    -0x4(%ebp),%eax
 653:	8b 00                	mov    (%eax),%eax
 655:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 658:	76 ca                	jbe    624 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 65a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 65d:	8b 40 04             	mov    0x4(%eax),%eax
 660:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 667:	8b 45 f8             	mov    -0x8(%ebp),%eax
 66a:	01 c2                	add    %eax,%edx
 66c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 66f:	8b 00                	mov    (%eax),%eax
 671:	39 c2                	cmp    %eax,%edx
 673:	75 24                	jne    699 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 675:	8b 45 f8             	mov    -0x8(%ebp),%eax
 678:	8b 50 04             	mov    0x4(%eax),%edx
 67b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 67e:	8b 00                	mov    (%eax),%eax
 680:	8b 40 04             	mov    0x4(%eax),%eax
 683:	01 c2                	add    %eax,%edx
 685:	8b 45 f8             	mov    -0x8(%ebp),%eax
 688:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 68b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 68e:	8b 00                	mov    (%eax),%eax
 690:	8b 10                	mov    (%eax),%edx
 692:	8b 45 f8             	mov    -0x8(%ebp),%eax
 695:	89 10                	mov    %edx,(%eax)
 697:	eb 0a                	jmp    6a3 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 699:	8b 45 fc             	mov    -0x4(%ebp),%eax
 69c:	8b 10                	mov    (%eax),%edx
 69e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6a1:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 6a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a6:	8b 40 04             	mov    0x4(%eax),%eax
 6a9:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b3:	01 d0                	add    %edx,%eax
 6b5:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6b8:	75 20                	jne    6da <free+0xcf>
    p->s.size += bp->s.size;
 6ba:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6bd:	8b 50 04             	mov    0x4(%eax),%edx
 6c0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6c3:	8b 40 04             	mov    0x4(%eax),%eax
 6c6:	01 c2                	add    %eax,%edx
 6c8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6cb:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6ce:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6d1:	8b 10                	mov    (%eax),%edx
 6d3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d6:	89 10                	mov    %edx,(%eax)
 6d8:	eb 08                	jmp    6e2 <free+0xd7>
  } else
    p->s.ptr = bp;
 6da:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6dd:	8b 55 f8             	mov    -0x8(%ebp),%edx
 6e0:	89 10                	mov    %edx,(%eax)
  freep = p;
 6e2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e5:	a3 98 0a 00 00       	mov    %eax,0xa98
}
 6ea:	c9                   	leave  
 6eb:	c3                   	ret    

000006ec <morecore>:

static Header*
morecore(uint nu)
{
 6ec:	55                   	push   %ebp
 6ed:	89 e5                	mov    %esp,%ebp
 6ef:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 6f2:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 6f9:	77 07                	ja     702 <morecore+0x16>
    nu = 4096;
 6fb:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 702:	8b 45 08             	mov    0x8(%ebp),%eax
 705:	c1 e0 03             	shl    $0x3,%eax
 708:	89 04 24             	mov    %eax,(%esp)
 70b:	e8 18 fc ff ff       	call   328 <sbrk>
 710:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 713:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 717:	75 07                	jne    720 <morecore+0x34>
    return 0;
 719:	b8 00 00 00 00       	mov    $0x0,%eax
 71e:	eb 22                	jmp    742 <morecore+0x56>
  hp = (Header*)p;
 720:	8b 45 f4             	mov    -0xc(%ebp),%eax
 723:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 726:	8b 45 f0             	mov    -0x10(%ebp),%eax
 729:	8b 55 08             	mov    0x8(%ebp),%edx
 72c:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 72f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 732:	83 c0 08             	add    $0x8,%eax
 735:	89 04 24             	mov    %eax,(%esp)
 738:	e8 ce fe ff ff       	call   60b <free>
  return freep;
 73d:	a1 98 0a 00 00       	mov    0xa98,%eax
}
 742:	c9                   	leave  
 743:	c3                   	ret    

00000744 <malloc>:

void*
malloc(uint nbytes)
{
 744:	55                   	push   %ebp
 745:	89 e5                	mov    %esp,%ebp
 747:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 74a:	8b 45 08             	mov    0x8(%ebp),%eax
 74d:	83 c0 07             	add    $0x7,%eax
 750:	c1 e8 03             	shr    $0x3,%eax
 753:	83 c0 01             	add    $0x1,%eax
 756:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 759:	a1 98 0a 00 00       	mov    0xa98,%eax
 75e:	89 45 f0             	mov    %eax,-0x10(%ebp)
 761:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 765:	75 23                	jne    78a <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 767:	c7 45 f0 90 0a 00 00 	movl   $0xa90,-0x10(%ebp)
 76e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 771:	a3 98 0a 00 00       	mov    %eax,0xa98
 776:	a1 98 0a 00 00       	mov    0xa98,%eax
 77b:	a3 90 0a 00 00       	mov    %eax,0xa90
    base.s.size = 0;
 780:	c7 05 94 0a 00 00 00 	movl   $0x0,0xa94
 787:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 78a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 78d:	8b 00                	mov    (%eax),%eax
 78f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 792:	8b 45 f4             	mov    -0xc(%ebp),%eax
 795:	8b 40 04             	mov    0x4(%eax),%eax
 798:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 79b:	72 4d                	jb     7ea <malloc+0xa6>
      if(p->s.size == nunits)
 79d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7a0:	8b 40 04             	mov    0x4(%eax),%eax
 7a3:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7a6:	75 0c                	jne    7b4 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 7a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ab:	8b 10                	mov    (%eax),%edx
 7ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7b0:	89 10                	mov    %edx,(%eax)
 7b2:	eb 26                	jmp    7da <malloc+0x96>
      else {
        p->s.size -= nunits;
 7b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7b7:	8b 40 04             	mov    0x4(%eax),%eax
 7ba:	2b 45 ec             	sub    -0x14(%ebp),%eax
 7bd:	89 c2                	mov    %eax,%edx
 7bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7c2:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7c8:	8b 40 04             	mov    0x4(%eax),%eax
 7cb:	c1 e0 03             	shl    $0x3,%eax
 7ce:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 7d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7d4:	8b 55 ec             	mov    -0x14(%ebp),%edx
 7d7:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 7da:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7dd:	a3 98 0a 00 00       	mov    %eax,0xa98
      return (void*)(p + 1);
 7e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e5:	83 c0 08             	add    $0x8,%eax
 7e8:	eb 38                	jmp    822 <malloc+0xde>
    }
    if(p == freep)
 7ea:	a1 98 0a 00 00       	mov    0xa98,%eax
 7ef:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 7f2:	75 1b                	jne    80f <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 7f4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7f7:	89 04 24             	mov    %eax,(%esp)
 7fa:	e8 ed fe ff ff       	call   6ec <morecore>
 7ff:	89 45 f4             	mov    %eax,-0xc(%ebp)
 802:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 806:	75 07                	jne    80f <malloc+0xcb>
        return 0;
 808:	b8 00 00 00 00       	mov    $0x0,%eax
 80d:	eb 13                	jmp    822 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 80f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 812:	89 45 f0             	mov    %eax,-0x10(%ebp)
 815:	8b 45 f4             	mov    -0xc(%ebp),%eax
 818:	8b 00                	mov    (%eax),%eax
 81a:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 81d:	e9 70 ff ff ff       	jmp    792 <malloc+0x4e>
}
 822:	c9                   	leave  
 823:	c3                   	ret    
