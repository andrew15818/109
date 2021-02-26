
guess:     file format elf64-x86-64


Disassembly of section .interp:

0000000000000318 <.interp>:
 318:	2f                   	(bad)  
 319:	6c                   	ins    BYTE PTR es:[rdi],dx
 31a:	69 62 36 34 2f 6c 64 	imul   esp,DWORD PTR [rdx+0x36],0x646c2f34
 321:	2d 6c 69 6e 75       	sub    eax,0x756e696c
 326:	78 2d                	js     355 <__abi_tag-0x47>
 328:	78 38                	js     362 <__abi_tag-0x3a>
 32a:	36 2d 36 34 2e 73    	ss sub eax,0x732e3436
 330:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 331:	2e 32 00             	cs xor al,BYTE PTR [rax]

Disassembly of section .note.gnu.property:

0000000000000338 <.note.gnu.property>:
 338:	04 00                	add    al,0x0
 33a:	00 00                	add    BYTE PTR [rax],al
 33c:	30 00                	xor    BYTE PTR [rax],al
 33e:	00 00                	add    BYTE PTR [rax],al
 340:	05 00 00 00 47       	add    eax,0x47000000
 345:	4e 55                	rex.WRX push rbp
 347:	00 02                	add    BYTE PTR [rdx],al
 349:	80 00 c0             	add    BYTE PTR [rax],0xc0
 34c:	04 00                	add    al,0x0
 34e:	00 00                	add    BYTE PTR [rax],al
 350:	01 00                	add    DWORD PTR [rax],eax
 352:	00 00                	add    BYTE PTR [rax],al
 354:	00 00                	add    BYTE PTR [rax],al
 356:	00 00                	add    BYTE PTR [rax],al
 358:	01 00                	add    DWORD PTR [rax],eax
 35a:	01 c0                	add    eax,eax
 35c:	04 00                	add    al,0x0
 35e:	00 00                	add    BYTE PTR [rax],al
 360:	01 00                	add    DWORD PTR [rax],eax
 362:	00 00                	add    BYTE PTR [rax],al
 364:	00 00                	add    BYTE PTR [rax],al
 366:	00 00                	add    BYTE PTR [rax],al
 368:	02 00                	add    al,BYTE PTR [rax]
 36a:	01 c0                	add    eax,eax
 36c:	04 00                	add    al,0x0
	...

Disassembly of section .note.gnu.build-id:

0000000000000378 <.note.gnu.build-id>:
 378:	04 00                	add    al,0x0
 37a:	00 00                	add    BYTE PTR [rax],al
 37c:	14 00                	adc    al,0x0
 37e:	00 00                	add    BYTE PTR [rax],al
 380:	03 00                	add    eax,DWORD PTR [rax]
 382:	00 00                	add    BYTE PTR [rax],al
 384:	47                   	rex.RXB
 385:	4e 55                	rex.WRX push rbp
 387:	00 2c dd 28 eb d7 69 	add    BYTE PTR [rbx*8+0x69d7eb28],ch
 38e:	f6 54 04 7f          	not    BYTE PTR [rsp+rax*1+0x7f]
 392:	35 85 40 8f 53       	xor    eax,0x538f4085
 397:	e4 0a                	in     al,0xa
 399:	16                   	(bad)  
 39a:	79 5e                	jns    3fa <__abi_tag+0x5e>

Disassembly of section .note.ABI-tag:

000000000000039c <__abi_tag>:
 39c:	04 00                	add    al,0x0
 39e:	00 00                	add    BYTE PTR [rax],al
 3a0:	10 00                	adc    BYTE PTR [rax],al
 3a2:	00 00                	add    BYTE PTR [rax],al
 3a4:	01 00                	add    DWORD PTR [rax],eax
 3a6:	00 00                	add    BYTE PTR [rax],al
 3a8:	47                   	rex.RXB
 3a9:	4e 55                	rex.WRX push rbp
 3ab:	00 00                	add    BYTE PTR [rax],al
 3ad:	00 00                	add    BYTE PTR [rax],al
 3af:	00 03                	add    BYTE PTR [rbx],al
 3b1:	00 00                	add    BYTE PTR [rax],al
 3b3:	00 02                	add    BYTE PTR [rdx],al
 3b5:	00 00                	add    BYTE PTR [rax],al
 3b7:	00 00                	add    BYTE PTR [rax],al
 3b9:	00 00                	add    BYTE PTR [rax],al
	...

Disassembly of section .gnu.hash:

00000000000003c0 <.gnu.hash>:
 3c0:	02 00                	add    al,BYTE PTR [rax]
 3c2:	00 00                	add    BYTE PTR [rax],al
 3c4:	10 00                	adc    BYTE PTR [rax],al
 3c6:	00 00                	add    BYTE PTR [rax],al
 3c8:	01 00                	add    DWORD PTR [rax],eax
 3ca:	00 00                	add    BYTE PTR [rax],al
 3cc:	06                   	(bad)  
 3cd:	00 00                	add    BYTE PTR [rax],al
 3cf:	00 00                	add    BYTE PTR [rax],al
 3d1:	00 20                	add    BYTE PTR [rax],ah
 3d3:	00 80 01 10 00 10    	add    BYTE PTR [rax+0x10001001],al
 3d9:	00 00                	add    BYTE PTR [rax],al
 3db:	00 11                	add    BYTE PTR [rcx],dl
 3dd:	00 00                	add    BYTE PTR [rax],al
 3df:	00 29                	add    BYTE PTR [rcx],ch
 3e1:	1d 8c 1c 67 55       	sbb    eax,0x55671c8c
 3e6:	61                   	(bad)  
 3e7:	10                   	.byte 0x10

Disassembly of section .dynsym:

00000000000003e8 <.dynsym>:
	...
 400:	93                   	xchg   ebx,eax
 401:	00 00                	add    BYTE PTR [rax],al
 403:	00 20                	add    BYTE PTR [rax],ah
	...
 415:	00 00                	add    BYTE PTR [rax],al
 417:	00 07                	add    BYTE PTR [rdi],al
 419:	00 00                	add    BYTE PTR [rax],al
 41b:	00 12                	add    BYTE PTR [rdx],dl
	...
 42d:	00 00                	add    BYTE PTR [rax],al
 42f:	00 28                	add    BYTE PTR [rax],ch
 431:	00 00                	add    BYTE PTR [rax],al
 433:	00 12                	add    BYTE PTR [rdx],dl
	...
 445:	00 00                	add    BYTE PTR [rax],al
 447:	00 11                	add    BYTE PTR [rcx],dl
 449:	00 00                	add    BYTE PTR [rax],al
 44b:	00 12                	add    BYTE PTR [rdx],dl
	...
 45d:	00 00                	add    BYTE PTR [rax],al
 45f:	00 2f                	add    BYTE PTR [rdi],ch
 461:	00 00                	add    BYTE PTR [rax],al
 463:	00 12                	add    BYTE PTR [rdx],dl
	...
 475:	00 00                	add    BYTE PTR [rax],al
 477:	00 61 00             	add    BYTE PTR [rcx+0x0],ah
 47a:	00 00                	add    BYTE PTR [rax],al
 47c:	12 00                	adc    al,BYTE PTR [rax]
	...
 48e:	00 00                	add    BYTE PTR [rax],al
 490:	01 00                	add    DWORD PTR [rax],eax
 492:	00 00                	add    BYTE PTR [rax],al
 494:	12 00                	adc    al,BYTE PTR [rax]
	...
 4a6:	00 00                	add    BYTE PTR [rax],al
 4a8:	3d 00 00 00 12       	cmp    eax,0x12000000
	...
 4bd:	00 00                	add    BYTE PTR [rax],al
 4bf:	00 af 00 00 00 20    	add    BYTE PTR [rdi+0x20000000],ch
	...
 4d5:	00 00                	add    BYTE PTR [rax],al
 4d7:	00 36                	add    BYTE PTR [rsi],dh
 4d9:	00 00                	add    BYTE PTR [rax],al
 4db:	00 12                	add    BYTE PTR [rdx],dl
	...
 4ed:	00 00                	add    BYTE PTR [rax],al
 4ef:	00 0c 00             	add    BYTE PTR [rax+rax*1],cl
 4f2:	00 00                	add    BYTE PTR [rax],al
 4f4:	12 00                	adc    al,BYTE PTR [rax]
	...
 506:	00 00                	add    BYTE PTR [rax],al
 508:	59                   	pop    rcx
 509:	00 00                	add    BYTE PTR [rax],al
 50b:	00 12                	add    BYTE PTR [rdx],dl
	...
 51d:	00 00                	add    BYTE PTR [rax],al
 51f:	00 be 00 00 00 20    	add    BYTE PTR [rsi+0x20000000],bh
	...
 535:	00 00                	add    BYTE PTR [rax],al
 537:	00 4a 00             	add    BYTE PTR [rdx+0x0],cl
 53a:	00 00                	add    BYTE PTR [rax],al
 53c:	22 00                	and    al,BYTE PTR [rax]
	...
 54e:	00 00                	add    BYTE PTR [rax],al
 550:	02 00                	add    al,BYTE PTR [rax]
 552:	00 00                	add    BYTE PTR [rax],al
 554:	12 00                	adc    al,BYTE PTR [rax]
	...
 566:	00 00                	add    BYTE PTR [rax],al
 568:	43 00 00             	rex.XB add BYTE PTR [r8],al
 56b:	00 11                	add    BYTE PTR [rcx],dl
 56d:	00 19                	add    BYTE PTR [rcx],bl
 56f:	00 80 40 00 00 00    	add    BYTE PTR [rax+0x40],al
 575:	00 00                	add    BYTE PTR [rax],al
 577:	00 08                	add    BYTE PTR [rax],cl
 579:	00 00                	add    BYTE PTR [rax],al
 57b:	00 00                	add    BYTE PTR [rax],al
 57d:	00 00                	add    BYTE PTR [rax],al
 57f:	00 22                	add    BYTE PTR [rdx],ah
 581:	00 00                	add    BYTE PTR [rax],al
 583:	00 11                	add    BYTE PTR [rcx],dl
 585:	00 19                	add    BYTE PTR [rcx],bl
 587:	00 90 40 00 00 00    	add    BYTE PTR [rax+0x40],dl
 58d:	00 00                	add    BYTE PTR [rax],al
 58f:	00 08                	add    BYTE PTR [rax],cl
 591:	00 00                	add    BYTE PTR [rax],al
 593:	00 00                	add    BYTE PTR [rax],al
 595:	00 00                	add    BYTE PTR [rax],al
	...

Disassembly of section .dynstr:

0000000000000598 <.dynstr>:
 598:	00 73 72             	add    BYTE PTR [rbx+0x72],dh
 59b:	61                   	(bad)  
 59c:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 59d:	64 00 70 75          	add    BYTE PTR fs:[rax+0x75],dh
 5a1:	74 73                	je     616 <__abi_tag+0x27a>
 5a3:	00 74 69 6d          	add    BYTE PTR [rcx+rbp*2+0x6d],dh
 5a7:	65 00 5f 5f          	add    BYTE PTR gs:[rdi+0x5f],bl
 5ab:	73 74                	jae    621 <__abi_tag+0x285>
 5ad:	61                   	(bad)  
 5ae:	63 6b 5f             	movsxd ebp,DWORD PTR [rbx+0x5f]
 5b1:	63 68 6b             	movsxd ebp,DWORD PTR [rax+0x6b]
 5b4:	5f                   	pop    rdi
 5b5:	66 61                	data16 (bad) 
 5b7:	69 6c 00 73 74 64 69 	imul   ebp,DWORD PTR [rax+rax*1+0x73],0x6e696474
 5be:	6e 
 5bf:	00 67 65             	add    BYTE PTR [rdi+0x65],ah
 5c2:	74 70                	je     634 <__abi_tag+0x298>
 5c4:	69 64 00 70 72 69 6e 	imul   esp,DWORD PTR [rax+rax*1+0x70],0x746e6972
 5cb:	74 
 5cc:	66 00 73 74          	data16 add BYTE PTR [rbx+0x74],dh
 5d0:	72 74                	jb     646 <__abi_tag+0x2aa>
 5d2:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 5d3:	6c                   	ins    BYTE PTR es:[rdi],dx
 5d4:	00 66 67             	add    BYTE PTR [rsi+0x67],ah
 5d7:	65 74 73             	gs je  64d <__abi_tag+0x2b1>
 5da:	00 73 74             	add    BYTE PTR [rbx+0x74],dh
 5dd:	64 6f                	outs   dx,DWORD PTR fs:[rsi]
 5df:	75 74                	jne    655 <__abi_tag+0x2b9>
 5e1:	00 5f 5f             	add    BYTE PTR [rdi+0x5f],bl
 5e4:	63 78 61             	movsxd edi,DWORD PTR [rax+0x61]
 5e7:	5f                   	pop    rdi
 5e8:	66 69 6e 61 6c 69    	imul   bp,WORD PTR [rsi+0x61],0x696c
 5ee:	7a 65                	jp     655 <__abi_tag+0x2b9>
 5f0:	00 73 65             	add    BYTE PTR [rbx+0x65],dh
 5f3:	74 76                	je     66b <__abi_tag+0x2cf>
 5f5:	62                   	(bad)  
 5f6:	75 66                	jne    65e <__abi_tag+0x2c2>
 5f8:	00 5f 5f             	add    BYTE PTR [rdi+0x5f],bl
 5fb:	6c                   	ins    BYTE PTR es:[rdi],dx
 5fc:	69 62 63 5f 73 74 61 	imul   esp,DWORD PTR [rdx+0x63],0x6174735f
 603:	72 74                	jb     679 <__abi_tag+0x2dd>
 605:	5f                   	pop    rdi
 606:	6d                   	ins    DWORD PTR es:[rdi],dx
 607:	61                   	(bad)  
 608:	69 6e 00 6c 69 62 63 	imul   ebp,DWORD PTR [rsi+0x0],0x6362696c
 60f:	2e 73 6f             	cs jae 681 <__abi_tag+0x2e5>
 612:	2e 36 00 47 4c       	cs ss add BYTE PTR [rdi+0x4c],al
 617:	49                   	rex.WB
 618:	42                   	rex.X
 619:	43 5f                	rex.XB pop r15
 61b:	32 2e                	xor    ch,BYTE PTR [rsi]
 61d:	34 00                	xor    al,0x0
 61f:	47                   	rex.RXB
 620:	4c                   	rex.WR
 621:	49                   	rex.WB
 622:	42                   	rex.X
 623:	43 5f                	rex.XB pop r15
 625:	32 2e                	xor    ch,BYTE PTR [rsi]
 627:	32 2e                	xor    ch,BYTE PTR [rsi]
 629:	35 00 5f 49 54       	xor    eax,0x54495f00
 62e:	4d 5f                	rex.WRB pop r15
 630:	64 65 72 65          	fs gs jb 699 <__abi_tag+0x2fd>
 634:	67 69 73 74 65 72 54 	imul   esi,DWORD PTR [ebx+0x74],0x4d547265
 63b:	4d 
 63c:	43 6c                	rex.XB ins BYTE PTR es:[rdi],dx
 63e:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 63f:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 640:	65 54                	gs push rsp
 642:	61                   	(bad)  
 643:	62                   	(bad)  
 644:	6c                   	ins    BYTE PTR es:[rdi],dx
 645:	65 00 5f 5f          	add    BYTE PTR gs:[rdi+0x5f],bl
 649:	67 6d                	ins    DWORD PTR es:[edi],dx
 64b:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 64c:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 64d:	5f                   	pop    rdi
 64e:	73 74                	jae    6c4 <__abi_tag+0x328>
 650:	61                   	(bad)  
 651:	72 74                	jb     6c7 <__abi_tag+0x32b>
 653:	5f                   	pop    rdi
 654:	5f                   	pop    rdi
 655:	00 5f 49             	add    BYTE PTR [rdi+0x49],bl
 658:	54                   	push   rsp
 659:	4d 5f                	rex.WRB pop r15
 65b:	72 65                	jb     6c2 <__abi_tag+0x326>
 65d:	67 69 73 74 65 72 54 	imul   esi,DWORD PTR [ebx+0x74],0x4d547265
 664:	4d 
 665:	43 6c                	rex.XB ins BYTE PTR es:[rdi],dx
 667:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 668:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 669:	65 54                	gs push rsp
 66b:	61                   	(bad)  
 66c:	62                   	.byte 0x62
 66d:	6c                   	ins    BYTE PTR es:[rdi],dx
 66e:	65                   	gs
	...

Disassembly of section .gnu.version:

0000000000000670 <.gnu.version>:
 670:	00 00                	add    BYTE PTR [rax],al
 672:	00 00                	add    BYTE PTR [rax],al
 674:	02 00                	add    al,BYTE PTR [rax]
 676:	02 00                	add    al,BYTE PTR [rax]
 678:	03 00                	add    eax,DWORD PTR [rax]
 67a:	02 00                	add    al,BYTE PTR [rax]
 67c:	02 00                	add    al,BYTE PTR [rax]
 67e:	02 00                	add    al,BYTE PTR [rax]
 680:	02 00                	add    al,BYTE PTR [rax]
 682:	00 00                	add    BYTE PTR [rax],al
 684:	02 00                	add    al,BYTE PTR [rax]
 686:	02 00                	add    al,BYTE PTR [rax]
 688:	02 00                	add    al,BYTE PTR [rax]
 68a:	00 00                	add    BYTE PTR [rax],al
 68c:	02 00                	add    al,BYTE PTR [rax]
 68e:	02 00                	add    al,BYTE PTR [rax]
 690:	02 00                	add    al,BYTE PTR [rax]
 692:	02 00                	add    al,BYTE PTR [rax]

Disassembly of section .gnu.version_r:

0000000000000698 <.gnu.version_r>:
 698:	01 00                	add    DWORD PTR [rax],eax
 69a:	02 00                	add    al,BYTE PTR [rax]
 69c:	73 00                	jae    69e <__abi_tag+0x302>
 69e:	00 00                	add    BYTE PTR [rax],al
 6a0:	10 00                	adc    BYTE PTR [rax],al
 6a2:	00 00                	add    BYTE PTR [rax],al
 6a4:	00 00                	add    BYTE PTR [rax],al
 6a6:	00 00                	add    BYTE PTR [rax],al
 6a8:	14 69                	adc    al,0x69
 6aa:	69 0d 00 00 03 00 7d 	imul   ecx,DWORD PTR [rip+0x30000],0x7d        # 306b4 <_end+0x2c614>
 6b1:	00 00 00 
 6b4:	10 00                	adc    BYTE PTR [rax],al
 6b6:	00 00                	add    BYTE PTR [rax],al
 6b8:	75 1a                	jne    6d4 <__abi_tag+0x338>
 6ba:	69 09 00 00 02 00    	imul   ecx,DWORD PTR [rcx],0x20000
 6c0:	87 00                	xchg   DWORD PTR [rax],eax
 6c2:	00 00                	add    BYTE PTR [rax],al
 6c4:	00 00                	add    BYTE PTR [rax],al
	...

Disassembly of section .rela.dyn:

00000000000006c8 <.rela.dyn>:
 6c8:	e8 3d 00 00 00       	call   70a <__abi_tag+0x36e>
 6cd:	00 00                	add    BYTE PTR [rax],al
 6cf:	00 08                	add    BYTE PTR [rax],cl
 6d1:	00 00                	add    BYTE PTR [rax],al
 6d3:	00 00                	add    BYTE PTR [rax],al
 6d5:	00 00                	add    BYTE PTR [rax],al
 6d7:	00 c0                	add    al,al
 6d9:	11 00                	adc    DWORD PTR [rax],eax
 6db:	00 00                	add    BYTE PTR [rax],al
 6dd:	00 00                	add    BYTE PTR [rax],al
 6df:	00 f0                	add    al,dh
 6e1:	3d 00 00 00 00       	cmp    eax,0x0
 6e6:	00 00                	add    BYTE PTR [rax],al
 6e8:	08 00                	or     BYTE PTR [rax],al
 6ea:	00 00                	add    BYTE PTR [rax],al
 6ec:	00 00                	add    BYTE PTR [rax],al
 6ee:	00 00                	add    BYTE PTR [rax],al
 6f0:	70 11                	jo     703 <__abi_tag+0x367>
 6f2:	00 00                	add    BYTE PTR [rax],al
 6f4:	00 00                	add    BYTE PTR [rax],al
 6f6:	00 00                	add    BYTE PTR [rax],al
 6f8:	70 40                	jo     73a <__abi_tag+0x39e>
 6fa:	00 00                	add    BYTE PTR [rax],al
 6fc:	00 00                	add    BYTE PTR [rax],al
 6fe:	00 00                	add    BYTE PTR [rax],al
 700:	08 00                	or     BYTE PTR [rax],al
 702:	00 00                	add    BYTE PTR [rax],al
 704:	00 00                	add    BYTE PTR [rax],al
 706:	00 00                	add    BYTE PTR [rax],al
 708:	70 40                	jo     74a <__abi_tag+0x3ae>
 70a:	00 00                	add    BYTE PTR [rax],al
 70c:	00 00                	add    BYTE PTR [rax],al
 70e:	00 00                	add    BYTE PTR [rax],al
 710:	d8 3f                	fdivr  DWORD PTR [rdi]
 712:	00 00                	add    BYTE PTR [rax],al
 714:	00 00                	add    BYTE PTR [rax],al
 716:	00 00                	add    BYTE PTR [rax],al
 718:	06                   	(bad)  
 719:	00 00                	add    BYTE PTR [rax],al
 71b:	00 01                	add    BYTE PTR [rcx],al
	...
 725:	00 00                	add    BYTE PTR [rax],al
 727:	00 e0                	add    al,ah
 729:	3f                   	(bad)  
 72a:	00 00                	add    BYTE PTR [rax],al
 72c:	00 00                	add    BYTE PTR [rax],al
 72e:	00 00                	add    BYTE PTR [rax],al
 730:	06                   	(bad)  
 731:	00 00                	add    BYTE PTR [rax],al
 733:	00 06                	add    BYTE PTR [rsi],al
	...
 73d:	00 00                	add    BYTE PTR [rax],al
 73f:	00 e8                	add    al,ch
 741:	3f                   	(bad)  
 742:	00 00                	add    BYTE PTR [rax],al
 744:	00 00                	add    BYTE PTR [rax],al
 746:	00 00                	add    BYTE PTR [rax],al
 748:	06                   	(bad)  
 749:	00 00                	add    BYTE PTR [rax],al
 74b:	00 09                	add    BYTE PTR [rcx],cl
	...
 755:	00 00                	add    BYTE PTR [rax],al
 757:	00 f0                	add    al,dh
 759:	3f                   	(bad)  
 75a:	00 00                	add    BYTE PTR [rax],al
 75c:	00 00                	add    BYTE PTR [rax],al
 75e:	00 00                	add    BYTE PTR [rax],al
 760:	06                   	(bad)  
 761:	00 00                	add    BYTE PTR [rax],al
 763:	00 0d 00 00 00 00    	add    BYTE PTR [rip+0x0],cl        # 769 <__abi_tag+0x3cd>
 769:	00 00                	add    BYTE PTR [rax],al
 76b:	00 00                	add    BYTE PTR [rax],al
 76d:	00 00                	add    BYTE PTR [rax],al
 76f:	00 f8                	add    al,bh
 771:	3f                   	(bad)  
 772:	00 00                	add    BYTE PTR [rax],al
 774:	00 00                	add    BYTE PTR [rax],al
 776:	00 00                	add    BYTE PTR [rax],al
 778:	06                   	(bad)  
 779:	00 00                	add    BYTE PTR [rax],al
 77b:	00 0e                	add    BYTE PTR [rsi],cl
	...
 785:	00 00                	add    BYTE PTR [rax],al
 787:	00 80 40 00 00 00    	add    BYTE PTR [rax+0x40],al
 78d:	00 00                	add    BYTE PTR [rax],al
 78f:	00 05 00 00 00 10    	add    BYTE PTR [rip+0x10000000],al        # 10000795 <_end+0xfffc6f5>
	...
 79d:	00 00                	add    BYTE PTR [rax],al
 79f:	00 90 40 00 00 00    	add    BYTE PTR [rax+0x40],dl
 7a5:	00 00                	add    BYTE PTR [rax],al
 7a7:	00 05 00 00 00 11    	add    BYTE PTR [rip+0x11000000],al        # 110007ad <_end+0x10ffc70d>
	...

Disassembly of section .rela.plt:

00000000000007b8 <.rela.plt>:
 7b8:	18 40 00             	sbb    BYTE PTR [rax+0x0],al
 7bb:	00 00                	add    BYTE PTR [rax],al
 7bd:	00 00                	add    BYTE PTR [rax],al
 7bf:	00 07                	add    BYTE PTR [rdi],al
 7c1:	00 00                	add    BYTE PTR [rax],al
 7c3:	00 02                	add    BYTE PTR [rdx],al
	...
 7cd:	00 00                	add    BYTE PTR [rax],al
 7cf:	00 20                	add    BYTE PTR [rax],ah
 7d1:	40 00 00             	rex add BYTE PTR [rax],al
 7d4:	00 00                	add    BYTE PTR [rax],al
 7d6:	00 00                	add    BYTE PTR [rax],al
 7d8:	07                   	(bad)  
 7d9:	00 00                	add    BYTE PTR [rax],al
 7db:	00 03                	add    BYTE PTR [rbx],al
	...
 7e5:	00 00                	add    BYTE PTR [rax],al
 7e7:	00 28                	add    BYTE PTR [rax],ch
 7e9:	40 00 00             	rex add BYTE PTR [rax],al
 7ec:	00 00                	add    BYTE PTR [rax],al
 7ee:	00 00                	add    BYTE PTR [rax],al
 7f0:	07                   	(bad)  
 7f1:	00 00                	add    BYTE PTR [rax],al
 7f3:	00 04 00             	add    BYTE PTR [rax+rax*1],al
	...
 7fe:	00 00                	add    BYTE PTR [rax],al
 800:	30 40 00             	xor    BYTE PTR [rax+0x0],al
 803:	00 00                	add    BYTE PTR [rax],al
 805:	00 00                	add    BYTE PTR [rax],al
 807:	00 07                	add    BYTE PTR [rdi],al
 809:	00 00                	add    BYTE PTR [rax],al
 80b:	00 05 00 00 00 00    	add    BYTE PTR [rip+0x0],al        # 811 <__abi_tag+0x475>
 811:	00 00                	add    BYTE PTR [rax],al
 813:	00 00                	add    BYTE PTR [rax],al
 815:	00 00                	add    BYTE PTR [rax],al
 817:	00 38                	add    BYTE PTR [rax],bh
 819:	40 00 00             	rex add BYTE PTR [rax],al
 81c:	00 00                	add    BYTE PTR [rax],al
 81e:	00 00                	add    BYTE PTR [rax],al
 820:	07                   	(bad)  
 821:	00 00                	add    BYTE PTR [rax],al
 823:	00 07                	add    BYTE PTR [rdi],al
	...
 82d:	00 00                	add    BYTE PTR [rax],al
 82f:	00 40 40             	add    BYTE PTR [rax+0x40],al
 832:	00 00                	add    BYTE PTR [rax],al
 834:	00 00                	add    BYTE PTR [rax],al
 836:	00 00                	add    BYTE PTR [rax],al
 838:	07                   	(bad)  
 839:	00 00                	add    BYTE PTR [rax],al
 83b:	00 08                	add    BYTE PTR [rax],cl
	...
 845:	00 00                	add    BYTE PTR [rax],al
 847:	00 48 40             	add    BYTE PTR [rax+0x40],cl
 84a:	00 00                	add    BYTE PTR [rax],al
 84c:	00 00                	add    BYTE PTR [rax],al
 84e:	00 00                	add    BYTE PTR [rax],al
 850:	07                   	(bad)  
 851:	00 00                	add    BYTE PTR [rax],al
 853:	00 0a                	add    BYTE PTR [rdx],cl
	...
 85d:	00 00                	add    BYTE PTR [rax],al
 85f:	00 50 40             	add    BYTE PTR [rax+0x40],dl
 862:	00 00                	add    BYTE PTR [rax],al
 864:	00 00                	add    BYTE PTR [rax],al
 866:	00 00                	add    BYTE PTR [rax],al
 868:	07                   	(bad)  
 869:	00 00                	add    BYTE PTR [rax],al
 86b:	00 0b                	add    BYTE PTR [rbx],cl
	...
 875:	00 00                	add    BYTE PTR [rax],al
 877:	00 58 40             	add    BYTE PTR [rax+0x40],bl
 87a:	00 00                	add    BYTE PTR [rax],al
 87c:	00 00                	add    BYTE PTR [rax],al
 87e:	00 00                	add    BYTE PTR [rax],al
 880:	07                   	(bad)  
 881:	00 00                	add    BYTE PTR [rax],al
 883:	00 0c 00             	add    BYTE PTR [rax+rax*1],cl
	...
 88e:	00 00                	add    BYTE PTR [rax],al
 890:	60                   	(bad)  
 891:	40 00 00             	rex add BYTE PTR [rax],al
 894:	00 00                	add    BYTE PTR [rax],al
 896:	00 00                	add    BYTE PTR [rax],al
 898:	07                   	(bad)  
 899:	00 00                	add    BYTE PTR [rax],al
 89b:	00 0f                	add    BYTE PTR [rdi],cl
	...

Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64 
    1004:	48 83 ec 08          	sub    rsp,0x8
    1008:	48 8b 05 d9 2f 00 00 	mov    rax,QWORD PTR [rip+0x2fd9]        # 3fe8 <__gmon_start__>
    100f:	48 85 c0             	test   rax,rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	call   rax
    1016:	48 83 c4 08          	add    rsp,0x8
    101a:	c3                   	ret    

Disassembly of section .plt:

0000000000001020 <puts@plt-0x10>:
    1020:	ff 35 e2 2f 00 00    	push   QWORD PTR [rip+0x2fe2]        # 4008 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	ff 25 e4 2f 00 00    	jmp    QWORD PTR [rip+0x2fe4]        # 4010 <_GLOBAL_OFFSET_TABLE_+0x10>
    102c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000001030 <puts@plt>:
    1030:	ff 25 e2 2f 00 00    	jmp    QWORD PTR [rip+0x2fe2]        # 4018 <puts@GLIBC_2.2.5>
    1036:	68 00 00 00 00       	push   0x0
    103b:	e9 e0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001040 <getpid@plt>:
    1040:	ff 25 da 2f 00 00    	jmp    QWORD PTR [rip+0x2fda]        # 4020 <getpid@GLIBC_2.2.5>
    1046:	68 01 00 00 00       	push   0x1
    104b:	e9 d0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001050 <__stack_chk_fail@plt>:
    1050:	ff 25 d2 2f 00 00    	jmp    QWORD PTR [rip+0x2fd2]        # 4028 <__stack_chk_fail@GLIBC_2.4>
    1056:	68 02 00 00 00       	push   0x2
    105b:	e9 c0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001060 <printf@plt>:
    1060:	ff 25 ca 2f 00 00    	jmp    QWORD PTR [rip+0x2fca]        # 4030 <printf@GLIBC_2.2.5>
    1066:	68 03 00 00 00       	push   0x3
    106b:	e9 b0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001070 <srand@plt>:
    1070:	ff 25 c2 2f 00 00    	jmp    QWORD PTR [rip+0x2fc2]        # 4038 <srand@GLIBC_2.2.5>
    1076:	68 04 00 00 00       	push   0x4
    107b:	e9 a0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001080 <fgets@plt>:
    1080:	ff 25 ba 2f 00 00    	jmp    QWORD PTR [rip+0x2fba]        # 4040 <fgets@GLIBC_2.2.5>
    1086:	68 05 00 00 00       	push   0x5
    108b:	e9 90 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001090 <strtol@plt>:
    1090:	ff 25 b2 2f 00 00    	jmp    QWORD PTR [rip+0x2fb2]        # 4048 <strtol@GLIBC_2.2.5>
    1096:	68 06 00 00 00       	push   0x6
    109b:	e9 80 ff ff ff       	jmp    1020 <_init+0x20>

00000000000010a0 <time@plt>:
    10a0:	ff 25 aa 2f 00 00    	jmp    QWORD PTR [rip+0x2faa]        # 4050 <time@GLIBC_2.2.5>
    10a6:	68 07 00 00 00       	push   0x7
    10ab:	e9 70 ff ff ff       	jmp    1020 <_init+0x20>

00000000000010b0 <setvbuf@plt>:
    10b0:	ff 25 a2 2f 00 00    	jmp    QWORD PTR [rip+0x2fa2]        # 4058 <setvbuf@GLIBC_2.2.5>
    10b6:	68 08 00 00 00       	push   0x8
    10bb:	e9 60 ff ff ff       	jmp    1020 <_init+0x20>

00000000000010c0 <rand@plt>:
    10c0:	ff 25 9a 2f 00 00    	jmp    QWORD PTR [rip+0x2f9a]        # 4060 <rand@GLIBC_2.2.5>
    10c6:	68 09 00 00 00       	push   0x9
    10cb:	e9 50 ff ff ff       	jmp    1020 <_init+0x20>

Disassembly of section .text:

00000000000010d0 <_start>:
    10d0:	f3 0f 1e fa          	endbr64 
    10d4:	31 ed                	xor    ebp,ebp
    10d6:	49 89 d1             	mov    r9,rdx
    10d9:	5e                   	pop    rsi
    10da:	48 89 e2             	mov    rdx,rsp
    10dd:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
    10e1:	50                   	push   rax
    10e2:	54                   	push   rsp
    10e3:	4c 8d 05 76 02 00 00 	lea    r8,[rip+0x276]        # 1360 <__libc_csu_fini>
    10ea:	48 8d 0d ff 01 00 00 	lea    rcx,[rip+0x1ff]        # 12f0 <__libc_csu_init>
    10f1:	48 8d 3d d1 00 00 00 	lea    rdi,[rip+0xd1]        # 11c9 <main>
    10f8:	ff 15 e2 2e 00 00    	call   QWORD PTR [rip+0x2ee2]        # 3fe0 <__libc_start_main@GLIBC_2.2.5>
    10fe:	f4                   	hlt    
    10ff:	90                   	nop

0000000000001100 <deregister_tm_clones>:
    1100:	48 8d 3d 71 2f 00 00 	lea    rdi,[rip+0x2f71]        # 4078 <__TMC_END__>
    1107:	48 8d 05 6a 2f 00 00 	lea    rax,[rip+0x2f6a]        # 4078 <__TMC_END__>
    110e:	48 39 f8             	cmp    rax,rdi
    1111:	74 15                	je     1128 <deregister_tm_clones+0x28>
    1113:	48 8b 05 be 2e 00 00 	mov    rax,QWORD PTR [rip+0x2ebe]        # 3fd8 <_ITM_deregisterTMCloneTable>
    111a:	48 85 c0             	test   rax,rax
    111d:	74 09                	je     1128 <deregister_tm_clones+0x28>
    111f:	ff e0                	jmp    rax
    1121:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    1128:	c3                   	ret    
    1129:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000001130 <register_tm_clones>:
    1130:	48 8d 3d 41 2f 00 00 	lea    rdi,[rip+0x2f41]        # 4078 <__TMC_END__>
    1137:	48 8d 35 3a 2f 00 00 	lea    rsi,[rip+0x2f3a]        # 4078 <__TMC_END__>
    113e:	48 29 fe             	sub    rsi,rdi
    1141:	48 89 f0             	mov    rax,rsi
    1144:	48 c1 ee 3f          	shr    rsi,0x3f
    1148:	48 c1 f8 03          	sar    rax,0x3
    114c:	48 01 c6             	add    rsi,rax
    114f:	48 d1 fe             	sar    rsi,1
    1152:	74 14                	je     1168 <register_tm_clones+0x38>
    1154:	48 8b 05 95 2e 00 00 	mov    rax,QWORD PTR [rip+0x2e95]        # 3ff0 <_ITM_registerTMCloneTable>
    115b:	48 85 c0             	test   rax,rax
    115e:	74 08                	je     1168 <register_tm_clones+0x38>
    1160:	ff e0                	jmp    rax
    1162:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    1168:	c3                   	ret    
    1169:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000001170 <__do_global_dtors_aux>:
    1170:	f3 0f 1e fa          	endbr64 
    1174:	80 3d 1d 2f 00 00 00 	cmp    BYTE PTR [rip+0x2f1d],0x0        # 4098 <completed.0>
    117b:	75 33                	jne    11b0 <__do_global_dtors_aux+0x40>
    117d:	55                   	push   rbp
    117e:	48 83 3d 72 2e 00 00 	cmp    QWORD PTR [rip+0x2e72],0x0        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    1185:	00 
    1186:	48 89 e5             	mov    rbp,rsp
    1189:	74 0d                	je     1198 <__do_global_dtors_aux+0x28>
    118b:	48 8b 3d de 2e 00 00 	mov    rdi,QWORD PTR [rip+0x2ede]        # 4070 <__dso_handle>
    1192:	ff 15 60 2e 00 00    	call   QWORD PTR [rip+0x2e60]        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    1198:	e8 63 ff ff ff       	call   1100 <deregister_tm_clones>
    119d:	c6 05 f4 2e 00 00 01 	mov    BYTE PTR [rip+0x2ef4],0x1        # 4098 <completed.0>
    11a4:	5d                   	pop    rbp
    11a5:	c3                   	ret    
    11a6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    11ad:	00 00 00 
    11b0:	c3                   	ret    
    11b1:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    11b8:	00 00 00 00 
    11bc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

00000000000011c0 <frame_dummy>:
    11c0:	f3 0f 1e fa          	endbr64 
    11c4:	e9 67 ff ff ff       	jmp    1130 <register_tm_clones>

00000000000011c9 <main>:
    11c9:	55                   	push   rbp
    11ca:	48 89 e5             	mov    rbp,rsp
    11cd:	53                   	push   rbx
    11ce:	48 83 ec 38          	sub    rsp,0x38
    11d2:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    11d9:	00 00 
    11db:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    11df:	31 c0                	xor    eax,eax
    11e1:	48 8b 05 98 2e 00 00 	mov    rax,QWORD PTR [rip+0x2e98]        # 4080 <stdout@@GLIBC_2.2.5>
    11e8:	b9 00 00 00 00       	mov    ecx,0x0
    11ed:	ba 02 00 00 00       	mov    edx,0x2
    11f2:	be 00 00 00 00       	mov    esi,0x0
    11f7:	48 89 c7             	mov    rdi,rax
    11fa:	e8 b1 fe ff ff       	call   10b0 <setvbuf@plt>
    11ff:	bf 00 00 00 00       	mov    edi,0x0
    1204:	e8 97 fe ff ff       	call   10a0 <time@plt>
    1209:	89 c3                	mov    ebx,eax
    120b:	e8 30 fe ff ff       	call   1040 <getpid@plt>
    1210:	31 d8                	xor    eax,ebx
    1212:	89 c7                	mov    edi,eax
    1214:	e8 57 fe ff ff       	call   1070 <srand@plt>
    1219:	e8 a2 fe ff ff       	call   10c0 <rand@plt>
    121e:	48 63 d0             	movsxd rdx,eax
    1221:	48 69 d2 ad 8b db 68 	imul   rdx,rdx,0x68db8bad
    1228:	48 c1 ea 20          	shr    rdx,0x20
    122c:	c1 fa 0c             	sar    edx,0xc
    122f:	89 c1                	mov    ecx,eax
    1231:	c1 f9 1f             	sar    ecx,0x1f
    1234:	29 ca                	sub    edx,ecx
    1236:	69 ca 10 27 00 00    	imul   ecx,edx,0x2710
    123c:	29 c8                	sub    eax,ecx
    123e:	89 c2                	mov    edx,eax
    1240:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
    1243:	48 8d 3d ba 0d 00 00 	lea    rdi,[rip+0xdba]        # 2004 <_IO_stdin_used+0x4>
    124a:	b8 00 00 00 00       	mov    eax,0x0
    124f:	e8 0c fe ff ff       	call   1060 <printf@plt>
    1254:	48 8b 15 35 2e 00 00 	mov    rdx,QWORD PTR [rip+0x2e35]        # 4090 <stdin@@GLIBC_2.2.5>
    125b:	48 8d 45 d0          	lea    rax,[rbp-0x30]
    125f:	be 14 00 00 00       	mov    esi,0x14
    1264:	48 89 c7             	mov    rdi,rax
    1267:	e8 14 fe ff ff       	call   1080 <fgets@plt>
    126c:	48 85 c0             	test   rax,rax
    126f:	74 51                	je     12c2 <main+0xf9>
    1271:	48 8d 45 d0          	lea    rax,[rbp-0x30]
    1275:	ba 00 00 00 00       	mov    edx,0x0
    127a:	be 00 00 00 00       	mov    esi,0x0
    127f:	48 89 c7             	mov    rdi,rax
    1282:	e8 09 fe ff ff       	call   1090 <strtol@plt>
    1287:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
    128a:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
    128d:	89 c6                	mov    esi,eax
    128f:	48 8d 3d 81 0d 00 00 	lea    rdi,[rip+0xd81]        # 2017 <_IO_stdin_used+0x17>
    1296:	b8 00 00 00 00       	mov    eax,0x0
    129b:	e8 c0 fd ff ff       	call   1060 <printf@plt>
    12a0:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
    12a3:	39 45 cc             	cmp    DWORD PTR [rbp-0x34],eax
    12a6:	75 0e                	jne    12b6 <main+0xed>
    12a8:	48 8d 3d 7a 0d 00 00 	lea    rdi,[rip+0xd7a]        # 2029 <_IO_stdin_used+0x29>
    12af:	e8 7c fd ff ff       	call   1030 <puts@plt>
    12b4:	eb 0c                	jmp    12c2 <main+0xf9>
    12b6:	48 8d 3d 73 0d 00 00 	lea    rdi,[rip+0xd73]        # 2030 <_IO_stdin_used+0x30>
    12bd:	e8 6e fd ff ff       	call   1030 <puts@plt>
    12c2:	b8 00 00 00 00       	mov    eax,0x0
    12c7:	48 8b 5d e8          	mov    rbx,QWORD PTR [rbp-0x18]
    12cb:	64 48 2b 1c 25 28 00 	sub    rbx,QWORD PTR fs:0x28
    12d2:	00 00 
    12d4:	74 05                	je     12db <main+0x112>
    12d6:	e8 75 fd ff ff       	call   1050 <__stack_chk_fail@plt>
    12db:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
    12df:	c9                   	leave  
    12e0:	c3                   	ret    
    12e1:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    12e8:	00 00 00 
    12eb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000012f0 <__libc_csu_init>:
    12f0:	f3 0f 1e fa          	endbr64 
    12f4:	41 57                	push   r15
    12f6:	4c 8d 3d eb 2a 00 00 	lea    r15,[rip+0x2aeb]        # 3de8 <__frame_dummy_init_array_entry>
    12fd:	41 56                	push   r14
    12ff:	49 89 d6             	mov    r14,rdx
    1302:	41 55                	push   r13
    1304:	49 89 f5             	mov    r13,rsi
    1307:	41 54                	push   r12
    1309:	41 89 fc             	mov    r12d,edi
    130c:	55                   	push   rbp
    130d:	48 8d 2d dc 2a 00 00 	lea    rbp,[rip+0x2adc]        # 3df0 <__do_global_dtors_aux_fini_array_entry>
    1314:	53                   	push   rbx
    1315:	4c 29 fd             	sub    rbp,r15
    1318:	48 83 ec 08          	sub    rsp,0x8
    131c:	e8 df fc ff ff       	call   1000 <_init>
    1321:	48 c1 fd 03          	sar    rbp,0x3
    1325:	74 1f                	je     1346 <__libc_csu_init+0x56>
    1327:	31 db                	xor    ebx,ebx
    1329:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    1330:	4c 89 f2             	mov    rdx,r14
    1333:	4c 89 ee             	mov    rsi,r13
    1336:	44 89 e7             	mov    edi,r12d
    1339:	41 ff 14 df          	call   QWORD PTR [r15+rbx*8]
    133d:	48 83 c3 01          	add    rbx,0x1
    1341:	48 39 dd             	cmp    rbp,rbx
    1344:	75 ea                	jne    1330 <__libc_csu_init+0x40>
    1346:	48 83 c4 08          	add    rsp,0x8
    134a:	5b                   	pop    rbx
    134b:	5d                   	pop    rbp
    134c:	41 5c                	pop    r12
    134e:	41 5d                	pop    r13
    1350:	41 5e                	pop    r14
    1352:	41 5f                	pop    r15
    1354:	c3                   	ret    
    1355:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    135c:	00 00 00 00 

0000000000001360 <__libc_csu_fini>:
    1360:	f3 0f 1e fa          	endbr64 
    1364:	c3                   	ret    

Disassembly of section .fini:

0000000000001368 <_fini>:
    1368:	f3 0f 1e fa          	endbr64 
    136c:	48 83 ec 08          	sub    rsp,0x8
    1370:	48 83 c4 08          	add    rsp,0x8
    1374:	c3                   	ret    

Disassembly of section .rodata:

0000000000002000 <_IO_stdin_used>:
    2000:	01 00                	add    DWORD PTR [rax],eax
    2002:	02 00                	add    al,BYTE PTR [rax]
    2004:	47 75 65             	rex.RXB jne 206c <__GNU_EH_FRAME_HDR+0x2c>
    2007:	73 73                	jae    207c <__GNU_EH_FRAME_HDR+0x3c>
    2009:	20 74 68 65          	and    BYTE PTR [rax+rbp*2+0x65],dh
    200d:	20 6e 75             	and    BYTE PTR [rsi+0x75],ch
    2010:	6d                   	ins    DWORD PTR es:[rdi],dx
    2011:	62                   	(bad)  
    2012:	65 72 3a             	gs jb  204f <__GNU_EH_FRAME_HDR+0xf>
    2015:	20 00                	and    BYTE PTR [rax],al
    2017:	59                   	pop    rcx
    2018:	6f                   	outs   dx,DWORD PTR ds:[rsi]
    2019:	75 72                	jne    208d <__GNU_EH_FRAME_HDR+0x4d>
    201b:	20 67 75             	and    BYTE PTR [rdi+0x75],ah
    201e:	65 73 73             	gs jae 2094 <__GNU_EH_FRAME_HDR+0x54>
    2021:	20 69 73             	and    BYTE PTR [rcx+0x73],ch
    2024:	20 25 64 0a 00 42    	and    BYTE PTR [rip+0x42000a64],ah        # 42002a8e <_end+0x41ffe9ee>
    202a:	69 6e 67 6f 21 00 4e 	imul   ebp,DWORD PTR [rsi+0x67],0x4e00216f
    2031:	6f                   	outs   dx,DWORD PTR ds:[rsi]
    2032:	20 6e 6f             	and    BYTE PTR [rsi+0x6f],ch
    2035:	20 6e 6f             	and    BYTE PTR [rsi+0x6f],ch
    2038:	20 2e                	and    BYTE PTR [rsi],ch
    203a:	2e                   	cs
    203b:	2e                   	cs
	...

Disassembly of section .eh_frame_hdr:

0000000000002040 <__GNU_EH_FRAME_HDR>:
    2040:	01 1b                	add    DWORD PTR [rbx],ebx
    2042:	03 3b                	add    edi,DWORD PTR [rbx]
    2044:	34 00                	xor    al,0x0
    2046:	00 00                	add    BYTE PTR [rax],al
    2048:	05 00 00 00 e0       	add    eax,0xe0000000
    204d:	ef                   	out    dx,eax
    204e:	ff                   	(bad)  
    204f:	ff 68 00             	jmp    FWORD PTR [rax+0x0]
    2052:	00 00                	add    BYTE PTR [rax],al
    2054:	90                   	nop
    2055:	f0 ff                	lock (bad) 
    2057:	ff 50 00             	call   QWORD PTR [rax+0x0]
    205a:	00 00                	add    BYTE PTR [rax],al
    205c:	89 f1                	mov    ecx,esi
    205e:	ff                   	(bad)  
    205f:	ff 90 00 00 00 b0    	call   QWORD PTR [rax-0x50000000]
    2065:	f2 ff                	repnz (bad) 
    2067:	ff                   	(bad)  
    2068:	b8 00 00 00 20       	mov    eax,0x20000000
    206d:	f3 ff                	repz (bad) 
    206f:	ff 00                	inc    DWORD PTR [rax]
    2071:	01 00                	add    DWORD PTR [rax],eax
	...

Disassembly of section .eh_frame:

0000000000002078 <__FRAME_END__-0xdc>:
    2078:	14 00                	adc    al,0x0
    207a:	00 00                	add    BYTE PTR [rax],al
    207c:	00 00                	add    BYTE PTR [rax],al
    207e:	00 00                	add    BYTE PTR [rax],al
    2080:	01 7a 52             	add    DWORD PTR [rdx+0x52],edi
    2083:	00 01                	add    BYTE PTR [rcx],al
    2085:	78 10                	js     2097 <__GNU_EH_FRAME_HDR+0x57>
    2087:	01 1b                	add    DWORD PTR [rbx],ebx
    2089:	0c 07                	or     al,0x7
    208b:	08 90 01 00 00 14    	or     BYTE PTR [rax+0x14000001],dl
    2091:	00 00                	add    BYTE PTR [rax],al
    2093:	00 1c 00             	add    BYTE PTR [rax+rax*1],bl
    2096:	00 00                	add    BYTE PTR [rax],al
    2098:	38 f0                	cmp    al,dh
    209a:	ff                   	(bad)  
    209b:	ff 2f                	jmp    FWORD PTR [rdi]
    209d:	00 00                	add    BYTE PTR [rax],al
    209f:	00 00                	add    BYTE PTR [rax],al
    20a1:	44 07                	rex.R (bad) 
    20a3:	10 00                	adc    BYTE PTR [rax],al
    20a5:	00 00                	add    BYTE PTR [rax],al
    20a7:	00 24 00             	add    BYTE PTR [rax+rax*1],ah
    20aa:	00 00                	add    BYTE PTR [rax],al
    20ac:	34 00                	xor    al,0x0
    20ae:	00 00                	add    BYTE PTR [rax],al
    20b0:	70 ef                	jo     20a1 <__GNU_EH_FRAME_HDR+0x61>
    20b2:	ff                   	(bad)  
    20b3:	ff b0 00 00 00 00    	push   QWORD PTR [rax+0x0]
    20b9:	0e                   	(bad)  
    20ba:	10 46 0e             	adc    BYTE PTR [rsi+0xe],al
    20bd:	18 4a 0f             	sbb    BYTE PTR [rdx+0xf],cl
    20c0:	0b 77 08             	or     esi,DWORD PTR [rdi+0x8]
    20c3:	80 00 3f             	add    BYTE PTR [rax],0x3f
    20c6:	1a 3b                	sbb    bh,BYTE PTR [rbx]
    20c8:	2a 33                	sub    dh,BYTE PTR [rbx]
    20ca:	24 22                	and    al,0x22
    20cc:	00 00                	add    BYTE PTR [rax],al
    20ce:	00 00                	add    BYTE PTR [rax],al
    20d0:	24 00                	and    al,0x0
    20d2:	00 00                	add    BYTE PTR [rax],al
    20d4:	5c                   	pop    rsp
    20d5:	00 00                	add    BYTE PTR [rax],al
    20d7:	00 f1                	add    cl,dh
    20d9:	f0 ff                	lock (bad) 
    20db:	ff 18                	call   FWORD PTR [rax]
    20dd:	01 00                	add    DWORD PTR [rax],eax
    20df:	00 00                	add    BYTE PTR [rax],al
    20e1:	41 0e                	rex.B (bad) 
    20e3:	10 86 02 43 0d 06    	adc    BYTE PTR [rsi+0x60d4302],al
    20e9:	45 83 03 03          	rex.RB add DWORD PTR [r11],0x3
    20ed:	0e                   	(bad)  
    20ee:	01 0c 07             	add    DWORD PTR [rdi+rax*1],ecx
    20f1:	08 00                	or     BYTE PTR [rax],al
    20f3:	00 00                	add    BYTE PTR [rax],al
    20f5:	00 00                	add    BYTE PTR [rax],al
    20f7:	00 44 00 00          	add    BYTE PTR [rax+rax*1+0x0],al
    20fb:	00 84 00 00 00 f0 f1 	add    BYTE PTR [rax+rax*1-0xe100000],al
    2102:	ff                   	(bad)  
    2103:	ff 65 00             	jmp    QWORD PTR [rbp+0x0]
    2106:	00 00                	add    BYTE PTR [rax],al
    2108:	00 46 0e             	add    BYTE PTR [rsi+0xe],al
    210b:	10 8f 02 49 0e 18    	adc    BYTE PTR [rdi+0x180e4902],cl
    2111:	8e 03                	mov    es,WORD PTR [rbx]
    2113:	45 0e                	rex.RB (bad) 
    2115:	20 8d 04 45 0e 28    	and    BYTE PTR [rbp+0x280e4504],cl
    211b:	8c 05 44 0e 30 86    	mov    WORD PTR [rip+0xffffffff86300e44],es        # ffffffff86302f65 <_end+0xffffffff862feec5>
    2121:	06                   	(bad)  
    2122:	48 0e                	rex.W (bad) 
    2124:	38 83 07 47 0e 40    	cmp    BYTE PTR [rbx+0x400e4707],al
    212a:	6e                   	outs   dx,BYTE PTR ds:[rsi]
    212b:	0e                   	(bad)  
    212c:	38 41 0e             	cmp    BYTE PTR [rcx+0xe],al
    212f:	30 41 0e             	xor    BYTE PTR [rcx+0xe],al
    2132:	28 42 0e             	sub    BYTE PTR [rdx+0xe],al
    2135:	20 42 0e             	and    BYTE PTR [rdx+0xe],al
    2138:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
    213b:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
    213e:	08 00                	or     BYTE PTR [rax],al
    2140:	10 00                	adc    BYTE PTR [rax],al
    2142:	00 00                	add    BYTE PTR [rax],al
    2144:	cc                   	int3   
    2145:	00 00                	add    BYTE PTR [rax],al
    2147:	00 18                	add    BYTE PTR [rax],bl
    2149:	f2 ff                	repnz (bad) 
    214b:	ff 05 00 00 00 00    	inc    DWORD PTR [rip+0x0]        # 2151 <__GNU_EH_FRAME_HDR+0x111>
    2151:	00 00                	add    BYTE PTR [rax],al
	...

0000000000002154 <__FRAME_END__>:
    2154:	00 00                	add    BYTE PTR [rax],al
	...

Disassembly of section .init_array:

0000000000003de8 <__frame_dummy_init_array_entry>:
    3de8:	c0 11 00             	rcl    BYTE PTR [rcx],0x0
    3deb:	00 00                	add    BYTE PTR [rax],al
    3ded:	00 00                	add    BYTE PTR [rax],al
	...

Disassembly of section .fini_array:

0000000000003df0 <__do_global_dtors_aux_fini_array_entry>:
    3df0:	70 11                	jo     3e03 <_DYNAMIC+0xb>
    3df2:	00 00                	add    BYTE PTR [rax],al
    3df4:	00 00                	add    BYTE PTR [rax],al
	...

Disassembly of section .dynamic:

0000000000003df8 <_DYNAMIC>:
    3df8:	01 00                	add    DWORD PTR [rax],eax
    3dfa:	00 00                	add    BYTE PTR [rax],al
    3dfc:	00 00                	add    BYTE PTR [rax],al
    3dfe:	00 00                	add    BYTE PTR [rax],al
    3e00:	73 00                	jae    3e02 <_DYNAMIC+0xa>
    3e02:	00 00                	add    BYTE PTR [rax],al
    3e04:	00 00                	add    BYTE PTR [rax],al
    3e06:	00 00                	add    BYTE PTR [rax],al
    3e08:	0c 00                	or     al,0x0
    3e0a:	00 00                	add    BYTE PTR [rax],al
    3e0c:	00 00                	add    BYTE PTR [rax],al
    3e0e:	00 00                	add    BYTE PTR [rax],al
    3e10:	00 10                	add    BYTE PTR [rax],dl
    3e12:	00 00                	add    BYTE PTR [rax],al
    3e14:	00 00                	add    BYTE PTR [rax],al
    3e16:	00 00                	add    BYTE PTR [rax],al
    3e18:	0d 00 00 00 00       	or     eax,0x0
    3e1d:	00 00                	add    BYTE PTR [rax],al
    3e1f:	00 68 13             	add    BYTE PTR [rax+0x13],ch
    3e22:	00 00                	add    BYTE PTR [rax],al
    3e24:	00 00                	add    BYTE PTR [rax],al
    3e26:	00 00                	add    BYTE PTR [rax],al
    3e28:	19 00                	sbb    DWORD PTR [rax],eax
    3e2a:	00 00                	add    BYTE PTR [rax],al
    3e2c:	00 00                	add    BYTE PTR [rax],al
    3e2e:	00 00                	add    BYTE PTR [rax],al
    3e30:	e8 3d 00 00 00       	call   3e72 <_DYNAMIC+0x7a>
    3e35:	00 00                	add    BYTE PTR [rax],al
    3e37:	00 1b                	add    BYTE PTR [rbx],bl
    3e39:	00 00                	add    BYTE PTR [rax],al
    3e3b:	00 00                	add    BYTE PTR [rax],al
    3e3d:	00 00                	add    BYTE PTR [rax],al
    3e3f:	00 08                	add    BYTE PTR [rax],cl
    3e41:	00 00                	add    BYTE PTR [rax],al
    3e43:	00 00                	add    BYTE PTR [rax],al
    3e45:	00 00                	add    BYTE PTR [rax],al
    3e47:	00 1a                	add    BYTE PTR [rdx],bl
    3e49:	00 00                	add    BYTE PTR [rax],al
    3e4b:	00 00                	add    BYTE PTR [rax],al
    3e4d:	00 00                	add    BYTE PTR [rax],al
    3e4f:	00 f0                	add    al,dh
    3e51:	3d 00 00 00 00       	cmp    eax,0x0
    3e56:	00 00                	add    BYTE PTR [rax],al
    3e58:	1c 00                	sbb    al,0x0
    3e5a:	00 00                	add    BYTE PTR [rax],al
    3e5c:	00 00                	add    BYTE PTR [rax],al
    3e5e:	00 00                	add    BYTE PTR [rax],al
    3e60:	08 00                	or     BYTE PTR [rax],al
    3e62:	00 00                	add    BYTE PTR [rax],al
    3e64:	00 00                	add    BYTE PTR [rax],al
    3e66:	00 00                	add    BYTE PTR [rax],al
    3e68:	f5                   	cmc    
    3e69:	fe                   	(bad)  
    3e6a:	ff 6f 00             	jmp    FWORD PTR [rdi+0x0]
    3e6d:	00 00                	add    BYTE PTR [rax],al
    3e6f:	00 c0                	add    al,al
    3e71:	03 00                	add    eax,DWORD PTR [rax]
    3e73:	00 00                	add    BYTE PTR [rax],al
    3e75:	00 00                	add    BYTE PTR [rax],al
    3e77:	00 05 00 00 00 00    	add    BYTE PTR [rip+0x0],al        # 3e7d <_DYNAMIC+0x85>
    3e7d:	00 00                	add    BYTE PTR [rax],al
    3e7f:	00 98 05 00 00 00    	add    BYTE PTR [rax+0x5],bl
    3e85:	00 00                	add    BYTE PTR [rax],al
    3e87:	00 06                	add    BYTE PTR [rsi],al
    3e89:	00 00                	add    BYTE PTR [rax],al
    3e8b:	00 00                	add    BYTE PTR [rax],al
    3e8d:	00 00                	add    BYTE PTR [rax],al
    3e8f:	00 e8                	add    al,ch
    3e91:	03 00                	add    eax,DWORD PTR [rax]
    3e93:	00 00                	add    BYTE PTR [rax],al
    3e95:	00 00                	add    BYTE PTR [rax],al
    3e97:	00 0a                	add    BYTE PTR [rdx],cl
    3e99:	00 00                	add    BYTE PTR [rax],al
    3e9b:	00 00                	add    BYTE PTR [rax],al
    3e9d:	00 00                	add    BYTE PTR [rax],al
    3e9f:	00 d8                	add    al,bl
    3ea1:	00 00                	add    BYTE PTR [rax],al
    3ea3:	00 00                	add    BYTE PTR [rax],al
    3ea5:	00 00                	add    BYTE PTR [rax],al
    3ea7:	00 0b                	add    BYTE PTR [rbx],cl
    3ea9:	00 00                	add    BYTE PTR [rax],al
    3eab:	00 00                	add    BYTE PTR [rax],al
    3ead:	00 00                	add    BYTE PTR [rax],al
    3eaf:	00 18                	add    BYTE PTR [rax],bl
    3eb1:	00 00                	add    BYTE PTR [rax],al
    3eb3:	00 00                	add    BYTE PTR [rax],al
    3eb5:	00 00                	add    BYTE PTR [rax],al
    3eb7:	00 15 00 00 00 00    	add    BYTE PTR [rip+0x0],dl        # 3ebd <_DYNAMIC+0xc5>
	...
    3ec5:	00 00                	add    BYTE PTR [rax],al
    3ec7:	00 03                	add    BYTE PTR [rbx],al
	...
    3ed1:	40 00 00             	rex add BYTE PTR [rax],al
    3ed4:	00 00                	add    BYTE PTR [rax],al
    3ed6:	00 00                	add    BYTE PTR [rax],al
    3ed8:	02 00                	add    al,BYTE PTR [rax]
    3eda:	00 00                	add    BYTE PTR [rax],al
    3edc:	00 00                	add    BYTE PTR [rax],al
    3ede:	00 00                	add    BYTE PTR [rax],al
    3ee0:	f0 00 00             	lock add BYTE PTR [rax],al
    3ee3:	00 00                	add    BYTE PTR [rax],al
    3ee5:	00 00                	add    BYTE PTR [rax],al
    3ee7:	00 14 00             	add    BYTE PTR [rax+rax*1],dl
    3eea:	00 00                	add    BYTE PTR [rax],al
    3eec:	00 00                	add    BYTE PTR [rax],al
    3eee:	00 00                	add    BYTE PTR [rax],al
    3ef0:	07                   	(bad)  
    3ef1:	00 00                	add    BYTE PTR [rax],al
    3ef3:	00 00                	add    BYTE PTR [rax],al
    3ef5:	00 00                	add    BYTE PTR [rax],al
    3ef7:	00 17                	add    BYTE PTR [rdi],dl
    3ef9:	00 00                	add    BYTE PTR [rax],al
    3efb:	00 00                	add    BYTE PTR [rax],al
    3efd:	00 00                	add    BYTE PTR [rax],al
    3eff:	00 b8 07 00 00 00    	add    BYTE PTR [rax+0x7],bh
    3f05:	00 00                	add    BYTE PTR [rax],al
    3f07:	00 07                	add    BYTE PTR [rdi],al
    3f09:	00 00                	add    BYTE PTR [rax],al
    3f0b:	00 00                	add    BYTE PTR [rax],al
    3f0d:	00 00                	add    BYTE PTR [rax],al
    3f0f:	00 c8                	add    al,cl
    3f11:	06                   	(bad)  
    3f12:	00 00                	add    BYTE PTR [rax],al
    3f14:	00 00                	add    BYTE PTR [rax],al
    3f16:	00 00                	add    BYTE PTR [rax],al
    3f18:	08 00                	or     BYTE PTR [rax],al
    3f1a:	00 00                	add    BYTE PTR [rax],al
    3f1c:	00 00                	add    BYTE PTR [rax],al
    3f1e:	00 00                	add    BYTE PTR [rax],al
    3f20:	f0 00 00             	lock add BYTE PTR [rax],al
    3f23:	00 00                	add    BYTE PTR [rax],al
    3f25:	00 00                	add    BYTE PTR [rax],al
    3f27:	00 09                	add    BYTE PTR [rcx],cl
    3f29:	00 00                	add    BYTE PTR [rax],al
    3f2b:	00 00                	add    BYTE PTR [rax],al
    3f2d:	00 00                	add    BYTE PTR [rax],al
    3f2f:	00 18                	add    BYTE PTR [rax],bl
    3f31:	00 00                	add    BYTE PTR [rax],al
    3f33:	00 00                	add    BYTE PTR [rax],al
    3f35:	00 00                	add    BYTE PTR [rax],al
    3f37:	00 fb                	add    bl,bh
    3f39:	ff                   	(bad)  
    3f3a:	ff 6f 00             	jmp    FWORD PTR [rdi+0x0]
    3f3d:	00 00                	add    BYTE PTR [rax],al
    3f3f:	00 00                	add    BYTE PTR [rax],al
    3f41:	00 00                	add    BYTE PTR [rax],al
    3f43:	08 00                	or     BYTE PTR [rax],al
    3f45:	00 00                	add    BYTE PTR [rax],al
    3f47:	00 fe                	add    dh,bh
    3f49:	ff                   	(bad)  
    3f4a:	ff 6f 00             	jmp    FWORD PTR [rdi+0x0]
    3f4d:	00 00                	add    BYTE PTR [rax],al
    3f4f:	00 98 06 00 00 00    	add    BYTE PTR [rax+0x6],bl
    3f55:	00 00                	add    BYTE PTR [rax],al
    3f57:	00 ff                	add    bh,bh
    3f59:	ff                   	(bad)  
    3f5a:	ff 6f 00             	jmp    FWORD PTR [rdi+0x0]
    3f5d:	00 00                	add    BYTE PTR [rax],al
    3f5f:	00 01                	add    BYTE PTR [rcx],al
    3f61:	00 00                	add    BYTE PTR [rax],al
    3f63:	00 00                	add    BYTE PTR [rax],al
    3f65:	00 00                	add    BYTE PTR [rax],al
    3f67:	00 f0                	add    al,dh
    3f69:	ff                   	(bad)  
    3f6a:	ff 6f 00             	jmp    FWORD PTR [rdi+0x0]
    3f6d:	00 00                	add    BYTE PTR [rax],al
    3f6f:	00 70 06             	add    BYTE PTR [rax+0x6],dh
    3f72:	00 00                	add    BYTE PTR [rax],al
    3f74:	00 00                	add    BYTE PTR [rax],al
    3f76:	00 00                	add    BYTE PTR [rax],al
    3f78:	f9                   	stc    
    3f79:	ff                   	(bad)  
    3f7a:	ff 6f 00             	jmp    FWORD PTR [rdi+0x0]
    3f7d:	00 00                	add    BYTE PTR [rax],al
    3f7f:	00 03                	add    BYTE PTR [rbx],al
	...

Disassembly of section .got:

0000000000003fd8 <.got>:
	...

Disassembly of section .got.plt:

0000000000004000 <_GLOBAL_OFFSET_TABLE_>:
    4000:	f8                   	clc    
    4001:	3d 00 00 00 00       	cmp    eax,0x0
	...
    4016:	00 00                	add    BYTE PTR [rax],al
    4018:	36 10 00             	ss adc BYTE PTR [rax],al
    401b:	00 00                	add    BYTE PTR [rax],al
    401d:	00 00                	add    BYTE PTR [rax],al
    401f:	00 46 10             	add    BYTE PTR [rsi+0x10],al
    4022:	00 00                	add    BYTE PTR [rax],al
    4024:	00 00                	add    BYTE PTR [rax],al
    4026:	00 00                	add    BYTE PTR [rax],al
    4028:	56                   	push   rsi
    4029:	10 00                	adc    BYTE PTR [rax],al
    402b:	00 00                	add    BYTE PTR [rax],al
    402d:	00 00                	add    BYTE PTR [rax],al
    402f:	00 66 10             	add    BYTE PTR [rsi+0x10],ah
    4032:	00 00                	add    BYTE PTR [rax],al
    4034:	00 00                	add    BYTE PTR [rax],al
    4036:	00 00                	add    BYTE PTR [rax],al
    4038:	76 10                	jbe    404a <_GLOBAL_OFFSET_TABLE_+0x4a>
    403a:	00 00                	add    BYTE PTR [rax],al
    403c:	00 00                	add    BYTE PTR [rax],al
    403e:	00 00                	add    BYTE PTR [rax],al
    4040:	86 10                	xchg   BYTE PTR [rax],dl
    4042:	00 00                	add    BYTE PTR [rax],al
    4044:	00 00                	add    BYTE PTR [rax],al
    4046:	00 00                	add    BYTE PTR [rax],al
    4048:	96                   	xchg   esi,eax
    4049:	10 00                	adc    BYTE PTR [rax],al
    404b:	00 00                	add    BYTE PTR [rax],al
    404d:	00 00                	add    BYTE PTR [rax],al
    404f:	00 a6 10 00 00 00    	add    BYTE PTR [rsi+0x10],ah
    4055:	00 00                	add    BYTE PTR [rax],al
    4057:	00 b6 10 00 00 00    	add    BYTE PTR [rsi+0x10],dh
    405d:	00 00                	add    BYTE PTR [rax],al
    405f:	00 c6                	add    dh,al
    4061:	10 00                	adc    BYTE PTR [rax],al
    4063:	00 00                	add    BYTE PTR [rax],al
    4065:	00 00                	add    BYTE PTR [rax],al
	...

Disassembly of section .data:

0000000000004068 <__data_start>:
	...

0000000000004070 <__dso_handle>:
    4070:	70 40                	jo     40b2 <_end+0x12>
    4072:	00 00                	add    BYTE PTR [rax],al
    4074:	00 00                	add    BYTE PTR [rax],al
	...

Disassembly of section .bss:

0000000000004080 <stdout@GLIBC_2.2.5>:
	...

0000000000004090 <stdin@GLIBC_2.2.5>:
	...

0000000000004098 <completed.0>:
	...

Disassembly of section .comment:

0000000000000000 <.comment>:
   0:	47                   	rex.RXB
   1:	43                   	rex.XB
   2:	43 3a 20             	rex.XB cmp spl,BYTE PTR [r8]
   5:	28 47 4e             	sub    BYTE PTR [rdi+0x4e],al
   8:	55                   	push   rbp
   9:	29 20                	sub    DWORD PTR [rax],esp
   b:	31 30                	xor    DWORD PTR [rax],esi
   d:	2e 32 2e             	cs xor ch,BYTE PTR [rsi]
  10:	30 00                	xor    BYTE PTR [rax],al

Disassembly of section .debug_aranges:

0000000000000000 <.debug_aranges>:
   0:	2c 00                	sub    al,0x0
   2:	00 00                	add    BYTE PTR [rax],al
   4:	02 00                	add    al,BYTE PTR [rax]
   6:	00 00                	add    BYTE PTR [rax],al
   8:	00 00                	add    BYTE PTR [rax],al
   a:	08 00                	or     BYTE PTR [rax],al
   c:	00 00                	add    BYTE PTR [rax],al
   e:	00 00                	add    BYTE PTR [rax],al
  10:	c9                   	leave  
  11:	11 00                	adc    DWORD PTR [rax],eax
  13:	00 00                	add    BYTE PTR [rax],al
  15:	00 00                	add    BYTE PTR [rax],al
  17:	00 18                	add    BYTE PTR [rax],bl
  19:	01 00                	add    DWORD PTR [rax],eax
	...

Disassembly of section .debug_info:

0000000000000000 <.debug_info>:
   0:	29 03                	sub    DWORD PTR [rbx],eax
   2:	00 00                	add    BYTE PTR [rax],al
   4:	04 00                	add    al,0x0
   6:	00 00                	add    BYTE PTR [rax],al
   8:	00 00                	add    BYTE PTR [rax],al
   a:	08 01                	or     BYTE PTR [rcx],al
   c:	89 00                	mov    DWORD PTR [rax],eax
   e:	00 00                	add    BYTE PTR [rax],al
  10:	0c f6                	or     al,0xf6
  12:	01 00                	add    DWORD PTR [rax],eax
  14:	00 31                	add    BYTE PTR [rcx],dh
  16:	01 00                	add    DWORD PTR [rax],eax
  18:	00 c9                	add    cl,cl
  1a:	11 00                	adc    DWORD PTR [rax],eax
  1c:	00 00                	add    BYTE PTR [rax],al
  1e:	00 00                	add    BYTE PTR [rax],al
  20:	00 18                	add    BYTE PTR [rax],bl
  22:	01 00                	add    DWORD PTR [rax],eax
	...
  2c:	00 02                	add    BYTE PTR [rdx],al
  2e:	1b 00                	sbb    eax,DWORD PTR [rax]
  30:	00 00                	add    BYTE PTR [rax],al
  32:	02 d1                	add    dl,cl
  34:	17                   	(bad)  
  35:	39 00                	cmp    DWORD PTR [rax],eax
  37:	00 00                	add    BYTE PTR [rax],al
  39:	03 08                	add    ecx,DWORD PTR [rax]
  3b:	07                   	(bad)  
  3c:	71 01                	jno    3f <__abi_tag-0x35d>
  3e:	00 00                	add    BYTE PTR [rax],al
  40:	03 04 07             	add    eax,DWORD PTR [rdi+rax*1]
  43:	76 01                	jbe    46 <__abi_tag-0x356>
  45:	00 00                	add    BYTE PTR [rax],al
  47:	04 08                	add    al,0x8
  49:	03 01                	add    eax,DWORD PTR [rcx]
  4b:	08 23                	or     BYTE PTR [rbx],ah
  4d:	01 00                	add    DWORD PTR [rax],eax
  4f:	00 03                	add    BYTE PTR [rbx],al
  51:	02 07                	add    al,BYTE PTR [rdi]
  53:	c3                   	ret    
  54:	00 00                	add    BYTE PTR [rax],al
  56:	00 03                	add    BYTE PTR [rbx],al
  58:	01 06                	add    DWORD PTR [rsi],eax
  5a:	25 01 00 00 03       	and    eax,0x3000001
  5f:	02 05 0c 02 00 00    	add    al,BYTE PTR [rip+0x20c]        # 271 <__abi_tag-0x12b>
  65:	05 04 05 69 6e       	add    eax,0x6e690504
  6a:	74 00                	je     6c <__abi_tag-0x330>
  6c:	03 08                	add    ecx,DWORD PTR [rax]
  6e:	05 e0 01 00 00       	add    eax,0x1e0
  73:	02 3d 00 00 00 03    	add    bh,BYTE PTR [rip+0x3000000]        # 3000079 <_end+0x2ffbfd9>
  79:	98                   	cwde   
  7a:	19 6c 00 00          	sbb    DWORD PTR [rax+rax*1+0x0],ebp
  7e:	00 02                	add    BYTE PTR [rdx],al
  80:	60                   	(bad)  
  81:	00 00                	add    BYTE PTR [rax],al
  83:	00 03                	add    BYTE PTR [rbx],al
  85:	99                   	cdq    
  86:	1b 6c 00 00          	sbb    ebp,DWORD PTR [rax+rax*1+0x0]
  8a:	00 06                	add    BYTE PTR [rsi],al
  8c:	08 91 00 00 00 03    	or     BYTE PTR [rcx+0x3000000],dl
  92:	01 06                	add    DWORD PTR [rsi],eax
  94:	2c 01                	sub    al,0x1
  96:	00 00                	add    BYTE PTR [rax],al
  98:	07                   	(bad)  
  99:	72 00                	jb     9b <__abi_tag-0x301>
  9b:	00 00                	add    BYTE PTR [rax],al
  9d:	d8 04 31             	fadd   DWORD PTR [rcx+rsi*1]
  a0:	08 1f                	or     BYTE PTR [rdi],bl
  a2:	02 00                	add    al,BYTE PTR [rax]
  a4:	00 08                	add    BYTE PTR [rax],cl
  a6:	26 02 00             	es add al,BYTE PTR [rax]
  a9:	00 04 33             	add    BYTE PTR [rbx+rsi*1],al
  ac:	07                   	(bad)  
  ad:	65 00 00             	add    BYTE PTR gs:[rax],al
  b0:	00 00                	add    BYTE PTR [rax],al
  b2:	08 e9                	or     cl,ch
  b4:	01 00                	add    DWORD PTR [rax],eax
  b6:	00 04 36             	add    BYTE PTR [rsi+rsi*1],al
  b9:	09 8b 00 00 00 08    	or     DWORD PTR [rbx+0x8000000],ecx
  bf:	08 0e                	or     BYTE PTR [rsi],cl
  c1:	00 00                	add    BYTE PTR [rax],al
  c3:	00 04 37             	add    BYTE PTR [rdi+rsi*1],al
  c6:	09 8b 00 00 00 10    	or     DWORD PTR [rbx+0x10000000],ecx
  cc:	08 00                	or     BYTE PTR [rax],al
  ce:	00 00                	add    BYTE PTR [rax],al
  d0:	00 04 38             	add    BYTE PTR [rax+rdi*1],al
  d3:	09 8b 00 00 00 18    	or     DWORD PTR [rbx+0x18000000],ecx
  d9:	08 22                	or     BYTE PTR [rdx],ah
  db:	00 00                	add    BYTE PTR [rax],al
  dd:	00 04 39             	add    BYTE PTR [rcx+rdi*1],al
  e0:	09 8b 00 00 00 20    	or     DWORD PTR [rbx+0x20000000],ecx
  e6:	08 2d 02 00 00 04    	or     BYTE PTR [rip+0x4000002],ch        # 40000ee <_end+0x3ffc04e>
  ec:	3a 09                	cmp    cl,BYTE PTR [rcx]
  ee:	8b 00                	mov    eax,DWORD PTR [rax]
  f0:	00 00                	add    BYTE PTR [rax],al
  f2:	28 08                	sub    BYTE PTR [rax],cl
  f4:	fe 01                	inc    BYTE PTR [rcx]
  f6:	00 00                	add    BYTE PTR [rax],al
  f8:	04 3b                	add    al,0x3b
  fa:	09 8b 00 00 00 30    	or     DWORD PTR [rbx+0x30000000],ecx
 100:	08 9b 01 00 00 04    	or     BYTE PTR [rbx+0x4000001],bl
 106:	3c 09                	cmp    al,0x9
 108:	8b 00                	mov    eax,DWORD PTR [rax]
 10a:	00 00                	add    BYTE PTR [rax],al
 10c:	38 08                	cmp    BYTE PTR [rax],cl
 10e:	31 00                	xor    DWORD PTR [rax],eax
 110:	00 00                	add    BYTE PTR [rax],al
 112:	04 3d                	add    al,0x3d
 114:	09 8b 00 00 00 40    	or     DWORD PTR [rbx+0x40000000],ecx
 11a:	08 7b 00             	or     BYTE PTR [rbx+0x0],bh
 11d:	00 00                	add    BYTE PTR [rax],al
 11f:	04 40                	add    al,0x40
 121:	09 8b 00 00 00 48    	or     DWORD PTR [rbx+0x48000000],ecx
 127:	08 16                	or     BYTE PTR [rsi],dl
 129:	02 00                	add    al,BYTE PTR [rax]
 12b:	00 04 41             	add    BYTE PTR [rcx+rax*2],al
 12e:	09 8b 00 00 00 50    	or     DWORD PTR [rbx+0x50000000],ecx
 134:	08 dc                	or     ah,bl
 136:	00 00                	add    BYTE PTR [rax],al
 138:	00 04 42             	add    BYTE PTR [rdx+rax*2],al
 13b:	09 8b 00 00 00 58    	or     DWORD PTR [rbx+0x58000000],ecx
 141:	08 f4                	or     ah,dh
 143:	00 00                	add    BYTE PTR [rax],al
 145:	00 04 44             	add    BYTE PTR [rsp+rax*2],al
 148:	16                   	(bad)  
 149:	38 02                	cmp    BYTE PTR [rdx],al
 14b:	00 00                	add    BYTE PTR [rax],al
 14d:	60                   	(bad)  
 14e:	08 4c 00 00          	or     BYTE PTR [rax+rax*1+0x0],cl
 152:	00 04 46             	add    BYTE PTR [rsi+rax*2],al
 155:	14 3e                	adc    al,0x3e
 157:	02 00                	add    al,BYTE PTR [rax]
 159:	00 68 08             	add    BYTE PTR [rax+0x8],ch
 15c:	6a 00                	push   0x0
 15e:	00 00                	add    BYTE PTR [rax],al
 160:	04 48                	add    al,0x48
 162:	07                   	(bad)  
 163:	65 00 00             	add    BYTE PTR gs:[rax],al
 166:	00 70 08             	add    BYTE PTR [rax+0x8],dh
 169:	02 01                	add    al,BYTE PTR [rcx]
 16b:	00 00                	add    BYTE PTR [rax],al
 16d:	04 49                	add    al,0x49
 16f:	07                   	(bad)  
 170:	65 00 00             	add    BYTE PTR gs:[rax],al
 173:	00 74 08 0a          	add    BYTE PTR [rax+rcx*1+0xa],dh
 177:	01 00                	add    DWORD PTR [rax],eax
 179:	00 04 4a             	add    BYTE PTR [rdx+rcx*2],al
 17c:	0b 73 00             	or     esi,DWORD PTR [rbx+0x0]
 17f:	00 00                	add    BYTE PTR [rax],al
 181:	78 08                	js     18b <__abi_tag-0x211>
 183:	8f 01                	pop    QWORD PTR [rcx]
 185:	00 00                	add    BYTE PTR [rax],al
 187:	04 4d                	add    al,0x4d
 189:	12 50 00             	adc    dl,BYTE PTR [rax+0x0]
 18c:	00 00                	add    BYTE PTR [rax],al
 18e:	80 08 a8             	or     BYTE PTR [rax],0xa8
 191:	01 00                	add    DWORD PTR [rax],eax
 193:	00 04 4e             	add    BYTE PTR [rsi+rcx*2],al
 196:	0f 57 00             	xorps  xmm0,XMMWORD PTR [rax]
 199:	00 00                	add    BYTE PTR [rax],al
 19b:	82                   	(bad)  
 19c:	08 49 02             	or     BYTE PTR [rcx+0x2],cl
 19f:	00 00                	add    BYTE PTR [rax],al
 1a1:	04 4f                	add    al,0x4f
 1a3:	08 44 02 00          	or     BYTE PTR [rdx+rax*1+0x0],al
 1a7:	00 83 08 1d 01 00    	add    BYTE PTR [rbx+0x11d08],al
 1ad:	00 04 51             	add    BYTE PTR [rcx+rdx*2],al
 1b0:	0f 54 02             	andps  xmm0,XMMWORD PTR [rdx]
 1b3:	00 00                	add    BYTE PTR [rax],al
 1b5:	88 08                	mov    BYTE PTR [rax],cl
 1b7:	0e                   	(bad)  
 1b8:	01 00                	add    DWORD PTR [rax],eax
 1ba:	00 04 59             	add    BYTE PTR [rcx+rbx*2],al
 1bd:	0d 7f 00 00 00       	or     eax,0x7f
 1c2:	90                   	nop
 1c3:	08 86 01 00 00 04    	or     BYTE PTR [rsi+0x4000001],al
 1c9:	5b                   	pop    rbx
 1ca:	17                   	(bad)  
 1cb:	5f                   	pop    rdi
 1cc:	02 00                	add    al,BYTE PTR [rax]
 1ce:	00 98 08 ba 01 00    	add    BYTE PTR [rax+0x1ba08],bl
 1d4:	00 04 5c             	add    BYTE PTR [rsp+rbx*2],al
 1d7:	19 6a 02             	sbb    DWORD PTR [rdx+0x2],ebp
 1da:	00 00                	add    BYTE PTR [rax],al
 1dc:	a0 08 3b 02 00 00 04 	movabs al,ds:0x145d040000023b08
 1e3:	5d 14 
 1e5:	3e 02 00             	ds add al,BYTE PTR [rax]
 1e8:	00 a8 08 c5 01 00    	add    BYTE PTR [rax+0x1c508],ch
 1ee:	00 04 5e             	add    BYTE PTR [rsi+rbx*2],al
 1f1:	09 47 00             	or     DWORD PTR [rdi+0x0],eax
 1f4:	00 00                	add    BYTE PTR [rax],al
 1f6:	b0 08                	mov    al,0x8
 1f8:	53                   	push   rbx
 1f9:	00 00                	add    BYTE PTR [rax],al
 1fb:	00 04 5f             	add    BYTE PTR [rdi+rbx*2],al
 1fe:	0a 2d 00 00 00 b8    	or     ch,BYTE PTR [rip+0xffffffffb8000000]        # ffffffffb8000204 <_end+0xffffffffb7ffc164>
 204:	08 5a 00             	or     BYTE PTR [rdx+0x0],bl
 207:	00 00                	add    BYTE PTR [rax],al
 209:	04 60                	add    al,0x60
 20b:	07                   	(bad)  
 20c:	65 00 00             	add    BYTE PTR gs:[rax],al
 20f:	00 c0                	add    al,al
 211:	08 d2                	or     dl,dl
 213:	01 00                	add    DWORD PTR [rax],eax
 215:	00 04 62             	add    BYTE PTR [rdx+riz*2],al
 218:	08 70 02             	or     BYTE PTR [rax+0x2],dh
 21b:	00 00                	add    BYTE PTR [rax],al
 21d:	c4                   	(bad)  
 21e:	00 02                	add    BYTE PTR [rdx],al
 220:	76 00                	jbe    222 <__abi_tag-0x17a>
 222:	00 00                	add    BYTE PTR [rax],al
 224:	05 07 19 98 00       	add    eax,0x981907
 229:	00 00                	add    BYTE PTR [rax],al
 22b:	09 e9                	or     ecx,ebp
 22d:	00 00                	add    BYTE PTR [rax],al
 22f:	00 04 2b             	add    BYTE PTR [rbx+rbp*1],al
 232:	0e                   	(bad)  
 233:	0a b8 00 00 00 06    	or     bh,BYTE PTR [rax+0x6000000]
 239:	08 33                	or     BYTE PTR [rbx],dh
 23b:	02 00                	add    al,BYTE PTR [rax]
 23d:	00 06                	add    BYTE PTR [rsi],al
 23f:	08 98 00 00 00 0b    	or     BYTE PTR [rax+0xb000000],bl
 245:	91                   	xchg   ecx,eax
 246:	00 00                	add    BYTE PTR [rax],al
 248:	00 54 02 00          	add    BYTE PTR [rdx+rax*1+0x0],dl
 24c:	00 0c 39             	add    BYTE PTR [rcx+rdi*1],cl
 24f:	00 00                	add    BYTE PTR [rax],al
 251:	00 00                	add    BYTE PTR [rax],al
 253:	00 06                	add    BYTE PTR [rsi],al
 255:	08 2b                	or     BYTE PTR [rbx],ch
 257:	02 00                	add    al,BYTE PTR [rax]
 259:	00 0a                	add    BYTE PTR [rdx],cl
 25b:	83 01 00             	add    DWORD PTR [rcx],0x0
 25e:	00 06                	add    BYTE PTR [rsi],al
 260:	08 5a 02             	or     BYTE PTR [rdx+0x2],bl
 263:	00 00                	add    BYTE PTR [rax],al
 265:	0a b7 01 00 00 06    	or     dh,BYTE PTR [rdi+0x6000001]
 26b:	08 65 02             	or     BYTE PTR [rbp+0x2],ah
 26e:	00 00                	add    BYTE PTR [rax],al
 270:	0b 91 00 00 00 80    	or     edx,DWORD PTR [rcx-0x80000000]
 276:	02 00                	add    al,BYTE PTR [rax]
 278:	00 0c 39             	add    BYTE PTR [rcx+rdi*1],cl
 27b:	00 00                	add    BYTE PTR [rax],al
 27d:	00 13                	add    BYTE PTR [rbx],dl
 27f:	00 0d d6 00 00 00    	add    BYTE PTR [rip+0xd6],cl        # 35b <__abi_tag-0x41>
 285:	06                   	(bad)  
 286:	89 0e                	mov    DWORD PTR [rsi],ecx
 288:	8c 02                	mov    WORD PTR [rdx],es
 28a:	00 00                	add    BYTE PTR [rax],al
 28c:	06                   	(bad)  
 28d:	08 1f                	or     BYTE PTR [rdi],bl
 28f:	02 00                	add    al,BYTE PTR [rax]
 291:	00 0d 45 00 00 00    	add    BYTE PTR [rip+0x45],cl        # 2dc <__abi_tag-0xc0>
 297:	06                   	(bad)  
 298:	8a 0e                	mov    cl,BYTE PTR [rsi]
 29a:	8c 02                	mov    WORD PTR [rdx],es
 29c:	00 00                	add    BYTE PTR [rax],al
 29e:	03 08                	add    ecx,DWORD PTR [rax]
 2a0:	05 db 01 00 00       	add    eax,0x1db
 2a5:	03 08                	add    ecx,DWORD PTR [rax]
 2a7:	07                   	(bad)  
 2a8:	6c                   	ins    BYTE PTR es:[rdi],dx
 2a9:	01 00                	add    DWORD PTR [rax],eax
 2ab:	00 0e                	add    BYTE PTR [rsi],cl
 2ad:	fd                   	std    
 2ae:	00 00                	add    BYTE PTR [rax],al
 2b0:	00 01                	add    BYTE PTR [rcx],al
 2b2:	07                   	(bad)  
 2b3:	05 65 00 00 00       	add    eax,0x65
 2b8:	c9                   	leave  
 2b9:	11 00                	adc    DWORD PTR [rax],eax
 2bb:	00 00                	add    BYTE PTR [rax],al
 2bd:	00 00                	add    BYTE PTR [rax],al
 2bf:	00 18                	add    BYTE PTR [rax],bl
 2c1:	01 00                	add    DWORD PTR [rax],eax
 2c3:	00 00                	add    BYTE PTR [rax],al
 2c5:	00 00                	add    BYTE PTR [rax],al
 2c7:	00 01                	add    BYTE PTR [rcx],al
 2c9:	9c                   	pushf  
 2ca:	20 03                	and    BYTE PTR [rbx],al
 2cc:	00 00                	add    BYTE PTR [rax],al
 2ce:	0f 14 01             	unpcklps xmm0,XMMWORD PTR [rcx]
 2d1:	08 02                	or     BYTE PTR [rdx],al
 2d3:	f2 02 00             	repnz add al,BYTE PTR [rax]
 2d6:	00 10                	add    BYTE PTR [rax],dl
 2d8:	62                   	(bad)  
 2d9:	75 66                	jne    341 <__abi_tag-0x5b>
 2db:	00 01                	add    BYTE PTR [rcx],al
 2dd:	09 08                	or     DWORD PTR [rax],ecx
 2df:	20 03                	and    BYTE PTR [rbx],al
 2e1:	00 00                	add    BYTE PTR [rax],al
 2e3:	00 08                	add    BYTE PTR [rax],cl
 2e5:	16                   	(bad)  
 2e6:	01 00                	add    DWORD PTR [rax],eax
 2e8:	00 01                	add    BYTE PTR [rcx],al
 2ea:	0a 07                	or     al,BYTE PTR [rdi]
 2ec:	65 00 00             	add    BYTE PTR gs:[rax],al
 2ef:	00 10                	add    BYTE PTR [rax],dl
 2f1:	00 11                	add    BYTE PTR [rcx],dl
 2f3:	64 00 01             	add    BYTE PTR fs:[rcx],al
 2f6:	0b 04 ce             	or     eax,DWORD PTR [rsi+rcx*8]
 2f9:	02 00                	add    al,BYTE PTR [rax]
 2fb:	00 02                	add    BYTE PTR [rdx],al
 2fd:	91                   	xchg   ecx,eax
 2fe:	40 12 71 12          	adc    sil,BYTE PTR [rcx+0x12]
 302:	00 00                	add    BYTE PTR [rax],al
 304:	00 00                	add    BYTE PTR [rax],al
 306:	00 00                	add    BYTE PTR [rax],al
 308:	51                   	push   rcx
 309:	00 00                	add    BYTE PTR [rax],al
 30b:	00 00                	add    BYTE PTR [rax],al
 30d:	00 00                	add    BYTE PTR [rax],al
 30f:	00 11                	add    BYTE PTR [rcx],dl
 311:	67 00 01             	add    BYTE PTR [ecx],al
 314:	14 07                	adc    al,0x7
 316:	65 00 00             	add    BYTE PTR gs:[rax],al
 319:	00 03                	add    BYTE PTR [rbx],al
 31b:	91                   	xchg   ecx,eax
 31c:	bc 7f 00 00 13       	mov    esp,0x1300007f
 321:	91                   	xchg   ecx,eax
 322:	00 00                	add    BYTE PTR [rax],al
 324:	00 0c 39             	add    BYTE PTR [rcx+rdi*1],cl
 327:	00 00                	add    BYTE PTR [rax],al
 329:	00 0f                	add    BYTE PTR [rdi],cl
	...

Disassembly of section .debug_abbrev:

0000000000000000 <.debug_abbrev>:
   0:	01 11                	add    DWORD PTR [rcx],edx
   2:	01 25 0e 13 0b 03    	add    DWORD PTR [rip+0x30b130e],esp        # 30b1316 <_end+0x30ad276>
   8:	0e                   	(bad)  
   9:	1b 0e                	sbb    ecx,DWORD PTR [rsi]
   b:	11 01                	adc    DWORD PTR [rcx],eax
   d:	12 07                	adc    al,BYTE PTR [rdi]
   f:	10 17                	adc    BYTE PTR [rdi],dl
  11:	00 00                	add    BYTE PTR [rax],al
  13:	02 16                	add    dl,BYTE PTR [rsi]
  15:	00 03                	add    BYTE PTR [rbx],al
  17:	0e                   	(bad)  
  18:	3a 0b                	cmp    cl,BYTE PTR [rbx]
  1a:	3b 0b                	cmp    ecx,DWORD PTR [rbx]
  1c:	39 0b                	cmp    DWORD PTR [rbx],ecx
  1e:	49 13 00             	adc    rax,QWORD PTR [r8]
  21:	00 03                	add    BYTE PTR [rbx],al
  23:	24 00                	and    al,0x0
  25:	0b 0b                	or     ecx,DWORD PTR [rbx]
  27:	3e 0b 03             	ds or  eax,DWORD PTR [rbx]
  2a:	0e                   	(bad)  
  2b:	00 00                	add    BYTE PTR [rax],al
  2d:	04 0f                	add    al,0xf
  2f:	00 0b                	add    BYTE PTR [rbx],cl
  31:	0b 00                	or     eax,DWORD PTR [rax]
  33:	00 05 24 00 0b 0b    	add    BYTE PTR [rip+0xb0b0024],al        # b0b005d <_end+0xb0abfbd>
  39:	3e 0b 03             	ds or  eax,DWORD PTR [rbx]
  3c:	08 00                	or     BYTE PTR [rax],al
  3e:	00 06                	add    BYTE PTR [rsi],al
  40:	0f 00 0b             	str    WORD PTR [rbx]
  43:	0b 49 13             	or     ecx,DWORD PTR [rcx+0x13]
  46:	00 00                	add    BYTE PTR [rax],al
  48:	07                   	(bad)  
  49:	13 01                	adc    eax,DWORD PTR [rcx]
  4b:	03 0e                	add    ecx,DWORD PTR [rsi]
  4d:	0b 0b                	or     ecx,DWORD PTR [rbx]
  4f:	3a 0b                	cmp    cl,BYTE PTR [rbx]
  51:	3b 0b                	cmp    ecx,DWORD PTR [rbx]
  53:	39 0b                	cmp    DWORD PTR [rbx],ecx
  55:	01 13                	add    DWORD PTR [rbx],edx
  57:	00 00                	add    BYTE PTR [rax],al
  59:	08 0d 00 03 0e 3a    	or     BYTE PTR [rip+0x3a0e0300],cl        # 3a0e035f <_end+0x3a0dc2bf>
  5f:	0b 3b                	or     edi,DWORD PTR [rbx]
  61:	0b 39                	or     edi,DWORD PTR [rcx]
  63:	0b 49 13             	or     ecx,DWORD PTR [rcx+0x13]
  66:	38 0b                	cmp    BYTE PTR [rbx],cl
  68:	00 00                	add    BYTE PTR [rax],al
  6a:	09 16                	or     DWORD PTR [rsi],edx
  6c:	00 03                	add    BYTE PTR [rbx],al
  6e:	0e                   	(bad)  
  6f:	3a 0b                	cmp    cl,BYTE PTR [rbx]
  71:	3b 0b                	cmp    ecx,DWORD PTR [rbx]
  73:	39 0b                	cmp    DWORD PTR [rbx],ecx
  75:	00 00                	add    BYTE PTR [rax],al
  77:	0a 13                	or     dl,BYTE PTR [rbx]
  79:	00 03                	add    BYTE PTR [rbx],al
  7b:	0e                   	(bad)  
  7c:	3c 19                	cmp    al,0x19
  7e:	00 00                	add    BYTE PTR [rax],al
  80:	0b 01                	or     eax,DWORD PTR [rcx]
  82:	01 49 13             	add    DWORD PTR [rcx+0x13],ecx
  85:	01 13                	add    DWORD PTR [rbx],edx
  87:	00 00                	add    BYTE PTR [rax],al
  89:	0c 21                	or     al,0x21
  8b:	00 49 13             	add    BYTE PTR [rcx+0x13],cl
  8e:	2f                   	(bad)  
  8f:	0b 00                	or     eax,DWORD PTR [rax]
  91:	00 0d 34 00 03 0e    	add    BYTE PTR [rip+0xe030034],cl        # e0300cb <_end+0xe02c02b>
  97:	3a 0b                	cmp    cl,BYTE PTR [rbx]
  99:	3b 0b                	cmp    ecx,DWORD PTR [rbx]
  9b:	39 0b                	cmp    DWORD PTR [rbx],ecx
  9d:	49 13 3f             	adc    rdi,QWORD PTR [r15]
  a0:	19 3c 19             	sbb    DWORD PTR [rcx+rbx*1],edi
  a3:	00 00                	add    BYTE PTR [rax],al
  a5:	0e                   	(bad)  
  a6:	2e 01 3f             	cs add DWORD PTR [rdi],edi
  a9:	19 03                	sbb    DWORD PTR [rbx],eax
  ab:	0e                   	(bad)  
  ac:	3a 0b                	cmp    cl,BYTE PTR [rbx]
  ae:	3b 0b                	cmp    ecx,DWORD PTR [rbx]
  b0:	39 0b                	cmp    DWORD PTR [rbx],ecx
  b2:	49 13 11             	adc    rdx,QWORD PTR [r9]
  b5:	01 12                	add    DWORD PTR [rdx],edx
  b7:	07                   	(bad)  
  b8:	40 18 96 42 19 01 13 	rex sbb BYTE PTR [rsi+0x13011942],dl
  bf:	00 00                	add    BYTE PTR [rax],al
  c1:	0f 13 01             	movlps QWORD PTR [rcx],xmm0
  c4:	0b 0b                	or     ecx,DWORD PTR [rbx]
  c6:	3a 0b                	cmp    cl,BYTE PTR [rbx]
  c8:	3b 0b                	cmp    ecx,DWORD PTR [rbx]
  ca:	39 0b                	cmp    DWORD PTR [rbx],ecx
  cc:	01 13                	add    DWORD PTR [rbx],edx
  ce:	00 00                	add    BYTE PTR [rax],al
  d0:	10 0d 00 03 08 3a    	adc    BYTE PTR [rip+0x3a080300],cl        # 3a0803d6 <_end+0x3a07c336>
  d6:	0b 3b                	or     edi,DWORD PTR [rbx]
  d8:	0b 39                	or     edi,DWORD PTR [rcx]
  da:	0b 49 13             	or     ecx,DWORD PTR [rcx+0x13]
  dd:	38 0b                	cmp    BYTE PTR [rbx],cl
  df:	00 00                	add    BYTE PTR [rax],al
  e1:	11 34 00             	adc    DWORD PTR [rax+rax*1],esi
  e4:	03 08                	add    ecx,DWORD PTR [rax]
  e6:	3a 0b                	cmp    cl,BYTE PTR [rbx]
  e8:	3b 0b                	cmp    ecx,DWORD PTR [rbx]
  ea:	39 0b                	cmp    DWORD PTR [rbx],ecx
  ec:	49 13 02             	adc    rax,QWORD PTR [r10]
  ef:	18 00                	sbb    BYTE PTR [rax],al
  f1:	00 12                	add    BYTE PTR [rdx],dl
  f3:	0b 01                	or     eax,DWORD PTR [rcx]
  f5:	11 01                	adc    DWORD PTR [rcx],eax
  f7:	12 07                	adc    al,BYTE PTR [rdi]
  f9:	00 00                	add    BYTE PTR [rax],al
  fb:	13 01                	adc    eax,DWORD PTR [rcx]
  fd:	01 49 13             	add    DWORD PTR [rcx+0x13],ecx
 100:	00 00                	add    BYTE PTR [rax],al
	...

Disassembly of section .debug_line:

0000000000000000 <.debug_line>:
   0:	20 01                	and    BYTE PTR [rcx],al
   2:	00 00                	add    BYTE PTR [rax],al
   4:	03 00                	add    eax,DWORD PTR [rax]
   6:	c2 00 00             	ret    0x0
   9:	00 01                	add    BYTE PTR [rcx],al
   b:	01 fb                	add    ebx,edi
   d:	0e                   	(bad)  
   e:	0d 00 01 01 01       	or     eax,0x1010100
  13:	01 00                	add    DWORD PTR [rax],eax
  15:	00 00                	add    BYTE PTR [rax],al
  17:	01 00                	add    DWORD PTR [rax],eax
  19:	00 01                	add    BYTE PTR [rcx],al
  1b:	2f                   	(bad)  
  1c:	75 73                	jne    91 <__abi_tag-0x30b>
  1e:	72 2f                	jb     4f <__abi_tag-0x34d>
  20:	6c                   	ins    BYTE PTR es:[rdi],dx
  21:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [rdx+0x2f],0x2f636367
  28:	78 38                	js     62 <__abi_tag-0x33a>
  2a:	36 5f                	ss pop rdi
  2c:	36 34 2d             	ss xor al,0x2d
  2f:	70 63                	jo     94 <__abi_tag-0x308>
  31:	2d 6c 69 6e 75       	sub    eax,0x756e696c
  36:	78 2d                	js     65 <__abi_tag-0x337>
  38:	67 6e                	outs   dx,BYTE PTR ds:[esi]
  3a:	75 2f                	jne    6b <__abi_tag-0x331>
  3c:	31 30                	xor    DWORD PTR [rax],esi
  3e:	2e 32 2e             	cs xor ch,BYTE PTR [rsi]
  41:	30 2f                	xor    BYTE PTR [rdi],ch
  43:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [rsi+0x63],0x6564756c
  4a:	00 2f                	add    BYTE PTR [rdi],ch
  4c:	75 73                	jne    c1 <__abi_tag-0x2db>
  4e:	72 2f                	jb     7f <__abi_tag-0x31d>
  50:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [rsi+0x63],0x6564756c
  57:	2f                   	(bad)  
  58:	62                   	(bad)  
  59:	69 74 73 00 2f 75 73 	imul   esi,DWORD PTR [rbx+rsi*2+0x0],0x7273752f
  60:	72 
  61:	2f                   	(bad)  
  62:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [rsi+0x63],0x6564756c
  69:	2f                   	(bad)  
  6a:	62                   	(bad)  
  6b:	69 74 73 2f 74 79 70 	imul   esi,DWORD PTR [rbx+rsi*2+0x2f],0x65707974
  72:	65 
  73:	73 00                	jae    75 <__abi_tag-0x327>
  75:	2f                   	(bad)  
  76:	75 73                	jne    eb <__abi_tag-0x2b1>
  78:	72 2f                	jb     a9 <__abi_tag-0x2f3>
  7a:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [rsi+0x63],0x6564756c
  81:	00 00                	add    BYTE PTR [rax],al
  83:	67 75 65             	addr32 jne eb <__abi_tag-0x2b1>
  86:	73 73                	jae    fb <__abi_tag-0x2a1>
  88:	2e 63 00             	cs movsxd eax,DWORD PTR [rax]
  8b:	00 00                	add    BYTE PTR [rax],al
  8d:	00 73 74             	add    BYTE PTR [rbx+0x74],dh
  90:	64 64 65 66 2e 68 00 	fs fs gs cs pushw 0x100
  97:	01 
  98:	00 00                	add    BYTE PTR [rax],al
  9a:	74 79                	je     115 <__abi_tag-0x287>
  9c:	70 65                	jo     103 <__abi_tag-0x299>
  9e:	73 2e                	jae    ce <__abi_tag-0x2ce>
  a0:	68 00 02 00 00       	push   0x200
  a5:	73 74                	jae    11b <__abi_tag-0x281>
  a7:	72 75                	jb     11e <__abi_tag-0x27e>
  a9:	63 74 5f 46          	movsxd esi,DWORD PTR [rdi+rbx*2+0x46]
  ad:	49                   	rex.WB
  ae:	4c                   	rex.WR
  af:	45                   	rex.RB
  b0:	2e 68 00 03 00 00    	cs push 0x300
  b6:	46                   	rex.RX
  b7:	49                   	rex.WB
  b8:	4c                   	rex.WR
  b9:	45                   	rex.RB
  ba:	2e 68 00 03 00 00    	cs push 0x300
  c0:	73 74                	jae    136 <__abi_tag-0x266>
  c2:	64 69 6f 2e 68 00 04 	imul   ebp,DWORD PTR fs:[rdi+0x2e],0x40068
  c9:	00 
  ca:	00 00                	add    BYTE PTR [rax],al
  cc:	05 0c 00 09 02       	add    eax,0x209000c
  d1:	c9                   	leave  
  d2:	11 00                	adc    DWORD PTR [rax],eax
  d4:	00 00                	add    BYTE PTR [rax],al
  d6:	00 00                	add    BYTE PTR [rax],al
  d8:	00 18                	add    BYTE PTR [rax],bl
  da:	90                   	nop
  db:	05 02 ea 05 08       	add    eax,0x805ea02
  e0:	08 c9                	or     cl,cl
  e2:	05 10 9e 05 12       	add    eax,0x12059e10
  e7:	2e 05 10 58 05 02    	cs add eax,0x2055810
  ed:	2e 05 0d 76 05 14    	cs add eax,0x1405760d
  f3:	58                   	pop    rax
  f4:	05 0b 02 22 12       	add    eax,0x1222020b
  f9:	05 02 3e 05 05       	add    eax,0x5053e02
  fe:	08 13                	or     BYTE PTR [rbx],dl
 100:	05 04 08 74 05       	add    eax,0x5740804
 105:	0b 59 05             	or     ebx,DWORD PTR [rcx+0x5]
 108:	07                   	(bad)  
 109:	08 58 05             	or     BYTE PTR [rax+0x5],bl
 10c:	03 3d 05 0c 08 59    	add    edi,DWORD PTR [rip+0x59080c05]        # 59080d17 <_end+0x5907cc77>
 112:	05 05 3c 05 04       	add    eax,0x4053c05
 117:	59                   	pop    rcx
 118:	d8 05 09 be 05 01    	fadd   DWORD PTR [rip+0x105be09]        # 105bf27 <_end+0x1057e87>
 11e:	59                   	pop    rcx
 11f:	02 1a                	add    bl,BYTE PTR [rdx]
 121:	00 01                	add    BYTE PTR [rcx],al
 123:	01                   	.byte 0x1

Disassembly of section .debug_str:

0000000000000000 <.debug_str>:
   0:	5f                   	pop    rdi
   1:	49                   	rex.WB
   2:	4f 5f                	rex.WRXB pop r15
   4:	72 65                	jb     6b <__abi_tag-0x331>
   6:	61                   	(bad)  
   7:	64 5f                	fs pop rdi
   9:	62 61                	(bad)  
   b:	73 65                	jae    72 <__abi_tag-0x32a>
   d:	00 5f 49             	add    BYTE PTR [rdi+0x49],bl
  10:	4f 5f                	rex.WRXB pop r15
  12:	72 65                	jb     79 <__abi_tag-0x323>
  14:	61                   	(bad)  
  15:	64 5f                	fs pop rdi
  17:	65 6e                	outs   dx,BYTE PTR gs:[rsi]
  19:	64 00 73 69          	add    BYTE PTR fs:[rbx+0x69],dh
  1d:	7a 65                	jp     84 <__abi_tag-0x318>
  1f:	5f                   	pop    rdi
  20:	74 00                	je     22 <__abi_tag-0x37a>
  22:	5f                   	pop    rdi
  23:	49                   	rex.WB
  24:	4f 5f                	rex.WRXB pop r15
  26:	77 72                	ja     9a <__abi_tag-0x302>
  28:	69 74 65 5f 62 61 73 	imul   esi,DWORD PTR [rbp+riz*2+0x5f],0x65736162
  2f:	65 
  30:	00 5f 49             	add    BYTE PTR [rdi+0x49],bl
  33:	4f 5f                	rex.WRXB pop r15
  35:	62                   	(bad)  
  36:	75 66                	jne    9e <__abi_tag-0x2fe>
  38:	5f                   	pop    rdi
  39:	65 6e                	outs   dx,BYTE PTR gs:[rsi]
  3b:	64 00 5f 5f          	add    BYTE PTR fs:[rdi+0x5f],bl
  3f:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  40:	66 66 5f             	data16 pop di
  43:	74 00                	je     45 <__abi_tag-0x357>
  45:	73 74                	jae    bb <__abi_tag-0x2e1>
  47:	64 6f                	outs   dx,DWORD PTR fs:[rsi]
  49:	75 74                	jne    bf <__abi_tag-0x2dd>
  4b:	00 5f 63             	add    BYTE PTR [rdi+0x63],bl
  4e:	68 61 69 6e 00       	push   0x6e6961
  53:	5f                   	pop    rdi
  54:	5f                   	pop    rdi
  55:	70 61                	jo     b8 <__abi_tag-0x2e4>
  57:	64 35 00 5f 6d 6f    	fs xor eax,0x6f6d5f00
  5d:	64 65 00 5f 5f       	fs add BYTE PTR gs:[rdi+0x5f],bl
  62:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  63:	66 66 36 34 5f       	data16 data16 ss xor al,0x5f
  68:	74 00                	je     6a <__abi_tag-0x332>
  6a:	5f                   	pop    rdi
  6b:	66 69 6c 65 6e 6f 00 	imul   bp,WORD PTR [rbp+riz*2+0x6e],0x6f
  72:	5f                   	pop    rdi
  73:	49                   	rex.WB
  74:	4f 5f                	rex.WRXB pop r15
  76:	46                   	rex.RX
  77:	49                   	rex.WB
  78:	4c                   	rex.WR
  79:	45 00 5f 49          	add    BYTE PTR [r15+0x49],r11b
  7d:	4f 5f                	rex.WRXB pop r15
  7f:	73 61                	jae    e2 <__abi_tag-0x2ba>
  81:	76 65                	jbe    e8 <__abi_tag-0x2b4>
  83:	5f                   	pop    rdi
  84:	62 61                	(bad)  
  86:	73 65                	jae    ed <__abi_tag-0x2af>
  88:	00 47 4e             	add    BYTE PTR [rdi+0x4e],al
  8b:	55                   	push   rbp
  8c:	20 43 31             	and    BYTE PTR [rbx+0x31],al
  8f:	37                   	(bad)  
  90:	20 31                	and    BYTE PTR [rcx],dh
  92:	30 2e                	xor    BYTE PTR [rsi],ch
  94:	32 2e                	xor    ch,BYTE PTR [rsi]
  96:	30 20                	xor    BYTE PTR [rax],ah
  98:	2d 6d 74 75 6e       	sub    eax,0x6e75746d
  9d:	65 3d 67 65 6e 65    	gs cmp eax,0x656e6567
  a3:	72 69                	jb     10e <__abi_tag-0x28e>
  a5:	63 20                	movsxd esp,DWORD PTR [rax]
  a7:	2d 6d 61 72 63       	sub    eax,0x6372616d
  ac:	68 3d 78 38 36       	push   0x3638783d
  b1:	2d 36 34 20 2d       	sub    eax,0x2d203436
  b6:	67 00 5f 49          	add    BYTE PTR [edi+0x49],bl
  ba:	4f 5f                	rex.WRXB pop r15
  bc:	6d                   	ins    DWORD PTR es:[rdi],dx
  bd:	61                   	(bad)  
  be:	72 6b                	jb     12b <__abi_tag-0x271>
  c0:	65 72 00             	gs jb  c3 <__abi_tag-0x2d9>
  c3:	73 68                	jae    12d <__abi_tag-0x26f>
  c5:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  c6:	72 74                	jb     13c <__abi_tag-0x260>
  c8:	20 75 6e             	and    BYTE PTR [rbp+0x6e],dh
  cb:	73 69                	jae    136 <__abi_tag-0x266>
  cd:	67 6e                	outs   dx,BYTE PTR ds:[esi]
  cf:	65 64 20 69 6e       	gs and BYTE PTR fs:[rcx+0x6e],ch
  d4:	74 00                	je     d6 <__abi_tag-0x2c6>
  d6:	73 74                	jae    14c <__abi_tag-0x250>
  d8:	64 69 6e 00 5f 49 4f 	imul   ebp,DWORD PTR fs:[rsi+0x0],0x5f4f495f
  df:	5f 
  e0:	73 61                	jae    143 <__abi_tag-0x259>
  e2:	76 65                	jbe    149 <__abi_tag-0x253>
  e4:	5f                   	pop    rdi
  e5:	65 6e                	outs   dx,BYTE PTR gs:[rsi]
  e7:	64 00 5f 49          	add    BYTE PTR fs:[rdi+0x49],bl
  eb:	4f 5f                	rex.WRXB pop r15
  ed:	6c                   	ins    BYTE PTR es:[rdi],dx
  ee:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  ef:	63 6b 5f             	movsxd ebp,DWORD PTR [rbx+0x5f]
  f2:	74 00                	je     f4 <__abi_tag-0x2a8>
  f4:	5f                   	pop    rdi
  f5:	6d                   	ins    DWORD PTR es:[rdi],dx
  f6:	61                   	(bad)  
  f7:	72 6b                	jb     164 <__abi_tag-0x238>
  f9:	65 72 73             	gs jb  16f <__abi_tag-0x22d>
  fc:	00 6d 61             	add    BYTE PTR [rbp+0x61],ch
  ff:	69 6e 00 5f 66 6c 61 	imul   ebp,DWORD PTR [rsi+0x0],0x616c665f
 106:	67 73 32             	addr32 jae 13b <__abi_tag-0x261>
 109:	00 5f 6f             	add    BYTE PTR [rdi+0x6f],bl
 10c:	6c                   	ins    BYTE PTR es:[rdi],dx
 10d:	64 5f                	fs pop rdi
 10f:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 110:	66 66 73 65          	data16 data16 jae 179 <__abi_tag-0x223>
 114:	74 00                	je     116 <__abi_tag-0x286>
 116:	61                   	(bad)  
 117:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 118:	73 77                	jae    191 <__abi_tag-0x20b>
 11a:	65 72 00             	gs jb  11d <__abi_tag-0x27f>
 11d:	5f                   	pop    rdi
 11e:	6c                   	ins    BYTE PTR es:[rdi],dx
 11f:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 120:	63 6b 00             	movsxd ebp,DWORD PTR [rbx+0x0]
 123:	75 6e                	jne    193 <__abi_tag-0x209>
 125:	73 69                	jae    190 <__abi_tag-0x20c>
 127:	67 6e                	outs   dx,BYTE PTR ds:[esi]
 129:	65 64 20 63 68       	gs and BYTE PTR fs:[rbx+0x68],ah
 12e:	61                   	(bad)  
 12f:	72 00                	jb     131 <__abi_tag-0x26b>
 131:	2f                   	(bad)  
 132:	68 6f 6d 65 2f       	push   0x2f656d6f
 137:	70 6f                	jo     1a8 <__abi_tag-0x1f4>
 139:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 13a:	63 65 64             	movsxd esp,DWORD PTR [rbp+0x64]
 13d:	65 6c                	gs ins BYTE PTR es:[rdi],dx
 13f:	65 6f                	outs   dx,DWORD PTR gs:[rsi]
 141:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 142:	2f                   	(bad)  
 143:	73 63                	jae    1a8 <__abi_tag-0x1f4>
 145:	68 6f 6f 6c 2f       	push   0x2f6c6f6f
 14a:	31 30                	xor    DWORD PTR [rax],esi
 14c:	39 2f                	cmp    DWORD PTR [rdi],ebp
 14e:	73 70                	jae    1c0 <__abi_tag-0x1dc>
 150:	72 69                	jb     1bb <__abi_tag-0x1e1>
 152:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 153:	67 2f                	addr32 (bad) 
 155:	75 6e                	jne    1c5 <__abi_tag-0x1d7>
 157:	69 78 2f 75 6e 69 78 	imul   edi,DWORD PTR [rax+0x2f],0x78696e75
 15e:	5f                   	pop    rdi
 15f:	70 72                	jo     1d3 <__abi_tag-0x1c9>
 161:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 162:	67 2f                	addr32 (bad) 
 164:	70 72                	jo     1d8 <__abi_tag-0x1c4>
 166:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 167:	63 65 6e             	movsxd esp,DWORD PTR [rbp+0x6e]
 16a:	76 00                	jbe    16c <__abi_tag-0x230>
 16c:	6c                   	ins    BYTE PTR es:[rdi],dx
 16d:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 16e:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 16f:	67 20 6c 6f 6e       	and    BYTE PTR [edi+ebp*2+0x6e],ch
 174:	67 20 75 6e          	and    BYTE PTR [ebp+0x6e],dh
 178:	73 69                	jae    1e3 <__abi_tag-0x1b9>
 17a:	67 6e                	outs   dx,BYTE PTR ds:[esi]
 17c:	65 64 20 69 6e       	gs and BYTE PTR fs:[rcx+0x6e],ch
 181:	74 00                	je     183 <__abi_tag-0x219>
 183:	5f                   	pop    rdi
 184:	49                   	rex.WB
 185:	4f 5f                	rex.WRXB pop r15
 187:	63 6f 64             	movsxd ebp,DWORD PTR [rdi+0x64]
 18a:	65 63 76 74          	movsxd esi,DWORD PTR gs:[rsi+0x74]
 18e:	00 5f 63             	add    BYTE PTR [rdi+0x63],bl
 191:	75 72                	jne    205 <__abi_tag-0x197>
 193:	5f                   	pop    rdi
 194:	63 6f 6c             	movsxd ebp,DWORD PTR [rdi+0x6c]
 197:	75 6d                	jne    206 <__abi_tag-0x196>
 199:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 19a:	00 5f 49             	add    BYTE PTR [rdi+0x49],bl
 19d:	4f 5f                	rex.WRXB pop r15
 19f:	62                   	(bad)  
 1a0:	75 66                	jne    208 <__abi_tag-0x194>
 1a2:	5f                   	pop    rdi
 1a3:	62 61                	(bad)  
 1a5:	73 65                	jae    20c <__abi_tag-0x190>
 1a7:	00 5f 76             	add    BYTE PTR [rdi+0x76],bl
 1aa:	74 61                	je     20d <__abi_tag-0x18f>
 1ac:	62                   	(bad)  
 1ad:	6c                   	ins    BYTE PTR es:[rdi],dx
 1ae:	65 5f                	gs pop rdi
 1b0:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 1b1:	66 66 73 65          	data16 data16 jae 21a <__abi_tag-0x182>
 1b5:	74 00                	je     1b7 <__abi_tag-0x1e5>
 1b7:	5f                   	pop    rdi
 1b8:	49                   	rex.WB
 1b9:	4f 5f                	rex.WRXB pop r15
 1bb:	77 69                	ja     226 <__abi_tag-0x176>
 1bd:	64 65 5f             	fs gs pop rdi
 1c0:	64 61                	fs (bad) 
 1c2:	74 61                	je     225 <__abi_tag-0x177>
 1c4:	00 5f 66             	add    BYTE PTR [rdi+0x66],bl
 1c7:	72 65                	jb     22e <__abi_tag-0x16e>
 1c9:	65 72 65             	gs jb  231 <__abi_tag-0x16b>
 1cc:	73 5f                	jae    22d <__abi_tag-0x16f>
 1ce:	62                   	(bad)  
 1cf:	75 66                	jne    237 <__abi_tag-0x165>
 1d1:	00 5f 75             	add    BYTE PTR [rdi+0x75],bl
 1d4:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 1d5:	75 73                	jne    24a <__abi_tag-0x152>
 1d7:	65 64 32 00          	gs xor al,BYTE PTR fs:[rax]
 1db:	6c                   	ins    BYTE PTR es:[rdi],dx
 1dc:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 1dd:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 1de:	67 20 6c 6f 6e       	and    BYTE PTR [edi+ebp*2+0x6e],ch
 1e3:	67 20 69 6e          	and    BYTE PTR [ecx+0x6e],ch
 1e7:	74 00                	je     1e9 <__abi_tag-0x1b3>
 1e9:	5f                   	pop    rdi
 1ea:	49                   	rex.WB
 1eb:	4f 5f                	rex.WRXB pop r15
 1ed:	72 65                	jb     254 <__abi_tag-0x148>
 1ef:	61                   	(bad)  
 1f0:	64 5f                	fs pop rdi
 1f2:	70 74                	jo     268 <__abi_tag-0x134>
 1f4:	72 00                	jb     1f6 <__abi_tag-0x1a6>
 1f6:	67 75 65             	addr32 jne 25e <__abi_tag-0x13e>
 1f9:	73 73                	jae    26e <__abi_tag-0x12e>
 1fb:	2e 63 00             	cs movsxd eax,DWORD PTR [rax]
 1fe:	5f                   	pop    rdi
 1ff:	49                   	rex.WB
 200:	4f 5f                	rex.WRXB pop r15
 202:	77 72                	ja     276 <__abi_tag-0x126>
 204:	69 74 65 5f 65 6e 64 	imul   esi,DWORD PTR [rbp+riz*2+0x5f],0x646e65
 20b:	00 
 20c:	73 68                	jae    276 <__abi_tag-0x126>
 20e:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 20f:	72 74                	jb     285 <__abi_tag-0x117>
 211:	20 69 6e             	and    BYTE PTR [rcx+0x6e],ch
 214:	74 00                	je     216 <__abi_tag-0x186>
 216:	5f                   	pop    rdi
 217:	49                   	rex.WB
 218:	4f 5f                	rex.WRXB pop r15
 21a:	62 61                	(bad)  
 21c:	63 6b 75             	movsxd ebp,DWORD PTR [rbx+0x75]
 21f:	70 5f                	jo     280 <__abi_tag-0x11c>
 221:	62 61                	(bad)  
 223:	73 65                	jae    28a <__abi_tag-0x112>
 225:	00 5f 66             	add    BYTE PTR [rdi+0x66],bl
 228:	6c                   	ins    BYTE PTR es:[rdi],dx
 229:	61                   	(bad)  
 22a:	67 73 00             	addr32 jae 22d <__abi_tag-0x16f>
 22d:	5f                   	pop    rdi
 22e:	49                   	rex.WB
 22f:	4f 5f                	rex.WRXB pop r15
 231:	77 72                	ja     2a5 <__abi_tag-0xf7>
 233:	69 74 65 5f 70 74 72 	imul   esi,DWORD PTR [rbp+riz*2+0x5f],0x727470
 23a:	00 
 23b:	5f                   	pop    rdi
 23c:	66 72 65             	data16 jb 2a4 <__abi_tag-0xf8>
 23f:	65 72 65             	gs jb  2a7 <__abi_tag-0xf5>
 242:	73 5f                	jae    2a3 <__abi_tag-0xf9>
 244:	6c                   	ins    BYTE PTR es:[rdi],dx
 245:	69 73 74 00 5f 73 68 	imul   esi,DWORD PTR [rbx+0x74],0x68735f00
 24c:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 24d:	72 74                	jb     2c3 <__abi_tag-0xd9>
 24f:	62                   	.byte 0x62
 250:	75 66                	jne    2b8 <__abi_tag-0xe4>
	...
