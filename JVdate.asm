
_JVdate:     file format elf32-i386


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
   f:	c7 44 24 70 50 0a 00 	movl   $0xa50,0x70(%esp)
  16:	00 
  17:	c7 44 24 74 54 0a 00 	movl   $0xa54,0x74(%esp)
  1e:	00 
  1f:	c7 44 24 78 58 0a 00 	movl   $0xa58,0x78(%esp)
  26:	00 
  27:	c7 44 24 7c 5c 0a 00 	movl   $0xa5c,0x7c(%esp)
  2e:	00 
  2f:	c7 84 24 80 00 00 00 	movl   $0xa60,0x80(%esp)
  36:	60 0a 00 00 
  3a:	c7 84 24 84 00 00 00 	movl   $0xa64,0x84(%esp)
  41:	64 0a 00 00 
  45:	c7 84 24 88 00 00 00 	movl   $0xa68,0x88(%esp)
  4c:	68 0a 00 00 
  50:	c7 84 24 8c 00 00 00 	movl   $0xa6c,0x8c(%esp)
  57:	6c 0a 00 00 
  5b:	c7 84 24 90 00 00 00 	movl   $0xa70,0x90(%esp)
  62:	70 0a 00 00 
  66:	c7 84 24 94 00 00 00 	movl   $0xa74,0x94(%esp)
  6d:	74 0a 00 00 
  71:	c7 84 24 98 00 00 00 	movl   $0xa78,0x98(%esp)
  78:	78 0a 00 00 
  7c:	c7 84 24 9c 00 00 00 	movl   $0xa7c,0x9c(%esp)
  83:	7c 0a 00 00 
	char * days[7] = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
  87:	c7 44 24 54 80 0a 00 	movl   $0xa80,0x54(%esp)
  8e:	00 
  8f:	c7 44 24 58 87 0a 00 	movl   $0xa87,0x58(%esp)
  96:	00 
  97:	c7 44 24 5c 8e 0a 00 	movl   $0xa8e,0x5c(%esp)
  9e:	00 
  9f:	c7 44 24 60 96 0a 00 	movl   $0xa96,0x60(%esp)
  a6:	00 
  a7:	c7 44 24 64 a0 0a 00 	movl   $0xaa0,0x64(%esp)
  ae:	00 
  af:	c7 44 24 68 a9 0a 00 	movl   $0xaa9,0x68(%esp)
  b6:	00 
  b7:	c7 44 24 6c b0 0a 00 	movl   $0xab0,0x6c(%esp)
  be:	00 
	struct rtcdate r;

	if(date(&r)) {
  bf:	8d 44 24 3c          	lea    0x3c(%esp),%eax
  c3:	89 04 24             	mov    %eax,(%esp)
  c6:	e8 9f 04 00 00       	call   56a <date>
  cb:	85 c0                	test   %eax,%eax
  cd:	74 19                	je     e8 <main+0xe8>
		printf(2, "date_failed\n");
  cf:	c7 44 24 04 b9 0a 00 	movl   $0xab9,0x4(%esp)
  d6:	00 
  d7:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  de:	e8 9f 05 00 00       	call   682 <printf>
		exit();
  e3:	e8 e2 03 00 00       	call   4ca <exit>
	}

	printf(1, "%s %s %d %d:%d:%d UTC %d\n", 
  e8:	8b 44 24 50          	mov    0x50(%esp),%eax
  ec:	89 44 24 2c          	mov    %eax,0x2c(%esp)
  f0:	8b 4c 24 3c          	mov    0x3c(%esp),%ecx
  f4:	89 4c 24 28          	mov    %ecx,0x28(%esp)
  f8:	8b 5c 24 40          	mov    0x40(%esp),%ebx
  fc:	89 5c 24 24          	mov    %ebx,0x24(%esp)
 100:	8b 7c 24 44          	mov    0x44(%esp),%edi
 104:	8b 74 24 48          	mov    0x48(%esp),%esi
		days[dayofweek(r.year,r.month,r.day)], months[r.month - 1], r.day, 
 108:	8b 44 24 4c          	mov    0x4c(%esp),%eax
 10c:	83 e8 01             	sub    $0x1,%eax
	if(date(&r)) {
		printf(2, "date_failed\n");
		exit();
	}

	printf(1, "%s %s %d %d:%d:%d UTC %d\n", 
 10f:	8b 5c 84 70          	mov    0x70(%esp,%eax,4),%ebx
		days[dayofweek(r.year,r.month,r.day)], months[r.month - 1], r.day, 
 113:	8b 44 24 48          	mov    0x48(%esp),%eax
 117:	89 c1                	mov    %eax,%ecx
 119:	8b 44 24 4c          	mov    0x4c(%esp),%eax
 11d:	89 c2                	mov    %eax,%edx
 11f:	8b 44 24 50          	mov    0x50(%esp),%eax
 123:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 127:	89 54 24 04          	mov    %edx,0x4(%esp)
 12b:	89 04 24             	mov    %eax,(%esp)
 12e:	e8 79 00 00 00       	call   1ac <dayofweek>
	if(date(&r)) {
		printf(2, "date_failed\n");
		exit();
	}

	printf(1, "%s %s %d %d:%d:%d UTC %d\n", 
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
 15f:	c7 44 24 04 c6 0a 00 	movl   $0xac6,0x4(%esp)
 166:	00 
 167:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 16e:	e8 0f 05 00 00       	call   682 <printf>
		days[dayofweek(r.year,r.month,r.day)], months[r.month - 1], r.day, 
		r.hour, r.minute, r.second, 
		r.year);

	if(years_since_alamo(r.year) >= 0)
 173:	8b 44 24 50          	mov    0x50(%esp),%eax
 177:	89 04 24             	mov    %eax,(%esp)
 17a:	e8 c6 00 00 00       	call   245 <years_since_alamo>
 17f:	85 c0                	test   %eax,%eax
 181:	78 24                	js     1a7 <main+0x1a7>
		printf(1, "%d years. Remember the Alamo.\n", years_since_alamo(r.year));
 183:	8b 44 24 50          	mov    0x50(%esp),%eax
 187:	89 04 24             	mov    %eax,(%esp)
 18a:	e8 b6 00 00 00       	call   245 <years_since_alamo>
 18f:	89 44 24 08          	mov    %eax,0x8(%esp)
 193:	c7 44 24 04 e0 0a 00 	movl   $0xae0,0x4(%esp)
 19a:	00 
 19b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1a2:	e8 db 04 00 00       	call   682 <printf>


	exit();
 1a7:	e8 1e 03 00 00       	call   4ca <exit>

000001ac <dayofweek>:
//Finds day of week from year, month, and day
//source: //en.wikipedia.org/wiki/Determination_of_the_day_of_the_week#Implementation-dependent_methods
//Thanks to Ethan Grinnell for sharing the find! 
int
dayofweek(int year, int month, int day)
{
 1ac:	55                   	push   %ebp
 1ad:	89 e5                	mov    %esp,%ebp
 1af:	53                   	push   %ebx
	static int t[] = {0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4};
	year -= month < 3;
 1b0:	83 7d 0c 02          	cmpl   $0x2,0xc(%ebp)
 1b4:	0f 9e c0             	setle  %al
 1b7:	0f b6 c0             	movzbl %al,%eax
 1ba:	29 45 08             	sub    %eax,0x8(%ebp)
	return (year + year/4 - year/100 + year/400 + t[month-1] + day) % 7;
 1bd:	8b 45 08             	mov    0x8(%ebp),%eax
 1c0:	8d 50 03             	lea    0x3(%eax),%edx
 1c3:	85 c0                	test   %eax,%eax
 1c5:	0f 48 c2             	cmovs  %edx,%eax
 1c8:	c1 f8 02             	sar    $0x2,%eax
 1cb:	89 c2                	mov    %eax,%edx
 1cd:	8b 45 08             	mov    0x8(%ebp),%eax
 1d0:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
 1d3:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1d6:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
 1db:	89 c8                	mov    %ecx,%eax
 1dd:	f7 ea                	imul   %edx
 1df:	c1 fa 05             	sar    $0x5,%edx
 1e2:	89 c8                	mov    %ecx,%eax
 1e4:	c1 f8 1f             	sar    $0x1f,%eax
 1e7:	29 c2                	sub    %eax,%edx
 1e9:	89 d0                	mov    %edx,%eax
 1eb:	29 c3                	sub    %eax,%ebx
 1ed:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1f0:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
 1f5:	89 c8                	mov    %ecx,%eax
 1f7:	f7 ea                	imul   %edx
 1f9:	c1 fa 07             	sar    $0x7,%edx
 1fc:	89 c8                	mov    %ecx,%eax
 1fe:	c1 f8 1f             	sar    $0x1f,%eax
 201:	29 c2                	sub    %eax,%edx
 203:	89 d0                	mov    %edx,%eax
 205:	8d 14 03             	lea    (%ebx,%eax,1),%edx
 208:	8b 45 0c             	mov    0xc(%ebp),%eax
 20b:	83 e8 01             	sub    $0x1,%eax
 20e:	8b 04 85 a0 0d 00 00 	mov    0xda0(,%eax,4),%eax
 215:	01 c2                	add    %eax,%edx
 217:	8b 45 10             	mov    0x10(%ebp),%eax
 21a:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 21d:	ba 93 24 49 92       	mov    $0x92492493,%edx
 222:	89 c8                	mov    %ecx,%eax
 224:	f7 ea                	imul   %edx
 226:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
 229:	c1 f8 02             	sar    $0x2,%eax
 22c:	89 c2                	mov    %eax,%edx
 22e:	89 c8                	mov    %ecx,%eax
 230:	c1 f8 1f             	sar    $0x1f,%eax
 233:	29 c2                	sub    %eax,%edx
 235:	89 d0                	mov    %edx,%eax
 237:	c1 e0 03             	shl    $0x3,%eax
 23a:	29 d0                	sub    %edx,%eax
 23c:	29 c1                	sub    %eax,%ecx
 23e:	89 ca                	mov    %ecx,%edx
 240:	89 d0                	mov    %edx,%eax
}
 242:	5b                   	pop    %ebx
 243:	5d                   	pop    %ebp
 244:	c3                   	ret    

00000245 <years_since_alamo>:

//calculates amount of years since the alamo, never forget
int
years_since_alamo(int year)
{
 245:	55                   	push   %ebp
 246:	89 e5                	mov    %esp,%ebp
	if(year < 1836)
 248:	81 7d 08 2b 07 00 00 	cmpl   $0x72b,0x8(%ebp)
 24f:	7f 07                	jg     258 <years_since_alamo+0x13>
		return -1;
 251:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 256:	eb 08                	jmp    260 <years_since_alamo+0x1b>

	return year - 1836;
 258:	8b 45 08             	mov    0x8(%ebp),%eax
 25b:	2d 2c 07 00 00       	sub    $0x72c,%eax
}
 260:	5d                   	pop    %ebp
 261:	c3                   	ret    

00000262 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 262:	55                   	push   %ebp
 263:	89 e5                	mov    %esp,%ebp
 265:	57                   	push   %edi
 266:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 267:	8b 4d 08             	mov    0x8(%ebp),%ecx
 26a:	8b 55 10             	mov    0x10(%ebp),%edx
 26d:	8b 45 0c             	mov    0xc(%ebp),%eax
 270:	89 cb                	mov    %ecx,%ebx
 272:	89 df                	mov    %ebx,%edi
 274:	89 d1                	mov    %edx,%ecx
 276:	fc                   	cld    
 277:	f3 aa                	rep stos %al,%es:(%edi)
 279:	89 ca                	mov    %ecx,%edx
 27b:	89 fb                	mov    %edi,%ebx
 27d:	89 5d 08             	mov    %ebx,0x8(%ebp)
 280:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 283:	5b                   	pop    %ebx
 284:	5f                   	pop    %edi
 285:	5d                   	pop    %ebp
 286:	c3                   	ret    

00000287 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 287:	55                   	push   %ebp
 288:	89 e5                	mov    %esp,%ebp
 28a:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 28d:	8b 45 08             	mov    0x8(%ebp),%eax
 290:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 293:	90                   	nop
 294:	8b 45 08             	mov    0x8(%ebp),%eax
 297:	8d 50 01             	lea    0x1(%eax),%edx
 29a:	89 55 08             	mov    %edx,0x8(%ebp)
 29d:	8b 55 0c             	mov    0xc(%ebp),%edx
 2a0:	8d 4a 01             	lea    0x1(%edx),%ecx
 2a3:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 2a6:	0f b6 12             	movzbl (%edx),%edx
 2a9:	88 10                	mov    %dl,(%eax)
 2ab:	0f b6 00             	movzbl (%eax),%eax
 2ae:	84 c0                	test   %al,%al
 2b0:	75 e2                	jne    294 <strcpy+0xd>
    ;
  return os;
 2b2:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2b5:	c9                   	leave  
 2b6:	c3                   	ret    

000002b7 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2b7:	55                   	push   %ebp
 2b8:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 2ba:	eb 08                	jmp    2c4 <strcmp+0xd>
    p++, q++;
 2bc:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2c0:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 2c4:	8b 45 08             	mov    0x8(%ebp),%eax
 2c7:	0f b6 00             	movzbl (%eax),%eax
 2ca:	84 c0                	test   %al,%al
 2cc:	74 10                	je     2de <strcmp+0x27>
 2ce:	8b 45 08             	mov    0x8(%ebp),%eax
 2d1:	0f b6 10             	movzbl (%eax),%edx
 2d4:	8b 45 0c             	mov    0xc(%ebp),%eax
 2d7:	0f b6 00             	movzbl (%eax),%eax
 2da:	38 c2                	cmp    %al,%dl
 2dc:	74 de                	je     2bc <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 2de:	8b 45 08             	mov    0x8(%ebp),%eax
 2e1:	0f b6 00             	movzbl (%eax),%eax
 2e4:	0f b6 d0             	movzbl %al,%edx
 2e7:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ea:	0f b6 00             	movzbl (%eax),%eax
 2ed:	0f b6 c0             	movzbl %al,%eax
 2f0:	29 c2                	sub    %eax,%edx
 2f2:	89 d0                	mov    %edx,%eax
}
 2f4:	5d                   	pop    %ebp
 2f5:	c3                   	ret    

000002f6 <strlen>:

uint
strlen(char *s)
{
 2f6:	55                   	push   %ebp
 2f7:	89 e5                	mov    %esp,%ebp
 2f9:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 2fc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 303:	eb 04                	jmp    309 <strlen+0x13>
 305:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 309:	8b 55 fc             	mov    -0x4(%ebp),%edx
 30c:	8b 45 08             	mov    0x8(%ebp),%eax
 30f:	01 d0                	add    %edx,%eax
 311:	0f b6 00             	movzbl (%eax),%eax
 314:	84 c0                	test   %al,%al
 316:	75 ed                	jne    305 <strlen+0xf>
    ;
  return n;
 318:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 31b:	c9                   	leave  
 31c:	c3                   	ret    

0000031d <memset>:

void*
memset(void *dst, int c, uint n)
{
 31d:	55                   	push   %ebp
 31e:	89 e5                	mov    %esp,%ebp
 320:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 323:	8b 45 10             	mov    0x10(%ebp),%eax
 326:	89 44 24 08          	mov    %eax,0x8(%esp)
 32a:	8b 45 0c             	mov    0xc(%ebp),%eax
 32d:	89 44 24 04          	mov    %eax,0x4(%esp)
 331:	8b 45 08             	mov    0x8(%ebp),%eax
 334:	89 04 24             	mov    %eax,(%esp)
 337:	e8 26 ff ff ff       	call   262 <stosb>
  return dst;
 33c:	8b 45 08             	mov    0x8(%ebp),%eax
}
 33f:	c9                   	leave  
 340:	c3                   	ret    

00000341 <strchr>:

char*
strchr(const char *s, char c)
{
 341:	55                   	push   %ebp
 342:	89 e5                	mov    %esp,%ebp
 344:	83 ec 04             	sub    $0x4,%esp
 347:	8b 45 0c             	mov    0xc(%ebp),%eax
 34a:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 34d:	eb 14                	jmp    363 <strchr+0x22>
    if(*s == c)
 34f:	8b 45 08             	mov    0x8(%ebp),%eax
 352:	0f b6 00             	movzbl (%eax),%eax
 355:	3a 45 fc             	cmp    -0x4(%ebp),%al
 358:	75 05                	jne    35f <strchr+0x1e>
      return (char*)s;
 35a:	8b 45 08             	mov    0x8(%ebp),%eax
 35d:	eb 13                	jmp    372 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 35f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 363:	8b 45 08             	mov    0x8(%ebp),%eax
 366:	0f b6 00             	movzbl (%eax),%eax
 369:	84 c0                	test   %al,%al
 36b:	75 e2                	jne    34f <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 36d:	b8 00 00 00 00       	mov    $0x0,%eax
}
 372:	c9                   	leave  
 373:	c3                   	ret    

00000374 <gets>:

char*
gets(char *buf, int max)
{
 374:	55                   	push   %ebp
 375:	89 e5                	mov    %esp,%ebp
 377:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 37a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 381:	eb 4c                	jmp    3cf <gets+0x5b>
    cc = read(0, &c, 1);
 383:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 38a:	00 
 38b:	8d 45 ef             	lea    -0x11(%ebp),%eax
 38e:	89 44 24 04          	mov    %eax,0x4(%esp)
 392:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 399:	e8 44 01 00 00       	call   4e2 <read>
 39e:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 3a1:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 3a5:	7f 02                	jg     3a9 <gets+0x35>
      break;
 3a7:	eb 31                	jmp    3da <gets+0x66>
    buf[i++] = c;
 3a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3ac:	8d 50 01             	lea    0x1(%eax),%edx
 3af:	89 55 f4             	mov    %edx,-0xc(%ebp)
 3b2:	89 c2                	mov    %eax,%edx
 3b4:	8b 45 08             	mov    0x8(%ebp),%eax
 3b7:	01 c2                	add    %eax,%edx
 3b9:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 3bd:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 3bf:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 3c3:	3c 0a                	cmp    $0xa,%al
 3c5:	74 13                	je     3da <gets+0x66>
 3c7:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 3cb:	3c 0d                	cmp    $0xd,%al
 3cd:	74 0b                	je     3da <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3d2:	83 c0 01             	add    $0x1,%eax
 3d5:	3b 45 0c             	cmp    0xc(%ebp),%eax
 3d8:	7c a9                	jl     383 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 3da:	8b 55 f4             	mov    -0xc(%ebp),%edx
 3dd:	8b 45 08             	mov    0x8(%ebp),%eax
 3e0:	01 d0                	add    %edx,%eax
 3e2:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 3e5:	8b 45 08             	mov    0x8(%ebp),%eax
}
 3e8:	c9                   	leave  
 3e9:	c3                   	ret    

000003ea <stat>:

int
stat(char *n, struct stat *st)
{
 3ea:	55                   	push   %ebp
 3eb:	89 e5                	mov    %esp,%ebp
 3ed:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3f0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 3f7:	00 
 3f8:	8b 45 08             	mov    0x8(%ebp),%eax
 3fb:	89 04 24             	mov    %eax,(%esp)
 3fe:	e8 07 01 00 00       	call   50a <open>
 403:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 406:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 40a:	79 07                	jns    413 <stat+0x29>
    return -1;
 40c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 411:	eb 23                	jmp    436 <stat+0x4c>
  r = fstat(fd, st);
 413:	8b 45 0c             	mov    0xc(%ebp),%eax
 416:	89 44 24 04          	mov    %eax,0x4(%esp)
 41a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 41d:	89 04 24             	mov    %eax,(%esp)
 420:	e8 fd 00 00 00       	call   522 <fstat>
 425:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 428:	8b 45 f4             	mov    -0xc(%ebp),%eax
 42b:	89 04 24             	mov    %eax,(%esp)
 42e:	e8 bf 00 00 00       	call   4f2 <close>
  return r;
 433:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 436:	c9                   	leave  
 437:	c3                   	ret    

00000438 <atoi>:

int
atoi(const char *s)
{
 438:	55                   	push   %ebp
 439:	89 e5                	mov    %esp,%ebp
 43b:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 43e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 445:	eb 25                	jmp    46c <atoi+0x34>
    n = n*10 + *s++ - '0';
 447:	8b 55 fc             	mov    -0x4(%ebp),%edx
 44a:	89 d0                	mov    %edx,%eax
 44c:	c1 e0 02             	shl    $0x2,%eax
 44f:	01 d0                	add    %edx,%eax
 451:	01 c0                	add    %eax,%eax
 453:	89 c1                	mov    %eax,%ecx
 455:	8b 45 08             	mov    0x8(%ebp),%eax
 458:	8d 50 01             	lea    0x1(%eax),%edx
 45b:	89 55 08             	mov    %edx,0x8(%ebp)
 45e:	0f b6 00             	movzbl (%eax),%eax
 461:	0f be c0             	movsbl %al,%eax
 464:	01 c8                	add    %ecx,%eax
 466:	83 e8 30             	sub    $0x30,%eax
 469:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 46c:	8b 45 08             	mov    0x8(%ebp),%eax
 46f:	0f b6 00             	movzbl (%eax),%eax
 472:	3c 2f                	cmp    $0x2f,%al
 474:	7e 0a                	jle    480 <atoi+0x48>
 476:	8b 45 08             	mov    0x8(%ebp),%eax
 479:	0f b6 00             	movzbl (%eax),%eax
 47c:	3c 39                	cmp    $0x39,%al
 47e:	7e c7                	jle    447 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 480:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 483:	c9                   	leave  
 484:	c3                   	ret    

00000485 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 485:	55                   	push   %ebp
 486:	89 e5                	mov    %esp,%ebp
 488:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 48b:	8b 45 08             	mov    0x8(%ebp),%eax
 48e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 491:	8b 45 0c             	mov    0xc(%ebp),%eax
 494:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 497:	eb 17                	jmp    4b0 <memmove+0x2b>
    *dst++ = *src++;
 499:	8b 45 fc             	mov    -0x4(%ebp),%eax
 49c:	8d 50 01             	lea    0x1(%eax),%edx
 49f:	89 55 fc             	mov    %edx,-0x4(%ebp)
 4a2:	8b 55 f8             	mov    -0x8(%ebp),%edx
 4a5:	8d 4a 01             	lea    0x1(%edx),%ecx
 4a8:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 4ab:	0f b6 12             	movzbl (%edx),%edx
 4ae:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 4b0:	8b 45 10             	mov    0x10(%ebp),%eax
 4b3:	8d 50 ff             	lea    -0x1(%eax),%edx
 4b6:	89 55 10             	mov    %edx,0x10(%ebp)
 4b9:	85 c0                	test   %eax,%eax
 4bb:	7f dc                	jg     499 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 4bd:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4c0:	c9                   	leave  
 4c1:	c3                   	ret    

000004c2 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4c2:	b8 01 00 00 00       	mov    $0x1,%eax
 4c7:	cd 40                	int    $0x40
 4c9:	c3                   	ret    

000004ca <exit>:
SYSCALL(exit)
 4ca:	b8 02 00 00 00       	mov    $0x2,%eax
 4cf:	cd 40                	int    $0x40
 4d1:	c3                   	ret    

000004d2 <wait>:
SYSCALL(wait)
 4d2:	b8 03 00 00 00       	mov    $0x3,%eax
 4d7:	cd 40                	int    $0x40
 4d9:	c3                   	ret    

000004da <pipe>:
SYSCALL(pipe)
 4da:	b8 04 00 00 00       	mov    $0x4,%eax
 4df:	cd 40                	int    $0x40
 4e1:	c3                   	ret    

000004e2 <read>:
SYSCALL(read)
 4e2:	b8 05 00 00 00       	mov    $0x5,%eax
 4e7:	cd 40                	int    $0x40
 4e9:	c3                   	ret    

000004ea <write>:
SYSCALL(write)
 4ea:	b8 10 00 00 00       	mov    $0x10,%eax
 4ef:	cd 40                	int    $0x40
 4f1:	c3                   	ret    

000004f2 <close>:
SYSCALL(close)
 4f2:	b8 15 00 00 00       	mov    $0x15,%eax
 4f7:	cd 40                	int    $0x40
 4f9:	c3                   	ret    

000004fa <kill>:
SYSCALL(kill)
 4fa:	b8 06 00 00 00       	mov    $0x6,%eax
 4ff:	cd 40                	int    $0x40
 501:	c3                   	ret    

00000502 <exec>:
SYSCALL(exec)
 502:	b8 07 00 00 00       	mov    $0x7,%eax
 507:	cd 40                	int    $0x40
 509:	c3                   	ret    

0000050a <open>:
SYSCALL(open)
 50a:	b8 0f 00 00 00       	mov    $0xf,%eax
 50f:	cd 40                	int    $0x40
 511:	c3                   	ret    

00000512 <mknod>:
SYSCALL(mknod)
 512:	b8 11 00 00 00       	mov    $0x11,%eax
 517:	cd 40                	int    $0x40
 519:	c3                   	ret    

0000051a <unlink>:
SYSCALL(unlink)
 51a:	b8 12 00 00 00       	mov    $0x12,%eax
 51f:	cd 40                	int    $0x40
 521:	c3                   	ret    

00000522 <fstat>:
SYSCALL(fstat)
 522:	b8 08 00 00 00       	mov    $0x8,%eax
 527:	cd 40                	int    $0x40
 529:	c3                   	ret    

0000052a <link>:
SYSCALL(link)
 52a:	b8 13 00 00 00       	mov    $0x13,%eax
 52f:	cd 40                	int    $0x40
 531:	c3                   	ret    

00000532 <mkdir>:
SYSCALL(mkdir)
 532:	b8 14 00 00 00       	mov    $0x14,%eax
 537:	cd 40                	int    $0x40
 539:	c3                   	ret    

0000053a <chdir>:
SYSCALL(chdir)
 53a:	b8 09 00 00 00       	mov    $0x9,%eax
 53f:	cd 40                	int    $0x40
 541:	c3                   	ret    

00000542 <dup>:
SYSCALL(dup)
 542:	b8 0a 00 00 00       	mov    $0xa,%eax
 547:	cd 40                	int    $0x40
 549:	c3                   	ret    

0000054a <getpid>:
SYSCALL(getpid)
 54a:	b8 0b 00 00 00       	mov    $0xb,%eax
 54f:	cd 40                	int    $0x40
 551:	c3                   	ret    

00000552 <sbrk>:
SYSCALL(sbrk)
 552:	b8 0c 00 00 00       	mov    $0xc,%eax
 557:	cd 40                	int    $0x40
 559:	c3                   	ret    

0000055a <sleep>:
SYSCALL(sleep)
 55a:	b8 0d 00 00 00       	mov    $0xd,%eax
 55f:	cd 40                	int    $0x40
 561:	c3                   	ret    

00000562 <uptime>:
SYSCALL(uptime)
 562:	b8 0e 00 00 00       	mov    $0xe,%eax
 567:	cd 40                	int    $0x40
 569:	c3                   	ret    

0000056a <date>:
SYSCALL(date) //JV-date - defines system call date and stores it into IDT
 56a:	b8 16 00 00 00       	mov    $0x16,%eax
 56f:	cd 40                	int    $0x40
 571:	c3                   	ret    

00000572 <time>:
SYSCALL(time) //JV-time - defines system call time and stores it into IDT
 572:	b8 17 00 00 00       	mov    $0x17,%eax
 577:	cd 40                	int    $0x40
 579:	c3                   	ret    

0000057a <getgid>:
SYSCALL(getgid) //JV-getgid - defines system call getgid and stores it into IDT (this is referenced in user.h)
 57a:	b8 18 00 00 00       	mov    $0x18,%eax
 57f:	cd 40                	int    $0x40
 581:	c3                   	ret    

00000582 <getuid>:
SYSCALL(getuid) //JV-getuid - defines system call getuid and stores it into IDT (this is referenced in user.h)
 582:	b8 19 00 00 00       	mov    $0x19,%eax
 587:	cd 40                	int    $0x40
 589:	c3                   	ret    

0000058a <getppid>:
SYSCALL(getppid) //JV-getppid - defines system call getppid
 58a:	b8 1a 00 00 00       	mov    $0x1a,%eax
 58f:	cd 40                	int    $0x40
 591:	c3                   	ret    

00000592 <setgid>:
SYSCALL(setgid) //JV-setgid - defines system call setgid
 592:	b8 1b 00 00 00       	mov    $0x1b,%eax
 597:	cd 40                	int    $0x40
 599:	c3                   	ret    

0000059a <setuid>:
SYSCALL(setuid) //JV-setuid - defines system call setuid
 59a:	b8 1c 00 00 00       	mov    $0x1c,%eax
 59f:	cd 40                	int    $0x40
 5a1:	c3                   	ret    

000005a2 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5a2:	55                   	push   %ebp
 5a3:	89 e5                	mov    %esp,%ebp
 5a5:	83 ec 18             	sub    $0x18,%esp
 5a8:	8b 45 0c             	mov    0xc(%ebp),%eax
 5ab:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 5ae:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5b5:	00 
 5b6:	8d 45 f4             	lea    -0xc(%ebp),%eax
 5b9:	89 44 24 04          	mov    %eax,0x4(%esp)
 5bd:	8b 45 08             	mov    0x8(%ebp),%eax
 5c0:	89 04 24             	mov    %eax,(%esp)
 5c3:	e8 22 ff ff ff       	call   4ea <write>
}
 5c8:	c9                   	leave  
 5c9:	c3                   	ret    

000005ca <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5ca:	55                   	push   %ebp
 5cb:	89 e5                	mov    %esp,%ebp
 5cd:	56                   	push   %esi
 5ce:	53                   	push   %ebx
 5cf:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 5d2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 5d9:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 5dd:	74 17                	je     5f6 <printint+0x2c>
 5df:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 5e3:	79 11                	jns    5f6 <printint+0x2c>
    neg = 1;
 5e5:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 5ec:	8b 45 0c             	mov    0xc(%ebp),%eax
 5ef:	f7 d8                	neg    %eax
 5f1:	89 45 ec             	mov    %eax,-0x14(%ebp)
 5f4:	eb 06                	jmp    5fc <printint+0x32>
  } else {
    x = xx;
 5f6:	8b 45 0c             	mov    0xc(%ebp),%eax
 5f9:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 5fc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 603:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 606:	8d 41 01             	lea    0x1(%ecx),%eax
 609:	89 45 f4             	mov    %eax,-0xc(%ebp)
 60c:	8b 5d 10             	mov    0x10(%ebp),%ebx
 60f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 612:	ba 00 00 00 00       	mov    $0x0,%edx
 617:	f7 f3                	div    %ebx
 619:	89 d0                	mov    %edx,%eax
 61b:	0f b6 80 d0 0d 00 00 	movzbl 0xdd0(%eax),%eax
 622:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 626:	8b 75 10             	mov    0x10(%ebp),%esi
 629:	8b 45 ec             	mov    -0x14(%ebp),%eax
 62c:	ba 00 00 00 00       	mov    $0x0,%edx
 631:	f7 f6                	div    %esi
 633:	89 45 ec             	mov    %eax,-0x14(%ebp)
 636:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 63a:	75 c7                	jne    603 <printint+0x39>
  if(neg)
 63c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 640:	74 10                	je     652 <printint+0x88>
    buf[i++] = '-';
 642:	8b 45 f4             	mov    -0xc(%ebp),%eax
 645:	8d 50 01             	lea    0x1(%eax),%edx
 648:	89 55 f4             	mov    %edx,-0xc(%ebp)
 64b:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 650:	eb 1f                	jmp    671 <printint+0xa7>
 652:	eb 1d                	jmp    671 <printint+0xa7>
    putc(fd, buf[i]);
 654:	8d 55 dc             	lea    -0x24(%ebp),%edx
 657:	8b 45 f4             	mov    -0xc(%ebp),%eax
 65a:	01 d0                	add    %edx,%eax
 65c:	0f b6 00             	movzbl (%eax),%eax
 65f:	0f be c0             	movsbl %al,%eax
 662:	89 44 24 04          	mov    %eax,0x4(%esp)
 666:	8b 45 08             	mov    0x8(%ebp),%eax
 669:	89 04 24             	mov    %eax,(%esp)
 66c:	e8 31 ff ff ff       	call   5a2 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 671:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 675:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 679:	79 d9                	jns    654 <printint+0x8a>
    putc(fd, buf[i]);
}
 67b:	83 c4 30             	add    $0x30,%esp
 67e:	5b                   	pop    %ebx
 67f:	5e                   	pop    %esi
 680:	5d                   	pop    %ebp
 681:	c3                   	ret    

00000682 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 682:	55                   	push   %ebp
 683:	89 e5                	mov    %esp,%ebp
 685:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 688:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 68f:	8d 45 0c             	lea    0xc(%ebp),%eax
 692:	83 c0 04             	add    $0x4,%eax
 695:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 698:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 69f:	e9 7c 01 00 00       	jmp    820 <printf+0x19e>
    c = fmt[i] & 0xff;
 6a4:	8b 55 0c             	mov    0xc(%ebp),%edx
 6a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6aa:	01 d0                	add    %edx,%eax
 6ac:	0f b6 00             	movzbl (%eax),%eax
 6af:	0f be c0             	movsbl %al,%eax
 6b2:	25 ff 00 00 00       	and    $0xff,%eax
 6b7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 6ba:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 6be:	75 2c                	jne    6ec <printf+0x6a>
      if(c == '%'){
 6c0:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6c4:	75 0c                	jne    6d2 <printf+0x50>
        state = '%';
 6c6:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 6cd:	e9 4a 01 00 00       	jmp    81c <printf+0x19a>
      } else {
        putc(fd, c);
 6d2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6d5:	0f be c0             	movsbl %al,%eax
 6d8:	89 44 24 04          	mov    %eax,0x4(%esp)
 6dc:	8b 45 08             	mov    0x8(%ebp),%eax
 6df:	89 04 24             	mov    %eax,(%esp)
 6e2:	e8 bb fe ff ff       	call   5a2 <putc>
 6e7:	e9 30 01 00 00       	jmp    81c <printf+0x19a>
      }
    } else if(state == '%'){
 6ec:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 6f0:	0f 85 26 01 00 00    	jne    81c <printf+0x19a>
      if(c == 'd'){
 6f6:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 6fa:	75 2d                	jne    729 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 6fc:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6ff:	8b 00                	mov    (%eax),%eax
 701:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 708:	00 
 709:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 710:	00 
 711:	89 44 24 04          	mov    %eax,0x4(%esp)
 715:	8b 45 08             	mov    0x8(%ebp),%eax
 718:	89 04 24             	mov    %eax,(%esp)
 71b:	e8 aa fe ff ff       	call   5ca <printint>
        ap++;
 720:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 724:	e9 ec 00 00 00       	jmp    815 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 729:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 72d:	74 06                	je     735 <printf+0xb3>
 72f:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 733:	75 2d                	jne    762 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 735:	8b 45 e8             	mov    -0x18(%ebp),%eax
 738:	8b 00                	mov    (%eax),%eax
 73a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 741:	00 
 742:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 749:	00 
 74a:	89 44 24 04          	mov    %eax,0x4(%esp)
 74e:	8b 45 08             	mov    0x8(%ebp),%eax
 751:	89 04 24             	mov    %eax,(%esp)
 754:	e8 71 fe ff ff       	call   5ca <printint>
        ap++;
 759:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 75d:	e9 b3 00 00 00       	jmp    815 <printf+0x193>
      } else if(c == 's'){
 762:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 766:	75 45                	jne    7ad <printf+0x12b>
        s = (char*)*ap;
 768:	8b 45 e8             	mov    -0x18(%ebp),%eax
 76b:	8b 00                	mov    (%eax),%eax
 76d:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 770:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 774:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 778:	75 09                	jne    783 <printf+0x101>
          s = "(null)";
 77a:	c7 45 f4 ff 0a 00 00 	movl   $0xaff,-0xc(%ebp)
        while(*s != 0){
 781:	eb 1e                	jmp    7a1 <printf+0x11f>
 783:	eb 1c                	jmp    7a1 <printf+0x11f>
          putc(fd, *s);
 785:	8b 45 f4             	mov    -0xc(%ebp),%eax
 788:	0f b6 00             	movzbl (%eax),%eax
 78b:	0f be c0             	movsbl %al,%eax
 78e:	89 44 24 04          	mov    %eax,0x4(%esp)
 792:	8b 45 08             	mov    0x8(%ebp),%eax
 795:	89 04 24             	mov    %eax,(%esp)
 798:	e8 05 fe ff ff       	call   5a2 <putc>
          s++;
 79d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 7a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7a4:	0f b6 00             	movzbl (%eax),%eax
 7a7:	84 c0                	test   %al,%al
 7a9:	75 da                	jne    785 <printf+0x103>
 7ab:	eb 68                	jmp    815 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 7ad:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 7b1:	75 1d                	jne    7d0 <printf+0x14e>
        putc(fd, *ap);
 7b3:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7b6:	8b 00                	mov    (%eax),%eax
 7b8:	0f be c0             	movsbl %al,%eax
 7bb:	89 44 24 04          	mov    %eax,0x4(%esp)
 7bf:	8b 45 08             	mov    0x8(%ebp),%eax
 7c2:	89 04 24             	mov    %eax,(%esp)
 7c5:	e8 d8 fd ff ff       	call   5a2 <putc>
        ap++;
 7ca:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7ce:	eb 45                	jmp    815 <printf+0x193>
      } else if(c == '%'){
 7d0:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 7d4:	75 17                	jne    7ed <printf+0x16b>
        putc(fd, c);
 7d6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7d9:	0f be c0             	movsbl %al,%eax
 7dc:	89 44 24 04          	mov    %eax,0x4(%esp)
 7e0:	8b 45 08             	mov    0x8(%ebp),%eax
 7e3:	89 04 24             	mov    %eax,(%esp)
 7e6:	e8 b7 fd ff ff       	call   5a2 <putc>
 7eb:	eb 28                	jmp    815 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 7ed:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 7f4:	00 
 7f5:	8b 45 08             	mov    0x8(%ebp),%eax
 7f8:	89 04 24             	mov    %eax,(%esp)
 7fb:	e8 a2 fd ff ff       	call   5a2 <putc>
        putc(fd, c);
 800:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 803:	0f be c0             	movsbl %al,%eax
 806:	89 44 24 04          	mov    %eax,0x4(%esp)
 80a:	8b 45 08             	mov    0x8(%ebp),%eax
 80d:	89 04 24             	mov    %eax,(%esp)
 810:	e8 8d fd ff ff       	call   5a2 <putc>
      }
      state = 0;
 815:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 81c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 820:	8b 55 0c             	mov    0xc(%ebp),%edx
 823:	8b 45 f0             	mov    -0x10(%ebp),%eax
 826:	01 d0                	add    %edx,%eax
 828:	0f b6 00             	movzbl (%eax),%eax
 82b:	84 c0                	test   %al,%al
 82d:	0f 85 71 fe ff ff    	jne    6a4 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 833:	c9                   	leave  
 834:	c3                   	ret    

00000835 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 835:	55                   	push   %ebp
 836:	89 e5                	mov    %esp,%ebp
 838:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 83b:	8b 45 08             	mov    0x8(%ebp),%eax
 83e:	83 e8 08             	sub    $0x8,%eax
 841:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 844:	a1 ec 0d 00 00       	mov    0xdec,%eax
 849:	89 45 fc             	mov    %eax,-0x4(%ebp)
 84c:	eb 24                	jmp    872 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 84e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 851:	8b 00                	mov    (%eax),%eax
 853:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 856:	77 12                	ja     86a <free+0x35>
 858:	8b 45 f8             	mov    -0x8(%ebp),%eax
 85b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 85e:	77 24                	ja     884 <free+0x4f>
 860:	8b 45 fc             	mov    -0x4(%ebp),%eax
 863:	8b 00                	mov    (%eax),%eax
 865:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 868:	77 1a                	ja     884 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 86a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 86d:	8b 00                	mov    (%eax),%eax
 86f:	89 45 fc             	mov    %eax,-0x4(%ebp)
 872:	8b 45 f8             	mov    -0x8(%ebp),%eax
 875:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 878:	76 d4                	jbe    84e <free+0x19>
 87a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 87d:	8b 00                	mov    (%eax),%eax
 87f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 882:	76 ca                	jbe    84e <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 884:	8b 45 f8             	mov    -0x8(%ebp),%eax
 887:	8b 40 04             	mov    0x4(%eax),%eax
 88a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 891:	8b 45 f8             	mov    -0x8(%ebp),%eax
 894:	01 c2                	add    %eax,%edx
 896:	8b 45 fc             	mov    -0x4(%ebp),%eax
 899:	8b 00                	mov    (%eax),%eax
 89b:	39 c2                	cmp    %eax,%edx
 89d:	75 24                	jne    8c3 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 89f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8a2:	8b 50 04             	mov    0x4(%eax),%edx
 8a5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8a8:	8b 00                	mov    (%eax),%eax
 8aa:	8b 40 04             	mov    0x4(%eax),%eax
 8ad:	01 c2                	add    %eax,%edx
 8af:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8b2:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 8b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8b8:	8b 00                	mov    (%eax),%eax
 8ba:	8b 10                	mov    (%eax),%edx
 8bc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8bf:	89 10                	mov    %edx,(%eax)
 8c1:	eb 0a                	jmp    8cd <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 8c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8c6:	8b 10                	mov    (%eax),%edx
 8c8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8cb:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 8cd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8d0:	8b 40 04             	mov    0x4(%eax),%eax
 8d3:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 8da:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8dd:	01 d0                	add    %edx,%eax
 8df:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8e2:	75 20                	jne    904 <free+0xcf>
    p->s.size += bp->s.size;
 8e4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8e7:	8b 50 04             	mov    0x4(%eax),%edx
 8ea:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8ed:	8b 40 04             	mov    0x4(%eax),%eax
 8f0:	01 c2                	add    %eax,%edx
 8f2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8f5:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8f8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8fb:	8b 10                	mov    (%eax),%edx
 8fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 900:	89 10                	mov    %edx,(%eax)
 902:	eb 08                	jmp    90c <free+0xd7>
  } else
    p->s.ptr = bp;
 904:	8b 45 fc             	mov    -0x4(%ebp),%eax
 907:	8b 55 f8             	mov    -0x8(%ebp),%edx
 90a:	89 10                	mov    %edx,(%eax)
  freep = p;
 90c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 90f:	a3 ec 0d 00 00       	mov    %eax,0xdec
}
 914:	c9                   	leave  
 915:	c3                   	ret    

00000916 <morecore>:

static Header*
morecore(uint nu)
{
 916:	55                   	push   %ebp
 917:	89 e5                	mov    %esp,%ebp
 919:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 91c:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 923:	77 07                	ja     92c <morecore+0x16>
    nu = 4096;
 925:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 92c:	8b 45 08             	mov    0x8(%ebp),%eax
 92f:	c1 e0 03             	shl    $0x3,%eax
 932:	89 04 24             	mov    %eax,(%esp)
 935:	e8 18 fc ff ff       	call   552 <sbrk>
 93a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 93d:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 941:	75 07                	jne    94a <morecore+0x34>
    return 0;
 943:	b8 00 00 00 00       	mov    $0x0,%eax
 948:	eb 22                	jmp    96c <morecore+0x56>
  hp = (Header*)p;
 94a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 94d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 950:	8b 45 f0             	mov    -0x10(%ebp),%eax
 953:	8b 55 08             	mov    0x8(%ebp),%edx
 956:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 959:	8b 45 f0             	mov    -0x10(%ebp),%eax
 95c:	83 c0 08             	add    $0x8,%eax
 95f:	89 04 24             	mov    %eax,(%esp)
 962:	e8 ce fe ff ff       	call   835 <free>
  return freep;
 967:	a1 ec 0d 00 00       	mov    0xdec,%eax
}
 96c:	c9                   	leave  
 96d:	c3                   	ret    

0000096e <malloc>:

void*
malloc(uint nbytes)
{
 96e:	55                   	push   %ebp
 96f:	89 e5                	mov    %esp,%ebp
 971:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 974:	8b 45 08             	mov    0x8(%ebp),%eax
 977:	83 c0 07             	add    $0x7,%eax
 97a:	c1 e8 03             	shr    $0x3,%eax
 97d:	83 c0 01             	add    $0x1,%eax
 980:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 983:	a1 ec 0d 00 00       	mov    0xdec,%eax
 988:	89 45 f0             	mov    %eax,-0x10(%ebp)
 98b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 98f:	75 23                	jne    9b4 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 991:	c7 45 f0 e4 0d 00 00 	movl   $0xde4,-0x10(%ebp)
 998:	8b 45 f0             	mov    -0x10(%ebp),%eax
 99b:	a3 ec 0d 00 00       	mov    %eax,0xdec
 9a0:	a1 ec 0d 00 00       	mov    0xdec,%eax
 9a5:	a3 e4 0d 00 00       	mov    %eax,0xde4
    base.s.size = 0;
 9aa:	c7 05 e8 0d 00 00 00 	movl   $0x0,0xde8
 9b1:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9b7:	8b 00                	mov    (%eax),%eax
 9b9:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 9bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9bf:	8b 40 04             	mov    0x4(%eax),%eax
 9c2:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 9c5:	72 4d                	jb     a14 <malloc+0xa6>
      if(p->s.size == nunits)
 9c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9ca:	8b 40 04             	mov    0x4(%eax),%eax
 9cd:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 9d0:	75 0c                	jne    9de <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 9d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9d5:	8b 10                	mov    (%eax),%edx
 9d7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9da:	89 10                	mov    %edx,(%eax)
 9dc:	eb 26                	jmp    a04 <malloc+0x96>
      else {
        p->s.size -= nunits;
 9de:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9e1:	8b 40 04             	mov    0x4(%eax),%eax
 9e4:	2b 45 ec             	sub    -0x14(%ebp),%eax
 9e7:	89 c2                	mov    %eax,%edx
 9e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9ec:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9f2:	8b 40 04             	mov    0x4(%eax),%eax
 9f5:	c1 e0 03             	shl    $0x3,%eax
 9f8:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 9fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9fe:	8b 55 ec             	mov    -0x14(%ebp),%edx
 a01:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 a04:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a07:	a3 ec 0d 00 00       	mov    %eax,0xdec
      return (void*)(p + 1);
 a0c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a0f:	83 c0 08             	add    $0x8,%eax
 a12:	eb 38                	jmp    a4c <malloc+0xde>
    }
    if(p == freep)
 a14:	a1 ec 0d 00 00       	mov    0xdec,%eax
 a19:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 a1c:	75 1b                	jne    a39 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 a1e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a21:	89 04 24             	mov    %eax,(%esp)
 a24:	e8 ed fe ff ff       	call   916 <morecore>
 a29:	89 45 f4             	mov    %eax,-0xc(%ebp)
 a2c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 a30:	75 07                	jne    a39 <malloc+0xcb>
        return 0;
 a32:	b8 00 00 00 00       	mov    $0x0,%eax
 a37:	eb 13                	jmp    a4c <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a39:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a3c:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a42:	8b 00                	mov    (%eax),%eax
 a44:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 a47:	e9 70 ff ff ff       	jmp    9bc <malloc+0x4e>
}
 a4c:	c9                   	leave  
 a4d:	c3                   	ret    
