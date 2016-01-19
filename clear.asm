
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
  13:	c7 44 24 04 fc 07 00 	movl   $0x7fc,0x4(%esp)
  1a:	00 
  1b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  22:	e8 09 04 00 00       	call   430 <printf>
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

00000350 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	83 ec 18             	sub    $0x18,%esp
 356:	8b 45 0c             	mov    0xc(%ebp),%eax
 359:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 35c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 363:	00 
 364:	8d 45 f4             	lea    -0xc(%ebp),%eax
 367:	89 44 24 04          	mov    %eax,0x4(%esp)
 36b:	8b 45 08             	mov    0x8(%ebp),%eax
 36e:	89 04 24             	mov    %eax,(%esp)
 371:	e8 4a ff ff ff       	call   2c0 <write>
}
 376:	c9                   	leave  
 377:	c3                   	ret    

00000378 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 378:	55                   	push   %ebp
 379:	89 e5                	mov    %esp,%ebp
 37b:	56                   	push   %esi
 37c:	53                   	push   %ebx
 37d:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 380:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 387:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 38b:	74 17                	je     3a4 <printint+0x2c>
 38d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 391:	79 11                	jns    3a4 <printint+0x2c>
    neg = 1;
 393:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 39a:	8b 45 0c             	mov    0xc(%ebp),%eax
 39d:	f7 d8                	neg    %eax
 39f:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3a2:	eb 06                	jmp    3aa <printint+0x32>
  } else {
    x = xx;
 3a4:	8b 45 0c             	mov    0xc(%ebp),%eax
 3a7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 3aa:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 3b1:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 3b4:	8d 41 01             	lea    0x1(%ecx),%eax
 3b7:	89 45 f4             	mov    %eax,-0xc(%ebp)
 3ba:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3bd:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3c0:	ba 00 00 00 00       	mov    $0x0,%edx
 3c5:	f7 f3                	div    %ebx
 3c7:	89 d0                	mov    %edx,%eax
 3c9:	0f b6 80 54 0a 00 00 	movzbl 0xa54(%eax),%eax
 3d0:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 3d4:	8b 75 10             	mov    0x10(%ebp),%esi
 3d7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3da:	ba 00 00 00 00       	mov    $0x0,%edx
 3df:	f7 f6                	div    %esi
 3e1:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3e4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 3e8:	75 c7                	jne    3b1 <printint+0x39>
  if(neg)
 3ea:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 3ee:	74 10                	je     400 <printint+0x88>
    buf[i++] = '-';
 3f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3f3:	8d 50 01             	lea    0x1(%eax),%edx
 3f6:	89 55 f4             	mov    %edx,-0xc(%ebp)
 3f9:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 3fe:	eb 1f                	jmp    41f <printint+0xa7>
 400:	eb 1d                	jmp    41f <printint+0xa7>
    putc(fd, buf[i]);
 402:	8d 55 dc             	lea    -0x24(%ebp),%edx
 405:	8b 45 f4             	mov    -0xc(%ebp),%eax
 408:	01 d0                	add    %edx,%eax
 40a:	0f b6 00             	movzbl (%eax),%eax
 40d:	0f be c0             	movsbl %al,%eax
 410:	89 44 24 04          	mov    %eax,0x4(%esp)
 414:	8b 45 08             	mov    0x8(%ebp),%eax
 417:	89 04 24             	mov    %eax,(%esp)
 41a:	e8 31 ff ff ff       	call   350 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 41f:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 423:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 427:	79 d9                	jns    402 <printint+0x8a>
    putc(fd, buf[i]);
}
 429:	83 c4 30             	add    $0x30,%esp
 42c:	5b                   	pop    %ebx
 42d:	5e                   	pop    %esi
 42e:	5d                   	pop    %ebp
 42f:	c3                   	ret    

00000430 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 436:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 43d:	8d 45 0c             	lea    0xc(%ebp),%eax
 440:	83 c0 04             	add    $0x4,%eax
 443:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 446:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 44d:	e9 7c 01 00 00       	jmp    5ce <printf+0x19e>
    c = fmt[i] & 0xff;
 452:	8b 55 0c             	mov    0xc(%ebp),%edx
 455:	8b 45 f0             	mov    -0x10(%ebp),%eax
 458:	01 d0                	add    %edx,%eax
 45a:	0f b6 00             	movzbl (%eax),%eax
 45d:	0f be c0             	movsbl %al,%eax
 460:	25 ff 00 00 00       	and    $0xff,%eax
 465:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 468:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 46c:	75 2c                	jne    49a <printf+0x6a>
      if(c == '%'){
 46e:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 472:	75 0c                	jne    480 <printf+0x50>
        state = '%';
 474:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 47b:	e9 4a 01 00 00       	jmp    5ca <printf+0x19a>
      } else {
        putc(fd, c);
 480:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 483:	0f be c0             	movsbl %al,%eax
 486:	89 44 24 04          	mov    %eax,0x4(%esp)
 48a:	8b 45 08             	mov    0x8(%ebp),%eax
 48d:	89 04 24             	mov    %eax,(%esp)
 490:	e8 bb fe ff ff       	call   350 <putc>
 495:	e9 30 01 00 00       	jmp    5ca <printf+0x19a>
      }
    } else if(state == '%'){
 49a:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 49e:	0f 85 26 01 00 00    	jne    5ca <printf+0x19a>
      if(c == 'd'){
 4a4:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 4a8:	75 2d                	jne    4d7 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 4aa:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4ad:	8b 00                	mov    (%eax),%eax
 4af:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 4b6:	00 
 4b7:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 4be:	00 
 4bf:	89 44 24 04          	mov    %eax,0x4(%esp)
 4c3:	8b 45 08             	mov    0x8(%ebp),%eax
 4c6:	89 04 24             	mov    %eax,(%esp)
 4c9:	e8 aa fe ff ff       	call   378 <printint>
        ap++;
 4ce:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4d2:	e9 ec 00 00 00       	jmp    5c3 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 4d7:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 4db:	74 06                	je     4e3 <printf+0xb3>
 4dd:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 4e1:	75 2d                	jne    510 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 4e3:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4e6:	8b 00                	mov    (%eax),%eax
 4e8:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 4ef:	00 
 4f0:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 4f7:	00 
 4f8:	89 44 24 04          	mov    %eax,0x4(%esp)
 4fc:	8b 45 08             	mov    0x8(%ebp),%eax
 4ff:	89 04 24             	mov    %eax,(%esp)
 502:	e8 71 fe ff ff       	call   378 <printint>
        ap++;
 507:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 50b:	e9 b3 00 00 00       	jmp    5c3 <printf+0x193>
      } else if(c == 's'){
 510:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 514:	75 45                	jne    55b <printf+0x12b>
        s = (char*)*ap;
 516:	8b 45 e8             	mov    -0x18(%ebp),%eax
 519:	8b 00                	mov    (%eax),%eax
 51b:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 51e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 522:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 526:	75 09                	jne    531 <printf+0x101>
          s = "(null)";
 528:	c7 45 f4 07 08 00 00 	movl   $0x807,-0xc(%ebp)
        while(*s != 0){
 52f:	eb 1e                	jmp    54f <printf+0x11f>
 531:	eb 1c                	jmp    54f <printf+0x11f>
          putc(fd, *s);
 533:	8b 45 f4             	mov    -0xc(%ebp),%eax
 536:	0f b6 00             	movzbl (%eax),%eax
 539:	0f be c0             	movsbl %al,%eax
 53c:	89 44 24 04          	mov    %eax,0x4(%esp)
 540:	8b 45 08             	mov    0x8(%ebp),%eax
 543:	89 04 24             	mov    %eax,(%esp)
 546:	e8 05 fe ff ff       	call   350 <putc>
          s++;
 54b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 54f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 552:	0f b6 00             	movzbl (%eax),%eax
 555:	84 c0                	test   %al,%al
 557:	75 da                	jne    533 <printf+0x103>
 559:	eb 68                	jmp    5c3 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 55b:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 55f:	75 1d                	jne    57e <printf+0x14e>
        putc(fd, *ap);
 561:	8b 45 e8             	mov    -0x18(%ebp),%eax
 564:	8b 00                	mov    (%eax),%eax
 566:	0f be c0             	movsbl %al,%eax
 569:	89 44 24 04          	mov    %eax,0x4(%esp)
 56d:	8b 45 08             	mov    0x8(%ebp),%eax
 570:	89 04 24             	mov    %eax,(%esp)
 573:	e8 d8 fd ff ff       	call   350 <putc>
        ap++;
 578:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 57c:	eb 45                	jmp    5c3 <printf+0x193>
      } else if(c == '%'){
 57e:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 582:	75 17                	jne    59b <printf+0x16b>
        putc(fd, c);
 584:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 587:	0f be c0             	movsbl %al,%eax
 58a:	89 44 24 04          	mov    %eax,0x4(%esp)
 58e:	8b 45 08             	mov    0x8(%ebp),%eax
 591:	89 04 24             	mov    %eax,(%esp)
 594:	e8 b7 fd ff ff       	call   350 <putc>
 599:	eb 28                	jmp    5c3 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 59b:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 5a2:	00 
 5a3:	8b 45 08             	mov    0x8(%ebp),%eax
 5a6:	89 04 24             	mov    %eax,(%esp)
 5a9:	e8 a2 fd ff ff       	call   350 <putc>
        putc(fd, c);
 5ae:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5b1:	0f be c0             	movsbl %al,%eax
 5b4:	89 44 24 04          	mov    %eax,0x4(%esp)
 5b8:	8b 45 08             	mov    0x8(%ebp),%eax
 5bb:	89 04 24             	mov    %eax,(%esp)
 5be:	e8 8d fd ff ff       	call   350 <putc>
      }
      state = 0;
 5c3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5ca:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 5ce:	8b 55 0c             	mov    0xc(%ebp),%edx
 5d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5d4:	01 d0                	add    %edx,%eax
 5d6:	0f b6 00             	movzbl (%eax),%eax
 5d9:	84 c0                	test   %al,%al
 5db:	0f 85 71 fe ff ff    	jne    452 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5e1:	c9                   	leave  
 5e2:	c3                   	ret    

000005e3 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5e3:	55                   	push   %ebp
 5e4:	89 e5                	mov    %esp,%ebp
 5e6:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5e9:	8b 45 08             	mov    0x8(%ebp),%eax
 5ec:	83 e8 08             	sub    $0x8,%eax
 5ef:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5f2:	a1 70 0a 00 00       	mov    0xa70,%eax
 5f7:	89 45 fc             	mov    %eax,-0x4(%ebp)
 5fa:	eb 24                	jmp    620 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5fc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5ff:	8b 00                	mov    (%eax),%eax
 601:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 604:	77 12                	ja     618 <free+0x35>
 606:	8b 45 f8             	mov    -0x8(%ebp),%eax
 609:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 60c:	77 24                	ja     632 <free+0x4f>
 60e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 611:	8b 00                	mov    (%eax),%eax
 613:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 616:	77 1a                	ja     632 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 618:	8b 45 fc             	mov    -0x4(%ebp),%eax
 61b:	8b 00                	mov    (%eax),%eax
 61d:	89 45 fc             	mov    %eax,-0x4(%ebp)
 620:	8b 45 f8             	mov    -0x8(%ebp),%eax
 623:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 626:	76 d4                	jbe    5fc <free+0x19>
 628:	8b 45 fc             	mov    -0x4(%ebp),%eax
 62b:	8b 00                	mov    (%eax),%eax
 62d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 630:	76 ca                	jbe    5fc <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 632:	8b 45 f8             	mov    -0x8(%ebp),%eax
 635:	8b 40 04             	mov    0x4(%eax),%eax
 638:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 63f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 642:	01 c2                	add    %eax,%edx
 644:	8b 45 fc             	mov    -0x4(%ebp),%eax
 647:	8b 00                	mov    (%eax),%eax
 649:	39 c2                	cmp    %eax,%edx
 64b:	75 24                	jne    671 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 64d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 650:	8b 50 04             	mov    0x4(%eax),%edx
 653:	8b 45 fc             	mov    -0x4(%ebp),%eax
 656:	8b 00                	mov    (%eax),%eax
 658:	8b 40 04             	mov    0x4(%eax),%eax
 65b:	01 c2                	add    %eax,%edx
 65d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 660:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 663:	8b 45 fc             	mov    -0x4(%ebp),%eax
 666:	8b 00                	mov    (%eax),%eax
 668:	8b 10                	mov    (%eax),%edx
 66a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 66d:	89 10                	mov    %edx,(%eax)
 66f:	eb 0a                	jmp    67b <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 671:	8b 45 fc             	mov    -0x4(%ebp),%eax
 674:	8b 10                	mov    (%eax),%edx
 676:	8b 45 f8             	mov    -0x8(%ebp),%eax
 679:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 67b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 67e:	8b 40 04             	mov    0x4(%eax),%eax
 681:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 688:	8b 45 fc             	mov    -0x4(%ebp),%eax
 68b:	01 d0                	add    %edx,%eax
 68d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 690:	75 20                	jne    6b2 <free+0xcf>
    p->s.size += bp->s.size;
 692:	8b 45 fc             	mov    -0x4(%ebp),%eax
 695:	8b 50 04             	mov    0x4(%eax),%edx
 698:	8b 45 f8             	mov    -0x8(%ebp),%eax
 69b:	8b 40 04             	mov    0x4(%eax),%eax
 69e:	01 c2                	add    %eax,%edx
 6a0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a3:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6a6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6a9:	8b 10                	mov    (%eax),%edx
 6ab:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ae:	89 10                	mov    %edx,(%eax)
 6b0:	eb 08                	jmp    6ba <free+0xd7>
  } else
    p->s.ptr = bp;
 6b2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b5:	8b 55 f8             	mov    -0x8(%ebp),%edx
 6b8:	89 10                	mov    %edx,(%eax)
  freep = p;
 6ba:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6bd:	a3 70 0a 00 00       	mov    %eax,0xa70
}
 6c2:	c9                   	leave  
 6c3:	c3                   	ret    

000006c4 <morecore>:

static Header*
morecore(uint nu)
{
 6c4:	55                   	push   %ebp
 6c5:	89 e5                	mov    %esp,%ebp
 6c7:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 6ca:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 6d1:	77 07                	ja     6da <morecore+0x16>
    nu = 4096;
 6d3:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 6da:	8b 45 08             	mov    0x8(%ebp),%eax
 6dd:	c1 e0 03             	shl    $0x3,%eax
 6e0:	89 04 24             	mov    %eax,(%esp)
 6e3:	e8 40 fc ff ff       	call   328 <sbrk>
 6e8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 6eb:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 6ef:	75 07                	jne    6f8 <morecore+0x34>
    return 0;
 6f1:	b8 00 00 00 00       	mov    $0x0,%eax
 6f6:	eb 22                	jmp    71a <morecore+0x56>
  hp = (Header*)p;
 6f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6fb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 6fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
 701:	8b 55 08             	mov    0x8(%ebp),%edx
 704:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 707:	8b 45 f0             	mov    -0x10(%ebp),%eax
 70a:	83 c0 08             	add    $0x8,%eax
 70d:	89 04 24             	mov    %eax,(%esp)
 710:	e8 ce fe ff ff       	call   5e3 <free>
  return freep;
 715:	a1 70 0a 00 00       	mov    0xa70,%eax
}
 71a:	c9                   	leave  
 71b:	c3                   	ret    

0000071c <malloc>:

void*
malloc(uint nbytes)
{
 71c:	55                   	push   %ebp
 71d:	89 e5                	mov    %esp,%ebp
 71f:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 722:	8b 45 08             	mov    0x8(%ebp),%eax
 725:	83 c0 07             	add    $0x7,%eax
 728:	c1 e8 03             	shr    $0x3,%eax
 72b:	83 c0 01             	add    $0x1,%eax
 72e:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 731:	a1 70 0a 00 00       	mov    0xa70,%eax
 736:	89 45 f0             	mov    %eax,-0x10(%ebp)
 739:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 73d:	75 23                	jne    762 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 73f:	c7 45 f0 68 0a 00 00 	movl   $0xa68,-0x10(%ebp)
 746:	8b 45 f0             	mov    -0x10(%ebp),%eax
 749:	a3 70 0a 00 00       	mov    %eax,0xa70
 74e:	a1 70 0a 00 00       	mov    0xa70,%eax
 753:	a3 68 0a 00 00       	mov    %eax,0xa68
    base.s.size = 0;
 758:	c7 05 6c 0a 00 00 00 	movl   $0x0,0xa6c
 75f:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 762:	8b 45 f0             	mov    -0x10(%ebp),%eax
 765:	8b 00                	mov    (%eax),%eax
 767:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 76a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 76d:	8b 40 04             	mov    0x4(%eax),%eax
 770:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 773:	72 4d                	jb     7c2 <malloc+0xa6>
      if(p->s.size == nunits)
 775:	8b 45 f4             	mov    -0xc(%ebp),%eax
 778:	8b 40 04             	mov    0x4(%eax),%eax
 77b:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 77e:	75 0c                	jne    78c <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 780:	8b 45 f4             	mov    -0xc(%ebp),%eax
 783:	8b 10                	mov    (%eax),%edx
 785:	8b 45 f0             	mov    -0x10(%ebp),%eax
 788:	89 10                	mov    %edx,(%eax)
 78a:	eb 26                	jmp    7b2 <malloc+0x96>
      else {
        p->s.size -= nunits;
 78c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 78f:	8b 40 04             	mov    0x4(%eax),%eax
 792:	2b 45 ec             	sub    -0x14(%ebp),%eax
 795:	89 c2                	mov    %eax,%edx
 797:	8b 45 f4             	mov    -0xc(%ebp),%eax
 79a:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 79d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7a0:	8b 40 04             	mov    0x4(%eax),%eax
 7a3:	c1 e0 03             	shl    $0x3,%eax
 7a6:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 7a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ac:	8b 55 ec             	mov    -0x14(%ebp),%edx
 7af:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 7b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7b5:	a3 70 0a 00 00       	mov    %eax,0xa70
      return (void*)(p + 1);
 7ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7bd:	83 c0 08             	add    $0x8,%eax
 7c0:	eb 38                	jmp    7fa <malloc+0xde>
    }
    if(p == freep)
 7c2:	a1 70 0a 00 00       	mov    0xa70,%eax
 7c7:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 7ca:	75 1b                	jne    7e7 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 7cc:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7cf:	89 04 24             	mov    %eax,(%esp)
 7d2:	e8 ed fe ff ff       	call   6c4 <morecore>
 7d7:	89 45 f4             	mov    %eax,-0xc(%ebp)
 7da:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7de:	75 07                	jne    7e7 <malloc+0xcb>
        return 0;
 7e0:	b8 00 00 00 00       	mov    $0x0,%eax
 7e5:	eb 13                	jmp    7fa <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ea:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7f0:	8b 00                	mov    (%eax),%eax
 7f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 7f5:	e9 70 ff ff ff       	jmp    76a <malloc+0x4e>
}
 7fa:	c9                   	leave  
 7fb:	c3                   	ret    
