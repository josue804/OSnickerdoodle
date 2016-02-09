
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 48             	sub    $0x48,%esp
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
   6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
   d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10:	89 45 ec             	mov    %eax,-0x14(%ebp)
  13:	8b 45 ec             	mov    -0x14(%ebp),%eax
  16:	89 45 f0             	mov    %eax,-0x10(%ebp)
  inword = 0;
  19:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
  20:	eb 68                	jmp    8a <wc+0x8a>
    for(i=0; i<n; i++){
  22:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  29:	eb 57                	jmp    82 <wc+0x82>
      c++;
  2b:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
      if(buf[i] == '\n')
  2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  32:	05 a0 0c 00 00       	add    $0xca0,%eax
  37:	0f b6 00             	movzbl (%eax),%eax
  3a:	3c 0a                	cmp    $0xa,%al
  3c:	75 04                	jne    42 <wc+0x42>
        l++;
  3e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      if(strchr(" \r\t\n\v", buf[i]))
  42:	8b 45 f4             	mov    -0xc(%ebp),%eax
  45:	05 a0 0c 00 00       	add    $0xca0,%eax
  4a:	0f b6 00             	movzbl (%eax),%eax
  4d:	0f be c0             	movsbl %al,%eax
  50:	89 44 24 04          	mov    %eax,0x4(%esp)
  54:	c7 04 24 c5 09 00 00 	movl   $0x9c5,(%esp)
  5b:	e8 58 02 00 00       	call   2b8 <strchr>
  60:	85 c0                	test   %eax,%eax
  62:	74 09                	je     6d <wc+0x6d>
        inword = 0;
  64:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  6b:	eb 11                	jmp    7e <wc+0x7e>
      else if(!inword){
  6d:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  71:	75 0b                	jne    7e <wc+0x7e>
        w++;
  73:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
        inword = 1;
  77:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
  7e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  82:	8b 45 f4             	mov    -0xc(%ebp),%eax
  85:	3b 45 e0             	cmp    -0x20(%ebp),%eax
  88:	7c a1                	jl     2b <wc+0x2b>
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
  8a:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  91:	00 
  92:	c7 44 24 04 a0 0c 00 	movl   $0xca0,0x4(%esp)
  99:	00 
  9a:	8b 45 08             	mov    0x8(%ebp),%eax
  9d:	89 04 24             	mov    %eax,(%esp)
  a0:	e8 b4 03 00 00       	call   459 <read>
  a5:	89 45 e0             	mov    %eax,-0x20(%ebp)
  a8:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  ac:	0f 8f 70 ff ff ff    	jg     22 <wc+0x22>
        w++;
        inword = 1;
      }
    }
  }
  if(n < 0){
  b2:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  b6:	79 19                	jns    d1 <wc+0xd1>
    printf(1, "wc: read error\n");
  b8:	c7 44 24 04 cb 09 00 	movl   $0x9cb,0x4(%esp)
  bf:	00 
  c0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  c7:	e8 2d 05 00 00       	call   5f9 <printf>
    exit();
  cc:	e8 70 03 00 00       	call   441 <exit>
  }
  printf(1, "%d %d %d %s\n", l, w, c, name);
  d1:	8b 45 0c             	mov    0xc(%ebp),%eax
  d4:	89 44 24 14          	mov    %eax,0x14(%esp)
  d8:	8b 45 e8             	mov    -0x18(%ebp),%eax
  db:	89 44 24 10          	mov    %eax,0x10(%esp)
  df:	8b 45 ec             	mov    -0x14(%ebp),%eax
  e2:	89 44 24 0c          	mov    %eax,0xc(%esp)
  e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  e9:	89 44 24 08          	mov    %eax,0x8(%esp)
  ed:	c7 44 24 04 db 09 00 	movl   $0x9db,0x4(%esp)
  f4:	00 
  f5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  fc:	e8 f8 04 00 00       	call   5f9 <printf>
}
 101:	c9                   	leave  
 102:	c3                   	ret    

00000103 <main>:

int
main(int argc, char *argv[])
{
 103:	55                   	push   %ebp
 104:	89 e5                	mov    %esp,%ebp
 106:	83 e4 f0             	and    $0xfffffff0,%esp
 109:	83 ec 20             	sub    $0x20,%esp
  int fd, i;

  if(argc <= 1){
 10c:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
 110:	7f 19                	jg     12b <main+0x28>
    wc(0, "");
 112:	c7 44 24 04 e8 09 00 	movl   $0x9e8,0x4(%esp)
 119:	00 
 11a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 121:	e8 da fe ff ff       	call   0 <wc>
    exit();
 126:	e8 16 03 00 00       	call   441 <exit>
  }

  for(i = 1; i < argc; i++){
 12b:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
 132:	00 
 133:	e9 8f 00 00 00       	jmp    1c7 <main+0xc4>
    if((fd = open(argv[i], 0)) < 0){
 138:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 13c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 143:	8b 45 0c             	mov    0xc(%ebp),%eax
 146:	01 d0                	add    %edx,%eax
 148:	8b 00                	mov    (%eax),%eax
 14a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 151:	00 
 152:	89 04 24             	mov    %eax,(%esp)
 155:	e8 27 03 00 00       	call   481 <open>
 15a:	89 44 24 18          	mov    %eax,0x18(%esp)
 15e:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
 163:	79 2f                	jns    194 <main+0x91>
      printf(1, "wc: cannot open %s\n", argv[i]);
 165:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 169:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 170:	8b 45 0c             	mov    0xc(%ebp),%eax
 173:	01 d0                	add    %edx,%eax
 175:	8b 00                	mov    (%eax),%eax
 177:	89 44 24 08          	mov    %eax,0x8(%esp)
 17b:	c7 44 24 04 e9 09 00 	movl   $0x9e9,0x4(%esp)
 182:	00 
 183:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 18a:	e8 6a 04 00 00       	call   5f9 <printf>
      exit();
 18f:	e8 ad 02 00 00       	call   441 <exit>
    }
    wc(fd, argv[i]);
 194:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 198:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 19f:	8b 45 0c             	mov    0xc(%ebp),%eax
 1a2:	01 d0                	add    %edx,%eax
 1a4:	8b 00                	mov    (%eax),%eax
 1a6:	89 44 24 04          	mov    %eax,0x4(%esp)
 1aa:	8b 44 24 18          	mov    0x18(%esp),%eax
 1ae:	89 04 24             	mov    %eax,(%esp)
 1b1:	e8 4a fe ff ff       	call   0 <wc>
    close(fd);
 1b6:	8b 44 24 18          	mov    0x18(%esp),%eax
 1ba:	89 04 24             	mov    %eax,(%esp)
 1bd:	e8 a7 02 00 00       	call   469 <close>
  if(argc <= 1){
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
 1c2:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 1c7:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 1cb:	3b 45 08             	cmp    0x8(%ebp),%eax
 1ce:	0f 8c 64 ff ff ff    	jl     138 <main+0x35>
      exit();
    }
    wc(fd, argv[i]);
    close(fd);
  }
  exit();
 1d4:	e8 68 02 00 00       	call   441 <exit>

000001d9 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 1d9:	55                   	push   %ebp
 1da:	89 e5                	mov    %esp,%ebp
 1dc:	57                   	push   %edi
 1dd:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 1de:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1e1:	8b 55 10             	mov    0x10(%ebp),%edx
 1e4:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e7:	89 cb                	mov    %ecx,%ebx
 1e9:	89 df                	mov    %ebx,%edi
 1eb:	89 d1                	mov    %edx,%ecx
 1ed:	fc                   	cld    
 1ee:	f3 aa                	rep stos %al,%es:(%edi)
 1f0:	89 ca                	mov    %ecx,%edx
 1f2:	89 fb                	mov    %edi,%ebx
 1f4:	89 5d 08             	mov    %ebx,0x8(%ebp)
 1f7:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 1fa:	5b                   	pop    %ebx
 1fb:	5f                   	pop    %edi
 1fc:	5d                   	pop    %ebp
 1fd:	c3                   	ret    

000001fe <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 1fe:	55                   	push   %ebp
 1ff:	89 e5                	mov    %esp,%ebp
 201:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 204:	8b 45 08             	mov    0x8(%ebp),%eax
 207:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 20a:	90                   	nop
 20b:	8b 45 08             	mov    0x8(%ebp),%eax
 20e:	8d 50 01             	lea    0x1(%eax),%edx
 211:	89 55 08             	mov    %edx,0x8(%ebp)
 214:	8b 55 0c             	mov    0xc(%ebp),%edx
 217:	8d 4a 01             	lea    0x1(%edx),%ecx
 21a:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 21d:	0f b6 12             	movzbl (%edx),%edx
 220:	88 10                	mov    %dl,(%eax)
 222:	0f b6 00             	movzbl (%eax),%eax
 225:	84 c0                	test   %al,%al
 227:	75 e2                	jne    20b <strcpy+0xd>
    ;
  return os;
 229:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 22c:	c9                   	leave  
 22d:	c3                   	ret    

0000022e <strcmp>:

int
strcmp(const char *p, const char *q)
{
 22e:	55                   	push   %ebp
 22f:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 231:	eb 08                	jmp    23b <strcmp+0xd>
    p++, q++;
 233:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 237:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 23b:	8b 45 08             	mov    0x8(%ebp),%eax
 23e:	0f b6 00             	movzbl (%eax),%eax
 241:	84 c0                	test   %al,%al
 243:	74 10                	je     255 <strcmp+0x27>
 245:	8b 45 08             	mov    0x8(%ebp),%eax
 248:	0f b6 10             	movzbl (%eax),%edx
 24b:	8b 45 0c             	mov    0xc(%ebp),%eax
 24e:	0f b6 00             	movzbl (%eax),%eax
 251:	38 c2                	cmp    %al,%dl
 253:	74 de                	je     233 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 255:	8b 45 08             	mov    0x8(%ebp),%eax
 258:	0f b6 00             	movzbl (%eax),%eax
 25b:	0f b6 d0             	movzbl %al,%edx
 25e:	8b 45 0c             	mov    0xc(%ebp),%eax
 261:	0f b6 00             	movzbl (%eax),%eax
 264:	0f b6 c0             	movzbl %al,%eax
 267:	29 c2                	sub    %eax,%edx
 269:	89 d0                	mov    %edx,%eax
}
 26b:	5d                   	pop    %ebp
 26c:	c3                   	ret    

0000026d <strlen>:

uint
strlen(char *s)
{
 26d:	55                   	push   %ebp
 26e:	89 e5                	mov    %esp,%ebp
 270:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 273:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 27a:	eb 04                	jmp    280 <strlen+0x13>
 27c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 280:	8b 55 fc             	mov    -0x4(%ebp),%edx
 283:	8b 45 08             	mov    0x8(%ebp),%eax
 286:	01 d0                	add    %edx,%eax
 288:	0f b6 00             	movzbl (%eax),%eax
 28b:	84 c0                	test   %al,%al
 28d:	75 ed                	jne    27c <strlen+0xf>
    ;
  return n;
 28f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 292:	c9                   	leave  
 293:	c3                   	ret    

00000294 <memset>:

void*
memset(void *dst, int c, uint n)
{
 294:	55                   	push   %ebp
 295:	89 e5                	mov    %esp,%ebp
 297:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 29a:	8b 45 10             	mov    0x10(%ebp),%eax
 29d:	89 44 24 08          	mov    %eax,0x8(%esp)
 2a1:	8b 45 0c             	mov    0xc(%ebp),%eax
 2a4:	89 44 24 04          	mov    %eax,0x4(%esp)
 2a8:	8b 45 08             	mov    0x8(%ebp),%eax
 2ab:	89 04 24             	mov    %eax,(%esp)
 2ae:	e8 26 ff ff ff       	call   1d9 <stosb>
  return dst;
 2b3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2b6:	c9                   	leave  
 2b7:	c3                   	ret    

000002b8 <strchr>:

char*
strchr(const char *s, char c)
{
 2b8:	55                   	push   %ebp
 2b9:	89 e5                	mov    %esp,%ebp
 2bb:	83 ec 04             	sub    $0x4,%esp
 2be:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c1:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 2c4:	eb 14                	jmp    2da <strchr+0x22>
    if(*s == c)
 2c6:	8b 45 08             	mov    0x8(%ebp),%eax
 2c9:	0f b6 00             	movzbl (%eax),%eax
 2cc:	3a 45 fc             	cmp    -0x4(%ebp),%al
 2cf:	75 05                	jne    2d6 <strchr+0x1e>
      return (char*)s;
 2d1:	8b 45 08             	mov    0x8(%ebp),%eax
 2d4:	eb 13                	jmp    2e9 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 2d6:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2da:	8b 45 08             	mov    0x8(%ebp),%eax
 2dd:	0f b6 00             	movzbl (%eax),%eax
 2e0:	84 c0                	test   %al,%al
 2e2:	75 e2                	jne    2c6 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 2e4:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2e9:	c9                   	leave  
 2ea:	c3                   	ret    

000002eb <gets>:

char*
gets(char *buf, int max)
{
 2eb:	55                   	push   %ebp
 2ec:	89 e5                	mov    %esp,%ebp
 2ee:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2f1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 2f8:	eb 4c                	jmp    346 <gets+0x5b>
    cc = read(0, &c, 1);
 2fa:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 301:	00 
 302:	8d 45 ef             	lea    -0x11(%ebp),%eax
 305:	89 44 24 04          	mov    %eax,0x4(%esp)
 309:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 310:	e8 44 01 00 00       	call   459 <read>
 315:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 318:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 31c:	7f 02                	jg     320 <gets+0x35>
      break;
 31e:	eb 31                	jmp    351 <gets+0x66>
    buf[i++] = c;
 320:	8b 45 f4             	mov    -0xc(%ebp),%eax
 323:	8d 50 01             	lea    0x1(%eax),%edx
 326:	89 55 f4             	mov    %edx,-0xc(%ebp)
 329:	89 c2                	mov    %eax,%edx
 32b:	8b 45 08             	mov    0x8(%ebp),%eax
 32e:	01 c2                	add    %eax,%edx
 330:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 334:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 336:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 33a:	3c 0a                	cmp    $0xa,%al
 33c:	74 13                	je     351 <gets+0x66>
 33e:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 342:	3c 0d                	cmp    $0xd,%al
 344:	74 0b                	je     351 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 346:	8b 45 f4             	mov    -0xc(%ebp),%eax
 349:	83 c0 01             	add    $0x1,%eax
 34c:	3b 45 0c             	cmp    0xc(%ebp),%eax
 34f:	7c a9                	jl     2fa <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 351:	8b 55 f4             	mov    -0xc(%ebp),%edx
 354:	8b 45 08             	mov    0x8(%ebp),%eax
 357:	01 d0                	add    %edx,%eax
 359:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 35c:	8b 45 08             	mov    0x8(%ebp),%eax
}
 35f:	c9                   	leave  
 360:	c3                   	ret    

00000361 <stat>:

int
stat(char *n, struct stat *st)
{
 361:	55                   	push   %ebp
 362:	89 e5                	mov    %esp,%ebp
 364:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 367:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 36e:	00 
 36f:	8b 45 08             	mov    0x8(%ebp),%eax
 372:	89 04 24             	mov    %eax,(%esp)
 375:	e8 07 01 00 00       	call   481 <open>
 37a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 37d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 381:	79 07                	jns    38a <stat+0x29>
    return -1;
 383:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 388:	eb 23                	jmp    3ad <stat+0x4c>
  r = fstat(fd, st);
 38a:	8b 45 0c             	mov    0xc(%ebp),%eax
 38d:	89 44 24 04          	mov    %eax,0x4(%esp)
 391:	8b 45 f4             	mov    -0xc(%ebp),%eax
 394:	89 04 24             	mov    %eax,(%esp)
 397:	e8 fd 00 00 00       	call   499 <fstat>
 39c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 39f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3a2:	89 04 24             	mov    %eax,(%esp)
 3a5:	e8 bf 00 00 00       	call   469 <close>
  return r;
 3aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 3ad:	c9                   	leave  
 3ae:	c3                   	ret    

000003af <atoi>:

int
atoi(const char *s)
{
 3af:	55                   	push   %ebp
 3b0:	89 e5                	mov    %esp,%ebp
 3b2:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 3b5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 3bc:	eb 25                	jmp    3e3 <atoi+0x34>
    n = n*10 + *s++ - '0';
 3be:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3c1:	89 d0                	mov    %edx,%eax
 3c3:	c1 e0 02             	shl    $0x2,%eax
 3c6:	01 d0                	add    %edx,%eax
 3c8:	01 c0                	add    %eax,%eax
 3ca:	89 c1                	mov    %eax,%ecx
 3cc:	8b 45 08             	mov    0x8(%ebp),%eax
 3cf:	8d 50 01             	lea    0x1(%eax),%edx
 3d2:	89 55 08             	mov    %edx,0x8(%ebp)
 3d5:	0f b6 00             	movzbl (%eax),%eax
 3d8:	0f be c0             	movsbl %al,%eax
 3db:	01 c8                	add    %ecx,%eax
 3dd:	83 e8 30             	sub    $0x30,%eax
 3e0:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3e3:	8b 45 08             	mov    0x8(%ebp),%eax
 3e6:	0f b6 00             	movzbl (%eax),%eax
 3e9:	3c 2f                	cmp    $0x2f,%al
 3eb:	7e 0a                	jle    3f7 <atoi+0x48>
 3ed:	8b 45 08             	mov    0x8(%ebp),%eax
 3f0:	0f b6 00             	movzbl (%eax),%eax
 3f3:	3c 39                	cmp    $0x39,%al
 3f5:	7e c7                	jle    3be <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 3f7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3fa:	c9                   	leave  
 3fb:	c3                   	ret    

000003fc <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 3fc:	55                   	push   %ebp
 3fd:	89 e5                	mov    %esp,%ebp
 3ff:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 402:	8b 45 08             	mov    0x8(%ebp),%eax
 405:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 408:	8b 45 0c             	mov    0xc(%ebp),%eax
 40b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 40e:	eb 17                	jmp    427 <memmove+0x2b>
    *dst++ = *src++;
 410:	8b 45 fc             	mov    -0x4(%ebp),%eax
 413:	8d 50 01             	lea    0x1(%eax),%edx
 416:	89 55 fc             	mov    %edx,-0x4(%ebp)
 419:	8b 55 f8             	mov    -0x8(%ebp),%edx
 41c:	8d 4a 01             	lea    0x1(%edx),%ecx
 41f:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 422:	0f b6 12             	movzbl (%edx),%edx
 425:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 427:	8b 45 10             	mov    0x10(%ebp),%eax
 42a:	8d 50 ff             	lea    -0x1(%eax),%edx
 42d:	89 55 10             	mov    %edx,0x10(%ebp)
 430:	85 c0                	test   %eax,%eax
 432:	7f dc                	jg     410 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 434:	8b 45 08             	mov    0x8(%ebp),%eax
}
 437:	c9                   	leave  
 438:	c3                   	ret    

00000439 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 439:	b8 01 00 00 00       	mov    $0x1,%eax
 43e:	cd 40                	int    $0x40
 440:	c3                   	ret    

00000441 <exit>:
SYSCALL(exit)
 441:	b8 02 00 00 00       	mov    $0x2,%eax
 446:	cd 40                	int    $0x40
 448:	c3                   	ret    

00000449 <wait>:
SYSCALL(wait)
 449:	b8 03 00 00 00       	mov    $0x3,%eax
 44e:	cd 40                	int    $0x40
 450:	c3                   	ret    

00000451 <pipe>:
SYSCALL(pipe)
 451:	b8 04 00 00 00       	mov    $0x4,%eax
 456:	cd 40                	int    $0x40
 458:	c3                   	ret    

00000459 <read>:
SYSCALL(read)
 459:	b8 05 00 00 00       	mov    $0x5,%eax
 45e:	cd 40                	int    $0x40
 460:	c3                   	ret    

00000461 <write>:
SYSCALL(write)
 461:	b8 10 00 00 00       	mov    $0x10,%eax
 466:	cd 40                	int    $0x40
 468:	c3                   	ret    

00000469 <close>:
SYSCALL(close)
 469:	b8 15 00 00 00       	mov    $0x15,%eax
 46e:	cd 40                	int    $0x40
 470:	c3                   	ret    

00000471 <kill>:
SYSCALL(kill)
 471:	b8 06 00 00 00       	mov    $0x6,%eax
 476:	cd 40                	int    $0x40
 478:	c3                   	ret    

00000479 <exec>:
SYSCALL(exec)
 479:	b8 07 00 00 00       	mov    $0x7,%eax
 47e:	cd 40                	int    $0x40
 480:	c3                   	ret    

00000481 <open>:
SYSCALL(open)
 481:	b8 0f 00 00 00       	mov    $0xf,%eax
 486:	cd 40                	int    $0x40
 488:	c3                   	ret    

00000489 <mknod>:
SYSCALL(mknod)
 489:	b8 11 00 00 00       	mov    $0x11,%eax
 48e:	cd 40                	int    $0x40
 490:	c3                   	ret    

00000491 <unlink>:
SYSCALL(unlink)
 491:	b8 12 00 00 00       	mov    $0x12,%eax
 496:	cd 40                	int    $0x40
 498:	c3                   	ret    

00000499 <fstat>:
SYSCALL(fstat)
 499:	b8 08 00 00 00       	mov    $0x8,%eax
 49e:	cd 40                	int    $0x40
 4a0:	c3                   	ret    

000004a1 <link>:
SYSCALL(link)
 4a1:	b8 13 00 00 00       	mov    $0x13,%eax
 4a6:	cd 40                	int    $0x40
 4a8:	c3                   	ret    

000004a9 <mkdir>:
SYSCALL(mkdir)
 4a9:	b8 14 00 00 00       	mov    $0x14,%eax
 4ae:	cd 40                	int    $0x40
 4b0:	c3                   	ret    

000004b1 <chdir>:
SYSCALL(chdir)
 4b1:	b8 09 00 00 00       	mov    $0x9,%eax
 4b6:	cd 40                	int    $0x40
 4b8:	c3                   	ret    

000004b9 <dup>:
SYSCALL(dup)
 4b9:	b8 0a 00 00 00       	mov    $0xa,%eax
 4be:	cd 40                	int    $0x40
 4c0:	c3                   	ret    

000004c1 <getpid>:
SYSCALL(getpid)
 4c1:	b8 0b 00 00 00       	mov    $0xb,%eax
 4c6:	cd 40                	int    $0x40
 4c8:	c3                   	ret    

000004c9 <sbrk>:
SYSCALL(sbrk)
 4c9:	b8 0c 00 00 00       	mov    $0xc,%eax
 4ce:	cd 40                	int    $0x40
 4d0:	c3                   	ret    

000004d1 <sleep>:
SYSCALL(sleep)
 4d1:	b8 0d 00 00 00       	mov    $0xd,%eax
 4d6:	cd 40                	int    $0x40
 4d8:	c3                   	ret    

000004d9 <uptime>:
SYSCALL(uptime)
 4d9:	b8 0e 00 00 00       	mov    $0xe,%eax
 4de:	cd 40                	int    $0x40
 4e0:	c3                   	ret    

000004e1 <date>:
SYSCALL(date) //JV-date - defines system call date and stores it into IDT
 4e1:	b8 16 00 00 00       	mov    $0x16,%eax
 4e6:	cd 40                	int    $0x40
 4e8:	c3                   	ret    

000004e9 <time>:
SYSCALL(time) //JV-time - defines system call time and stores it into IDT
 4e9:	b8 17 00 00 00       	mov    $0x17,%eax
 4ee:	cd 40                	int    $0x40
 4f0:	c3                   	ret    

000004f1 <getgid>:
SYSCALL(getgid) //JV-getgid - defines system call getgid and stores it into IDT (this is referenced in user.h)
 4f1:	b8 18 00 00 00       	mov    $0x18,%eax
 4f6:	cd 40                	int    $0x40
 4f8:	c3                   	ret    

000004f9 <getuid>:
SYSCALL(getuid) //JV-getuid - defines system call getuid and stores it into IDT (this is referenced in user.h)
 4f9:	b8 19 00 00 00       	mov    $0x19,%eax
 4fe:	cd 40                	int    $0x40
 500:	c3                   	ret    

00000501 <getppid>:
SYSCALL(getppid) //JV-getppid - defines system call getppid
 501:	b8 1a 00 00 00       	mov    $0x1a,%eax
 506:	cd 40                	int    $0x40
 508:	c3                   	ret    

00000509 <setgid>:
SYSCALL(setgid) //JV-setgid - defines system call setgid
 509:	b8 1b 00 00 00       	mov    $0x1b,%eax
 50e:	cd 40                	int    $0x40
 510:	c3                   	ret    

00000511 <setuid>:
SYSCALL(setuid) //JV-setuid - defines system call setuid
 511:	b8 1c 00 00 00       	mov    $0x1c,%eax
 516:	cd 40                	int    $0x40
 518:	c3                   	ret    

00000519 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 519:	55                   	push   %ebp
 51a:	89 e5                	mov    %esp,%ebp
 51c:	83 ec 18             	sub    $0x18,%esp
 51f:	8b 45 0c             	mov    0xc(%ebp),%eax
 522:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 525:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 52c:	00 
 52d:	8d 45 f4             	lea    -0xc(%ebp),%eax
 530:	89 44 24 04          	mov    %eax,0x4(%esp)
 534:	8b 45 08             	mov    0x8(%ebp),%eax
 537:	89 04 24             	mov    %eax,(%esp)
 53a:	e8 22 ff ff ff       	call   461 <write>
}
 53f:	c9                   	leave  
 540:	c3                   	ret    

00000541 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 541:	55                   	push   %ebp
 542:	89 e5                	mov    %esp,%ebp
 544:	56                   	push   %esi
 545:	53                   	push   %ebx
 546:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 549:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 550:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 554:	74 17                	je     56d <printint+0x2c>
 556:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 55a:	79 11                	jns    56d <printint+0x2c>
    neg = 1;
 55c:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 563:	8b 45 0c             	mov    0xc(%ebp),%eax
 566:	f7 d8                	neg    %eax
 568:	89 45 ec             	mov    %eax,-0x14(%ebp)
 56b:	eb 06                	jmp    573 <printint+0x32>
  } else {
    x = xx;
 56d:	8b 45 0c             	mov    0xc(%ebp),%eax
 570:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 573:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 57a:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 57d:	8d 41 01             	lea    0x1(%ecx),%eax
 580:	89 45 f4             	mov    %eax,-0xc(%ebp)
 583:	8b 5d 10             	mov    0x10(%ebp),%ebx
 586:	8b 45 ec             	mov    -0x14(%ebp),%eax
 589:	ba 00 00 00 00       	mov    $0x0,%edx
 58e:	f7 f3                	div    %ebx
 590:	89 d0                	mov    %edx,%eax
 592:	0f b6 80 68 0c 00 00 	movzbl 0xc68(%eax),%eax
 599:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 59d:	8b 75 10             	mov    0x10(%ebp),%esi
 5a0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5a3:	ba 00 00 00 00       	mov    $0x0,%edx
 5a8:	f7 f6                	div    %esi
 5aa:	89 45 ec             	mov    %eax,-0x14(%ebp)
 5ad:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5b1:	75 c7                	jne    57a <printint+0x39>
  if(neg)
 5b3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 5b7:	74 10                	je     5c9 <printint+0x88>
    buf[i++] = '-';
 5b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5bc:	8d 50 01             	lea    0x1(%eax),%edx
 5bf:	89 55 f4             	mov    %edx,-0xc(%ebp)
 5c2:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 5c7:	eb 1f                	jmp    5e8 <printint+0xa7>
 5c9:	eb 1d                	jmp    5e8 <printint+0xa7>
    putc(fd, buf[i]);
 5cb:	8d 55 dc             	lea    -0x24(%ebp),%edx
 5ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5d1:	01 d0                	add    %edx,%eax
 5d3:	0f b6 00             	movzbl (%eax),%eax
 5d6:	0f be c0             	movsbl %al,%eax
 5d9:	89 44 24 04          	mov    %eax,0x4(%esp)
 5dd:	8b 45 08             	mov    0x8(%ebp),%eax
 5e0:	89 04 24             	mov    %eax,(%esp)
 5e3:	e8 31 ff ff ff       	call   519 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 5e8:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 5ec:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5f0:	79 d9                	jns    5cb <printint+0x8a>
    putc(fd, buf[i]);
}
 5f2:	83 c4 30             	add    $0x30,%esp
 5f5:	5b                   	pop    %ebx
 5f6:	5e                   	pop    %esi
 5f7:	5d                   	pop    %ebp
 5f8:	c3                   	ret    

000005f9 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 5f9:	55                   	push   %ebp
 5fa:	89 e5                	mov    %esp,%ebp
 5fc:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 5ff:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 606:	8d 45 0c             	lea    0xc(%ebp),%eax
 609:	83 c0 04             	add    $0x4,%eax
 60c:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 60f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 616:	e9 7c 01 00 00       	jmp    797 <printf+0x19e>
    c = fmt[i] & 0xff;
 61b:	8b 55 0c             	mov    0xc(%ebp),%edx
 61e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 621:	01 d0                	add    %edx,%eax
 623:	0f b6 00             	movzbl (%eax),%eax
 626:	0f be c0             	movsbl %al,%eax
 629:	25 ff 00 00 00       	and    $0xff,%eax
 62e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 631:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 635:	75 2c                	jne    663 <printf+0x6a>
      if(c == '%'){
 637:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 63b:	75 0c                	jne    649 <printf+0x50>
        state = '%';
 63d:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 644:	e9 4a 01 00 00       	jmp    793 <printf+0x19a>
      } else {
        putc(fd, c);
 649:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 64c:	0f be c0             	movsbl %al,%eax
 64f:	89 44 24 04          	mov    %eax,0x4(%esp)
 653:	8b 45 08             	mov    0x8(%ebp),%eax
 656:	89 04 24             	mov    %eax,(%esp)
 659:	e8 bb fe ff ff       	call   519 <putc>
 65e:	e9 30 01 00 00       	jmp    793 <printf+0x19a>
      }
    } else if(state == '%'){
 663:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 667:	0f 85 26 01 00 00    	jne    793 <printf+0x19a>
      if(c == 'd'){
 66d:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 671:	75 2d                	jne    6a0 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 673:	8b 45 e8             	mov    -0x18(%ebp),%eax
 676:	8b 00                	mov    (%eax),%eax
 678:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 67f:	00 
 680:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 687:	00 
 688:	89 44 24 04          	mov    %eax,0x4(%esp)
 68c:	8b 45 08             	mov    0x8(%ebp),%eax
 68f:	89 04 24             	mov    %eax,(%esp)
 692:	e8 aa fe ff ff       	call   541 <printint>
        ap++;
 697:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 69b:	e9 ec 00 00 00       	jmp    78c <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 6a0:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 6a4:	74 06                	je     6ac <printf+0xb3>
 6a6:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 6aa:	75 2d                	jne    6d9 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 6ac:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6af:	8b 00                	mov    (%eax),%eax
 6b1:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 6b8:	00 
 6b9:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 6c0:	00 
 6c1:	89 44 24 04          	mov    %eax,0x4(%esp)
 6c5:	8b 45 08             	mov    0x8(%ebp),%eax
 6c8:	89 04 24             	mov    %eax,(%esp)
 6cb:	e8 71 fe ff ff       	call   541 <printint>
        ap++;
 6d0:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6d4:	e9 b3 00 00 00       	jmp    78c <printf+0x193>
      } else if(c == 's'){
 6d9:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 6dd:	75 45                	jne    724 <printf+0x12b>
        s = (char*)*ap;
 6df:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6e2:	8b 00                	mov    (%eax),%eax
 6e4:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 6e7:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 6eb:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6ef:	75 09                	jne    6fa <printf+0x101>
          s = "(null)";
 6f1:	c7 45 f4 fd 09 00 00 	movl   $0x9fd,-0xc(%ebp)
        while(*s != 0){
 6f8:	eb 1e                	jmp    718 <printf+0x11f>
 6fa:	eb 1c                	jmp    718 <printf+0x11f>
          putc(fd, *s);
 6fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6ff:	0f b6 00             	movzbl (%eax),%eax
 702:	0f be c0             	movsbl %al,%eax
 705:	89 44 24 04          	mov    %eax,0x4(%esp)
 709:	8b 45 08             	mov    0x8(%ebp),%eax
 70c:	89 04 24             	mov    %eax,(%esp)
 70f:	e8 05 fe ff ff       	call   519 <putc>
          s++;
 714:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 718:	8b 45 f4             	mov    -0xc(%ebp),%eax
 71b:	0f b6 00             	movzbl (%eax),%eax
 71e:	84 c0                	test   %al,%al
 720:	75 da                	jne    6fc <printf+0x103>
 722:	eb 68                	jmp    78c <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 724:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 728:	75 1d                	jne    747 <printf+0x14e>
        putc(fd, *ap);
 72a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 72d:	8b 00                	mov    (%eax),%eax
 72f:	0f be c0             	movsbl %al,%eax
 732:	89 44 24 04          	mov    %eax,0x4(%esp)
 736:	8b 45 08             	mov    0x8(%ebp),%eax
 739:	89 04 24             	mov    %eax,(%esp)
 73c:	e8 d8 fd ff ff       	call   519 <putc>
        ap++;
 741:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 745:	eb 45                	jmp    78c <printf+0x193>
      } else if(c == '%'){
 747:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 74b:	75 17                	jne    764 <printf+0x16b>
        putc(fd, c);
 74d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 750:	0f be c0             	movsbl %al,%eax
 753:	89 44 24 04          	mov    %eax,0x4(%esp)
 757:	8b 45 08             	mov    0x8(%ebp),%eax
 75a:	89 04 24             	mov    %eax,(%esp)
 75d:	e8 b7 fd ff ff       	call   519 <putc>
 762:	eb 28                	jmp    78c <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 764:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 76b:	00 
 76c:	8b 45 08             	mov    0x8(%ebp),%eax
 76f:	89 04 24             	mov    %eax,(%esp)
 772:	e8 a2 fd ff ff       	call   519 <putc>
        putc(fd, c);
 777:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 77a:	0f be c0             	movsbl %al,%eax
 77d:	89 44 24 04          	mov    %eax,0x4(%esp)
 781:	8b 45 08             	mov    0x8(%ebp),%eax
 784:	89 04 24             	mov    %eax,(%esp)
 787:	e8 8d fd ff ff       	call   519 <putc>
      }
      state = 0;
 78c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 793:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 797:	8b 55 0c             	mov    0xc(%ebp),%edx
 79a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 79d:	01 d0                	add    %edx,%eax
 79f:	0f b6 00             	movzbl (%eax),%eax
 7a2:	84 c0                	test   %al,%al
 7a4:	0f 85 71 fe ff ff    	jne    61b <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 7aa:	c9                   	leave  
 7ab:	c3                   	ret    

000007ac <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7ac:	55                   	push   %ebp
 7ad:	89 e5                	mov    %esp,%ebp
 7af:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7b2:	8b 45 08             	mov    0x8(%ebp),%eax
 7b5:	83 e8 08             	sub    $0x8,%eax
 7b8:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7bb:	a1 88 0c 00 00       	mov    0xc88,%eax
 7c0:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7c3:	eb 24                	jmp    7e9 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c8:	8b 00                	mov    (%eax),%eax
 7ca:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7cd:	77 12                	ja     7e1 <free+0x35>
 7cf:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7d2:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7d5:	77 24                	ja     7fb <free+0x4f>
 7d7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7da:	8b 00                	mov    (%eax),%eax
 7dc:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7df:	77 1a                	ja     7fb <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e4:	8b 00                	mov    (%eax),%eax
 7e6:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7e9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ec:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7ef:	76 d4                	jbe    7c5 <free+0x19>
 7f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f4:	8b 00                	mov    (%eax),%eax
 7f6:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7f9:	76 ca                	jbe    7c5 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 7fb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7fe:	8b 40 04             	mov    0x4(%eax),%eax
 801:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 808:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80b:	01 c2                	add    %eax,%edx
 80d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 810:	8b 00                	mov    (%eax),%eax
 812:	39 c2                	cmp    %eax,%edx
 814:	75 24                	jne    83a <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 816:	8b 45 f8             	mov    -0x8(%ebp),%eax
 819:	8b 50 04             	mov    0x4(%eax),%edx
 81c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 81f:	8b 00                	mov    (%eax),%eax
 821:	8b 40 04             	mov    0x4(%eax),%eax
 824:	01 c2                	add    %eax,%edx
 826:	8b 45 f8             	mov    -0x8(%ebp),%eax
 829:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 82c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 82f:	8b 00                	mov    (%eax),%eax
 831:	8b 10                	mov    (%eax),%edx
 833:	8b 45 f8             	mov    -0x8(%ebp),%eax
 836:	89 10                	mov    %edx,(%eax)
 838:	eb 0a                	jmp    844 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 83a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 83d:	8b 10                	mov    (%eax),%edx
 83f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 842:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 844:	8b 45 fc             	mov    -0x4(%ebp),%eax
 847:	8b 40 04             	mov    0x4(%eax),%eax
 84a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 851:	8b 45 fc             	mov    -0x4(%ebp),%eax
 854:	01 d0                	add    %edx,%eax
 856:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 859:	75 20                	jne    87b <free+0xcf>
    p->s.size += bp->s.size;
 85b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 85e:	8b 50 04             	mov    0x4(%eax),%edx
 861:	8b 45 f8             	mov    -0x8(%ebp),%eax
 864:	8b 40 04             	mov    0x4(%eax),%eax
 867:	01 c2                	add    %eax,%edx
 869:	8b 45 fc             	mov    -0x4(%ebp),%eax
 86c:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 86f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 872:	8b 10                	mov    (%eax),%edx
 874:	8b 45 fc             	mov    -0x4(%ebp),%eax
 877:	89 10                	mov    %edx,(%eax)
 879:	eb 08                	jmp    883 <free+0xd7>
  } else
    p->s.ptr = bp;
 87b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 87e:	8b 55 f8             	mov    -0x8(%ebp),%edx
 881:	89 10                	mov    %edx,(%eax)
  freep = p;
 883:	8b 45 fc             	mov    -0x4(%ebp),%eax
 886:	a3 88 0c 00 00       	mov    %eax,0xc88
}
 88b:	c9                   	leave  
 88c:	c3                   	ret    

0000088d <morecore>:

static Header*
morecore(uint nu)
{
 88d:	55                   	push   %ebp
 88e:	89 e5                	mov    %esp,%ebp
 890:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 893:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 89a:	77 07                	ja     8a3 <morecore+0x16>
    nu = 4096;
 89c:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 8a3:	8b 45 08             	mov    0x8(%ebp),%eax
 8a6:	c1 e0 03             	shl    $0x3,%eax
 8a9:	89 04 24             	mov    %eax,(%esp)
 8ac:	e8 18 fc ff ff       	call   4c9 <sbrk>
 8b1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 8b4:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 8b8:	75 07                	jne    8c1 <morecore+0x34>
    return 0;
 8ba:	b8 00 00 00 00       	mov    $0x0,%eax
 8bf:	eb 22                	jmp    8e3 <morecore+0x56>
  hp = (Header*)p;
 8c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8c4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 8c7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8ca:	8b 55 08             	mov    0x8(%ebp),%edx
 8cd:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 8d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8d3:	83 c0 08             	add    $0x8,%eax
 8d6:	89 04 24             	mov    %eax,(%esp)
 8d9:	e8 ce fe ff ff       	call   7ac <free>
  return freep;
 8de:	a1 88 0c 00 00       	mov    0xc88,%eax
}
 8e3:	c9                   	leave  
 8e4:	c3                   	ret    

000008e5 <malloc>:

void*
malloc(uint nbytes)
{
 8e5:	55                   	push   %ebp
 8e6:	89 e5                	mov    %esp,%ebp
 8e8:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8eb:	8b 45 08             	mov    0x8(%ebp),%eax
 8ee:	83 c0 07             	add    $0x7,%eax
 8f1:	c1 e8 03             	shr    $0x3,%eax
 8f4:	83 c0 01             	add    $0x1,%eax
 8f7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 8fa:	a1 88 0c 00 00       	mov    0xc88,%eax
 8ff:	89 45 f0             	mov    %eax,-0x10(%ebp)
 902:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 906:	75 23                	jne    92b <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 908:	c7 45 f0 80 0c 00 00 	movl   $0xc80,-0x10(%ebp)
 90f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 912:	a3 88 0c 00 00       	mov    %eax,0xc88
 917:	a1 88 0c 00 00       	mov    0xc88,%eax
 91c:	a3 80 0c 00 00       	mov    %eax,0xc80
    base.s.size = 0;
 921:	c7 05 84 0c 00 00 00 	movl   $0x0,0xc84
 928:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 92b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 92e:	8b 00                	mov    (%eax),%eax
 930:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 933:	8b 45 f4             	mov    -0xc(%ebp),%eax
 936:	8b 40 04             	mov    0x4(%eax),%eax
 939:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 93c:	72 4d                	jb     98b <malloc+0xa6>
      if(p->s.size == nunits)
 93e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 941:	8b 40 04             	mov    0x4(%eax),%eax
 944:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 947:	75 0c                	jne    955 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 949:	8b 45 f4             	mov    -0xc(%ebp),%eax
 94c:	8b 10                	mov    (%eax),%edx
 94e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 951:	89 10                	mov    %edx,(%eax)
 953:	eb 26                	jmp    97b <malloc+0x96>
      else {
        p->s.size -= nunits;
 955:	8b 45 f4             	mov    -0xc(%ebp),%eax
 958:	8b 40 04             	mov    0x4(%eax),%eax
 95b:	2b 45 ec             	sub    -0x14(%ebp),%eax
 95e:	89 c2                	mov    %eax,%edx
 960:	8b 45 f4             	mov    -0xc(%ebp),%eax
 963:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 966:	8b 45 f4             	mov    -0xc(%ebp),%eax
 969:	8b 40 04             	mov    0x4(%eax),%eax
 96c:	c1 e0 03             	shl    $0x3,%eax
 96f:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 972:	8b 45 f4             	mov    -0xc(%ebp),%eax
 975:	8b 55 ec             	mov    -0x14(%ebp),%edx
 978:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 97b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 97e:	a3 88 0c 00 00       	mov    %eax,0xc88
      return (void*)(p + 1);
 983:	8b 45 f4             	mov    -0xc(%ebp),%eax
 986:	83 c0 08             	add    $0x8,%eax
 989:	eb 38                	jmp    9c3 <malloc+0xde>
    }
    if(p == freep)
 98b:	a1 88 0c 00 00       	mov    0xc88,%eax
 990:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 993:	75 1b                	jne    9b0 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 995:	8b 45 ec             	mov    -0x14(%ebp),%eax
 998:	89 04 24             	mov    %eax,(%esp)
 99b:	e8 ed fe ff ff       	call   88d <morecore>
 9a0:	89 45 f4             	mov    %eax,-0xc(%ebp)
 9a3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 9a7:	75 07                	jne    9b0 <malloc+0xcb>
        return 0;
 9a9:	b8 00 00 00 00       	mov    $0x0,%eax
 9ae:	eb 13                	jmp    9c3 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9b3:	89 45 f0             	mov    %eax,-0x10(%ebp)
 9b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9b9:	8b 00                	mov    (%eax),%eax
 9bb:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 9be:	e9 70 ff ff ff       	jmp    933 <malloc+0x4e>
}
 9c3:	c9                   	leave  
 9c4:	c3                   	ret    
