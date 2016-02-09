
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <cat>:

char buf[512];

void
cat(int fd)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 28             	sub    $0x28,%esp
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0)
   6:	eb 1b                	jmp    23 <cat+0x23>
    write(1, buf, n);
   8:	8b 45 f4             	mov    -0xc(%ebp),%eax
   b:	89 44 24 08          	mov    %eax,0x8(%esp)
   f:	c7 44 24 04 e0 0b 00 	movl   $0xbe0,0x4(%esp)
  16:	00 
  17:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1e:	e8 82 03 00 00       	call   3a5 <write>
void
cat(int fd)
{
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0)
  23:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  2a:	00 
  2b:	c7 44 24 04 e0 0b 00 	movl   $0xbe0,0x4(%esp)
  32:	00 
  33:	8b 45 08             	mov    0x8(%ebp),%eax
  36:	89 04 24             	mov    %eax,(%esp)
  39:	e8 5f 03 00 00       	call   39d <read>
  3e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  41:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  45:	7f c1                	jg     8 <cat+0x8>
    write(1, buf, n);
  if(n < 0){
  47:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  4b:	79 19                	jns    66 <cat+0x66>
    printf(1, "cat: read error\n");
  4d:	c7 44 24 04 09 09 00 	movl   $0x909,0x4(%esp)
  54:	00 
  55:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  5c:	e8 dc 04 00 00       	call   53d <printf>
    exit();
  61:	e8 1f 03 00 00       	call   385 <exit>
  }
}
  66:	c9                   	leave  
  67:	c3                   	ret    

00000068 <main>:

int
main(int argc, char *argv[])
{
  68:	55                   	push   %ebp
  69:	89 e5                	mov    %esp,%ebp
  6b:	83 e4 f0             	and    $0xfffffff0,%esp
  6e:	83 ec 20             	sub    $0x20,%esp
  int fd, i;

  if(argc <= 1){
  71:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
  75:	7f 11                	jg     88 <main+0x20>
    cat(0);
  77:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  7e:	e8 7d ff ff ff       	call   0 <cat>
    exit();
  83:	e8 fd 02 00 00       	call   385 <exit>
  }

  for(i = 1; i < argc; i++){
  88:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  8f:	00 
  90:	eb 79                	jmp    10b <main+0xa3>
    if((fd = open(argv[i], 0)) < 0){
  92:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  96:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  9d:	8b 45 0c             	mov    0xc(%ebp),%eax
  a0:	01 d0                	add    %edx,%eax
  a2:	8b 00                	mov    (%eax),%eax
  a4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  ab:	00 
  ac:	89 04 24             	mov    %eax,(%esp)
  af:	e8 11 03 00 00       	call   3c5 <open>
  b4:	89 44 24 18          	mov    %eax,0x18(%esp)
  b8:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  bd:	79 2f                	jns    ee <main+0x86>
      printf(1, "cat: cannot open %s\n", argv[i]);
  bf:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  c3:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  ca:	8b 45 0c             	mov    0xc(%ebp),%eax
  cd:	01 d0                	add    %edx,%eax
  cf:	8b 00                	mov    (%eax),%eax
  d1:	89 44 24 08          	mov    %eax,0x8(%esp)
  d5:	c7 44 24 04 1a 09 00 	movl   $0x91a,0x4(%esp)
  dc:	00 
  dd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  e4:	e8 54 04 00 00       	call   53d <printf>
      exit();
  e9:	e8 97 02 00 00       	call   385 <exit>
    }
    cat(fd);
  ee:	8b 44 24 18          	mov    0x18(%esp),%eax
  f2:	89 04 24             	mov    %eax,(%esp)
  f5:	e8 06 ff ff ff       	call   0 <cat>
    close(fd);
  fa:	8b 44 24 18          	mov    0x18(%esp),%eax
  fe:	89 04 24             	mov    %eax,(%esp)
 101:	e8 a7 02 00 00       	call   3ad <close>
  if(argc <= 1){
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
 106:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 10b:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 10f:	3b 45 08             	cmp    0x8(%ebp),%eax
 112:	0f 8c 7a ff ff ff    	jl     92 <main+0x2a>
      exit();
    }
    cat(fd);
    close(fd);
  }
  exit();
 118:	e8 68 02 00 00       	call   385 <exit>

0000011d <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 11d:	55                   	push   %ebp
 11e:	89 e5                	mov    %esp,%ebp
 120:	57                   	push   %edi
 121:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 122:	8b 4d 08             	mov    0x8(%ebp),%ecx
 125:	8b 55 10             	mov    0x10(%ebp),%edx
 128:	8b 45 0c             	mov    0xc(%ebp),%eax
 12b:	89 cb                	mov    %ecx,%ebx
 12d:	89 df                	mov    %ebx,%edi
 12f:	89 d1                	mov    %edx,%ecx
 131:	fc                   	cld    
 132:	f3 aa                	rep stos %al,%es:(%edi)
 134:	89 ca                	mov    %ecx,%edx
 136:	89 fb                	mov    %edi,%ebx
 138:	89 5d 08             	mov    %ebx,0x8(%ebp)
 13b:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 13e:	5b                   	pop    %ebx
 13f:	5f                   	pop    %edi
 140:	5d                   	pop    %ebp
 141:	c3                   	ret    

00000142 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 142:	55                   	push   %ebp
 143:	89 e5                	mov    %esp,%ebp
 145:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 148:	8b 45 08             	mov    0x8(%ebp),%eax
 14b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 14e:	90                   	nop
 14f:	8b 45 08             	mov    0x8(%ebp),%eax
 152:	8d 50 01             	lea    0x1(%eax),%edx
 155:	89 55 08             	mov    %edx,0x8(%ebp)
 158:	8b 55 0c             	mov    0xc(%ebp),%edx
 15b:	8d 4a 01             	lea    0x1(%edx),%ecx
 15e:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 161:	0f b6 12             	movzbl (%edx),%edx
 164:	88 10                	mov    %dl,(%eax)
 166:	0f b6 00             	movzbl (%eax),%eax
 169:	84 c0                	test   %al,%al
 16b:	75 e2                	jne    14f <strcpy+0xd>
    ;
  return os;
 16d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 170:	c9                   	leave  
 171:	c3                   	ret    

00000172 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 172:	55                   	push   %ebp
 173:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 175:	eb 08                	jmp    17f <strcmp+0xd>
    p++, q++;
 177:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 17b:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 17f:	8b 45 08             	mov    0x8(%ebp),%eax
 182:	0f b6 00             	movzbl (%eax),%eax
 185:	84 c0                	test   %al,%al
 187:	74 10                	je     199 <strcmp+0x27>
 189:	8b 45 08             	mov    0x8(%ebp),%eax
 18c:	0f b6 10             	movzbl (%eax),%edx
 18f:	8b 45 0c             	mov    0xc(%ebp),%eax
 192:	0f b6 00             	movzbl (%eax),%eax
 195:	38 c2                	cmp    %al,%dl
 197:	74 de                	je     177 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 199:	8b 45 08             	mov    0x8(%ebp),%eax
 19c:	0f b6 00             	movzbl (%eax),%eax
 19f:	0f b6 d0             	movzbl %al,%edx
 1a2:	8b 45 0c             	mov    0xc(%ebp),%eax
 1a5:	0f b6 00             	movzbl (%eax),%eax
 1a8:	0f b6 c0             	movzbl %al,%eax
 1ab:	29 c2                	sub    %eax,%edx
 1ad:	89 d0                	mov    %edx,%eax
}
 1af:	5d                   	pop    %ebp
 1b0:	c3                   	ret    

000001b1 <strlen>:

uint
strlen(char *s)
{
 1b1:	55                   	push   %ebp
 1b2:	89 e5                	mov    %esp,%ebp
 1b4:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1b7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1be:	eb 04                	jmp    1c4 <strlen+0x13>
 1c0:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1c4:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1c7:	8b 45 08             	mov    0x8(%ebp),%eax
 1ca:	01 d0                	add    %edx,%eax
 1cc:	0f b6 00             	movzbl (%eax),%eax
 1cf:	84 c0                	test   %al,%al
 1d1:	75 ed                	jne    1c0 <strlen+0xf>
    ;
  return n;
 1d3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1d6:	c9                   	leave  
 1d7:	c3                   	ret    

000001d8 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1d8:	55                   	push   %ebp
 1d9:	89 e5                	mov    %esp,%ebp
 1db:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 1de:	8b 45 10             	mov    0x10(%ebp),%eax
 1e1:	89 44 24 08          	mov    %eax,0x8(%esp)
 1e5:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e8:	89 44 24 04          	mov    %eax,0x4(%esp)
 1ec:	8b 45 08             	mov    0x8(%ebp),%eax
 1ef:	89 04 24             	mov    %eax,(%esp)
 1f2:	e8 26 ff ff ff       	call   11d <stosb>
  return dst;
 1f7:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1fa:	c9                   	leave  
 1fb:	c3                   	ret    

000001fc <strchr>:

char*
strchr(const char *s, char c)
{
 1fc:	55                   	push   %ebp
 1fd:	89 e5                	mov    %esp,%ebp
 1ff:	83 ec 04             	sub    $0x4,%esp
 202:	8b 45 0c             	mov    0xc(%ebp),%eax
 205:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 208:	eb 14                	jmp    21e <strchr+0x22>
    if(*s == c)
 20a:	8b 45 08             	mov    0x8(%ebp),%eax
 20d:	0f b6 00             	movzbl (%eax),%eax
 210:	3a 45 fc             	cmp    -0x4(%ebp),%al
 213:	75 05                	jne    21a <strchr+0x1e>
      return (char*)s;
 215:	8b 45 08             	mov    0x8(%ebp),%eax
 218:	eb 13                	jmp    22d <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 21a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 21e:	8b 45 08             	mov    0x8(%ebp),%eax
 221:	0f b6 00             	movzbl (%eax),%eax
 224:	84 c0                	test   %al,%al
 226:	75 e2                	jne    20a <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 228:	b8 00 00 00 00       	mov    $0x0,%eax
}
 22d:	c9                   	leave  
 22e:	c3                   	ret    

0000022f <gets>:

char*
gets(char *buf, int max)
{
 22f:	55                   	push   %ebp
 230:	89 e5                	mov    %esp,%ebp
 232:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 235:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 23c:	eb 4c                	jmp    28a <gets+0x5b>
    cc = read(0, &c, 1);
 23e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 245:	00 
 246:	8d 45 ef             	lea    -0x11(%ebp),%eax
 249:	89 44 24 04          	mov    %eax,0x4(%esp)
 24d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 254:	e8 44 01 00 00       	call   39d <read>
 259:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 25c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 260:	7f 02                	jg     264 <gets+0x35>
      break;
 262:	eb 31                	jmp    295 <gets+0x66>
    buf[i++] = c;
 264:	8b 45 f4             	mov    -0xc(%ebp),%eax
 267:	8d 50 01             	lea    0x1(%eax),%edx
 26a:	89 55 f4             	mov    %edx,-0xc(%ebp)
 26d:	89 c2                	mov    %eax,%edx
 26f:	8b 45 08             	mov    0x8(%ebp),%eax
 272:	01 c2                	add    %eax,%edx
 274:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 278:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 27a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 27e:	3c 0a                	cmp    $0xa,%al
 280:	74 13                	je     295 <gets+0x66>
 282:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 286:	3c 0d                	cmp    $0xd,%al
 288:	74 0b                	je     295 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 28a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 28d:	83 c0 01             	add    $0x1,%eax
 290:	3b 45 0c             	cmp    0xc(%ebp),%eax
 293:	7c a9                	jl     23e <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 295:	8b 55 f4             	mov    -0xc(%ebp),%edx
 298:	8b 45 08             	mov    0x8(%ebp),%eax
 29b:	01 d0                	add    %edx,%eax
 29d:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 2a0:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2a3:	c9                   	leave  
 2a4:	c3                   	ret    

000002a5 <stat>:

int
stat(char *n, struct stat *st)
{
 2a5:	55                   	push   %ebp
 2a6:	89 e5                	mov    %esp,%ebp
 2a8:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2ab:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2b2:	00 
 2b3:	8b 45 08             	mov    0x8(%ebp),%eax
 2b6:	89 04 24             	mov    %eax,(%esp)
 2b9:	e8 07 01 00 00       	call   3c5 <open>
 2be:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 2c1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2c5:	79 07                	jns    2ce <stat+0x29>
    return -1;
 2c7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2cc:	eb 23                	jmp    2f1 <stat+0x4c>
  r = fstat(fd, st);
 2ce:	8b 45 0c             	mov    0xc(%ebp),%eax
 2d1:	89 44 24 04          	mov    %eax,0x4(%esp)
 2d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2d8:	89 04 24             	mov    %eax,(%esp)
 2db:	e8 fd 00 00 00       	call   3dd <fstat>
 2e0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 2e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2e6:	89 04 24             	mov    %eax,(%esp)
 2e9:	e8 bf 00 00 00       	call   3ad <close>
  return r;
 2ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 2f1:	c9                   	leave  
 2f2:	c3                   	ret    

000002f3 <atoi>:

int
atoi(const char *s)
{
 2f3:	55                   	push   %ebp
 2f4:	89 e5                	mov    %esp,%ebp
 2f6:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 2f9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 300:	eb 25                	jmp    327 <atoi+0x34>
    n = n*10 + *s++ - '0';
 302:	8b 55 fc             	mov    -0x4(%ebp),%edx
 305:	89 d0                	mov    %edx,%eax
 307:	c1 e0 02             	shl    $0x2,%eax
 30a:	01 d0                	add    %edx,%eax
 30c:	01 c0                	add    %eax,%eax
 30e:	89 c1                	mov    %eax,%ecx
 310:	8b 45 08             	mov    0x8(%ebp),%eax
 313:	8d 50 01             	lea    0x1(%eax),%edx
 316:	89 55 08             	mov    %edx,0x8(%ebp)
 319:	0f b6 00             	movzbl (%eax),%eax
 31c:	0f be c0             	movsbl %al,%eax
 31f:	01 c8                	add    %ecx,%eax
 321:	83 e8 30             	sub    $0x30,%eax
 324:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 327:	8b 45 08             	mov    0x8(%ebp),%eax
 32a:	0f b6 00             	movzbl (%eax),%eax
 32d:	3c 2f                	cmp    $0x2f,%al
 32f:	7e 0a                	jle    33b <atoi+0x48>
 331:	8b 45 08             	mov    0x8(%ebp),%eax
 334:	0f b6 00             	movzbl (%eax),%eax
 337:	3c 39                	cmp    $0x39,%al
 339:	7e c7                	jle    302 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 33b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 33e:	c9                   	leave  
 33f:	c3                   	ret    

00000340 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 346:	8b 45 08             	mov    0x8(%ebp),%eax
 349:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 34c:	8b 45 0c             	mov    0xc(%ebp),%eax
 34f:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 352:	eb 17                	jmp    36b <memmove+0x2b>
    *dst++ = *src++;
 354:	8b 45 fc             	mov    -0x4(%ebp),%eax
 357:	8d 50 01             	lea    0x1(%eax),%edx
 35a:	89 55 fc             	mov    %edx,-0x4(%ebp)
 35d:	8b 55 f8             	mov    -0x8(%ebp),%edx
 360:	8d 4a 01             	lea    0x1(%edx),%ecx
 363:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 366:	0f b6 12             	movzbl (%edx),%edx
 369:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 36b:	8b 45 10             	mov    0x10(%ebp),%eax
 36e:	8d 50 ff             	lea    -0x1(%eax),%edx
 371:	89 55 10             	mov    %edx,0x10(%ebp)
 374:	85 c0                	test   %eax,%eax
 376:	7f dc                	jg     354 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 378:	8b 45 08             	mov    0x8(%ebp),%eax
}
 37b:	c9                   	leave  
 37c:	c3                   	ret    

0000037d <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 37d:	b8 01 00 00 00       	mov    $0x1,%eax
 382:	cd 40                	int    $0x40
 384:	c3                   	ret    

00000385 <exit>:
SYSCALL(exit)
 385:	b8 02 00 00 00       	mov    $0x2,%eax
 38a:	cd 40                	int    $0x40
 38c:	c3                   	ret    

0000038d <wait>:
SYSCALL(wait)
 38d:	b8 03 00 00 00       	mov    $0x3,%eax
 392:	cd 40                	int    $0x40
 394:	c3                   	ret    

00000395 <pipe>:
SYSCALL(pipe)
 395:	b8 04 00 00 00       	mov    $0x4,%eax
 39a:	cd 40                	int    $0x40
 39c:	c3                   	ret    

0000039d <read>:
SYSCALL(read)
 39d:	b8 05 00 00 00       	mov    $0x5,%eax
 3a2:	cd 40                	int    $0x40
 3a4:	c3                   	ret    

000003a5 <write>:
SYSCALL(write)
 3a5:	b8 10 00 00 00       	mov    $0x10,%eax
 3aa:	cd 40                	int    $0x40
 3ac:	c3                   	ret    

000003ad <close>:
SYSCALL(close)
 3ad:	b8 15 00 00 00       	mov    $0x15,%eax
 3b2:	cd 40                	int    $0x40
 3b4:	c3                   	ret    

000003b5 <kill>:
SYSCALL(kill)
 3b5:	b8 06 00 00 00       	mov    $0x6,%eax
 3ba:	cd 40                	int    $0x40
 3bc:	c3                   	ret    

000003bd <exec>:
SYSCALL(exec)
 3bd:	b8 07 00 00 00       	mov    $0x7,%eax
 3c2:	cd 40                	int    $0x40
 3c4:	c3                   	ret    

000003c5 <open>:
SYSCALL(open)
 3c5:	b8 0f 00 00 00       	mov    $0xf,%eax
 3ca:	cd 40                	int    $0x40
 3cc:	c3                   	ret    

000003cd <mknod>:
SYSCALL(mknod)
 3cd:	b8 11 00 00 00       	mov    $0x11,%eax
 3d2:	cd 40                	int    $0x40
 3d4:	c3                   	ret    

000003d5 <unlink>:
SYSCALL(unlink)
 3d5:	b8 12 00 00 00       	mov    $0x12,%eax
 3da:	cd 40                	int    $0x40
 3dc:	c3                   	ret    

000003dd <fstat>:
SYSCALL(fstat)
 3dd:	b8 08 00 00 00       	mov    $0x8,%eax
 3e2:	cd 40                	int    $0x40
 3e4:	c3                   	ret    

000003e5 <link>:
SYSCALL(link)
 3e5:	b8 13 00 00 00       	mov    $0x13,%eax
 3ea:	cd 40                	int    $0x40
 3ec:	c3                   	ret    

000003ed <mkdir>:
SYSCALL(mkdir)
 3ed:	b8 14 00 00 00       	mov    $0x14,%eax
 3f2:	cd 40                	int    $0x40
 3f4:	c3                   	ret    

000003f5 <chdir>:
SYSCALL(chdir)
 3f5:	b8 09 00 00 00       	mov    $0x9,%eax
 3fa:	cd 40                	int    $0x40
 3fc:	c3                   	ret    

000003fd <dup>:
SYSCALL(dup)
 3fd:	b8 0a 00 00 00       	mov    $0xa,%eax
 402:	cd 40                	int    $0x40
 404:	c3                   	ret    

00000405 <getpid>:
SYSCALL(getpid)
 405:	b8 0b 00 00 00       	mov    $0xb,%eax
 40a:	cd 40                	int    $0x40
 40c:	c3                   	ret    

0000040d <sbrk>:
SYSCALL(sbrk)
 40d:	b8 0c 00 00 00       	mov    $0xc,%eax
 412:	cd 40                	int    $0x40
 414:	c3                   	ret    

00000415 <sleep>:
SYSCALL(sleep)
 415:	b8 0d 00 00 00       	mov    $0xd,%eax
 41a:	cd 40                	int    $0x40
 41c:	c3                   	ret    

0000041d <uptime>:
SYSCALL(uptime)
 41d:	b8 0e 00 00 00       	mov    $0xe,%eax
 422:	cd 40                	int    $0x40
 424:	c3                   	ret    

00000425 <date>:
SYSCALL(date) //JV-date - defines system call date and stores it into IDT
 425:	b8 16 00 00 00       	mov    $0x16,%eax
 42a:	cd 40                	int    $0x40
 42c:	c3                   	ret    

0000042d <time>:
SYSCALL(time) //JV-time - defines system call time and stores it into IDT
 42d:	b8 17 00 00 00       	mov    $0x17,%eax
 432:	cd 40                	int    $0x40
 434:	c3                   	ret    

00000435 <getgid>:
SYSCALL(getgid) //JV-getgid - defines system call getgid and stores it into IDT (this is referenced in user.h)
 435:	b8 18 00 00 00       	mov    $0x18,%eax
 43a:	cd 40                	int    $0x40
 43c:	c3                   	ret    

0000043d <getuid>:
SYSCALL(getuid) //JV-getuid - defines system call getuid and stores it into IDT (this is referenced in user.h)
 43d:	b8 19 00 00 00       	mov    $0x19,%eax
 442:	cd 40                	int    $0x40
 444:	c3                   	ret    

00000445 <getppid>:
SYSCALL(getppid) //JV-getppid - defines system call getppid
 445:	b8 1a 00 00 00       	mov    $0x1a,%eax
 44a:	cd 40                	int    $0x40
 44c:	c3                   	ret    

0000044d <setgid>:
SYSCALL(setgid) //JV-setgid - defines system call setgid
 44d:	b8 1b 00 00 00       	mov    $0x1b,%eax
 452:	cd 40                	int    $0x40
 454:	c3                   	ret    

00000455 <setuid>:
SYSCALL(setuid) //JV-setuid - defines system call setuid
 455:	b8 1c 00 00 00       	mov    $0x1c,%eax
 45a:	cd 40                	int    $0x40
 45c:	c3                   	ret    

0000045d <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 45d:	55                   	push   %ebp
 45e:	89 e5                	mov    %esp,%ebp
 460:	83 ec 18             	sub    $0x18,%esp
 463:	8b 45 0c             	mov    0xc(%ebp),%eax
 466:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 469:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 470:	00 
 471:	8d 45 f4             	lea    -0xc(%ebp),%eax
 474:	89 44 24 04          	mov    %eax,0x4(%esp)
 478:	8b 45 08             	mov    0x8(%ebp),%eax
 47b:	89 04 24             	mov    %eax,(%esp)
 47e:	e8 22 ff ff ff       	call   3a5 <write>
}
 483:	c9                   	leave  
 484:	c3                   	ret    

00000485 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 485:	55                   	push   %ebp
 486:	89 e5                	mov    %esp,%ebp
 488:	56                   	push   %esi
 489:	53                   	push   %ebx
 48a:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 48d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 494:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 498:	74 17                	je     4b1 <printint+0x2c>
 49a:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 49e:	79 11                	jns    4b1 <printint+0x2c>
    neg = 1;
 4a0:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 4a7:	8b 45 0c             	mov    0xc(%ebp),%eax
 4aa:	f7 d8                	neg    %eax
 4ac:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4af:	eb 06                	jmp    4b7 <printint+0x32>
  } else {
    x = xx;
 4b1:	8b 45 0c             	mov    0xc(%ebp),%eax
 4b4:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 4b7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 4be:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 4c1:	8d 41 01             	lea    0x1(%ecx),%eax
 4c4:	89 45 f4             	mov    %eax,-0xc(%ebp)
 4c7:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4ca:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4cd:	ba 00 00 00 00       	mov    $0x0,%edx
 4d2:	f7 f3                	div    %ebx
 4d4:	89 d0                	mov    %edx,%eax
 4d6:	0f b6 80 9c 0b 00 00 	movzbl 0xb9c(%eax),%eax
 4dd:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 4e1:	8b 75 10             	mov    0x10(%ebp),%esi
 4e4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4e7:	ba 00 00 00 00       	mov    $0x0,%edx
 4ec:	f7 f6                	div    %esi
 4ee:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4f1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4f5:	75 c7                	jne    4be <printint+0x39>
  if(neg)
 4f7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4fb:	74 10                	je     50d <printint+0x88>
    buf[i++] = '-';
 4fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 500:	8d 50 01             	lea    0x1(%eax),%edx
 503:	89 55 f4             	mov    %edx,-0xc(%ebp)
 506:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 50b:	eb 1f                	jmp    52c <printint+0xa7>
 50d:	eb 1d                	jmp    52c <printint+0xa7>
    putc(fd, buf[i]);
 50f:	8d 55 dc             	lea    -0x24(%ebp),%edx
 512:	8b 45 f4             	mov    -0xc(%ebp),%eax
 515:	01 d0                	add    %edx,%eax
 517:	0f b6 00             	movzbl (%eax),%eax
 51a:	0f be c0             	movsbl %al,%eax
 51d:	89 44 24 04          	mov    %eax,0x4(%esp)
 521:	8b 45 08             	mov    0x8(%ebp),%eax
 524:	89 04 24             	mov    %eax,(%esp)
 527:	e8 31 ff ff ff       	call   45d <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 52c:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 530:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 534:	79 d9                	jns    50f <printint+0x8a>
    putc(fd, buf[i]);
}
 536:	83 c4 30             	add    $0x30,%esp
 539:	5b                   	pop    %ebx
 53a:	5e                   	pop    %esi
 53b:	5d                   	pop    %ebp
 53c:	c3                   	ret    

0000053d <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 53d:	55                   	push   %ebp
 53e:	89 e5                	mov    %esp,%ebp
 540:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 543:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 54a:	8d 45 0c             	lea    0xc(%ebp),%eax
 54d:	83 c0 04             	add    $0x4,%eax
 550:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 553:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 55a:	e9 7c 01 00 00       	jmp    6db <printf+0x19e>
    c = fmt[i] & 0xff;
 55f:	8b 55 0c             	mov    0xc(%ebp),%edx
 562:	8b 45 f0             	mov    -0x10(%ebp),%eax
 565:	01 d0                	add    %edx,%eax
 567:	0f b6 00             	movzbl (%eax),%eax
 56a:	0f be c0             	movsbl %al,%eax
 56d:	25 ff 00 00 00       	and    $0xff,%eax
 572:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 575:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 579:	75 2c                	jne    5a7 <printf+0x6a>
      if(c == '%'){
 57b:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 57f:	75 0c                	jne    58d <printf+0x50>
        state = '%';
 581:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 588:	e9 4a 01 00 00       	jmp    6d7 <printf+0x19a>
      } else {
        putc(fd, c);
 58d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 590:	0f be c0             	movsbl %al,%eax
 593:	89 44 24 04          	mov    %eax,0x4(%esp)
 597:	8b 45 08             	mov    0x8(%ebp),%eax
 59a:	89 04 24             	mov    %eax,(%esp)
 59d:	e8 bb fe ff ff       	call   45d <putc>
 5a2:	e9 30 01 00 00       	jmp    6d7 <printf+0x19a>
      }
    } else if(state == '%'){
 5a7:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 5ab:	0f 85 26 01 00 00    	jne    6d7 <printf+0x19a>
      if(c == 'd'){
 5b1:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 5b5:	75 2d                	jne    5e4 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 5b7:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5ba:	8b 00                	mov    (%eax),%eax
 5bc:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 5c3:	00 
 5c4:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 5cb:	00 
 5cc:	89 44 24 04          	mov    %eax,0x4(%esp)
 5d0:	8b 45 08             	mov    0x8(%ebp),%eax
 5d3:	89 04 24             	mov    %eax,(%esp)
 5d6:	e8 aa fe ff ff       	call   485 <printint>
        ap++;
 5db:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5df:	e9 ec 00 00 00       	jmp    6d0 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 5e4:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 5e8:	74 06                	je     5f0 <printf+0xb3>
 5ea:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 5ee:	75 2d                	jne    61d <printf+0xe0>
        printint(fd, *ap, 16, 0);
 5f0:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5f3:	8b 00                	mov    (%eax),%eax
 5f5:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 5fc:	00 
 5fd:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 604:	00 
 605:	89 44 24 04          	mov    %eax,0x4(%esp)
 609:	8b 45 08             	mov    0x8(%ebp),%eax
 60c:	89 04 24             	mov    %eax,(%esp)
 60f:	e8 71 fe ff ff       	call   485 <printint>
        ap++;
 614:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 618:	e9 b3 00 00 00       	jmp    6d0 <printf+0x193>
      } else if(c == 's'){
 61d:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 621:	75 45                	jne    668 <printf+0x12b>
        s = (char*)*ap;
 623:	8b 45 e8             	mov    -0x18(%ebp),%eax
 626:	8b 00                	mov    (%eax),%eax
 628:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 62b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 62f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 633:	75 09                	jne    63e <printf+0x101>
          s = "(null)";
 635:	c7 45 f4 2f 09 00 00 	movl   $0x92f,-0xc(%ebp)
        while(*s != 0){
 63c:	eb 1e                	jmp    65c <printf+0x11f>
 63e:	eb 1c                	jmp    65c <printf+0x11f>
          putc(fd, *s);
 640:	8b 45 f4             	mov    -0xc(%ebp),%eax
 643:	0f b6 00             	movzbl (%eax),%eax
 646:	0f be c0             	movsbl %al,%eax
 649:	89 44 24 04          	mov    %eax,0x4(%esp)
 64d:	8b 45 08             	mov    0x8(%ebp),%eax
 650:	89 04 24             	mov    %eax,(%esp)
 653:	e8 05 fe ff ff       	call   45d <putc>
          s++;
 658:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 65c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 65f:	0f b6 00             	movzbl (%eax),%eax
 662:	84 c0                	test   %al,%al
 664:	75 da                	jne    640 <printf+0x103>
 666:	eb 68                	jmp    6d0 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 668:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 66c:	75 1d                	jne    68b <printf+0x14e>
        putc(fd, *ap);
 66e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 671:	8b 00                	mov    (%eax),%eax
 673:	0f be c0             	movsbl %al,%eax
 676:	89 44 24 04          	mov    %eax,0x4(%esp)
 67a:	8b 45 08             	mov    0x8(%ebp),%eax
 67d:	89 04 24             	mov    %eax,(%esp)
 680:	e8 d8 fd ff ff       	call   45d <putc>
        ap++;
 685:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 689:	eb 45                	jmp    6d0 <printf+0x193>
      } else if(c == '%'){
 68b:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 68f:	75 17                	jne    6a8 <printf+0x16b>
        putc(fd, c);
 691:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 694:	0f be c0             	movsbl %al,%eax
 697:	89 44 24 04          	mov    %eax,0x4(%esp)
 69b:	8b 45 08             	mov    0x8(%ebp),%eax
 69e:	89 04 24             	mov    %eax,(%esp)
 6a1:	e8 b7 fd ff ff       	call   45d <putc>
 6a6:	eb 28                	jmp    6d0 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6a8:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 6af:	00 
 6b0:	8b 45 08             	mov    0x8(%ebp),%eax
 6b3:	89 04 24             	mov    %eax,(%esp)
 6b6:	e8 a2 fd ff ff       	call   45d <putc>
        putc(fd, c);
 6bb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6be:	0f be c0             	movsbl %al,%eax
 6c1:	89 44 24 04          	mov    %eax,0x4(%esp)
 6c5:	8b 45 08             	mov    0x8(%ebp),%eax
 6c8:	89 04 24             	mov    %eax,(%esp)
 6cb:	e8 8d fd ff ff       	call   45d <putc>
      }
      state = 0;
 6d0:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6d7:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 6db:	8b 55 0c             	mov    0xc(%ebp),%edx
 6de:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6e1:	01 d0                	add    %edx,%eax
 6e3:	0f b6 00             	movzbl (%eax),%eax
 6e6:	84 c0                	test   %al,%al
 6e8:	0f 85 71 fe ff ff    	jne    55f <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 6ee:	c9                   	leave  
 6ef:	c3                   	ret    

000006f0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6f0:	55                   	push   %ebp
 6f1:	89 e5                	mov    %esp,%ebp
 6f3:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6f6:	8b 45 08             	mov    0x8(%ebp),%eax
 6f9:	83 e8 08             	sub    $0x8,%eax
 6fc:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6ff:	a1 c8 0b 00 00       	mov    0xbc8,%eax
 704:	89 45 fc             	mov    %eax,-0x4(%ebp)
 707:	eb 24                	jmp    72d <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 709:	8b 45 fc             	mov    -0x4(%ebp),%eax
 70c:	8b 00                	mov    (%eax),%eax
 70e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 711:	77 12                	ja     725 <free+0x35>
 713:	8b 45 f8             	mov    -0x8(%ebp),%eax
 716:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 719:	77 24                	ja     73f <free+0x4f>
 71b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 71e:	8b 00                	mov    (%eax),%eax
 720:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 723:	77 1a                	ja     73f <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 725:	8b 45 fc             	mov    -0x4(%ebp),%eax
 728:	8b 00                	mov    (%eax),%eax
 72a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 72d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 730:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 733:	76 d4                	jbe    709 <free+0x19>
 735:	8b 45 fc             	mov    -0x4(%ebp),%eax
 738:	8b 00                	mov    (%eax),%eax
 73a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 73d:	76 ca                	jbe    709 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 73f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 742:	8b 40 04             	mov    0x4(%eax),%eax
 745:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 74c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 74f:	01 c2                	add    %eax,%edx
 751:	8b 45 fc             	mov    -0x4(%ebp),%eax
 754:	8b 00                	mov    (%eax),%eax
 756:	39 c2                	cmp    %eax,%edx
 758:	75 24                	jne    77e <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 75a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 75d:	8b 50 04             	mov    0x4(%eax),%edx
 760:	8b 45 fc             	mov    -0x4(%ebp),%eax
 763:	8b 00                	mov    (%eax),%eax
 765:	8b 40 04             	mov    0x4(%eax),%eax
 768:	01 c2                	add    %eax,%edx
 76a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 76d:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 770:	8b 45 fc             	mov    -0x4(%ebp),%eax
 773:	8b 00                	mov    (%eax),%eax
 775:	8b 10                	mov    (%eax),%edx
 777:	8b 45 f8             	mov    -0x8(%ebp),%eax
 77a:	89 10                	mov    %edx,(%eax)
 77c:	eb 0a                	jmp    788 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 77e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 781:	8b 10                	mov    (%eax),%edx
 783:	8b 45 f8             	mov    -0x8(%ebp),%eax
 786:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 788:	8b 45 fc             	mov    -0x4(%ebp),%eax
 78b:	8b 40 04             	mov    0x4(%eax),%eax
 78e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 795:	8b 45 fc             	mov    -0x4(%ebp),%eax
 798:	01 d0                	add    %edx,%eax
 79a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 79d:	75 20                	jne    7bf <free+0xcf>
    p->s.size += bp->s.size;
 79f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a2:	8b 50 04             	mov    0x4(%eax),%edx
 7a5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a8:	8b 40 04             	mov    0x4(%eax),%eax
 7ab:	01 c2                	add    %eax,%edx
 7ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b0:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7b3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7b6:	8b 10                	mov    (%eax),%edx
 7b8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7bb:	89 10                	mov    %edx,(%eax)
 7bd:	eb 08                	jmp    7c7 <free+0xd7>
  } else
    p->s.ptr = bp;
 7bf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c2:	8b 55 f8             	mov    -0x8(%ebp),%edx
 7c5:	89 10                	mov    %edx,(%eax)
  freep = p;
 7c7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ca:	a3 c8 0b 00 00       	mov    %eax,0xbc8
}
 7cf:	c9                   	leave  
 7d0:	c3                   	ret    

000007d1 <morecore>:

static Header*
morecore(uint nu)
{
 7d1:	55                   	push   %ebp
 7d2:	89 e5                	mov    %esp,%ebp
 7d4:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 7d7:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 7de:	77 07                	ja     7e7 <morecore+0x16>
    nu = 4096;
 7e0:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 7e7:	8b 45 08             	mov    0x8(%ebp),%eax
 7ea:	c1 e0 03             	shl    $0x3,%eax
 7ed:	89 04 24             	mov    %eax,(%esp)
 7f0:	e8 18 fc ff ff       	call   40d <sbrk>
 7f5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 7f8:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 7fc:	75 07                	jne    805 <morecore+0x34>
    return 0;
 7fe:	b8 00 00 00 00       	mov    $0x0,%eax
 803:	eb 22                	jmp    827 <morecore+0x56>
  hp = (Header*)p;
 805:	8b 45 f4             	mov    -0xc(%ebp),%eax
 808:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 80b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80e:	8b 55 08             	mov    0x8(%ebp),%edx
 811:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 814:	8b 45 f0             	mov    -0x10(%ebp),%eax
 817:	83 c0 08             	add    $0x8,%eax
 81a:	89 04 24             	mov    %eax,(%esp)
 81d:	e8 ce fe ff ff       	call   6f0 <free>
  return freep;
 822:	a1 c8 0b 00 00       	mov    0xbc8,%eax
}
 827:	c9                   	leave  
 828:	c3                   	ret    

00000829 <malloc>:

void*
malloc(uint nbytes)
{
 829:	55                   	push   %ebp
 82a:	89 e5                	mov    %esp,%ebp
 82c:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 82f:	8b 45 08             	mov    0x8(%ebp),%eax
 832:	83 c0 07             	add    $0x7,%eax
 835:	c1 e8 03             	shr    $0x3,%eax
 838:	83 c0 01             	add    $0x1,%eax
 83b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 83e:	a1 c8 0b 00 00       	mov    0xbc8,%eax
 843:	89 45 f0             	mov    %eax,-0x10(%ebp)
 846:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 84a:	75 23                	jne    86f <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 84c:	c7 45 f0 c0 0b 00 00 	movl   $0xbc0,-0x10(%ebp)
 853:	8b 45 f0             	mov    -0x10(%ebp),%eax
 856:	a3 c8 0b 00 00       	mov    %eax,0xbc8
 85b:	a1 c8 0b 00 00       	mov    0xbc8,%eax
 860:	a3 c0 0b 00 00       	mov    %eax,0xbc0
    base.s.size = 0;
 865:	c7 05 c4 0b 00 00 00 	movl   $0x0,0xbc4
 86c:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 86f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 872:	8b 00                	mov    (%eax),%eax
 874:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 877:	8b 45 f4             	mov    -0xc(%ebp),%eax
 87a:	8b 40 04             	mov    0x4(%eax),%eax
 87d:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 880:	72 4d                	jb     8cf <malloc+0xa6>
      if(p->s.size == nunits)
 882:	8b 45 f4             	mov    -0xc(%ebp),%eax
 885:	8b 40 04             	mov    0x4(%eax),%eax
 888:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 88b:	75 0c                	jne    899 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 88d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 890:	8b 10                	mov    (%eax),%edx
 892:	8b 45 f0             	mov    -0x10(%ebp),%eax
 895:	89 10                	mov    %edx,(%eax)
 897:	eb 26                	jmp    8bf <malloc+0x96>
      else {
        p->s.size -= nunits;
 899:	8b 45 f4             	mov    -0xc(%ebp),%eax
 89c:	8b 40 04             	mov    0x4(%eax),%eax
 89f:	2b 45 ec             	sub    -0x14(%ebp),%eax
 8a2:	89 c2                	mov    %eax,%edx
 8a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8a7:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ad:	8b 40 04             	mov    0x4(%eax),%eax
 8b0:	c1 e0 03             	shl    $0x3,%eax
 8b3:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 8b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8b9:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8bc:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 8bf:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8c2:	a3 c8 0b 00 00       	mov    %eax,0xbc8
      return (void*)(p + 1);
 8c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ca:	83 c0 08             	add    $0x8,%eax
 8cd:	eb 38                	jmp    907 <malloc+0xde>
    }
    if(p == freep)
 8cf:	a1 c8 0b 00 00       	mov    0xbc8,%eax
 8d4:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 8d7:	75 1b                	jne    8f4 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 8d9:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8dc:	89 04 24             	mov    %eax,(%esp)
 8df:	e8 ed fe ff ff       	call   7d1 <morecore>
 8e4:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8e7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8eb:	75 07                	jne    8f4 <malloc+0xcb>
        return 0;
 8ed:	b8 00 00 00 00       	mov    $0x0,%eax
 8f2:	eb 13                	jmp    907 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f7:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8fd:	8b 00                	mov    (%eax),%eax
 8ff:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 902:	e9 70 ff ff ff       	jmp    877 <malloc+0x4e>
}
 907:	c9                   	leave  
 908:	c3                   	ret    
