
_JVtime:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

#define MAXARGS 10

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	56                   	push   %esi
   4:	53                   	push   %ebx
   5:	83 e4 f0             	and    $0xfffffff0,%esp
   8:	83 c4 80             	add    $0xffffff80,%esp
	int i, pid;
	char *p[MAXARGS];
	struct rtcdate parent_t, child_t;
	
	if(argc >= (MAXARGS-1)) {
   b:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
   f:	7e 19                	jle    2a <main+0x2a>
		printf(2, "Slow down Kiddo! Too many arguments!\n");
  11:	c7 44 24 04 00 0a 00 	movl   $0xa00,0x4(%esp)
  18:	00 
  19:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  20:	e8 0d 06 00 00       	call   632 <printf>
		exit();
  25:	e8 50 04 00 00       	call   47a <exit>
	}

	
	for(i=0; i<argc-1; ++i) {	   //for each argument
  2a:	c7 44 24 7c 00 00 00 	movl   $0x0,0x7c(%esp)
  31:	00 
  32:	eb 5e                	jmp    92 <main+0x92>
		p[i] = malloc(strlen(argv[i+1] + 1)); //allocate memory for str
  34:	8b 44 24 7c          	mov    0x7c(%esp),%eax
  38:	83 c0 01             	add    $0x1,%eax
  3b:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  42:	8b 45 0c             	mov    0xc(%ebp),%eax
  45:	01 d0                	add    %edx,%eax
  47:	8b 00                	mov    (%eax),%eax
  49:	83 c0 01             	add    $0x1,%eax
  4c:	89 04 24             	mov    %eax,(%esp)
  4f:	e8 52 02 00 00       	call   2a6 <strlen>
  54:	89 04 24             	mov    %eax,(%esp)
  57:	e8 c2 08 00 00       	call   91e <malloc>
  5c:	8b 54 24 7c          	mov    0x7c(%esp),%edx
  60:	89 44 94 4c          	mov    %eax,0x4c(%esp,%edx,4)
		strcpy(p[i], argv[i+1]);  //cpy args to p,not 0th! (system call)
  64:	8b 44 24 7c          	mov    0x7c(%esp),%eax
  68:	83 c0 01             	add    $0x1,%eax
  6b:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  72:	8b 45 0c             	mov    0xc(%ebp),%eax
  75:	01 d0                	add    %edx,%eax
  77:	8b 10                	mov    (%eax),%edx
  79:	8b 44 24 7c          	mov    0x7c(%esp),%eax
  7d:	8b 44 84 4c          	mov    0x4c(%esp,%eax,4),%eax
  81:	89 54 24 04          	mov    %edx,0x4(%esp)
  85:	89 04 24             	mov    %eax,(%esp)
  88:	e8 aa 01 00 00       	call   237 <strcpy>
		printf(2, "Slow down Kiddo! Too many arguments!\n");
		exit();
	}

	
	for(i=0; i<argc-1; ++i) {	   //for each argument
  8d:	83 44 24 7c 01       	addl   $0x1,0x7c(%esp)
  92:	8b 45 08             	mov    0x8(%ebp),%eax
  95:	83 e8 01             	sub    $0x1,%eax
  98:	3b 44 24 7c          	cmp    0x7c(%esp),%eax
  9c:	7f 96                	jg     34 <main+0x34>
		p[i] = malloc(strlen(argv[i+1] + 1)); //allocate memory for str
		strcpy(p[i], argv[i+1]);  //cpy args to p,not 0th! (system call)
	}

	p[i] = '\0'; //make sure last character is NULL 
  9e:	8b 44 24 7c          	mov    0x7c(%esp),%eax
  a2:	c7 44 84 4c 00 00 00 	movl   $0x0,0x4c(%esp,%eax,4)
  a9:	00 

	//grab the time of current process (date returns 0 if success)
	if(date(&parent_t)){
  aa:	8d 44 24 34          	lea    0x34(%esp),%eax
  ae:	89 04 24             	mov    %eax,(%esp)
  b1:	e8 64 04 00 00       	call   51a <date>
  b6:	85 c0                	test   %eax,%eax
  b8:	74 21                	je     db <main+0xdb>
		printf(2, "date() failed at line %d :(\n", __LINE__);
  ba:	c7 44 24 08 1d 00 00 	movl   $0x1d,0x8(%esp)
  c1:	00 
  c2:	c7 44 24 04 26 0a 00 	movl   $0xa26,0x4(%esp)
  c9:	00 
  ca:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  d1:	e8 5c 05 00 00       	call   632 <printf>
		exit();
  d6:	e8 9f 03 00 00       	call   47a <exit>
	}	

	//fork current process. pid == 0 if current process is child
	//otherwise if pid > 0, current process is parentt
	pid = fork();
  db:	e8 92 03 00 00       	call   472 <fork>
  e0:	89 44 24 78          	mov    %eax,0x78(%esp)


	if(pid < 0) {	//fail, probably ran out of resources
  e4:	83 7c 24 78 00       	cmpl   $0x0,0x78(%esp)
  e9:	79 19                	jns    104 <main+0x104>
		printf(2, "fork() failed! --/--E\n");
  eb:	c7 44 24 04 43 0a 00 	movl   $0xa43,0x4(%esp)
  f2:	00 
  f3:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  fa:	e8 33 05 00 00       	call   632 <printf>
		exit();
  ff:	e8 76 03 00 00       	call   47a <exit>
	} else if (pid == 0) {	//current process = child!
 104:	83 7c 24 78 00       	cmpl   $0x0,0x78(%esp)
 109:	75 35                	jne    140 <main+0x140>
		exec(p[0], p);	//exec args in p. returns to parent if success!
 10b:	8b 44 24 4c          	mov    0x4c(%esp),%eax
 10f:	8d 54 24 4c          	lea    0x4c(%esp),%edx
 113:	89 54 24 04          	mov    %edx,0x4(%esp)
 117:	89 04 24             	mov    %eax,(%esp)
 11a:	e8 93 03 00 00       	call   4b2 <exec>
		printf(2, "exec() failed. %s needs a full path Hombre\n", p[0]);
 11f:	8b 44 24 4c          	mov    0x4c(%esp),%eax
 123:	89 44 24 08          	mov    %eax,0x8(%esp)
 127:	c7 44 24 04 5c 0a 00 	movl   $0xa5c,0x4(%esp)
 12e:	00 
 12f:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 136:	e8 f7 04 00 00       	call   632 <printf>
		exit();
 13b:	e8 3a 03 00 00       	call   47a <exit>
	} else { //current process = parent!
		pid = wait(); //wait for child to finish
 140:	e8 3d 03 00 00       	call   482 <wait>
 145:	89 44 24 78          	mov    %eax,0x78(%esp)
		if(date(&child_t)){ //grab the time of child process
 149:	8d 44 24 1c          	lea    0x1c(%esp),%eax
 14d:	89 04 24             	mov    %eax,(%esp)
 150:	e8 c5 03 00 00       	call   51a <date>
 155:	85 c0                	test   %eax,%eax
 157:	74 21                	je     17a <main+0x17a>
			printf(2, "date() failed at line %d :(\n", __LINE__);
 159:	c7 44 24 08 30 00 00 	movl   $0x30,0x8(%esp)
 160:	00 
 161:	c7 44 24 04 26 0a 00 	movl   $0xa26,0x4(%esp)
 168:	00 
 169:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 170:	e8 bd 04 00 00       	call   632 <printf>
			exit();
 175:	e8 00 03 00 00       	call   47a <exit>
		}
	}

	int time_elapsed =  (child_t.second + child_t.minute*60 + child_t.hour*3600) - (parent_t.second + parent_t.minute*60 + parent_t.hour*3600);
 17a:	8b 54 24 1c          	mov    0x1c(%esp),%edx
 17e:	8b 44 24 24          	mov    0x24(%esp),%eax
 182:	69 c8 10 0e 00 00    	imul   $0xe10,%eax,%ecx
 188:	8b 44 24 20          	mov    0x20(%esp),%eax
 18c:	c1 e0 02             	shl    $0x2,%eax
 18f:	89 c3                	mov    %eax,%ebx
 191:	c1 e3 04             	shl    $0x4,%ebx
 194:	29 c3                	sub    %eax,%ebx
 196:	89 d8                	mov    %ebx,%eax
 198:	01 c8                	add    %ecx,%eax
 19a:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
 19d:	8b 54 24 34          	mov    0x34(%esp),%edx
 1a1:	8b 44 24 3c          	mov    0x3c(%esp),%eax
 1a5:	69 c8 10 0e 00 00    	imul   $0xe10,%eax,%ecx
 1ab:	8b 44 24 38          	mov    0x38(%esp),%eax
 1af:	c1 e0 02             	shl    $0x2,%eax
 1b2:	89 c6                	mov    %eax,%esi
 1b4:	c1 e6 04             	shl    $0x4,%esi
 1b7:	29 c6                	sub    %eax,%esi
 1b9:	89 f0                	mov    %esi,%eax
 1bb:	01 c8                	add    %ecx,%eax
 1bd:	01 d0                	add    %edx,%eax
 1bf:	29 c3                	sub    %eax,%ebx
 1c1:	89 d8                	mov    %ebx,%eax
 1c3:	89 44 24 74          	mov    %eax,0x74(%esp)

	if(time_elapsed < 0) {
 1c7:	83 7c 24 74 00       	cmpl   $0x0,0x74(%esp)
 1cc:	79 23                	jns    1f1 <main+0x1f1>
		printf(1, "JVtime: %d seconds elapsed\n", -1*time_elapsed);
 1ce:	8b 44 24 74          	mov    0x74(%esp),%eax
 1d2:	f7 d8                	neg    %eax
 1d4:	89 44 24 08          	mov    %eax,0x8(%esp)
 1d8:	c7 44 24 04 88 0a 00 	movl   $0xa88,0x4(%esp)
 1df:	00 
 1e0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1e7:	e8 46 04 00 00       	call   632 <printf>
		exit();
 1ec:	e8 89 02 00 00       	call   47a <exit>
	} else {
		printf(1, "JVtime: %d seconds elapsed\n", time_elapsed);
 1f1:	8b 44 24 74          	mov    0x74(%esp),%eax
 1f5:	89 44 24 08          	mov    %eax,0x8(%esp)
 1f9:	c7 44 24 04 88 0a 00 	movl   $0xa88,0x4(%esp)
 200:	00 
 201:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 208:	e8 25 04 00 00       	call   632 <printf>
		exit();
 20d:	e8 68 02 00 00       	call   47a <exit>

00000212 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 212:	55                   	push   %ebp
 213:	89 e5                	mov    %esp,%ebp
 215:	57                   	push   %edi
 216:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 217:	8b 4d 08             	mov    0x8(%ebp),%ecx
 21a:	8b 55 10             	mov    0x10(%ebp),%edx
 21d:	8b 45 0c             	mov    0xc(%ebp),%eax
 220:	89 cb                	mov    %ecx,%ebx
 222:	89 df                	mov    %ebx,%edi
 224:	89 d1                	mov    %edx,%ecx
 226:	fc                   	cld    
 227:	f3 aa                	rep stos %al,%es:(%edi)
 229:	89 ca                	mov    %ecx,%edx
 22b:	89 fb                	mov    %edi,%ebx
 22d:	89 5d 08             	mov    %ebx,0x8(%ebp)
 230:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 233:	5b                   	pop    %ebx
 234:	5f                   	pop    %edi
 235:	5d                   	pop    %ebp
 236:	c3                   	ret    

00000237 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 237:	55                   	push   %ebp
 238:	89 e5                	mov    %esp,%ebp
 23a:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 23d:	8b 45 08             	mov    0x8(%ebp),%eax
 240:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 243:	90                   	nop
 244:	8b 45 08             	mov    0x8(%ebp),%eax
 247:	8d 50 01             	lea    0x1(%eax),%edx
 24a:	89 55 08             	mov    %edx,0x8(%ebp)
 24d:	8b 55 0c             	mov    0xc(%ebp),%edx
 250:	8d 4a 01             	lea    0x1(%edx),%ecx
 253:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 256:	0f b6 12             	movzbl (%edx),%edx
 259:	88 10                	mov    %dl,(%eax)
 25b:	0f b6 00             	movzbl (%eax),%eax
 25e:	84 c0                	test   %al,%al
 260:	75 e2                	jne    244 <strcpy+0xd>
    ;
  return os;
 262:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 265:	c9                   	leave  
 266:	c3                   	ret    

00000267 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 267:	55                   	push   %ebp
 268:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 26a:	eb 08                	jmp    274 <strcmp+0xd>
    p++, q++;
 26c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 270:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 274:	8b 45 08             	mov    0x8(%ebp),%eax
 277:	0f b6 00             	movzbl (%eax),%eax
 27a:	84 c0                	test   %al,%al
 27c:	74 10                	je     28e <strcmp+0x27>
 27e:	8b 45 08             	mov    0x8(%ebp),%eax
 281:	0f b6 10             	movzbl (%eax),%edx
 284:	8b 45 0c             	mov    0xc(%ebp),%eax
 287:	0f b6 00             	movzbl (%eax),%eax
 28a:	38 c2                	cmp    %al,%dl
 28c:	74 de                	je     26c <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 28e:	8b 45 08             	mov    0x8(%ebp),%eax
 291:	0f b6 00             	movzbl (%eax),%eax
 294:	0f b6 d0             	movzbl %al,%edx
 297:	8b 45 0c             	mov    0xc(%ebp),%eax
 29a:	0f b6 00             	movzbl (%eax),%eax
 29d:	0f b6 c0             	movzbl %al,%eax
 2a0:	29 c2                	sub    %eax,%edx
 2a2:	89 d0                	mov    %edx,%eax
}
 2a4:	5d                   	pop    %ebp
 2a5:	c3                   	ret    

000002a6 <strlen>:

uint
strlen(char *s)
{
 2a6:	55                   	push   %ebp
 2a7:	89 e5                	mov    %esp,%ebp
 2a9:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 2ac:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 2b3:	eb 04                	jmp    2b9 <strlen+0x13>
 2b5:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 2b9:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2bc:	8b 45 08             	mov    0x8(%ebp),%eax
 2bf:	01 d0                	add    %edx,%eax
 2c1:	0f b6 00             	movzbl (%eax),%eax
 2c4:	84 c0                	test   %al,%al
 2c6:	75 ed                	jne    2b5 <strlen+0xf>
    ;
  return n;
 2c8:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2cb:	c9                   	leave  
 2cc:	c3                   	ret    

000002cd <memset>:

void*
memset(void *dst, int c, uint n)
{
 2cd:	55                   	push   %ebp
 2ce:	89 e5                	mov    %esp,%ebp
 2d0:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 2d3:	8b 45 10             	mov    0x10(%ebp),%eax
 2d6:	89 44 24 08          	mov    %eax,0x8(%esp)
 2da:	8b 45 0c             	mov    0xc(%ebp),%eax
 2dd:	89 44 24 04          	mov    %eax,0x4(%esp)
 2e1:	8b 45 08             	mov    0x8(%ebp),%eax
 2e4:	89 04 24             	mov    %eax,(%esp)
 2e7:	e8 26 ff ff ff       	call   212 <stosb>
  return dst;
 2ec:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2ef:	c9                   	leave  
 2f0:	c3                   	ret    

000002f1 <strchr>:

char*
strchr(const char *s, char c)
{
 2f1:	55                   	push   %ebp
 2f2:	89 e5                	mov    %esp,%ebp
 2f4:	83 ec 04             	sub    $0x4,%esp
 2f7:	8b 45 0c             	mov    0xc(%ebp),%eax
 2fa:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 2fd:	eb 14                	jmp    313 <strchr+0x22>
    if(*s == c)
 2ff:	8b 45 08             	mov    0x8(%ebp),%eax
 302:	0f b6 00             	movzbl (%eax),%eax
 305:	3a 45 fc             	cmp    -0x4(%ebp),%al
 308:	75 05                	jne    30f <strchr+0x1e>
      return (char*)s;
 30a:	8b 45 08             	mov    0x8(%ebp),%eax
 30d:	eb 13                	jmp    322 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 30f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 313:	8b 45 08             	mov    0x8(%ebp),%eax
 316:	0f b6 00             	movzbl (%eax),%eax
 319:	84 c0                	test   %al,%al
 31b:	75 e2                	jne    2ff <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 31d:	b8 00 00 00 00       	mov    $0x0,%eax
}
 322:	c9                   	leave  
 323:	c3                   	ret    

00000324 <gets>:

char*
gets(char *buf, int max)
{
 324:	55                   	push   %ebp
 325:	89 e5                	mov    %esp,%ebp
 327:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 32a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 331:	eb 4c                	jmp    37f <gets+0x5b>
    cc = read(0, &c, 1);
 333:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 33a:	00 
 33b:	8d 45 ef             	lea    -0x11(%ebp),%eax
 33e:	89 44 24 04          	mov    %eax,0x4(%esp)
 342:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 349:	e8 44 01 00 00       	call   492 <read>
 34e:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 351:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 355:	7f 02                	jg     359 <gets+0x35>
      break;
 357:	eb 31                	jmp    38a <gets+0x66>
    buf[i++] = c;
 359:	8b 45 f4             	mov    -0xc(%ebp),%eax
 35c:	8d 50 01             	lea    0x1(%eax),%edx
 35f:	89 55 f4             	mov    %edx,-0xc(%ebp)
 362:	89 c2                	mov    %eax,%edx
 364:	8b 45 08             	mov    0x8(%ebp),%eax
 367:	01 c2                	add    %eax,%edx
 369:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 36d:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 36f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 373:	3c 0a                	cmp    $0xa,%al
 375:	74 13                	je     38a <gets+0x66>
 377:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 37b:	3c 0d                	cmp    $0xd,%al
 37d:	74 0b                	je     38a <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 37f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 382:	83 c0 01             	add    $0x1,%eax
 385:	3b 45 0c             	cmp    0xc(%ebp),%eax
 388:	7c a9                	jl     333 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 38a:	8b 55 f4             	mov    -0xc(%ebp),%edx
 38d:	8b 45 08             	mov    0x8(%ebp),%eax
 390:	01 d0                	add    %edx,%eax
 392:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 395:	8b 45 08             	mov    0x8(%ebp),%eax
}
 398:	c9                   	leave  
 399:	c3                   	ret    

0000039a <stat>:

int
stat(char *n, struct stat *st)
{
 39a:	55                   	push   %ebp
 39b:	89 e5                	mov    %esp,%ebp
 39d:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3a0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 3a7:	00 
 3a8:	8b 45 08             	mov    0x8(%ebp),%eax
 3ab:	89 04 24             	mov    %eax,(%esp)
 3ae:	e8 07 01 00 00       	call   4ba <open>
 3b3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 3b6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 3ba:	79 07                	jns    3c3 <stat+0x29>
    return -1;
 3bc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 3c1:	eb 23                	jmp    3e6 <stat+0x4c>
  r = fstat(fd, st);
 3c3:	8b 45 0c             	mov    0xc(%ebp),%eax
 3c6:	89 44 24 04          	mov    %eax,0x4(%esp)
 3ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3cd:	89 04 24             	mov    %eax,(%esp)
 3d0:	e8 fd 00 00 00       	call   4d2 <fstat>
 3d5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 3d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3db:	89 04 24             	mov    %eax,(%esp)
 3de:	e8 bf 00 00 00       	call   4a2 <close>
  return r;
 3e3:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 3e6:	c9                   	leave  
 3e7:	c3                   	ret    

000003e8 <atoi>:

int
atoi(const char *s)
{
 3e8:	55                   	push   %ebp
 3e9:	89 e5                	mov    %esp,%ebp
 3eb:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 3ee:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 3f5:	eb 25                	jmp    41c <atoi+0x34>
    n = n*10 + *s++ - '0';
 3f7:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3fa:	89 d0                	mov    %edx,%eax
 3fc:	c1 e0 02             	shl    $0x2,%eax
 3ff:	01 d0                	add    %edx,%eax
 401:	01 c0                	add    %eax,%eax
 403:	89 c1                	mov    %eax,%ecx
 405:	8b 45 08             	mov    0x8(%ebp),%eax
 408:	8d 50 01             	lea    0x1(%eax),%edx
 40b:	89 55 08             	mov    %edx,0x8(%ebp)
 40e:	0f b6 00             	movzbl (%eax),%eax
 411:	0f be c0             	movsbl %al,%eax
 414:	01 c8                	add    %ecx,%eax
 416:	83 e8 30             	sub    $0x30,%eax
 419:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 41c:	8b 45 08             	mov    0x8(%ebp),%eax
 41f:	0f b6 00             	movzbl (%eax),%eax
 422:	3c 2f                	cmp    $0x2f,%al
 424:	7e 0a                	jle    430 <atoi+0x48>
 426:	8b 45 08             	mov    0x8(%ebp),%eax
 429:	0f b6 00             	movzbl (%eax),%eax
 42c:	3c 39                	cmp    $0x39,%al
 42e:	7e c7                	jle    3f7 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 430:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 433:	c9                   	leave  
 434:	c3                   	ret    

00000435 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 435:	55                   	push   %ebp
 436:	89 e5                	mov    %esp,%ebp
 438:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 43b:	8b 45 08             	mov    0x8(%ebp),%eax
 43e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 441:	8b 45 0c             	mov    0xc(%ebp),%eax
 444:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 447:	eb 17                	jmp    460 <memmove+0x2b>
    *dst++ = *src++;
 449:	8b 45 fc             	mov    -0x4(%ebp),%eax
 44c:	8d 50 01             	lea    0x1(%eax),%edx
 44f:	89 55 fc             	mov    %edx,-0x4(%ebp)
 452:	8b 55 f8             	mov    -0x8(%ebp),%edx
 455:	8d 4a 01             	lea    0x1(%edx),%ecx
 458:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 45b:	0f b6 12             	movzbl (%edx),%edx
 45e:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 460:	8b 45 10             	mov    0x10(%ebp),%eax
 463:	8d 50 ff             	lea    -0x1(%eax),%edx
 466:	89 55 10             	mov    %edx,0x10(%ebp)
 469:	85 c0                	test   %eax,%eax
 46b:	7f dc                	jg     449 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 46d:	8b 45 08             	mov    0x8(%ebp),%eax
}
 470:	c9                   	leave  
 471:	c3                   	ret    

00000472 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 472:	b8 01 00 00 00       	mov    $0x1,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret    

0000047a <exit>:
SYSCALL(exit)
 47a:	b8 02 00 00 00       	mov    $0x2,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret    

00000482 <wait>:
SYSCALL(wait)
 482:	b8 03 00 00 00       	mov    $0x3,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <pipe>:
SYSCALL(pipe)
 48a:	b8 04 00 00 00       	mov    $0x4,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret    

00000492 <read>:
SYSCALL(read)
 492:	b8 05 00 00 00       	mov    $0x5,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret    

0000049a <write>:
SYSCALL(write)
 49a:	b8 10 00 00 00       	mov    $0x10,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret    

000004a2 <close>:
SYSCALL(close)
 4a2:	b8 15 00 00 00       	mov    $0x15,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret    

000004aa <kill>:
SYSCALL(kill)
 4aa:	b8 06 00 00 00       	mov    $0x6,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret    

000004b2 <exec>:
SYSCALL(exec)
 4b2:	b8 07 00 00 00       	mov    $0x7,%eax
 4b7:	cd 40                	int    $0x40
 4b9:	c3                   	ret    

000004ba <open>:
SYSCALL(open)
 4ba:	b8 0f 00 00 00       	mov    $0xf,%eax
 4bf:	cd 40                	int    $0x40
 4c1:	c3                   	ret    

000004c2 <mknod>:
SYSCALL(mknod)
 4c2:	b8 11 00 00 00       	mov    $0x11,%eax
 4c7:	cd 40                	int    $0x40
 4c9:	c3                   	ret    

000004ca <unlink>:
SYSCALL(unlink)
 4ca:	b8 12 00 00 00       	mov    $0x12,%eax
 4cf:	cd 40                	int    $0x40
 4d1:	c3                   	ret    

000004d2 <fstat>:
SYSCALL(fstat)
 4d2:	b8 08 00 00 00       	mov    $0x8,%eax
 4d7:	cd 40                	int    $0x40
 4d9:	c3                   	ret    

000004da <link>:
SYSCALL(link)
 4da:	b8 13 00 00 00       	mov    $0x13,%eax
 4df:	cd 40                	int    $0x40
 4e1:	c3                   	ret    

000004e2 <mkdir>:
SYSCALL(mkdir)
 4e2:	b8 14 00 00 00       	mov    $0x14,%eax
 4e7:	cd 40                	int    $0x40
 4e9:	c3                   	ret    

000004ea <chdir>:
SYSCALL(chdir)
 4ea:	b8 09 00 00 00       	mov    $0x9,%eax
 4ef:	cd 40                	int    $0x40
 4f1:	c3                   	ret    

000004f2 <dup>:
SYSCALL(dup)
 4f2:	b8 0a 00 00 00       	mov    $0xa,%eax
 4f7:	cd 40                	int    $0x40
 4f9:	c3                   	ret    

000004fa <getpid>:
SYSCALL(getpid)
 4fa:	b8 0b 00 00 00       	mov    $0xb,%eax
 4ff:	cd 40                	int    $0x40
 501:	c3                   	ret    

00000502 <sbrk>:
SYSCALL(sbrk)
 502:	b8 0c 00 00 00       	mov    $0xc,%eax
 507:	cd 40                	int    $0x40
 509:	c3                   	ret    

0000050a <sleep>:
SYSCALL(sleep)
 50a:	b8 0d 00 00 00       	mov    $0xd,%eax
 50f:	cd 40                	int    $0x40
 511:	c3                   	ret    

00000512 <uptime>:
SYSCALL(uptime)
 512:	b8 0e 00 00 00       	mov    $0xe,%eax
 517:	cd 40                	int    $0x40
 519:	c3                   	ret    

0000051a <date>:
SYSCALL(date) //JV-date - defines system call date and stores it into IDT
 51a:	b8 16 00 00 00       	mov    $0x16,%eax
 51f:	cd 40                	int    $0x40
 521:	c3                   	ret    

00000522 <time>:
SYSCALL(time) //JV-time - defines system call time and stores it into IDT
 522:	b8 17 00 00 00       	mov    $0x17,%eax
 527:	cd 40                	int    $0x40
 529:	c3                   	ret    

0000052a <getgid>:
SYSCALL(getgid) //JV-getgid - defines system call getgid and stores it into IDT (this is referenced in user.h)
 52a:	b8 18 00 00 00       	mov    $0x18,%eax
 52f:	cd 40                	int    $0x40
 531:	c3                   	ret    

00000532 <getuid>:
SYSCALL(getuid) //JV-getuid - defines system call getuid and stores it into IDT (this is referenced in user.h)
 532:	b8 19 00 00 00       	mov    $0x19,%eax
 537:	cd 40                	int    $0x40
 539:	c3                   	ret    

0000053a <getppid>:
SYSCALL(getppid) //JV-getppid - defines system call getppid
 53a:	b8 1a 00 00 00       	mov    $0x1a,%eax
 53f:	cd 40                	int    $0x40
 541:	c3                   	ret    

00000542 <setgid>:
SYSCALL(setgid) //JV-setgid - defines system call setgid
 542:	b8 1b 00 00 00       	mov    $0x1b,%eax
 547:	cd 40                	int    $0x40
 549:	c3                   	ret    

0000054a <setuid>:
SYSCALL(setuid) //JV-setuid - defines system call setuid
 54a:	b8 1c 00 00 00       	mov    $0x1c,%eax
 54f:	cd 40                	int    $0x40
 551:	c3                   	ret    

00000552 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 552:	55                   	push   %ebp
 553:	89 e5                	mov    %esp,%ebp
 555:	83 ec 18             	sub    $0x18,%esp
 558:	8b 45 0c             	mov    0xc(%ebp),%eax
 55b:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 55e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 565:	00 
 566:	8d 45 f4             	lea    -0xc(%ebp),%eax
 569:	89 44 24 04          	mov    %eax,0x4(%esp)
 56d:	8b 45 08             	mov    0x8(%ebp),%eax
 570:	89 04 24             	mov    %eax,(%esp)
 573:	e8 22 ff ff ff       	call   49a <write>
}
 578:	c9                   	leave  
 579:	c3                   	ret    

0000057a <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 57a:	55                   	push   %ebp
 57b:	89 e5                	mov    %esp,%ebp
 57d:	56                   	push   %esi
 57e:	53                   	push   %ebx
 57f:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 582:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 589:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 58d:	74 17                	je     5a6 <printint+0x2c>
 58f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 593:	79 11                	jns    5a6 <printint+0x2c>
    neg = 1;
 595:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 59c:	8b 45 0c             	mov    0xc(%ebp),%eax
 59f:	f7 d8                	neg    %eax
 5a1:	89 45 ec             	mov    %eax,-0x14(%ebp)
 5a4:	eb 06                	jmp    5ac <printint+0x32>
  } else {
    x = xx;
 5a6:	8b 45 0c             	mov    0xc(%ebp),%eax
 5a9:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 5ac:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 5b3:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 5b6:	8d 41 01             	lea    0x1(%ecx),%eax
 5b9:	89 45 f4             	mov    %eax,-0xc(%ebp)
 5bc:	8b 5d 10             	mov    0x10(%ebp),%ebx
 5bf:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5c2:	ba 00 00 00 00       	mov    $0x0,%edx
 5c7:	f7 f3                	div    %ebx
 5c9:	89 d0                	mov    %edx,%eax
 5cb:	0f b6 80 f4 0c 00 00 	movzbl 0xcf4(%eax),%eax
 5d2:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 5d6:	8b 75 10             	mov    0x10(%ebp),%esi
 5d9:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5dc:	ba 00 00 00 00       	mov    $0x0,%edx
 5e1:	f7 f6                	div    %esi
 5e3:	89 45 ec             	mov    %eax,-0x14(%ebp)
 5e6:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5ea:	75 c7                	jne    5b3 <printint+0x39>
  if(neg)
 5ec:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 5f0:	74 10                	je     602 <printint+0x88>
    buf[i++] = '-';
 5f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5f5:	8d 50 01             	lea    0x1(%eax),%edx
 5f8:	89 55 f4             	mov    %edx,-0xc(%ebp)
 5fb:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 600:	eb 1f                	jmp    621 <printint+0xa7>
 602:	eb 1d                	jmp    621 <printint+0xa7>
    putc(fd, buf[i]);
 604:	8d 55 dc             	lea    -0x24(%ebp),%edx
 607:	8b 45 f4             	mov    -0xc(%ebp),%eax
 60a:	01 d0                	add    %edx,%eax
 60c:	0f b6 00             	movzbl (%eax),%eax
 60f:	0f be c0             	movsbl %al,%eax
 612:	89 44 24 04          	mov    %eax,0x4(%esp)
 616:	8b 45 08             	mov    0x8(%ebp),%eax
 619:	89 04 24             	mov    %eax,(%esp)
 61c:	e8 31 ff ff ff       	call   552 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 621:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 625:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 629:	79 d9                	jns    604 <printint+0x8a>
    putc(fd, buf[i]);
}
 62b:	83 c4 30             	add    $0x30,%esp
 62e:	5b                   	pop    %ebx
 62f:	5e                   	pop    %esi
 630:	5d                   	pop    %ebp
 631:	c3                   	ret    

00000632 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 632:	55                   	push   %ebp
 633:	89 e5                	mov    %esp,%ebp
 635:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 638:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 63f:	8d 45 0c             	lea    0xc(%ebp),%eax
 642:	83 c0 04             	add    $0x4,%eax
 645:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 648:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 64f:	e9 7c 01 00 00       	jmp    7d0 <printf+0x19e>
    c = fmt[i] & 0xff;
 654:	8b 55 0c             	mov    0xc(%ebp),%edx
 657:	8b 45 f0             	mov    -0x10(%ebp),%eax
 65a:	01 d0                	add    %edx,%eax
 65c:	0f b6 00             	movzbl (%eax),%eax
 65f:	0f be c0             	movsbl %al,%eax
 662:	25 ff 00 00 00       	and    $0xff,%eax
 667:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 66a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 66e:	75 2c                	jne    69c <printf+0x6a>
      if(c == '%'){
 670:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 674:	75 0c                	jne    682 <printf+0x50>
        state = '%';
 676:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 67d:	e9 4a 01 00 00       	jmp    7cc <printf+0x19a>
      } else {
        putc(fd, c);
 682:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 685:	0f be c0             	movsbl %al,%eax
 688:	89 44 24 04          	mov    %eax,0x4(%esp)
 68c:	8b 45 08             	mov    0x8(%ebp),%eax
 68f:	89 04 24             	mov    %eax,(%esp)
 692:	e8 bb fe ff ff       	call   552 <putc>
 697:	e9 30 01 00 00       	jmp    7cc <printf+0x19a>
      }
    } else if(state == '%'){
 69c:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 6a0:	0f 85 26 01 00 00    	jne    7cc <printf+0x19a>
      if(c == 'd'){
 6a6:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 6aa:	75 2d                	jne    6d9 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 6ac:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6af:	8b 00                	mov    (%eax),%eax
 6b1:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 6b8:	00 
 6b9:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 6c0:	00 
 6c1:	89 44 24 04          	mov    %eax,0x4(%esp)
 6c5:	8b 45 08             	mov    0x8(%ebp),%eax
 6c8:	89 04 24             	mov    %eax,(%esp)
 6cb:	e8 aa fe ff ff       	call   57a <printint>
        ap++;
 6d0:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6d4:	e9 ec 00 00 00       	jmp    7c5 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 6d9:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 6dd:	74 06                	je     6e5 <printf+0xb3>
 6df:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 6e3:	75 2d                	jne    712 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 6e5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6e8:	8b 00                	mov    (%eax),%eax
 6ea:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 6f1:	00 
 6f2:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 6f9:	00 
 6fa:	89 44 24 04          	mov    %eax,0x4(%esp)
 6fe:	8b 45 08             	mov    0x8(%ebp),%eax
 701:	89 04 24             	mov    %eax,(%esp)
 704:	e8 71 fe ff ff       	call   57a <printint>
        ap++;
 709:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 70d:	e9 b3 00 00 00       	jmp    7c5 <printf+0x193>
      } else if(c == 's'){
 712:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 716:	75 45                	jne    75d <printf+0x12b>
        s = (char*)*ap;
 718:	8b 45 e8             	mov    -0x18(%ebp),%eax
 71b:	8b 00                	mov    (%eax),%eax
 71d:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 720:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 724:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 728:	75 09                	jne    733 <printf+0x101>
          s = "(null)";
 72a:	c7 45 f4 a4 0a 00 00 	movl   $0xaa4,-0xc(%ebp)
        while(*s != 0){
 731:	eb 1e                	jmp    751 <printf+0x11f>
 733:	eb 1c                	jmp    751 <printf+0x11f>
          putc(fd, *s);
 735:	8b 45 f4             	mov    -0xc(%ebp),%eax
 738:	0f b6 00             	movzbl (%eax),%eax
 73b:	0f be c0             	movsbl %al,%eax
 73e:	89 44 24 04          	mov    %eax,0x4(%esp)
 742:	8b 45 08             	mov    0x8(%ebp),%eax
 745:	89 04 24             	mov    %eax,(%esp)
 748:	e8 05 fe ff ff       	call   552 <putc>
          s++;
 74d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 751:	8b 45 f4             	mov    -0xc(%ebp),%eax
 754:	0f b6 00             	movzbl (%eax),%eax
 757:	84 c0                	test   %al,%al
 759:	75 da                	jne    735 <printf+0x103>
 75b:	eb 68                	jmp    7c5 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 75d:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 761:	75 1d                	jne    780 <printf+0x14e>
        putc(fd, *ap);
 763:	8b 45 e8             	mov    -0x18(%ebp),%eax
 766:	8b 00                	mov    (%eax),%eax
 768:	0f be c0             	movsbl %al,%eax
 76b:	89 44 24 04          	mov    %eax,0x4(%esp)
 76f:	8b 45 08             	mov    0x8(%ebp),%eax
 772:	89 04 24             	mov    %eax,(%esp)
 775:	e8 d8 fd ff ff       	call   552 <putc>
        ap++;
 77a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 77e:	eb 45                	jmp    7c5 <printf+0x193>
      } else if(c == '%'){
 780:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 784:	75 17                	jne    79d <printf+0x16b>
        putc(fd, c);
 786:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 789:	0f be c0             	movsbl %al,%eax
 78c:	89 44 24 04          	mov    %eax,0x4(%esp)
 790:	8b 45 08             	mov    0x8(%ebp),%eax
 793:	89 04 24             	mov    %eax,(%esp)
 796:	e8 b7 fd ff ff       	call   552 <putc>
 79b:	eb 28                	jmp    7c5 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 79d:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 7a4:	00 
 7a5:	8b 45 08             	mov    0x8(%ebp),%eax
 7a8:	89 04 24             	mov    %eax,(%esp)
 7ab:	e8 a2 fd ff ff       	call   552 <putc>
        putc(fd, c);
 7b0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7b3:	0f be c0             	movsbl %al,%eax
 7b6:	89 44 24 04          	mov    %eax,0x4(%esp)
 7ba:	8b 45 08             	mov    0x8(%ebp),%eax
 7bd:	89 04 24             	mov    %eax,(%esp)
 7c0:	e8 8d fd ff ff       	call   552 <putc>
      }
      state = 0;
 7c5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 7cc:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 7d0:	8b 55 0c             	mov    0xc(%ebp),%edx
 7d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7d6:	01 d0                	add    %edx,%eax
 7d8:	0f b6 00             	movzbl (%eax),%eax
 7db:	84 c0                	test   %al,%al
 7dd:	0f 85 71 fe ff ff    	jne    654 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 7e3:	c9                   	leave  
 7e4:	c3                   	ret    

000007e5 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7e5:	55                   	push   %ebp
 7e6:	89 e5                	mov    %esp,%ebp
 7e8:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7eb:	8b 45 08             	mov    0x8(%ebp),%eax
 7ee:	83 e8 08             	sub    $0x8,%eax
 7f1:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7f4:	a1 10 0d 00 00       	mov    0xd10,%eax
 7f9:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7fc:	eb 24                	jmp    822 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7fe:	8b 45 fc             	mov    -0x4(%ebp),%eax
 801:	8b 00                	mov    (%eax),%eax
 803:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 806:	77 12                	ja     81a <free+0x35>
 808:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 80e:	77 24                	ja     834 <free+0x4f>
 810:	8b 45 fc             	mov    -0x4(%ebp),%eax
 813:	8b 00                	mov    (%eax),%eax
 815:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 818:	77 1a                	ja     834 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 81a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 81d:	8b 00                	mov    (%eax),%eax
 81f:	89 45 fc             	mov    %eax,-0x4(%ebp)
 822:	8b 45 f8             	mov    -0x8(%ebp),%eax
 825:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 828:	76 d4                	jbe    7fe <free+0x19>
 82a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 82d:	8b 00                	mov    (%eax),%eax
 82f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 832:	76 ca                	jbe    7fe <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 834:	8b 45 f8             	mov    -0x8(%ebp),%eax
 837:	8b 40 04             	mov    0x4(%eax),%eax
 83a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 841:	8b 45 f8             	mov    -0x8(%ebp),%eax
 844:	01 c2                	add    %eax,%edx
 846:	8b 45 fc             	mov    -0x4(%ebp),%eax
 849:	8b 00                	mov    (%eax),%eax
 84b:	39 c2                	cmp    %eax,%edx
 84d:	75 24                	jne    873 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 84f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 852:	8b 50 04             	mov    0x4(%eax),%edx
 855:	8b 45 fc             	mov    -0x4(%ebp),%eax
 858:	8b 00                	mov    (%eax),%eax
 85a:	8b 40 04             	mov    0x4(%eax),%eax
 85d:	01 c2                	add    %eax,%edx
 85f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 862:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 865:	8b 45 fc             	mov    -0x4(%ebp),%eax
 868:	8b 00                	mov    (%eax),%eax
 86a:	8b 10                	mov    (%eax),%edx
 86c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 86f:	89 10                	mov    %edx,(%eax)
 871:	eb 0a                	jmp    87d <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 873:	8b 45 fc             	mov    -0x4(%ebp),%eax
 876:	8b 10                	mov    (%eax),%edx
 878:	8b 45 f8             	mov    -0x8(%ebp),%eax
 87b:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 87d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 880:	8b 40 04             	mov    0x4(%eax),%eax
 883:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 88a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 88d:	01 d0                	add    %edx,%eax
 88f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 892:	75 20                	jne    8b4 <free+0xcf>
    p->s.size += bp->s.size;
 894:	8b 45 fc             	mov    -0x4(%ebp),%eax
 897:	8b 50 04             	mov    0x4(%eax),%edx
 89a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 89d:	8b 40 04             	mov    0x4(%eax),%eax
 8a0:	01 c2                	add    %eax,%edx
 8a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8a5:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8a8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8ab:	8b 10                	mov    (%eax),%edx
 8ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8b0:	89 10                	mov    %edx,(%eax)
 8b2:	eb 08                	jmp    8bc <free+0xd7>
  } else
    p->s.ptr = bp;
 8b4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8b7:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8ba:	89 10                	mov    %edx,(%eax)
  freep = p;
 8bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8bf:	a3 10 0d 00 00       	mov    %eax,0xd10
}
 8c4:	c9                   	leave  
 8c5:	c3                   	ret    

000008c6 <morecore>:

static Header*
morecore(uint nu)
{
 8c6:	55                   	push   %ebp
 8c7:	89 e5                	mov    %esp,%ebp
 8c9:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 8cc:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 8d3:	77 07                	ja     8dc <morecore+0x16>
    nu = 4096;
 8d5:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 8dc:	8b 45 08             	mov    0x8(%ebp),%eax
 8df:	c1 e0 03             	shl    $0x3,%eax
 8e2:	89 04 24             	mov    %eax,(%esp)
 8e5:	e8 18 fc ff ff       	call   502 <sbrk>
 8ea:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 8ed:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 8f1:	75 07                	jne    8fa <morecore+0x34>
    return 0;
 8f3:	b8 00 00 00 00       	mov    $0x0,%eax
 8f8:	eb 22                	jmp    91c <morecore+0x56>
  hp = (Header*)p;
 8fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8fd:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 900:	8b 45 f0             	mov    -0x10(%ebp),%eax
 903:	8b 55 08             	mov    0x8(%ebp),%edx
 906:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 909:	8b 45 f0             	mov    -0x10(%ebp),%eax
 90c:	83 c0 08             	add    $0x8,%eax
 90f:	89 04 24             	mov    %eax,(%esp)
 912:	e8 ce fe ff ff       	call   7e5 <free>
  return freep;
 917:	a1 10 0d 00 00       	mov    0xd10,%eax
}
 91c:	c9                   	leave  
 91d:	c3                   	ret    

0000091e <malloc>:

void*
malloc(uint nbytes)
{
 91e:	55                   	push   %ebp
 91f:	89 e5                	mov    %esp,%ebp
 921:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 924:	8b 45 08             	mov    0x8(%ebp),%eax
 927:	83 c0 07             	add    $0x7,%eax
 92a:	c1 e8 03             	shr    $0x3,%eax
 92d:	83 c0 01             	add    $0x1,%eax
 930:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 933:	a1 10 0d 00 00       	mov    0xd10,%eax
 938:	89 45 f0             	mov    %eax,-0x10(%ebp)
 93b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 93f:	75 23                	jne    964 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 941:	c7 45 f0 08 0d 00 00 	movl   $0xd08,-0x10(%ebp)
 948:	8b 45 f0             	mov    -0x10(%ebp),%eax
 94b:	a3 10 0d 00 00       	mov    %eax,0xd10
 950:	a1 10 0d 00 00       	mov    0xd10,%eax
 955:	a3 08 0d 00 00       	mov    %eax,0xd08
    base.s.size = 0;
 95a:	c7 05 0c 0d 00 00 00 	movl   $0x0,0xd0c
 961:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 964:	8b 45 f0             	mov    -0x10(%ebp),%eax
 967:	8b 00                	mov    (%eax),%eax
 969:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 96c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 96f:	8b 40 04             	mov    0x4(%eax),%eax
 972:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 975:	72 4d                	jb     9c4 <malloc+0xa6>
      if(p->s.size == nunits)
 977:	8b 45 f4             	mov    -0xc(%ebp),%eax
 97a:	8b 40 04             	mov    0x4(%eax),%eax
 97d:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 980:	75 0c                	jne    98e <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 982:	8b 45 f4             	mov    -0xc(%ebp),%eax
 985:	8b 10                	mov    (%eax),%edx
 987:	8b 45 f0             	mov    -0x10(%ebp),%eax
 98a:	89 10                	mov    %edx,(%eax)
 98c:	eb 26                	jmp    9b4 <malloc+0x96>
      else {
        p->s.size -= nunits;
 98e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 991:	8b 40 04             	mov    0x4(%eax),%eax
 994:	2b 45 ec             	sub    -0x14(%ebp),%eax
 997:	89 c2                	mov    %eax,%edx
 999:	8b 45 f4             	mov    -0xc(%ebp),%eax
 99c:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 99f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9a2:	8b 40 04             	mov    0x4(%eax),%eax
 9a5:	c1 e0 03             	shl    $0x3,%eax
 9a8:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 9ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9ae:	8b 55 ec             	mov    -0x14(%ebp),%edx
 9b1:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 9b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9b7:	a3 10 0d 00 00       	mov    %eax,0xd10
      return (void*)(p + 1);
 9bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9bf:	83 c0 08             	add    $0x8,%eax
 9c2:	eb 38                	jmp    9fc <malloc+0xde>
    }
    if(p == freep)
 9c4:	a1 10 0d 00 00       	mov    0xd10,%eax
 9c9:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 9cc:	75 1b                	jne    9e9 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 9ce:	8b 45 ec             	mov    -0x14(%ebp),%eax
 9d1:	89 04 24             	mov    %eax,(%esp)
 9d4:	e8 ed fe ff ff       	call   8c6 <morecore>
 9d9:	89 45 f4             	mov    %eax,-0xc(%ebp)
 9dc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 9e0:	75 07                	jne    9e9 <malloc+0xcb>
        return 0;
 9e2:	b8 00 00 00 00       	mov    $0x0,%eax
 9e7:	eb 13                	jmp    9fc <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9ec:	89 45 f0             	mov    %eax,-0x10(%ebp)
 9ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9f2:	8b 00                	mov    (%eax),%eax
 9f4:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 9f7:	e9 70 ff ff ff       	jmp    96c <malloc+0x4e>
}
 9fc:	c9                   	leave  
 9fd:	c3                   	ret    
