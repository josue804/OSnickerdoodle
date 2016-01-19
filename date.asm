
_date:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "user.h"
#include "date.h"

int
main (int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
   5:	53                   	push   %ebx
   6:	83 e4 f0             	and    $0xfffffff0,%esp
   9:	81 ec a0 00 00 00    	sub    $0xa0,%esp
	char * months[12] = {"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
   f:	c7 44 24 70 cd 09 00 	movl   $0x9cd,0x70(%esp)
  16:	00 
  17:	c7 44 24 74 d1 09 00 	movl   $0x9d1,0x74(%esp)
  1e:	00 
  1f:	c7 44 24 78 d5 09 00 	movl   $0x9d5,0x78(%esp)
  26:	00 
  27:	c7 44 24 7c d9 09 00 	movl   $0x9d9,0x7c(%esp)
  2e:	00 
  2f:	c7 84 24 80 00 00 00 	movl   $0x9dd,0x80(%esp)
  36:	dd 09 00 00 
  3a:	c7 84 24 84 00 00 00 	movl   $0x9e1,0x84(%esp)
  41:	e1 09 00 00 
  45:	c7 84 24 88 00 00 00 	movl   $0x9e5,0x88(%esp)
  4c:	e5 09 00 00 
  50:	c7 84 24 8c 00 00 00 	movl   $0x9e9,0x8c(%esp)
  57:	e9 09 00 00 
  5b:	c7 84 24 90 00 00 00 	movl   $0x9ed,0x90(%esp)
  62:	ed 09 00 00 
  66:	c7 84 24 94 00 00 00 	movl   $0x9f1,0x94(%esp)
  6d:	f1 09 00 00 
  71:	c7 84 24 98 00 00 00 	movl   $0x9f5,0x98(%esp)
  78:	f5 09 00 00 
  7c:	c7 84 24 9c 00 00 00 	movl   $0x9f9,0x9c(%esp)
  83:	f9 09 00 00 
	char * days[7] = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
  87:	c7 44 24 54 fd 09 00 	movl   $0x9fd,0x54(%esp)
  8e:	00 
  8f:	c7 44 24 58 04 0a 00 	movl   $0xa04,0x58(%esp)
  96:	00 
  97:	c7 44 24 5c 0b 0a 00 	movl   $0xa0b,0x5c(%esp)
  9e:	00 
  9f:	c7 44 24 60 13 0a 00 	movl   $0xa13,0x60(%esp)
  a6:	00 
  a7:	c7 44 24 64 1d 0a 00 	movl   $0xa1d,0x64(%esp)
  ae:	00 
  af:	c7 44 24 68 26 0a 00 	movl   $0xa26,0x68(%esp)
  b6:	00 
  b7:	c7 44 24 6c 2d 0a 00 	movl   $0xa2d,0x6c(%esp)
  be:	00 
	struct rtcdate r;

	if(date(&r)) {
  bf:	8d 44 24 3c          	lea    0x3c(%esp),%eax
  c3:	89 04 24             	mov    %eax,(%esp)
  c6:	e8 4e 04 00 00       	call   519 <date>
  cb:	85 c0                	test   %eax,%eax
  cd:	74 19                	je     e8 <main+0xe8>
		printf(2, "date_failed\n");
  cf:	c7 44 24 04 36 0a 00 	movl   $0xa36,0x4(%esp)
  d6:	00 
  d7:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  de:	e8 1e 05 00 00       	call   601 <printf>
		exit();
  e3:	e8 91 03 00 00       	call   479 <exit>
	}

	printf(1, "%s %s %d %d:%d:%d UTC %d", days[dayofweek(r.year,r.month,r.day)], months[r.month - 1], r.day, r.hour, r.minute, r.second, r.year); 
  e8:	8b 44 24 50          	mov    0x50(%esp),%eax
  ec:	89 44 24 2c          	mov    %eax,0x2c(%esp)
  f0:	8b 4c 24 3c          	mov    0x3c(%esp),%ecx
  f4:	89 4c 24 28          	mov    %ecx,0x28(%esp)
  f8:	8b 5c 24 40          	mov    0x40(%esp),%ebx
  fc:	89 5c 24 24          	mov    %ebx,0x24(%esp)
 100:	8b 7c 24 44          	mov    0x44(%esp),%edi
 104:	8b 74 24 48          	mov    0x48(%esp),%esi
 108:	8b 44 24 4c          	mov    0x4c(%esp),%eax
 10c:	83 e8 01             	sub    $0x1,%eax
 10f:	8b 5c 84 70          	mov    0x70(%esp,%eax,4),%ebx
 113:	8b 44 24 48          	mov    0x48(%esp),%eax
 117:	89 c1                	mov    %eax,%ecx
 119:	8b 44 24 4c          	mov    0x4c(%esp),%eax
 11d:	89 c2                	mov    %eax,%edx
 11f:	8b 44 24 50          	mov    0x50(%esp),%eax
 123:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 127:	89 54 24 04          	mov    %edx,0x4(%esp)
 12b:	89 04 24             	mov    %eax,(%esp)
 12e:	e8 45 00 00 00       	call   178 <dayofweek>
 133:	8b 44 84 54          	mov    0x54(%esp,%eax,4),%eax
 137:	8b 54 24 2c          	mov    0x2c(%esp),%edx
 13b:	89 54 24 20          	mov    %edx,0x20(%esp)
 13f:	8b 4c 24 28          	mov    0x28(%esp),%ecx
 143:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
 147:	8b 54 24 24          	mov    0x24(%esp),%edx
 14b:	89 54 24 18          	mov    %edx,0x18(%esp)
 14f:	89 7c 24 14          	mov    %edi,0x14(%esp)
 153:	89 74 24 10          	mov    %esi,0x10(%esp)
 157:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 15b:	89 44 24 08          	mov    %eax,0x8(%esp)
 15f:	c7 44 24 04 43 0a 00 	movl   $0xa43,0x4(%esp)
 166:	00 
 167:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 16e:	e8 8e 04 00 00       	call   601 <printf>


	exit();
 173:	e8 01 03 00 00       	call   479 <exit>

00000178 <dayofweek>:

//Finds day of week from year, month, and day
//source: //en.wikipedia.org/wiki/Determination_of_the_day_of_the_week#Implementation-dependent_methods
int
dayofweek(int year, int month, int day)
{
 178:	55                   	push   %ebp
 179:	89 e5                	mov    %esp,%ebp
 17b:	53                   	push   %ebx
	static int t[] = {0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4};
	year -= month < 3;
 17c:	83 7d 0c 02          	cmpl   $0x2,0xc(%ebp)
 180:	0f 9e c0             	setle  %al
 183:	0f b6 c0             	movzbl %al,%eax
 186:	29 45 08             	sub    %eax,0x8(%ebp)
	return (year + year/4 - year/100 + year/400 + t[month-1] + day) % 7;
 189:	8b 45 08             	mov    0x8(%ebp),%eax
 18c:	8d 50 03             	lea    0x3(%eax),%edx
 18f:	85 c0                	test   %eax,%eax
 191:	0f 48 c2             	cmovs  %edx,%eax
 194:	c1 f8 02             	sar    $0x2,%eax
 197:	89 c2                	mov    %eax,%edx
 199:	8b 45 08             	mov    0x8(%ebp),%eax
 19c:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
 19f:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1a2:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
 1a7:	89 c8                	mov    %ecx,%eax
 1a9:	f7 ea                	imul   %edx
 1ab:	c1 fa 05             	sar    $0x5,%edx
 1ae:	89 c8                	mov    %ecx,%eax
 1b0:	c1 f8 1f             	sar    $0x1f,%eax
 1b3:	29 c2                	sub    %eax,%edx
 1b5:	89 d0                	mov    %edx,%eax
 1b7:	29 c3                	sub    %eax,%ebx
 1b9:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1bc:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
 1c1:	89 c8                	mov    %ecx,%eax
 1c3:	f7 ea                	imul   %edx
 1c5:	c1 fa 07             	sar    $0x7,%edx
 1c8:	89 c8                	mov    %ecx,%eax
 1ca:	c1 f8 1f             	sar    $0x1f,%eax
 1cd:	29 c2                	sub    %eax,%edx
 1cf:	89 d0                	mov    %edx,%eax
 1d1:	8d 14 03             	lea    (%ebx,%eax,1),%edx
 1d4:	8b 45 0c             	mov    0xc(%ebp),%eax
 1d7:	83 e8 01             	sub    $0x1,%eax
 1da:	8b 04 85 e0 0c 00 00 	mov    0xce0(,%eax,4),%eax
 1e1:	01 c2                	add    %eax,%edx
 1e3:	8b 45 10             	mov    0x10(%ebp),%eax
 1e6:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 1e9:	ba 93 24 49 92       	mov    $0x92492493,%edx
 1ee:	89 c8                	mov    %ecx,%eax
 1f0:	f7 ea                	imul   %edx
 1f2:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
 1f5:	c1 f8 02             	sar    $0x2,%eax
 1f8:	89 c2                	mov    %eax,%edx
 1fa:	89 c8                	mov    %ecx,%eax
 1fc:	c1 f8 1f             	sar    $0x1f,%eax
 1ff:	29 c2                	sub    %eax,%edx
 201:	89 d0                	mov    %edx,%eax
 203:	c1 e0 03             	shl    $0x3,%eax
 206:	29 d0                	sub    %edx,%eax
 208:	29 c1                	sub    %eax,%ecx
 20a:	89 ca                	mov    %ecx,%edx
 20c:	89 d0                	mov    %edx,%eax
}
 20e:	5b                   	pop    %ebx
 20f:	5d                   	pop    %ebp
 210:	c3                   	ret    

00000211 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 211:	55                   	push   %ebp
 212:	89 e5                	mov    %esp,%ebp
 214:	57                   	push   %edi
 215:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 216:	8b 4d 08             	mov    0x8(%ebp),%ecx
 219:	8b 55 10             	mov    0x10(%ebp),%edx
 21c:	8b 45 0c             	mov    0xc(%ebp),%eax
 21f:	89 cb                	mov    %ecx,%ebx
 221:	89 df                	mov    %ebx,%edi
 223:	89 d1                	mov    %edx,%ecx
 225:	fc                   	cld    
 226:	f3 aa                	rep stos %al,%es:(%edi)
 228:	89 ca                	mov    %ecx,%edx
 22a:	89 fb                	mov    %edi,%ebx
 22c:	89 5d 08             	mov    %ebx,0x8(%ebp)
 22f:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 232:	5b                   	pop    %ebx
 233:	5f                   	pop    %edi
 234:	5d                   	pop    %ebp
 235:	c3                   	ret    

00000236 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 236:	55                   	push   %ebp
 237:	89 e5                	mov    %esp,%ebp
 239:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 23c:	8b 45 08             	mov    0x8(%ebp),%eax
 23f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 242:	90                   	nop
 243:	8b 45 08             	mov    0x8(%ebp),%eax
 246:	8d 50 01             	lea    0x1(%eax),%edx
 249:	89 55 08             	mov    %edx,0x8(%ebp)
 24c:	8b 55 0c             	mov    0xc(%ebp),%edx
 24f:	8d 4a 01             	lea    0x1(%edx),%ecx
 252:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 255:	0f b6 12             	movzbl (%edx),%edx
 258:	88 10                	mov    %dl,(%eax)
 25a:	0f b6 00             	movzbl (%eax),%eax
 25d:	84 c0                	test   %al,%al
 25f:	75 e2                	jne    243 <strcpy+0xd>
    ;
  return os;
 261:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 264:	c9                   	leave  
 265:	c3                   	ret    

00000266 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 266:	55                   	push   %ebp
 267:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 269:	eb 08                	jmp    273 <strcmp+0xd>
    p++, q++;
 26b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 26f:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 273:	8b 45 08             	mov    0x8(%ebp),%eax
 276:	0f b6 00             	movzbl (%eax),%eax
 279:	84 c0                	test   %al,%al
 27b:	74 10                	je     28d <strcmp+0x27>
 27d:	8b 45 08             	mov    0x8(%ebp),%eax
 280:	0f b6 10             	movzbl (%eax),%edx
 283:	8b 45 0c             	mov    0xc(%ebp),%eax
 286:	0f b6 00             	movzbl (%eax),%eax
 289:	38 c2                	cmp    %al,%dl
 28b:	74 de                	je     26b <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 28d:	8b 45 08             	mov    0x8(%ebp),%eax
 290:	0f b6 00             	movzbl (%eax),%eax
 293:	0f b6 d0             	movzbl %al,%edx
 296:	8b 45 0c             	mov    0xc(%ebp),%eax
 299:	0f b6 00             	movzbl (%eax),%eax
 29c:	0f b6 c0             	movzbl %al,%eax
 29f:	29 c2                	sub    %eax,%edx
 2a1:	89 d0                	mov    %edx,%eax
}
 2a3:	5d                   	pop    %ebp
 2a4:	c3                   	ret    

000002a5 <strlen>:

uint
strlen(char *s)
{
 2a5:	55                   	push   %ebp
 2a6:	89 e5                	mov    %esp,%ebp
 2a8:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 2ab:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 2b2:	eb 04                	jmp    2b8 <strlen+0x13>
 2b4:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 2b8:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2bb:	8b 45 08             	mov    0x8(%ebp),%eax
 2be:	01 d0                	add    %edx,%eax
 2c0:	0f b6 00             	movzbl (%eax),%eax
 2c3:	84 c0                	test   %al,%al
 2c5:	75 ed                	jne    2b4 <strlen+0xf>
    ;
  return n;
 2c7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2ca:	c9                   	leave  
 2cb:	c3                   	ret    

000002cc <memset>:

void*
memset(void *dst, int c, uint n)
{
 2cc:	55                   	push   %ebp
 2cd:	89 e5                	mov    %esp,%ebp
 2cf:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 2d2:	8b 45 10             	mov    0x10(%ebp),%eax
 2d5:	89 44 24 08          	mov    %eax,0x8(%esp)
 2d9:	8b 45 0c             	mov    0xc(%ebp),%eax
 2dc:	89 44 24 04          	mov    %eax,0x4(%esp)
 2e0:	8b 45 08             	mov    0x8(%ebp),%eax
 2e3:	89 04 24             	mov    %eax,(%esp)
 2e6:	e8 26 ff ff ff       	call   211 <stosb>
  return dst;
 2eb:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2ee:	c9                   	leave  
 2ef:	c3                   	ret    

000002f0 <strchr>:

char*
strchr(const char *s, char c)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	83 ec 04             	sub    $0x4,%esp
 2f6:	8b 45 0c             	mov    0xc(%ebp),%eax
 2f9:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 2fc:	eb 14                	jmp    312 <strchr+0x22>
    if(*s == c)
 2fe:	8b 45 08             	mov    0x8(%ebp),%eax
 301:	0f b6 00             	movzbl (%eax),%eax
 304:	3a 45 fc             	cmp    -0x4(%ebp),%al
 307:	75 05                	jne    30e <strchr+0x1e>
      return (char*)s;
 309:	8b 45 08             	mov    0x8(%ebp),%eax
 30c:	eb 13                	jmp    321 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 30e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 312:	8b 45 08             	mov    0x8(%ebp),%eax
 315:	0f b6 00             	movzbl (%eax),%eax
 318:	84 c0                	test   %al,%al
 31a:	75 e2                	jne    2fe <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 31c:	b8 00 00 00 00       	mov    $0x0,%eax
}
 321:	c9                   	leave  
 322:	c3                   	ret    

00000323 <gets>:

char*
gets(char *buf, int max)
{
 323:	55                   	push   %ebp
 324:	89 e5                	mov    %esp,%ebp
 326:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 329:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 330:	eb 4c                	jmp    37e <gets+0x5b>
    cc = read(0, &c, 1);
 332:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 339:	00 
 33a:	8d 45 ef             	lea    -0x11(%ebp),%eax
 33d:	89 44 24 04          	mov    %eax,0x4(%esp)
 341:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 348:	e8 44 01 00 00       	call   491 <read>
 34d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 350:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 354:	7f 02                	jg     358 <gets+0x35>
      break;
 356:	eb 31                	jmp    389 <gets+0x66>
    buf[i++] = c;
 358:	8b 45 f4             	mov    -0xc(%ebp),%eax
 35b:	8d 50 01             	lea    0x1(%eax),%edx
 35e:	89 55 f4             	mov    %edx,-0xc(%ebp)
 361:	89 c2                	mov    %eax,%edx
 363:	8b 45 08             	mov    0x8(%ebp),%eax
 366:	01 c2                	add    %eax,%edx
 368:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 36c:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 36e:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 372:	3c 0a                	cmp    $0xa,%al
 374:	74 13                	je     389 <gets+0x66>
 376:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 37a:	3c 0d                	cmp    $0xd,%al
 37c:	74 0b                	je     389 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 37e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 381:	83 c0 01             	add    $0x1,%eax
 384:	3b 45 0c             	cmp    0xc(%ebp),%eax
 387:	7c a9                	jl     332 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 389:	8b 55 f4             	mov    -0xc(%ebp),%edx
 38c:	8b 45 08             	mov    0x8(%ebp),%eax
 38f:	01 d0                	add    %edx,%eax
 391:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 394:	8b 45 08             	mov    0x8(%ebp),%eax
}
 397:	c9                   	leave  
 398:	c3                   	ret    

00000399 <stat>:

int
stat(char *n, struct stat *st)
{
 399:	55                   	push   %ebp
 39a:	89 e5                	mov    %esp,%ebp
 39c:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 39f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 3a6:	00 
 3a7:	8b 45 08             	mov    0x8(%ebp),%eax
 3aa:	89 04 24             	mov    %eax,(%esp)
 3ad:	e8 07 01 00 00       	call   4b9 <open>
 3b2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 3b5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 3b9:	79 07                	jns    3c2 <stat+0x29>
    return -1;
 3bb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 3c0:	eb 23                	jmp    3e5 <stat+0x4c>
  r = fstat(fd, st);
 3c2:	8b 45 0c             	mov    0xc(%ebp),%eax
 3c5:	89 44 24 04          	mov    %eax,0x4(%esp)
 3c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3cc:	89 04 24             	mov    %eax,(%esp)
 3cf:	e8 fd 00 00 00       	call   4d1 <fstat>
 3d4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 3d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3da:	89 04 24             	mov    %eax,(%esp)
 3dd:	e8 bf 00 00 00       	call   4a1 <close>
  return r;
 3e2:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 3e5:	c9                   	leave  
 3e6:	c3                   	ret    

000003e7 <atoi>:

int
atoi(const char *s)
{
 3e7:	55                   	push   %ebp
 3e8:	89 e5                	mov    %esp,%ebp
 3ea:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 3ed:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 3f4:	eb 25                	jmp    41b <atoi+0x34>
    n = n*10 + *s++ - '0';
 3f6:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3f9:	89 d0                	mov    %edx,%eax
 3fb:	c1 e0 02             	shl    $0x2,%eax
 3fe:	01 d0                	add    %edx,%eax
 400:	01 c0                	add    %eax,%eax
 402:	89 c1                	mov    %eax,%ecx
 404:	8b 45 08             	mov    0x8(%ebp),%eax
 407:	8d 50 01             	lea    0x1(%eax),%edx
 40a:	89 55 08             	mov    %edx,0x8(%ebp)
 40d:	0f b6 00             	movzbl (%eax),%eax
 410:	0f be c0             	movsbl %al,%eax
 413:	01 c8                	add    %ecx,%eax
 415:	83 e8 30             	sub    $0x30,%eax
 418:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 41b:	8b 45 08             	mov    0x8(%ebp),%eax
 41e:	0f b6 00             	movzbl (%eax),%eax
 421:	3c 2f                	cmp    $0x2f,%al
 423:	7e 0a                	jle    42f <atoi+0x48>
 425:	8b 45 08             	mov    0x8(%ebp),%eax
 428:	0f b6 00             	movzbl (%eax),%eax
 42b:	3c 39                	cmp    $0x39,%al
 42d:	7e c7                	jle    3f6 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 42f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 432:	c9                   	leave  
 433:	c3                   	ret    

00000434 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 434:	55                   	push   %ebp
 435:	89 e5                	mov    %esp,%ebp
 437:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 43a:	8b 45 08             	mov    0x8(%ebp),%eax
 43d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 440:	8b 45 0c             	mov    0xc(%ebp),%eax
 443:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 446:	eb 17                	jmp    45f <memmove+0x2b>
    *dst++ = *src++;
 448:	8b 45 fc             	mov    -0x4(%ebp),%eax
 44b:	8d 50 01             	lea    0x1(%eax),%edx
 44e:	89 55 fc             	mov    %edx,-0x4(%ebp)
 451:	8b 55 f8             	mov    -0x8(%ebp),%edx
 454:	8d 4a 01             	lea    0x1(%edx),%ecx
 457:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 45a:	0f b6 12             	movzbl (%edx),%edx
 45d:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 45f:	8b 45 10             	mov    0x10(%ebp),%eax
 462:	8d 50 ff             	lea    -0x1(%eax),%edx
 465:	89 55 10             	mov    %edx,0x10(%ebp)
 468:	85 c0                	test   %eax,%eax
 46a:	7f dc                	jg     448 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 46c:	8b 45 08             	mov    0x8(%ebp),%eax
}
 46f:	c9                   	leave  
 470:	c3                   	ret    

00000471 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 471:	b8 01 00 00 00       	mov    $0x1,%eax
 476:	cd 40                	int    $0x40
 478:	c3                   	ret    

00000479 <exit>:
SYSCALL(exit)
 479:	b8 02 00 00 00       	mov    $0x2,%eax
 47e:	cd 40                	int    $0x40
 480:	c3                   	ret    

00000481 <wait>:
SYSCALL(wait)
 481:	b8 03 00 00 00       	mov    $0x3,%eax
 486:	cd 40                	int    $0x40
 488:	c3                   	ret    

00000489 <pipe>:
SYSCALL(pipe)
 489:	b8 04 00 00 00       	mov    $0x4,%eax
 48e:	cd 40                	int    $0x40
 490:	c3                   	ret    

00000491 <read>:
SYSCALL(read)
 491:	b8 05 00 00 00       	mov    $0x5,%eax
 496:	cd 40                	int    $0x40
 498:	c3                   	ret    

00000499 <write>:
SYSCALL(write)
 499:	b8 10 00 00 00       	mov    $0x10,%eax
 49e:	cd 40                	int    $0x40
 4a0:	c3                   	ret    

000004a1 <close>:
SYSCALL(close)
 4a1:	b8 15 00 00 00       	mov    $0x15,%eax
 4a6:	cd 40                	int    $0x40
 4a8:	c3                   	ret    

000004a9 <kill>:
SYSCALL(kill)
 4a9:	b8 06 00 00 00       	mov    $0x6,%eax
 4ae:	cd 40                	int    $0x40
 4b0:	c3                   	ret    

000004b1 <exec>:
SYSCALL(exec)
 4b1:	b8 07 00 00 00       	mov    $0x7,%eax
 4b6:	cd 40                	int    $0x40
 4b8:	c3                   	ret    

000004b9 <open>:
SYSCALL(open)
 4b9:	b8 0f 00 00 00       	mov    $0xf,%eax
 4be:	cd 40                	int    $0x40
 4c0:	c3                   	ret    

000004c1 <mknod>:
SYSCALL(mknod)
 4c1:	b8 11 00 00 00       	mov    $0x11,%eax
 4c6:	cd 40                	int    $0x40
 4c8:	c3                   	ret    

000004c9 <unlink>:
SYSCALL(unlink)
 4c9:	b8 12 00 00 00       	mov    $0x12,%eax
 4ce:	cd 40                	int    $0x40
 4d0:	c3                   	ret    

000004d1 <fstat>:
SYSCALL(fstat)
 4d1:	b8 08 00 00 00       	mov    $0x8,%eax
 4d6:	cd 40                	int    $0x40
 4d8:	c3                   	ret    

000004d9 <link>:
SYSCALL(link)
 4d9:	b8 13 00 00 00       	mov    $0x13,%eax
 4de:	cd 40                	int    $0x40
 4e0:	c3                   	ret    

000004e1 <mkdir>:
SYSCALL(mkdir)
 4e1:	b8 14 00 00 00       	mov    $0x14,%eax
 4e6:	cd 40                	int    $0x40
 4e8:	c3                   	ret    

000004e9 <chdir>:
SYSCALL(chdir)
 4e9:	b8 09 00 00 00       	mov    $0x9,%eax
 4ee:	cd 40                	int    $0x40
 4f0:	c3                   	ret    

000004f1 <dup>:
SYSCALL(dup)
 4f1:	b8 0a 00 00 00       	mov    $0xa,%eax
 4f6:	cd 40                	int    $0x40
 4f8:	c3                   	ret    

000004f9 <getpid>:
SYSCALL(getpid)
 4f9:	b8 0b 00 00 00       	mov    $0xb,%eax
 4fe:	cd 40                	int    $0x40
 500:	c3                   	ret    

00000501 <sbrk>:
SYSCALL(sbrk)
 501:	b8 0c 00 00 00       	mov    $0xc,%eax
 506:	cd 40                	int    $0x40
 508:	c3                   	ret    

00000509 <sleep>:
SYSCALL(sleep)
 509:	b8 0d 00 00 00       	mov    $0xd,%eax
 50e:	cd 40                	int    $0x40
 510:	c3                   	ret    

00000511 <uptime>:
SYSCALL(uptime)
 511:	b8 0e 00 00 00       	mov    $0xe,%eax
 516:	cd 40                	int    $0x40
 518:	c3                   	ret    

00000519 <date>:
SYSCALL(date) // JV - defines a system call of name date and moves it into the IDT 
 519:	b8 16 00 00 00       	mov    $0x16,%eax
 51e:	cd 40                	int    $0x40
 520:	c3                   	ret    

00000521 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 521:	55                   	push   %ebp
 522:	89 e5                	mov    %esp,%ebp
 524:	83 ec 18             	sub    $0x18,%esp
 527:	8b 45 0c             	mov    0xc(%ebp),%eax
 52a:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 52d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 534:	00 
 535:	8d 45 f4             	lea    -0xc(%ebp),%eax
 538:	89 44 24 04          	mov    %eax,0x4(%esp)
 53c:	8b 45 08             	mov    0x8(%ebp),%eax
 53f:	89 04 24             	mov    %eax,(%esp)
 542:	e8 52 ff ff ff       	call   499 <write>
}
 547:	c9                   	leave  
 548:	c3                   	ret    

00000549 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 549:	55                   	push   %ebp
 54a:	89 e5                	mov    %esp,%ebp
 54c:	56                   	push   %esi
 54d:	53                   	push   %ebx
 54e:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 551:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 558:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 55c:	74 17                	je     575 <printint+0x2c>
 55e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 562:	79 11                	jns    575 <printint+0x2c>
    neg = 1;
 564:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 56b:	8b 45 0c             	mov    0xc(%ebp),%eax
 56e:	f7 d8                	neg    %eax
 570:	89 45 ec             	mov    %eax,-0x14(%ebp)
 573:	eb 06                	jmp    57b <printint+0x32>
  } else {
    x = xx;
 575:	8b 45 0c             	mov    0xc(%ebp),%eax
 578:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 57b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 582:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 585:	8d 41 01             	lea    0x1(%ecx),%eax
 588:	89 45 f4             	mov    %eax,-0xc(%ebp)
 58b:	8b 5d 10             	mov    0x10(%ebp),%ebx
 58e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 591:	ba 00 00 00 00       	mov    $0x0,%edx
 596:	f7 f3                	div    %ebx
 598:	89 d0                	mov    %edx,%eax
 59a:	0f b6 80 10 0d 00 00 	movzbl 0xd10(%eax),%eax
 5a1:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 5a5:	8b 75 10             	mov    0x10(%ebp),%esi
 5a8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5ab:	ba 00 00 00 00       	mov    $0x0,%edx
 5b0:	f7 f6                	div    %esi
 5b2:	89 45 ec             	mov    %eax,-0x14(%ebp)
 5b5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5b9:	75 c7                	jne    582 <printint+0x39>
  if(neg)
 5bb:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 5bf:	74 10                	je     5d1 <printint+0x88>
    buf[i++] = '-';
 5c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5c4:	8d 50 01             	lea    0x1(%eax),%edx
 5c7:	89 55 f4             	mov    %edx,-0xc(%ebp)
 5ca:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 5cf:	eb 1f                	jmp    5f0 <printint+0xa7>
 5d1:	eb 1d                	jmp    5f0 <printint+0xa7>
    putc(fd, buf[i]);
 5d3:	8d 55 dc             	lea    -0x24(%ebp),%edx
 5d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5d9:	01 d0                	add    %edx,%eax
 5db:	0f b6 00             	movzbl (%eax),%eax
 5de:	0f be c0             	movsbl %al,%eax
 5e1:	89 44 24 04          	mov    %eax,0x4(%esp)
 5e5:	8b 45 08             	mov    0x8(%ebp),%eax
 5e8:	89 04 24             	mov    %eax,(%esp)
 5eb:	e8 31 ff ff ff       	call   521 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 5f0:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 5f4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5f8:	79 d9                	jns    5d3 <printint+0x8a>
    putc(fd, buf[i]);
}
 5fa:	83 c4 30             	add    $0x30,%esp
 5fd:	5b                   	pop    %ebx
 5fe:	5e                   	pop    %esi
 5ff:	5d                   	pop    %ebp
 600:	c3                   	ret    

00000601 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 601:	55                   	push   %ebp
 602:	89 e5                	mov    %esp,%ebp
 604:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 607:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 60e:	8d 45 0c             	lea    0xc(%ebp),%eax
 611:	83 c0 04             	add    $0x4,%eax
 614:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 617:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 61e:	e9 7c 01 00 00       	jmp    79f <printf+0x19e>
    c = fmt[i] & 0xff;
 623:	8b 55 0c             	mov    0xc(%ebp),%edx
 626:	8b 45 f0             	mov    -0x10(%ebp),%eax
 629:	01 d0                	add    %edx,%eax
 62b:	0f b6 00             	movzbl (%eax),%eax
 62e:	0f be c0             	movsbl %al,%eax
 631:	25 ff 00 00 00       	and    $0xff,%eax
 636:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 639:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 63d:	75 2c                	jne    66b <printf+0x6a>
      if(c == '%'){
 63f:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 643:	75 0c                	jne    651 <printf+0x50>
        state = '%';
 645:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 64c:	e9 4a 01 00 00       	jmp    79b <printf+0x19a>
      } else {
        putc(fd, c);
 651:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 654:	0f be c0             	movsbl %al,%eax
 657:	89 44 24 04          	mov    %eax,0x4(%esp)
 65b:	8b 45 08             	mov    0x8(%ebp),%eax
 65e:	89 04 24             	mov    %eax,(%esp)
 661:	e8 bb fe ff ff       	call   521 <putc>
 666:	e9 30 01 00 00       	jmp    79b <printf+0x19a>
      }
    } else if(state == '%'){
 66b:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 66f:	0f 85 26 01 00 00    	jne    79b <printf+0x19a>
      if(c == 'd'){
 675:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 679:	75 2d                	jne    6a8 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 67b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 67e:	8b 00                	mov    (%eax),%eax
 680:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 687:	00 
 688:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 68f:	00 
 690:	89 44 24 04          	mov    %eax,0x4(%esp)
 694:	8b 45 08             	mov    0x8(%ebp),%eax
 697:	89 04 24             	mov    %eax,(%esp)
 69a:	e8 aa fe ff ff       	call   549 <printint>
        ap++;
 69f:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6a3:	e9 ec 00 00 00       	jmp    794 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 6a8:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 6ac:	74 06                	je     6b4 <printf+0xb3>
 6ae:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 6b2:	75 2d                	jne    6e1 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 6b4:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6b7:	8b 00                	mov    (%eax),%eax
 6b9:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 6c0:	00 
 6c1:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 6c8:	00 
 6c9:	89 44 24 04          	mov    %eax,0x4(%esp)
 6cd:	8b 45 08             	mov    0x8(%ebp),%eax
 6d0:	89 04 24             	mov    %eax,(%esp)
 6d3:	e8 71 fe ff ff       	call   549 <printint>
        ap++;
 6d8:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6dc:	e9 b3 00 00 00       	jmp    794 <printf+0x193>
      } else if(c == 's'){
 6e1:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 6e5:	75 45                	jne    72c <printf+0x12b>
        s = (char*)*ap;
 6e7:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6ea:	8b 00                	mov    (%eax),%eax
 6ec:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 6ef:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 6f3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6f7:	75 09                	jne    702 <printf+0x101>
          s = "(null)";
 6f9:	c7 45 f4 5c 0a 00 00 	movl   $0xa5c,-0xc(%ebp)
        while(*s != 0){
 700:	eb 1e                	jmp    720 <printf+0x11f>
 702:	eb 1c                	jmp    720 <printf+0x11f>
          putc(fd, *s);
 704:	8b 45 f4             	mov    -0xc(%ebp),%eax
 707:	0f b6 00             	movzbl (%eax),%eax
 70a:	0f be c0             	movsbl %al,%eax
 70d:	89 44 24 04          	mov    %eax,0x4(%esp)
 711:	8b 45 08             	mov    0x8(%ebp),%eax
 714:	89 04 24             	mov    %eax,(%esp)
 717:	e8 05 fe ff ff       	call   521 <putc>
          s++;
 71c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 720:	8b 45 f4             	mov    -0xc(%ebp),%eax
 723:	0f b6 00             	movzbl (%eax),%eax
 726:	84 c0                	test   %al,%al
 728:	75 da                	jne    704 <printf+0x103>
 72a:	eb 68                	jmp    794 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 72c:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 730:	75 1d                	jne    74f <printf+0x14e>
        putc(fd, *ap);
 732:	8b 45 e8             	mov    -0x18(%ebp),%eax
 735:	8b 00                	mov    (%eax),%eax
 737:	0f be c0             	movsbl %al,%eax
 73a:	89 44 24 04          	mov    %eax,0x4(%esp)
 73e:	8b 45 08             	mov    0x8(%ebp),%eax
 741:	89 04 24             	mov    %eax,(%esp)
 744:	e8 d8 fd ff ff       	call   521 <putc>
        ap++;
 749:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 74d:	eb 45                	jmp    794 <printf+0x193>
      } else if(c == '%'){
 74f:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 753:	75 17                	jne    76c <printf+0x16b>
        putc(fd, c);
 755:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 758:	0f be c0             	movsbl %al,%eax
 75b:	89 44 24 04          	mov    %eax,0x4(%esp)
 75f:	8b 45 08             	mov    0x8(%ebp),%eax
 762:	89 04 24             	mov    %eax,(%esp)
 765:	e8 b7 fd ff ff       	call   521 <putc>
 76a:	eb 28                	jmp    794 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 76c:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 773:	00 
 774:	8b 45 08             	mov    0x8(%ebp),%eax
 777:	89 04 24             	mov    %eax,(%esp)
 77a:	e8 a2 fd ff ff       	call   521 <putc>
        putc(fd, c);
 77f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 782:	0f be c0             	movsbl %al,%eax
 785:	89 44 24 04          	mov    %eax,0x4(%esp)
 789:	8b 45 08             	mov    0x8(%ebp),%eax
 78c:	89 04 24             	mov    %eax,(%esp)
 78f:	e8 8d fd ff ff       	call   521 <putc>
      }
      state = 0;
 794:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 79b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 79f:	8b 55 0c             	mov    0xc(%ebp),%edx
 7a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7a5:	01 d0                	add    %edx,%eax
 7a7:	0f b6 00             	movzbl (%eax),%eax
 7aa:	84 c0                	test   %al,%al
 7ac:	0f 85 71 fe ff ff    	jne    623 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 7b2:	c9                   	leave  
 7b3:	c3                   	ret    

000007b4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7b4:	55                   	push   %ebp
 7b5:	89 e5                	mov    %esp,%ebp
 7b7:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7ba:	8b 45 08             	mov    0x8(%ebp),%eax
 7bd:	83 e8 08             	sub    $0x8,%eax
 7c0:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7c3:	a1 2c 0d 00 00       	mov    0xd2c,%eax
 7c8:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7cb:	eb 24                	jmp    7f1 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7cd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d0:	8b 00                	mov    (%eax),%eax
 7d2:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7d5:	77 12                	ja     7e9 <free+0x35>
 7d7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7da:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7dd:	77 24                	ja     803 <free+0x4f>
 7df:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e2:	8b 00                	mov    (%eax),%eax
 7e4:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7e7:	77 1a                	ja     803 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7e9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ec:	8b 00                	mov    (%eax),%eax
 7ee:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7f1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7f4:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7f7:	76 d4                	jbe    7cd <free+0x19>
 7f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7fc:	8b 00                	mov    (%eax),%eax
 7fe:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 801:	76 ca                	jbe    7cd <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 803:	8b 45 f8             	mov    -0x8(%ebp),%eax
 806:	8b 40 04             	mov    0x4(%eax),%eax
 809:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 810:	8b 45 f8             	mov    -0x8(%ebp),%eax
 813:	01 c2                	add    %eax,%edx
 815:	8b 45 fc             	mov    -0x4(%ebp),%eax
 818:	8b 00                	mov    (%eax),%eax
 81a:	39 c2                	cmp    %eax,%edx
 81c:	75 24                	jne    842 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 81e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 821:	8b 50 04             	mov    0x4(%eax),%edx
 824:	8b 45 fc             	mov    -0x4(%ebp),%eax
 827:	8b 00                	mov    (%eax),%eax
 829:	8b 40 04             	mov    0x4(%eax),%eax
 82c:	01 c2                	add    %eax,%edx
 82e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 831:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 834:	8b 45 fc             	mov    -0x4(%ebp),%eax
 837:	8b 00                	mov    (%eax),%eax
 839:	8b 10                	mov    (%eax),%edx
 83b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 83e:	89 10                	mov    %edx,(%eax)
 840:	eb 0a                	jmp    84c <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 842:	8b 45 fc             	mov    -0x4(%ebp),%eax
 845:	8b 10                	mov    (%eax),%edx
 847:	8b 45 f8             	mov    -0x8(%ebp),%eax
 84a:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 84c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 84f:	8b 40 04             	mov    0x4(%eax),%eax
 852:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 859:	8b 45 fc             	mov    -0x4(%ebp),%eax
 85c:	01 d0                	add    %edx,%eax
 85e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 861:	75 20                	jne    883 <free+0xcf>
    p->s.size += bp->s.size;
 863:	8b 45 fc             	mov    -0x4(%ebp),%eax
 866:	8b 50 04             	mov    0x4(%eax),%edx
 869:	8b 45 f8             	mov    -0x8(%ebp),%eax
 86c:	8b 40 04             	mov    0x4(%eax),%eax
 86f:	01 c2                	add    %eax,%edx
 871:	8b 45 fc             	mov    -0x4(%ebp),%eax
 874:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 877:	8b 45 f8             	mov    -0x8(%ebp),%eax
 87a:	8b 10                	mov    (%eax),%edx
 87c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 87f:	89 10                	mov    %edx,(%eax)
 881:	eb 08                	jmp    88b <free+0xd7>
  } else
    p->s.ptr = bp;
 883:	8b 45 fc             	mov    -0x4(%ebp),%eax
 886:	8b 55 f8             	mov    -0x8(%ebp),%edx
 889:	89 10                	mov    %edx,(%eax)
  freep = p;
 88b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 88e:	a3 2c 0d 00 00       	mov    %eax,0xd2c
}
 893:	c9                   	leave  
 894:	c3                   	ret    

00000895 <morecore>:

static Header*
morecore(uint nu)
{
 895:	55                   	push   %ebp
 896:	89 e5                	mov    %esp,%ebp
 898:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 89b:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 8a2:	77 07                	ja     8ab <morecore+0x16>
    nu = 4096;
 8a4:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 8ab:	8b 45 08             	mov    0x8(%ebp),%eax
 8ae:	c1 e0 03             	shl    $0x3,%eax
 8b1:	89 04 24             	mov    %eax,(%esp)
 8b4:	e8 48 fc ff ff       	call   501 <sbrk>
 8b9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 8bc:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 8c0:	75 07                	jne    8c9 <morecore+0x34>
    return 0;
 8c2:	b8 00 00 00 00       	mov    $0x0,%eax
 8c7:	eb 22                	jmp    8eb <morecore+0x56>
  hp = (Header*)p;
 8c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8cc:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 8cf:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8d2:	8b 55 08             	mov    0x8(%ebp),%edx
 8d5:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 8d8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8db:	83 c0 08             	add    $0x8,%eax
 8de:	89 04 24             	mov    %eax,(%esp)
 8e1:	e8 ce fe ff ff       	call   7b4 <free>
  return freep;
 8e6:	a1 2c 0d 00 00       	mov    0xd2c,%eax
}
 8eb:	c9                   	leave  
 8ec:	c3                   	ret    

000008ed <malloc>:

void*
malloc(uint nbytes)
{
 8ed:	55                   	push   %ebp
 8ee:	89 e5                	mov    %esp,%ebp
 8f0:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8f3:	8b 45 08             	mov    0x8(%ebp),%eax
 8f6:	83 c0 07             	add    $0x7,%eax
 8f9:	c1 e8 03             	shr    $0x3,%eax
 8fc:	83 c0 01             	add    $0x1,%eax
 8ff:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 902:	a1 2c 0d 00 00       	mov    0xd2c,%eax
 907:	89 45 f0             	mov    %eax,-0x10(%ebp)
 90a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 90e:	75 23                	jne    933 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 910:	c7 45 f0 24 0d 00 00 	movl   $0xd24,-0x10(%ebp)
 917:	8b 45 f0             	mov    -0x10(%ebp),%eax
 91a:	a3 2c 0d 00 00       	mov    %eax,0xd2c
 91f:	a1 2c 0d 00 00       	mov    0xd2c,%eax
 924:	a3 24 0d 00 00       	mov    %eax,0xd24
    base.s.size = 0;
 929:	c7 05 28 0d 00 00 00 	movl   $0x0,0xd28
 930:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 933:	8b 45 f0             	mov    -0x10(%ebp),%eax
 936:	8b 00                	mov    (%eax),%eax
 938:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 93b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 93e:	8b 40 04             	mov    0x4(%eax),%eax
 941:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 944:	72 4d                	jb     993 <malloc+0xa6>
      if(p->s.size == nunits)
 946:	8b 45 f4             	mov    -0xc(%ebp),%eax
 949:	8b 40 04             	mov    0x4(%eax),%eax
 94c:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 94f:	75 0c                	jne    95d <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 951:	8b 45 f4             	mov    -0xc(%ebp),%eax
 954:	8b 10                	mov    (%eax),%edx
 956:	8b 45 f0             	mov    -0x10(%ebp),%eax
 959:	89 10                	mov    %edx,(%eax)
 95b:	eb 26                	jmp    983 <malloc+0x96>
      else {
        p->s.size -= nunits;
 95d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 960:	8b 40 04             	mov    0x4(%eax),%eax
 963:	2b 45 ec             	sub    -0x14(%ebp),%eax
 966:	89 c2                	mov    %eax,%edx
 968:	8b 45 f4             	mov    -0xc(%ebp),%eax
 96b:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 96e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 971:	8b 40 04             	mov    0x4(%eax),%eax
 974:	c1 e0 03             	shl    $0x3,%eax
 977:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 97a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 97d:	8b 55 ec             	mov    -0x14(%ebp),%edx
 980:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 983:	8b 45 f0             	mov    -0x10(%ebp),%eax
 986:	a3 2c 0d 00 00       	mov    %eax,0xd2c
      return (void*)(p + 1);
 98b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 98e:	83 c0 08             	add    $0x8,%eax
 991:	eb 38                	jmp    9cb <malloc+0xde>
    }
    if(p == freep)
 993:	a1 2c 0d 00 00       	mov    0xd2c,%eax
 998:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 99b:	75 1b                	jne    9b8 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 99d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 9a0:	89 04 24             	mov    %eax,(%esp)
 9a3:	e8 ed fe ff ff       	call   895 <morecore>
 9a8:	89 45 f4             	mov    %eax,-0xc(%ebp)
 9ab:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 9af:	75 07                	jne    9b8 <malloc+0xcb>
        return 0;
 9b1:	b8 00 00 00 00       	mov    $0x0,%eax
 9b6:	eb 13                	jmp    9cb <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9bb:	89 45 f0             	mov    %eax,-0x10(%ebp)
 9be:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9c1:	8b 00                	mov    (%eax),%eax
 9c3:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 9c6:	e9 70 ff ff ff       	jmp    93b <malloc+0x4e>
}
 9cb:	c9                   	leave  
 9cc:	c3                   	ret    
