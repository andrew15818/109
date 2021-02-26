
got:     file format elf64-x86-64


Disassembly of section .interp:

0000000000000238 <.interp>:
 238:	2f                   	(bad)  
 239:	6c                   	ins    BYTE PTR es:[rdi],dx
 23a:	69 62 36 34 2f 6c 64 	imul   esp,DWORD PTR [rdx+0x36],0x646c2f34
 241:	2d 6c 69 6e 75       	sub    eax,0x756e696c
 246:	78 2d                	js     275 <_init-0x273>
 248:	78 38                	js     282 <_init-0x266>
 24a:	36 2d 36 34 2e 73    	ss sub eax,0x732e3436
 250:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 251:	2e 32 00             	xor    al,BYTE PTR cs:[rax]

Disassembly of section .note.ABI-tag:

0000000000000254 <.note.ABI-tag>:
 254:	04 00                	add    al,0x0
 256:	00 00                	add    BYTE PTR [rax],al
 258:	10 00                	adc    BYTE PTR [rax],al
 25a:	00 00                	add    BYTE PTR [rax],al
 25c:	01 00                	add    DWORD PTR [rax],eax
 25e:	00 00                	add    BYTE PTR [rax],al
 260:	47                   	rex.RXB
 261:	4e 55                	rex.WRX push rbp
 263:	00 00                	add    BYTE PTR [rax],al
 265:	00 00                	add    BYTE PTR [rax],al
 267:	00 03                	add    BYTE PTR [rbx],al
 269:	00 00                	add    BYTE PTR [rax],al
 26b:	00 02                	add    BYTE PTR [rdx],al
 26d:	00 00                	add    BYTE PTR [rax],al
 26f:	00 00                	add    BYTE PTR [rax],al
 271:	00 00                	add    BYTE PTR [rax],al
	...

Disassembly of section .note.gnu.build-id:

0000000000000274 <.note.gnu.build-id>:
 274:	04 00                	add    al,0x0
 276:	00 00                	add    BYTE PTR [rax],al
 278:	14 00                	adc    al,0x0
 27a:	00 00                	add    BYTE PTR [rax],al
 27c:	03 00                	add    eax,DWORD PTR [rax]
 27e:	00 00                	add    BYTE PTR [rax],al
 280:	47                   	rex.RXB
 281:	4e 55                	rex.WRX push rbp
 283:	00 27                	add    BYTE PTR [rdi],ah
 285:	0e                   	(bad)  
 286:	1d 8a 9f f6 9d       	sbb    eax,0x9df69f8a
 28b:	ac                   	lods   al,BYTE PTR ds:[rsi]
 28c:	f7 f1                	div    ecx
 28e:	78 0a                	js     29a <_init-0x24e>
 290:	e3 6e                	jrcxz  300 <_init-0x1e8>
 292:	10 d8                	adc    al,bl
 294:	8b 5a 13             	mov    ebx,DWORD PTR [rdx+0x13]
 297:	65                   	gs

Disassembly of section .gnu.hash:

0000000000000298 <.gnu.hash>:
 298:	01 00                	add    DWORD PTR [rax],eax
 29a:	00 00                	add    BYTE PTR [rax],al
 29c:	01 00                	add    DWORD PTR [rax],eax
 29e:	00 00                	add    BYTE PTR [rax],al
 2a0:	01 00                	add    DWORD PTR [rax],eax
	...

Disassembly of section .dynsym:

00000000000002b8 <.dynsym>:
	...
 2d0:	3d 00 00 00 20       	cmp    eax,0x20000000
	...
 2e5:	00 00                	add    BYTE PTR [rax],al
 2e7:	00 0b                	add    BYTE PTR [rbx],cl
 2e9:	00 00                	add    BYTE PTR [rax],al
 2eb:	00 12                	add    BYTE PTR [rdx],dl
	...
 2fd:	00 00                	add    BYTE PTR [rax],al
 2ff:	00 1f                	add    BYTE PTR [rdi],bl
 301:	00 00                	add    BYTE PTR [rax],al
 303:	00 12                	add    BYTE PTR [rdx],dl
	...
 315:	00 00                	add    BYTE PTR [rax],al
 317:	00 59 00             	add    BYTE PTR [rcx+0x0],bl
 31a:	00 00                	add    BYTE PTR [rax],al
 31c:	20 00                	and    BYTE PTR [rax],al
	...
 32e:	00 00                	add    BYTE PTR [rax],al
 330:	68 00 00 00 20       	push   0x20000000
	...
 345:	00 00                	add    BYTE PTR [rax],al
 347:	00 10                	add    BYTE PTR [rax],dl
 349:	00 00                	add    BYTE PTR [rax],al
 34b:	00 22                	add    BYTE PTR [rdx],ah
	...

Disassembly of section .dynstr:

0000000000000360 <.dynstr>:
 360:	00 6c 69 62          	add    BYTE PTR [rcx+rbp*2+0x62],ch
 364:	63 2e                	movsxd ebp,DWORD PTR [rsi]
 366:	73 6f                	jae    3d7 <_init-0x111>
 368:	2e 36 00 70 75       	cs add BYTE PTR ss:[rax+0x75],dh
 36d:	74 73                	je     3e2 <_init-0x106>
 36f:	00 5f 5f             	add    BYTE PTR [rdi+0x5f],bl
 372:	63 78 61             	movsxd edi,DWORD PTR [rax+0x61]
 375:	5f                   	pop    rdi
 376:	66 69 6e 61 6c 69    	imul   bp,WORD PTR [rsi+0x61],0x696c
 37c:	7a 65                	jp     3e3 <_init-0x105>
 37e:	00 5f 5f             	add    BYTE PTR [rdi+0x5f],bl
 381:	6c                   	ins    BYTE PTR es:[rdi],dx
 382:	69 62 63 5f 73 74 61 	imul   esp,DWORD PTR [rdx+0x63],0x6174735f
 389:	72 74                	jb     3ff <_init-0xe9>
 38b:	5f                   	pop    rdi
 38c:	6d                   	ins    DWORD PTR es:[rdi],dx
 38d:	61                   	(bad)  
 38e:	69 6e 00 47 4c 49 42 	imul   ebp,DWORD PTR [rsi+0x0],0x42494c47
 395:	43 5f                	rex.XB pop r15
 397:	32 2e                	xor    ch,BYTE PTR [rsi]
 399:	32 2e                	xor    ch,BYTE PTR [rsi]
 39b:	35 00 5f 49 54       	xor    eax,0x54495f00
 3a0:	4d 5f                	rex.WRB pop r15
 3a2:	64 65 72 65          	fs gs jb 40b <_init-0xdd>
 3a6:	67 69 73 74 65 72 54 	imul   esi,DWORD PTR [ebx+0x74],0x4d547265
 3ad:	4d 
 3ae:	43 6c                	rex.XB ins BYTE PTR es:[rdi],dx
 3b0:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 3b1:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 3b2:	65 54                	gs push rsp
 3b4:	61                   	(bad)  
 3b5:	62                   	(bad)  
 3b6:	6c                   	ins    BYTE PTR es:[rdi],dx
 3b7:	65 00 5f 5f          	add    BYTE PTR gs:[rdi+0x5f],bl
 3bb:	67 6d                	ins    DWORD PTR es:[edi],dx
 3bd:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 3be:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 3bf:	5f                   	pop    rdi
 3c0:	73 74                	jae    436 <_init-0xb2>
 3c2:	61                   	(bad)  
 3c3:	72 74                	jb     439 <_init-0xaf>
 3c5:	5f                   	pop    rdi
 3c6:	5f                   	pop    rdi
 3c7:	00 5f 49             	add    BYTE PTR [rdi+0x49],bl
 3ca:	54                   	push   rsp
 3cb:	4d 5f                	rex.WRB pop r15
 3cd:	72 65                	jb     434 <_init-0xb4>
 3cf:	67 69 73 74 65 72 54 	imul   esi,DWORD PTR [ebx+0x74],0x4d547265
 3d6:	4d 
 3d7:	43 6c                	rex.XB ins BYTE PTR es:[rdi],dx
 3d9:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 3da:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 3db:	65 54                	gs push rsp
 3dd:	61                   	(bad)  
 3de:	62                   	.byte 0x62
 3df:	6c                   	ins    BYTE PTR es:[rdi],dx
 3e0:	65                   	gs
	...

Disassembly of section .gnu.version:

00000000000003e2 <.gnu.version>:
 3e2:	00 00                	add    BYTE PTR [rax],al
 3e4:	00 00                	add    BYTE PTR [rax],al
 3e6:	02 00                	add    al,BYTE PTR [rax]
 3e8:	02 00                	add    al,BYTE PTR [rax]
 3ea:	00 00                	add    BYTE PTR [rax],al
 3ec:	00 00                	add    BYTE PTR [rax],al
 3ee:	02 00                	add    al,BYTE PTR [rax]

Disassembly of section .gnu.version_r:

00000000000003f0 <.gnu.version_r>:
 3f0:	01 00                	add    DWORD PTR [rax],eax
 3f2:	01 00                	add    DWORD PTR [rax],eax
 3f4:	01 00                	add    DWORD PTR [rax],eax
 3f6:	00 00                	add    BYTE PTR [rax],al
 3f8:	10 00                	adc    BYTE PTR [rax],al
 3fa:	00 00                	add    BYTE PTR [rax],al
 3fc:	00 00                	add    BYTE PTR [rax],al
 3fe:	00 00                	add    BYTE PTR [rax],al
 400:	75 1a                	jne    41c <_init-0xcc>
 402:	69 09 00 00 02 00    	imul   ecx,DWORD PTR [rcx],0x20000
 408:	31 00                	xor    DWORD PTR [rax],eax
 40a:	00 00                	add    BYTE PTR [rax],al
 40c:	00 00                	add    BYTE PTR [rax],al
	...

Disassembly of section .rela.dyn:

0000000000000410 <.rela.dyn>:
 410:	b8 0d 20 00 00       	mov    eax,0x200d
 415:	00 00                	add    BYTE PTR [rax],al
 417:	00 08                	add    BYTE PTR [rax],cl
 419:	00 00                	add    BYTE PTR [rax],al
 41b:	00 00                	add    BYTE PTR [rax],al
 41d:	00 00                	add    BYTE PTR [rax],al
 41f:	00 30                	add    BYTE PTR [rax],dh
 421:	06                   	(bad)  
 422:	00 00                	add    BYTE PTR [rax],al
 424:	00 00                	add    BYTE PTR [rax],al
 426:	00 00                	add    BYTE PTR [rax],al
 428:	c0 0d 20 00 00 00 00 	ror    BYTE PTR [rip+0x20],0x0        # 44f <_init-0x99>
 42f:	00 08                	add    BYTE PTR [rax],cl
 431:	00 00                	add    BYTE PTR [rax],al
 433:	00 00                	add    BYTE PTR [rax],al
 435:	00 00                	add    BYTE PTR [rax],al
 437:	00 f0                	add    al,dh
 439:	05 00 00 00 00       	add    eax,0x0
 43e:	00 00                	add    BYTE PTR [rax],al
 440:	08 10                	or     BYTE PTR [rax],dl
 442:	20 00                	and    BYTE PTR [rax],al
 444:	00 00                	add    BYTE PTR [rax],al
 446:	00 00                	add    BYTE PTR [rax],al
 448:	08 00                	or     BYTE PTR [rax],al
 44a:	00 00                	add    BYTE PTR [rax],al
 44c:	00 00                	add    BYTE PTR [rax],al
 44e:	00 00                	add    BYTE PTR [rax],al
 450:	08 10                	or     BYTE PTR [rax],dl
 452:	20 00                	and    BYTE PTR [rax],al
 454:	00 00                	add    BYTE PTR [rax],al
 456:	00 00                	add    BYTE PTR [rax],al
 458:	d8 0f                	fmul   DWORD PTR [rdi]
 45a:	20 00                	and    BYTE PTR [rax],al
 45c:	00 00                	add    BYTE PTR [rax],al
 45e:	00 00                	add    BYTE PTR [rax],al
 460:	06                   	(bad)  
 461:	00 00                	add    BYTE PTR [rax],al
 463:	00 01                	add    BYTE PTR [rcx],al
	...
 46d:	00 00                	add    BYTE PTR [rax],al
 46f:	00 e0                	add    al,ah
 471:	0f 20 00             	mov    rax,cr0
 474:	00 00                	add    BYTE PTR [rax],al
 476:	00 00                	add    BYTE PTR [rax],al
 478:	06                   	(bad)  
 479:	00 00                	add    BYTE PTR [rax],al
 47b:	00 03                	add    BYTE PTR [rbx],al
	...
 485:	00 00                	add    BYTE PTR [rax],al
 487:	00 e8                	add    al,ch
 489:	0f 20 00             	mov    rax,cr0
 48c:	00 00                	add    BYTE PTR [rax],al
 48e:	00 00                	add    BYTE PTR [rax],al
 490:	06                   	(bad)  
 491:	00 00                	add    BYTE PTR [rax],al
 493:	00 04 00             	add    BYTE PTR [rax+rax*1],al
	...
 49e:	00 00                	add    BYTE PTR [rax],al
 4a0:	f0 0f 20 00          	lock mov rax,cr0
 4a4:	00 00                	add    BYTE PTR [rax],al
 4a6:	00 00                	add    BYTE PTR [rax],al
 4a8:	06                   	(bad)  
 4a9:	00 00                	add    BYTE PTR [rax],al
 4ab:	00 05 00 00 00 00    	add    BYTE PTR [rip+0x0],al        # 4b1 <_init-0x37>
 4b1:	00 00                	add    BYTE PTR [rax],al
 4b3:	00 00                	add    BYTE PTR [rax],al
 4b5:	00 00                	add    BYTE PTR [rax],al
 4b7:	00 f8                	add    al,bh
 4b9:	0f 20 00             	mov    rax,cr0
 4bc:	00 00                	add    BYTE PTR [rax],al
 4be:	00 00                	add    BYTE PTR [rax],al
 4c0:	06                   	(bad)  
 4c1:	00 00                	add    BYTE PTR [rax],al
 4c3:	00 06                	add    BYTE PTR [rsi],al
	...

Disassembly of section .rela.plt:

00000000000004d0 <.rela.plt>:
 4d0:	d0 0f                	ror    BYTE PTR [rdi],1
 4d2:	20 00                	and    BYTE PTR [rax],al
 4d4:	00 00                	add    BYTE PTR [rax],al
 4d6:	00 00                	add    BYTE PTR [rax],al
 4d8:	07                   	(bad)  
 4d9:	00 00                	add    BYTE PTR [rax],al
 4db:	00 02                	add    BYTE PTR [rdx],al
	...

Disassembly of section .init:

00000000000004e8 <_init>:
 4e8:	48 83 ec 08          	sub    rsp,0x8
 4ec:	48 8b 05 f5 0a 20 00 	mov    rax,QWORD PTR [rip+0x200af5]        # 200fe8 <__gmon_start__>
 4f3:	48 85 c0             	test   rax,rax
 4f6:	74 02                	je     4fa <_init+0x12>
 4f8:	ff d0                	call   rax
 4fa:	48 83 c4 08          	add    rsp,0x8
 4fe:	c3                   	ret    

Disassembly of section .plt:

0000000000000500 <.plt>:
 500:	ff 35 ba 0a 20 00    	push   QWORD PTR [rip+0x200aba]        # 200fc0 <_GLOBAL_OFFSET_TABLE_+0x8>
 506:	ff 25 bc 0a 20 00    	jmp    QWORD PTR [rip+0x200abc]        # 200fc8 <_GLOBAL_OFFSET_TABLE_+0x10>
 50c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000000510 <puts@plt>:
 510:	ff 25 ba 0a 20 00    	jmp    QWORD PTR [rip+0x200aba]        # 200fd0 <puts@GLIBC_2.2.5>
 516:	68 00 00 00 00       	push   0x0
 51b:	e9 e0 ff ff ff       	jmp    500 <.plt>

Disassembly of section .plt.got:

0000000000000520 <__cxa_finalize@plt>:
 520:	ff 25 d2 0a 20 00    	jmp    QWORD PTR [rip+0x200ad2]        # 200ff8 <__cxa_finalize@GLIBC_2.2.5>
 526:	66 90                	xchg   ax,ax

Disassembly of section .text:

0000000000000530 <_start>:
 530:	31 ed                	xor    ebp,ebp
 532:	49 89 d1             	mov    r9,rdx
 535:	5e                   	pop    rsi
 536:	48 89 e2             	mov    rdx,rsp
 539:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
 53d:	50                   	push   rax
 53e:	54                   	push   rsp
 53f:	4c 8d 05 8a 01 00 00 	lea    r8,[rip+0x18a]        # 6d0 <__libc_csu_fini>
 546:	48 8d 0d 13 01 00 00 	lea    rcx,[rip+0x113]        # 660 <__libc_csu_init>
 54d:	48 8d 3d e6 00 00 00 	lea    rdi,[rip+0xe6]        # 63a <main>
 554:	ff 15 86 0a 20 00    	call   QWORD PTR [rip+0x200a86]        # 200fe0 <__libc_start_main@GLIBC_2.2.5>
 55a:	f4                   	hlt    
 55b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000000560 <deregister_tm_clones>:
 560:	48 8d 3d a9 0a 20 00 	lea    rdi,[rip+0x200aa9]        # 201010 <__TMC_END__>
 567:	55                   	push   rbp
 568:	48 8d 05 a1 0a 20 00 	lea    rax,[rip+0x200aa1]        # 201010 <__TMC_END__>
 56f:	48 39 f8             	cmp    rax,rdi
 572:	48 89 e5             	mov    rbp,rsp
 575:	74 19                	je     590 <deregister_tm_clones+0x30>
 577:	48 8b 05 5a 0a 20 00 	mov    rax,QWORD PTR [rip+0x200a5a]        # 200fd8 <_ITM_deregisterTMCloneTable>
 57e:	48 85 c0             	test   rax,rax
 581:	74 0d                	je     590 <deregister_tm_clones+0x30>
 583:	5d                   	pop    rbp
 584:	ff e0                	jmp    rax
 586:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
 58d:	00 00 00 
 590:	5d                   	pop    rbp
 591:	c3                   	ret    
 592:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
 596:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
 59d:	00 00 00 

00000000000005a0 <register_tm_clones>:
 5a0:	48 8d 3d 69 0a 20 00 	lea    rdi,[rip+0x200a69]        # 201010 <__TMC_END__>
 5a7:	48 8d 35 62 0a 20 00 	lea    rsi,[rip+0x200a62]        # 201010 <__TMC_END__>
 5ae:	55                   	push   rbp
 5af:	48 29 fe             	sub    rsi,rdi
 5b2:	48 89 e5             	mov    rbp,rsp
 5b5:	48 c1 fe 03          	sar    rsi,0x3
 5b9:	48 89 f0             	mov    rax,rsi
 5bc:	48 c1 e8 3f          	shr    rax,0x3f
 5c0:	48 01 c6             	add    rsi,rax
 5c3:	48 d1 fe             	sar    rsi,1
 5c6:	74 18                	je     5e0 <register_tm_clones+0x40>
 5c8:	48 8b 05 21 0a 20 00 	mov    rax,QWORD PTR [rip+0x200a21]        # 200ff0 <_ITM_registerTMCloneTable>
 5cf:	48 85 c0             	test   rax,rax
 5d2:	74 0c                	je     5e0 <register_tm_clones+0x40>
 5d4:	5d                   	pop    rbp
 5d5:	ff e0                	jmp    rax
 5d7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
 5de:	00 00 
 5e0:	5d                   	pop    rbp
 5e1:	c3                   	ret    
 5e2:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
 5e6:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
 5ed:	00 00 00 

00000000000005f0 <__do_global_dtors_aux>:
 5f0:	80 3d 19 0a 20 00 00 	cmp    BYTE PTR [rip+0x200a19],0x0        # 201010 <__TMC_END__>
 5f7:	75 2f                	jne    628 <__do_global_dtors_aux+0x38>
 5f9:	48 83 3d f7 09 20 00 	cmp    QWORD PTR [rip+0x2009f7],0x0        # 200ff8 <__cxa_finalize@GLIBC_2.2.5>
 600:	00 
 601:	55                   	push   rbp
 602:	48 89 e5             	mov    rbp,rsp
 605:	74 0c                	je     613 <__do_global_dtors_aux+0x23>
 607:	48 8b 3d fa 09 20 00 	mov    rdi,QWORD PTR [rip+0x2009fa]        # 201008 <__dso_handle>
 60e:	e8 0d ff ff ff       	call   520 <__cxa_finalize@plt>
 613:	e8 48 ff ff ff       	call   560 <deregister_tm_clones>
 618:	c6 05 f1 09 20 00 01 	mov    BYTE PTR [rip+0x2009f1],0x1        # 201010 <__TMC_END__>
 61f:	5d                   	pop    rbp
 620:	c3                   	ret    
 621:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
 628:	f3 c3                	repz ret 
 62a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000000630 <frame_dummy>:
 630:	55                   	push   rbp
 631:	48 89 e5             	mov    rbp,rsp
 634:	5d                   	pop    rbp
 635:	e9 66 ff ff ff       	jmp    5a0 <register_tm_clones>

000000000000063a <main>:
 63a:	55                   	push   rbp
 63b:	48 89 e5             	mov    rbp,rsp
 63e:	48 8d 3d 9f 00 00 00 	lea    rdi,[rip+0x9f]        # 6e4 <_IO_stdin_used+0x4>
 645:	e8 c6 fe ff ff       	call   510 <puts@plt>
 64a:	48 8d 3d 99 00 00 00 	lea    rdi,[rip+0x99]        # 6ea <_IO_stdin_used+0xa>
 651:	e8 ba fe ff ff       	call   510 <puts@plt>
 656:	b8 00 00 00 00       	mov    eax,0x0
 65b:	5d                   	pop    rbp
 65c:	c3                   	ret    
 65d:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000000660 <__libc_csu_init>:
 660:	41 57                	push   r15
 662:	41 56                	push   r14
 664:	49 89 d7             	mov    r15,rdx
 667:	41 55                	push   r13
 669:	41 54                	push   r12
 66b:	4c 8d 25 46 07 20 00 	lea    r12,[rip+0x200746]        # 200db8 <__frame_dummy_init_array_entry>
 672:	55                   	push   rbp
 673:	48 8d 2d 46 07 20 00 	lea    rbp,[rip+0x200746]        # 200dc0 <__init_array_end>
 67a:	53                   	push   rbx
 67b:	41 89 fd             	mov    r13d,edi
 67e:	49 89 f6             	mov    r14,rsi
 681:	4c 29 e5             	sub    rbp,r12
 684:	48 83 ec 08          	sub    rsp,0x8
 688:	48 c1 fd 03          	sar    rbp,0x3
 68c:	e8 57 fe ff ff       	call   4e8 <_init>
 691:	48 85 ed             	test   rbp,rbp
 694:	74 20                	je     6b6 <__libc_csu_init+0x56>
 696:	31 db                	xor    ebx,ebx
 698:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
 69f:	00 
 6a0:	4c 89 fa             	mov    rdx,r15
 6a3:	4c 89 f6             	mov    rsi,r14
 6a6:	44 89 ef             	mov    edi,r13d
 6a9:	41 ff 14 dc          	call   QWORD PTR [r12+rbx*8]
 6ad:	48 83 c3 01          	add    rbx,0x1
 6b1:	48 39 dd             	cmp    rbp,rbx
 6b4:	75 ea                	jne    6a0 <__libc_csu_init+0x40>
 6b6:	48 83 c4 08          	add    rsp,0x8
 6ba:	5b                   	pop    rbx
 6bb:	5d                   	pop    rbp
 6bc:	41 5c                	pop    r12
 6be:	41 5d                	pop    r13
 6c0:	41 5e                	pop    r14
 6c2:	41 5f                	pop    r15
 6c4:	c3                   	ret    
 6c5:	90                   	nop
 6c6:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
 6cd:	00 00 00 

00000000000006d0 <__libc_csu_fini>:
 6d0:	f3 c3                	repz ret 

Disassembly of section .fini:

00000000000006d4 <_fini>:
 6d4:	48 83 ec 08          	sub    rsp,0x8
 6d8:	48 83 c4 08          	add    rsp,0x8
 6dc:	c3                   	ret    

Disassembly of section .rodata:

00000000000006e0 <_IO_stdin_used>:
 6e0:	01 00                	add    DWORD PTR [rax],eax
 6e2:	02 00                	add    al,BYTE PTR [rax]
 6e4:	68 65 6c 6c 6f       	push   0x6f6c6c65
 6e9:	00 77 6f             	add    BYTE PTR [rdi+0x6f],dh
 6ec:	72 6c                	jb     75a <__GNU_EH_FRAME_HDR+0x6a>
 6ee:	64                   	fs
	...

Disassembly of section .eh_frame_hdr:

00000000000006f0 <__GNU_EH_FRAME_HDR>:
 6f0:	01 1b                	add    DWORD PTR [rbx],ebx
 6f2:	03 3b                	add    edi,DWORD PTR [rbx]
 6f4:	3c 00                	cmp    al,0x0
 6f6:	00 00                	add    BYTE PTR [rax],al
 6f8:	06                   	(bad)  
 6f9:	00 00                	add    BYTE PTR [rax],al
 6fb:	00 10                	add    BYTE PTR [rax],dl
 6fd:	fe                   	(bad)  
 6fe:	ff                   	(bad)  
 6ff:	ff 88 00 00 00 30    	dec    DWORD PTR [rax+0x30000000]
 705:	fe                   	(bad)  
 706:	ff                   	(bad)  
 707:	ff b0 00 00 00 40    	push   QWORD PTR [rax+0x40000000]
 70d:	fe                   	(bad)  
 70e:	ff                   	(bad)  
 70f:	ff 58 00             	call   FWORD PTR [rax+0x0]
 712:	00 00                	add    BYTE PTR [rax],al
 714:	4a ff                	rex.WX (bad) 
 716:	ff                   	(bad)  
 717:	ff c8                	dec    eax
 719:	00 00                	add    BYTE PTR [rax],al
 71b:	00 70 ff             	add    BYTE PTR [rax-0x1],dh
 71e:	ff                   	(bad)  
 71f:	ff                   	(bad)  
 720:	e8 00 00 00 e0       	call   ffffffffe0000725 <_end+0xffffffffdfdff70d>
 725:	ff                   	(bad)  
 726:	ff                   	(bad)  
 727:	ff 30                	push   QWORD PTR [rax]
 729:	01 00                	add    DWORD PTR [rax],eax
	...

Disassembly of section .eh_frame:

0000000000000730 <__FRAME_END__-0x104>:
 730:	14 00                	adc    al,0x0
 732:	00 00                	add    BYTE PTR [rax],al
 734:	00 00                	add    BYTE PTR [rax],al
 736:	00 00                	add    BYTE PTR [rax],al
 738:	01 7a 52             	add    DWORD PTR [rdx+0x52],edi
 73b:	00 01                	add    BYTE PTR [rcx],al
 73d:	78 10                	js     74f <__GNU_EH_FRAME_HDR+0x5f>
 73f:	01 1b                	add    DWORD PTR [rbx],ebx
 741:	0c 07                	or     al,0x7
 743:	08 90 01 07 10 14    	or     BYTE PTR [rax+0x14100701],dl
 749:	00 00                	add    BYTE PTR [rax],al
 74b:	00 1c 00             	add    BYTE PTR [rax+rax*1],bl
 74e:	00 00                	add    BYTE PTR [rax],al
 750:	e0 fd                	loopne 74f <__GNU_EH_FRAME_HDR+0x5f>
 752:	ff                   	(bad)  
 753:	ff 2b                	jmp    FWORD PTR [rbx]
	...
 75d:	00 00                	add    BYTE PTR [rax],al
 75f:	00 14 00             	add    BYTE PTR [rax+rax*1],dl
 762:	00 00                	add    BYTE PTR [rax],al
 764:	00 00                	add    BYTE PTR [rax],al
 766:	00 00                	add    BYTE PTR [rax],al
 768:	01 7a 52             	add    DWORD PTR [rdx+0x52],edi
 76b:	00 01                	add    BYTE PTR [rcx],al
 76d:	78 10                	js     77f <__GNU_EH_FRAME_HDR+0x8f>
 76f:	01 1b                	add    DWORD PTR [rbx],ebx
 771:	0c 07                	or     al,0x7
 773:	08 90 01 00 00 24    	or     BYTE PTR [rax+0x24000001],dl
 779:	00 00                	add    BYTE PTR [rax],al
 77b:	00 1c 00             	add    BYTE PTR [rax+rax*1],bl
 77e:	00 00                	add    BYTE PTR [rax],al
 780:	80 fd ff             	cmp    ch,0xff
 783:	ff 20                	jmp    QWORD PTR [rax]
 785:	00 00                	add    BYTE PTR [rax],al
 787:	00 00                	add    BYTE PTR [rax],al
 789:	0e                   	(bad)  
 78a:	10 46 0e             	adc    BYTE PTR [rsi+0xe],al
 78d:	18 4a 0f             	sbb    BYTE PTR [rdx+0xf],cl
 790:	0b 77 08             	or     esi,DWORD PTR [rdi+0x8]
 793:	80 00 3f             	add    BYTE PTR [rax],0x3f
 796:	1a 3b                	sbb    bh,BYTE PTR [rbx]
 798:	2a 33                	sub    dh,BYTE PTR [rbx]
 79a:	24 22                	and    al,0x22
 79c:	00 00                	add    BYTE PTR [rax],al
 79e:	00 00                	add    BYTE PTR [rax],al
 7a0:	14 00                	adc    al,0x0
 7a2:	00 00                	add    BYTE PTR [rax],al
 7a4:	44 00 00             	add    BYTE PTR [rax],r8b
 7a7:	00 78 fd             	add    BYTE PTR [rax-0x3],bh
 7aa:	ff                   	(bad)  
 7ab:	ff 08                	dec    DWORD PTR [rax]
	...
 7b5:	00 00                	add    BYTE PTR [rax],al
 7b7:	00 1c 00             	add    BYTE PTR [rax+rax*1],bl
 7ba:	00 00                	add    BYTE PTR [rax],al
 7bc:	5c                   	pop    rsp
 7bd:	00 00                	add    BYTE PTR [rax],al
 7bf:	00 7a fe             	add    BYTE PTR [rdx-0x2],bh
 7c2:	ff                   	(bad)  
 7c3:	ff 23                	jmp    QWORD PTR [rbx]
 7c5:	00 00                	add    BYTE PTR [rax],al
 7c7:	00 00                	add    BYTE PTR [rax],al
 7c9:	41 0e                	rex.B (bad) 
 7cb:	10 86 02 43 0d 06    	adc    BYTE PTR [rsi+0x60d4302],al
 7d1:	5e                   	pop    rsi
 7d2:	0c 07                	or     al,0x7
 7d4:	08 00                	or     BYTE PTR [rax],al
 7d6:	00 00                	add    BYTE PTR [rax],al
 7d8:	44 00 00             	add    BYTE PTR [rax],r8b
 7db:	00 7c 00 00          	add    BYTE PTR [rax+rax*1+0x0],bh
 7df:	00 80 fe ff ff 65    	add    BYTE PTR [rax+0x65fffffe],al
 7e5:	00 00                	add    BYTE PTR [rax],al
 7e7:	00 00                	add    BYTE PTR [rax],al
 7e9:	42 0e                	rex.X (bad) 
 7eb:	10 8f 02 42 0e 18    	adc    BYTE PTR [rdi+0x180e4202],cl
 7f1:	8e 03                	mov    es,WORD PTR [rbx]
 7f3:	45 0e                	rex.RB (bad) 
 7f5:	20 8d 04 42 0e 28    	and    BYTE PTR [rbp+0x280e4204],cl
 7fb:	8c 05 48 0e 30 86    	mov    WORD PTR [rip+0xffffffff86300e48],es        # ffffffff86301649 <_end+0xffffffff86100631>
 801:	06                   	(bad)  
 802:	48 0e                	rex.W (bad) 
 804:	38 83 07 4d 0e 40    	cmp    BYTE PTR [rbx+0x400e4d07],al
 80a:	72 0e                	jb     81a <__GNU_EH_FRAME_HDR+0x12a>
 80c:	38 41 0e             	cmp    BYTE PTR [rcx+0xe],al
 80f:	30 41 0e             	xor    BYTE PTR [rcx+0xe],al
 812:	28 42 0e             	sub    BYTE PTR [rdx+0xe],al
 815:	20 42 0e             	and    BYTE PTR [rdx+0xe],al
 818:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
 81b:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 81e:	08 00                	or     BYTE PTR [rax],al
 820:	10 00                	adc    BYTE PTR [rax],al
 822:	00 00                	add    BYTE PTR [rax],al
 824:	c4                   	(bad)  
 825:	00 00                	add    BYTE PTR [rax],al
 827:	00 a8 fe ff ff 02    	add    BYTE PTR [rax+0x2fffffe],ch
 82d:	00 00                	add    BYTE PTR [rax],al
 82f:	00 00                	add    BYTE PTR [rax],al
 831:	00 00                	add    BYTE PTR [rax],al
	...

0000000000000834 <__FRAME_END__>:
 834:	00 00                	add    BYTE PTR [rax],al
	...

Disassembly of section .init_array:

0000000000200db8 <__frame_dummy_init_array_entry>:
  200db8:	30 06                	xor    BYTE PTR [rsi],al
  200dba:	00 00                	add    BYTE PTR [rax],al
  200dbc:	00 00                	add    BYTE PTR [rax],al
	...

Disassembly of section .fini_array:

0000000000200dc0 <__do_global_dtors_aux_fini_array_entry>:
  200dc0:	f0 05 00 00 00 00    	lock add eax,0x0
	...

Disassembly of section .dynamic:

0000000000200dc8 <_DYNAMIC>:
  200dc8:	01 00                	add    DWORD PTR [rax],eax
  200dca:	00 00                	add    BYTE PTR [rax],al
  200dcc:	00 00                	add    BYTE PTR [rax],al
  200dce:	00 00                	add    BYTE PTR [rax],al
  200dd0:	01 00                	add    DWORD PTR [rax],eax
  200dd2:	00 00                	add    BYTE PTR [rax],al
  200dd4:	00 00                	add    BYTE PTR [rax],al
  200dd6:	00 00                	add    BYTE PTR [rax],al
  200dd8:	0c 00                	or     al,0x0
  200dda:	00 00                	add    BYTE PTR [rax],al
  200ddc:	00 00                	add    BYTE PTR [rax],al
  200dde:	00 00                	add    BYTE PTR [rax],al
  200de0:	e8 04 00 00 00       	call   200de9 <_DYNAMIC+0x21>
  200de5:	00 00                	add    BYTE PTR [rax],al
  200de7:	00 0d 00 00 00 00    	add    BYTE PTR [rip+0x0],cl        # 200ded <_DYNAMIC+0x25>
  200ded:	00 00                	add    BYTE PTR [rax],al
  200def:	00 d4                	add    ah,dl
  200df1:	06                   	(bad)  
  200df2:	00 00                	add    BYTE PTR [rax],al
  200df4:	00 00                	add    BYTE PTR [rax],al
  200df6:	00 00                	add    BYTE PTR [rax],al
  200df8:	19 00                	sbb    DWORD PTR [rax],eax
  200dfa:	00 00                	add    BYTE PTR [rax],al
  200dfc:	00 00                	add    BYTE PTR [rax],al
  200dfe:	00 00                	add    BYTE PTR [rax],al
  200e00:	b8 0d 20 00 00       	mov    eax,0x200d
  200e05:	00 00                	add    BYTE PTR [rax],al
  200e07:	00 1b                	add    BYTE PTR [rbx],bl
  200e09:	00 00                	add    BYTE PTR [rax],al
  200e0b:	00 00                	add    BYTE PTR [rax],al
  200e0d:	00 00                	add    BYTE PTR [rax],al
  200e0f:	00 08                	add    BYTE PTR [rax],cl
  200e11:	00 00                	add    BYTE PTR [rax],al
  200e13:	00 00                	add    BYTE PTR [rax],al
  200e15:	00 00                	add    BYTE PTR [rax],al
  200e17:	00 1a                	add    BYTE PTR [rdx],bl
  200e19:	00 00                	add    BYTE PTR [rax],al
  200e1b:	00 00                	add    BYTE PTR [rax],al
  200e1d:	00 00                	add    BYTE PTR [rax],al
  200e1f:	00 c0                	add    al,al
  200e21:	0d 20 00 00 00       	or     eax,0x20
  200e26:	00 00                	add    BYTE PTR [rax],al
  200e28:	1c 00                	sbb    al,0x0
  200e2a:	00 00                	add    BYTE PTR [rax],al
  200e2c:	00 00                	add    BYTE PTR [rax],al
  200e2e:	00 00                	add    BYTE PTR [rax],al
  200e30:	08 00                	or     BYTE PTR [rax],al
  200e32:	00 00                	add    BYTE PTR [rax],al
  200e34:	00 00                	add    BYTE PTR [rax],al
  200e36:	00 00                	add    BYTE PTR [rax],al
  200e38:	f5                   	cmc    
  200e39:	fe                   	(bad)  
  200e3a:	ff 6f 00             	jmp    FWORD PTR [rdi+0x0]
  200e3d:	00 00                	add    BYTE PTR [rax],al
  200e3f:	00 98 02 00 00 00    	add    BYTE PTR [rax+0x2],bl
  200e45:	00 00                	add    BYTE PTR [rax],al
  200e47:	00 05 00 00 00 00    	add    BYTE PTR [rip+0x0],al        # 200e4d <_DYNAMIC+0x85>
  200e4d:	00 00                	add    BYTE PTR [rax],al
  200e4f:	00 60 03             	add    BYTE PTR [rax+0x3],ah
  200e52:	00 00                	add    BYTE PTR [rax],al
  200e54:	00 00                	add    BYTE PTR [rax],al
  200e56:	00 00                	add    BYTE PTR [rax],al
  200e58:	06                   	(bad)  
  200e59:	00 00                	add    BYTE PTR [rax],al
  200e5b:	00 00                	add    BYTE PTR [rax],al
  200e5d:	00 00                	add    BYTE PTR [rax],al
  200e5f:	00 b8 02 00 00 00    	add    BYTE PTR [rax+0x2],bh
  200e65:	00 00                	add    BYTE PTR [rax],al
  200e67:	00 0a                	add    BYTE PTR [rdx],cl
  200e69:	00 00                	add    BYTE PTR [rax],al
  200e6b:	00 00                	add    BYTE PTR [rax],al
  200e6d:	00 00                	add    BYTE PTR [rax],al
  200e6f:	00 82 00 00 00 00    	add    BYTE PTR [rdx+0x0],al
  200e75:	00 00                	add    BYTE PTR [rax],al
  200e77:	00 0b                	add    BYTE PTR [rbx],cl
  200e79:	00 00                	add    BYTE PTR [rax],al
  200e7b:	00 00                	add    BYTE PTR [rax],al
  200e7d:	00 00                	add    BYTE PTR [rax],al
  200e7f:	00 18                	add    BYTE PTR [rax],bl
  200e81:	00 00                	add    BYTE PTR [rax],al
  200e83:	00 00                	add    BYTE PTR [rax],al
  200e85:	00 00                	add    BYTE PTR [rax],al
  200e87:	00 15 00 00 00 00    	add    BYTE PTR [rip+0x0],dl        # 200e8d <_DYNAMIC+0xc5>
	...
  200e95:	00 00                	add    BYTE PTR [rax],al
  200e97:	00 03                	add    BYTE PTR [rbx],al
  200e99:	00 00                	add    BYTE PTR [rax],al
  200e9b:	00 00                	add    BYTE PTR [rax],al
  200e9d:	00 00                	add    BYTE PTR [rax],al
  200e9f:	00 b8 0f 20 00 00    	add    BYTE PTR [rax+0x200f],bh
  200ea5:	00 00                	add    BYTE PTR [rax],al
  200ea7:	00 02                	add    BYTE PTR [rdx],al
  200ea9:	00 00                	add    BYTE PTR [rax],al
  200eab:	00 00                	add    BYTE PTR [rax],al
  200ead:	00 00                	add    BYTE PTR [rax],al
  200eaf:	00 18                	add    BYTE PTR [rax],bl
  200eb1:	00 00                	add    BYTE PTR [rax],al
  200eb3:	00 00                	add    BYTE PTR [rax],al
  200eb5:	00 00                	add    BYTE PTR [rax],al
  200eb7:	00 14 00             	add    BYTE PTR [rax+rax*1],dl
  200eba:	00 00                	add    BYTE PTR [rax],al
  200ebc:	00 00                	add    BYTE PTR [rax],al
  200ebe:	00 00                	add    BYTE PTR [rax],al
  200ec0:	07                   	(bad)  
  200ec1:	00 00                	add    BYTE PTR [rax],al
  200ec3:	00 00                	add    BYTE PTR [rax],al
  200ec5:	00 00                	add    BYTE PTR [rax],al
  200ec7:	00 17                	add    BYTE PTR [rdi],dl
  200ec9:	00 00                	add    BYTE PTR [rax],al
  200ecb:	00 00                	add    BYTE PTR [rax],al
  200ecd:	00 00                	add    BYTE PTR [rax],al
  200ecf:	00 d0                	add    al,dl
  200ed1:	04 00                	add    al,0x0
  200ed3:	00 00                	add    BYTE PTR [rax],al
  200ed5:	00 00                	add    BYTE PTR [rax],al
  200ed7:	00 07                	add    BYTE PTR [rdi],al
  200ed9:	00 00                	add    BYTE PTR [rax],al
  200edb:	00 00                	add    BYTE PTR [rax],al
  200edd:	00 00                	add    BYTE PTR [rax],al
  200edf:	00 10                	add    BYTE PTR [rax],dl
  200ee1:	04 00                	add    al,0x0
  200ee3:	00 00                	add    BYTE PTR [rax],al
  200ee5:	00 00                	add    BYTE PTR [rax],al
  200ee7:	00 08                	add    BYTE PTR [rax],cl
  200ee9:	00 00                	add    BYTE PTR [rax],al
  200eeb:	00 00                	add    BYTE PTR [rax],al
  200eed:	00 00                	add    BYTE PTR [rax],al
  200eef:	00 c0                	add    al,al
  200ef1:	00 00                	add    BYTE PTR [rax],al
  200ef3:	00 00                	add    BYTE PTR [rax],al
  200ef5:	00 00                	add    BYTE PTR [rax],al
  200ef7:	00 09                	add    BYTE PTR [rcx],cl
  200ef9:	00 00                	add    BYTE PTR [rax],al
  200efb:	00 00                	add    BYTE PTR [rax],al
  200efd:	00 00                	add    BYTE PTR [rax],al
  200eff:	00 18                	add    BYTE PTR [rax],bl
  200f01:	00 00                	add    BYTE PTR [rax],al
  200f03:	00 00                	add    BYTE PTR [rax],al
  200f05:	00 00                	add    BYTE PTR [rax],al
  200f07:	00 1e                	add    BYTE PTR [rsi],bl
  200f09:	00 00                	add    BYTE PTR [rax],al
  200f0b:	00 00                	add    BYTE PTR [rax],al
  200f0d:	00 00                	add    BYTE PTR [rax],al
  200f0f:	00 08                	add    BYTE PTR [rax],cl
  200f11:	00 00                	add    BYTE PTR [rax],al
  200f13:	00 00                	add    BYTE PTR [rax],al
  200f15:	00 00                	add    BYTE PTR [rax],al
  200f17:	00 fb                	add    bl,bh
  200f19:	ff                   	(bad)  
  200f1a:	ff 6f 00             	jmp    FWORD PTR [rdi+0x0]
  200f1d:	00 00                	add    BYTE PTR [rax],al
  200f1f:	00 01                	add    BYTE PTR [rcx],al
  200f21:	00 00                	add    BYTE PTR [rax],al
  200f23:	08 00                	or     BYTE PTR [rax],al
  200f25:	00 00                	add    BYTE PTR [rax],al
  200f27:	00 fe                	add    dh,bh
  200f29:	ff                   	(bad)  
  200f2a:	ff 6f 00             	jmp    FWORD PTR [rdi+0x0]
  200f2d:	00 00                	add    BYTE PTR [rax],al
  200f2f:	00 f0                	add    al,dh
  200f31:	03 00                	add    eax,DWORD PTR [rax]
  200f33:	00 00                	add    BYTE PTR [rax],al
  200f35:	00 00                	add    BYTE PTR [rax],al
  200f37:	00 ff                	add    bh,bh
  200f39:	ff                   	(bad)  
  200f3a:	ff 6f 00             	jmp    FWORD PTR [rdi+0x0]
  200f3d:	00 00                	add    BYTE PTR [rax],al
  200f3f:	00 01                	add    BYTE PTR [rcx],al
  200f41:	00 00                	add    BYTE PTR [rax],al
  200f43:	00 00                	add    BYTE PTR [rax],al
  200f45:	00 00                	add    BYTE PTR [rax],al
  200f47:	00 f0                	add    al,dh
  200f49:	ff                   	(bad)  
  200f4a:	ff 6f 00             	jmp    FWORD PTR [rdi+0x0]
  200f4d:	00 00                	add    BYTE PTR [rax],al
  200f4f:	00 e2                	add    dl,ah
  200f51:	03 00                	add    eax,DWORD PTR [rax]
  200f53:	00 00                	add    BYTE PTR [rax],al
  200f55:	00 00                	add    BYTE PTR [rax],al
  200f57:	00 f9                	add    cl,bh
  200f59:	ff                   	(bad)  
  200f5a:	ff 6f 00             	jmp    FWORD PTR [rdi+0x0]
  200f5d:	00 00                	add    BYTE PTR [rax],al
  200f5f:	00 03                	add    BYTE PTR [rbx],al
	...

Disassembly of section .got:

0000000000200fb8 <_GLOBAL_OFFSET_TABLE_>:
  200fb8:	c8 0d 20 00          	enter  0x200d,0x0
	...
  200fd0:	16                   	(bad)  
  200fd1:	05 00 00 00 00       	add    eax,0x0
	...

Disassembly of section .data:

0000000000201000 <__data_start>:
	...

0000000000201008 <__dso_handle>:
  201008:	08 10                	or     BYTE PTR [rax],dl
  20100a:	20 00                	and    BYTE PTR [rax],al
  20100c:	00 00                	add    BYTE PTR [rax],al
	...

Disassembly of section .bss:

0000000000201010 <__bss_start>:
	...

Disassembly of section .comment:

0000000000000000 <.comment>:
   0:	47                   	rex.RXB
   1:	43                   	rex.XB
   2:	43 3a 20             	rex.XB cmp spl,BYTE PTR [r8]
   5:	28 55 62             	sub    BYTE PTR [rbp+0x62],dl
   8:	75 6e                	jne    78 <_init-0x470>
   a:	74 75                	je     81 <_init-0x467>
   c:	20 37                	and    BYTE PTR [rdi],dh
   e:	2e 35 2e 30 2d 33    	cs xor eax,0x332d302e
  14:	75 62                	jne    78 <_init-0x470>
  16:	75 6e                	jne    86 <_init-0x462>
  18:	74 75                	je     8f <_init-0x459>
  1a:	31 7e 31             	xor    DWORD PTR [rsi+0x31],edi
  1d:	38 2e                	cmp    BYTE PTR [rsi],ch
  1f:	30 34 29             	xor    BYTE PTR [rcx+rbp*1],dh
  22:	20 37                	and    BYTE PTR [rdi],dh
  24:	2e                   	cs
  25:	35                   	.byte 0x35
  26:	2e 30 00             	xor    BYTE PTR cs:[rax],al
