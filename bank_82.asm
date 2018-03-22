org($828000)

code_828000:				//----------------------| 
	JSR code_828004			// $828000  20 04 80	| 
	RTL				// $828003  6B		| 

code_828004:				//			| in: Y = %0000xxxxxxyyyyyy
	TYA				// $828004  98		| out: $80 = %0xxxxxx000000000
	AND.w #$003F			// $828005  29 3F 00	| 	$82 = %0yyyyyy000000000+$4000
	XBA				// $828008  EB		| 
	ASL				// $828009  0A		| 
	STA.b $80			// $82800A  85 80	| RAM ADDRESS
	TYA				// $82800C  98		| 
	AND.w #$0FC0			// $82800D  29 C0 0F	| 
	ASL				// $828010  0A		| 
	ASL				// $828011  0A		| 
	ASL				// $828012  0A		| 
	CLC				// $828013  18		| 
	ADC.w #$4000			// $828014  69 00 40	| 
	STA.b $82			// $828017  85 82	| RAM ADDRESS
	RTS				// $828019  60		| 






code_828593:				//----------------------| 
	PHK				// $828593  4B		| 
	PLB				// $828594  AB		| 
	JSR ($0006,x)			// $828595  FC 06 00	| RAM ADDRESS
	RTL				// $828598  6B		| 







data_82A75B:				//----------------------| 







data_82AA8E:				//----------------------| ??? possibly pointers to demo controls?
	dl data_8DFF4F; db $00		// $82AA8E  4F FF 8D 00	| ???
	dl data_9C9BB6; db $03		// $82AA92  B6 9B 9C 03	| ???
	dl data_95FFB0; db $27		// $82AA96  B0 FF 95 27	| ???

code_82AA9A:				//----------------------| 
	PHB				// $82AA9A  8B		| 
	PHK				// $82AA9B  4B		| 
	PLB				// $82AA9C  AB		| 
	JSR code_82C1E5			// $82AA9D  20 E5 C1	| 
	BCC code_82AAA7			// $82AAA0  90 05	| 
	STZ.w $0272			// $82AAA2  9C 72 02	| RAM ADDRESS
	BRA code_82AAAA			// $82AAA5  80 03	| 
code_82AAA7:				//			| 
	JSR code_82C310			// $82AAA7  20 10 C3	| 
code_82AAAA:				//			| 
	JSL code_81D361			// $82AAAA  22 61 D3 81	| 
	REP #$30			// $82AAAE  C2 30	| 
	XBA				// $82AAB0  EB		| 
	STA.w $4204			// $82AAB1  8D 04 42	| 
	LDA.w $0272			// $82AAB4  AD 72 02	| RAM ADDRESS
	CLC				// $82AAB7  18		| 
	ADC.w #$0003			// $82AAB8  69 03 00	| 
	CMP.w #$0100			// $82AABB  C9 00 01	| 
	BCC code_82AAC3			// $82AABE  90 03	| 
	LDA.w #$00FF			// $82AAC0  A9 FF 00	| 
code_82AAC3:				//			| 
	SEP #$20			// $82AAC3  E2 20	| 
	STA.w $4206			// $82AAC5  8D 06 42	| 
	REP #$20			// $82AAC8  C2 20	| 
	PHA				// $82AACA  48		| 
	PLA				// $82AACB  68		| 
	NOP				// $82AACC  EA		| 
	NOP				// $82AACD  EA		| 
	LDA.w $4216			// $82AACE  AD 16 42	| 
	SEC				// $82AAD1  38		| 
	SBC.w #$0003			// $82AAD2  E9 03 00	| 
	BPL code_82AAF9			// $82AAD5  10 22	| 
	LDA.w $4216			// $82AAD7  AD 16 42	| 
	ASL				// $82AADA  0A		| 
	ASL				// $82AADB  0A		| 
	TAX				// $82AADC  AA		| 
	LDA.w data_82AA8E+2,x		// $82AADD  BD 90 AA	| 
	STA.w $0264			// $82AAE0  8D 64 02	| RAM ADDRESS
	LDA.w data_82AA8E,x		// $82AAE3  BD 8E AA	| 
	STA.w $0262			// $82AAE6  8D 62 02	| RAM ADDRESS
	LDA.w #$0001			// $82AAE9  A9 01 00	| 
	STA.w $0265			// $82AAEC  8D 65 02	| RAM ADDRESS
	LDA.w data_82AA8E+3,x		// $82AAEF  BD 91 AA	| 
	REP #$20			// $82AAF2  C2 20	| 
	AND.w #$00FF			// $82AAF4  29 FF 00	| 
	PLB				// $82AAF7  AB		| 
	RTL				// $82AAF8  6B		| 

code_82AAF9:				//			| 
	JSR code_82C73E			// $82AAF9  20 3E C7	| 
	REP #$30			// $82AAFC  C2 30	| 
	LDA.w #$0070			// $82AAFE  A9 70 00	| SAVEADDR
	STA.w $0264			// $82AB01  8D 64 02	| RAM ADDRESS
	LDA.b $80			// $82AB04  A5 80	| RAM ADDRESS
	CLC				// $82AB06  18		| 
	ADC.w #$000E			// $82AB07  69 0E 00	| 
	STA.w $0262			// $82AB0A  8D 62 02	| RAM ADDRESS
	LDA.w #$0001			// $82AB0D  A9 01 00	| 
	STA.w $0265			// $82AB10  8D 65 02	| RAM ADDRESS
	LDA.b $84			// $82AB13  A5 84	| RAM ADDRESS
	PLB				// $82AB15  AB		| 
	RTL				// $82AB16  6B		| 


code_82AB17:				//----------------------| ?????
	REP #$30			// $82AB17  C2 30	| 
	LDX.w #code_82AD8A		// $82AB19  A2 8A AD	| 
	BRA code_82AB2A			// $82AB1C  80 0C	| 
code_82AB1E:				//----------------------| REPLAY menu setup (title screen)
	REP #$30			// $82AB1E  C2 30	| 
	LDX.w #code_82AD77		// $82AB20  A2 77 AD	| 
	BRA code_82AB2A			// $82AB23  80 05	| 
code_82AB25:				//----------------------| REPLAY menu setup (level)
	REP #$30			// $82AB25  C2 30	| 
	LDX.w #code_82AD5B		// $82AB27  A2 5B AD	| 
code_82AB2A:				//			| 
	STX.b $96			// $82AB2A  86 96	| RAM ADDRESS
	PHK				// $82AB2C  4B		| 
	PLB				// $82AB2D  AB		| 
	SEP #$20			// $82AB2E  E2 20	| 
	LDA.b #$80			// $82AB30  A9 80	| 
	TSB.w $0201			// $82AB32  0C 01 02	| RAM ADDRESS
	JSL code_808178			// $82AB35  22 78 81 80	| return next frame
	REP #$30			// $82AB39  C2 30	| 
	LDA.w #$0000			// $82AB3B  A9 00 00	| 
	STA.l $7E560C			// $82AB3E  8F 0C 56 7E	| RAM ADDRESS
	LDX.w #$1BE0			// $82AB42  A2 E0 1B	| INDIRECT RAM ADDRESS
	LDY.w #$000C			// $82AB45  A0 0C 00	| 
	LDA.w #$E000			// $82AB48  A9 00 E0	| 
code_82AB4B:				//			| 
	STA.b $00,x			// $82AB4B  95 00	| 
	INX				// $82AB4D  E8		| 
	INX				// $82AB4E  E8		| 
	INX				// $82AB4F  E8		| 
	INX				// $82AB50  E8		| 
	DEY				// $82AB51  88		| 
	BNE code_82AB4B			// $82AB52  D0 F7	| 
	LDX.w #$1C20			// $82AB54  A2 20 1C	| INDIRECT RAM ADDRESS
	LDY.w #$0007			// $82AB57  A0 07 00	| 
	LDA.w #$E000			// $82AB5A  A9 00 E0	| 
code_82AB5D:				//			| 
	STA.b $00,x			// $82AB5D  95 00	| 
	INX				// $82AB5F  E8		| 
	INX				// $82AB60  E8		| 
	INX				// $82AB61  E8		| 
	INX				// $82AB62  E8		| 
	DEY				// $82AB63  88		| 
	BNE code_82AB5D			// $82AB64  D0 F7	| 
	JSL code_808178			// $82AB66  22 78 81 80	| return next frame
	REP #$30			// $82AB6A  C2 30	| 
	LDX.w #$01FE			// $82AB6C  A2 FE 01	| 
code_82AB6F:				//			| below code darkens palette except for L3 colors
	TXA				// $82AB6F  8A		| 
	AND.w #$01E0			// $82AB70  29 E0 01	| 
	TAY				// $82AB73  A8		| 
	LDA.l $7E5200,x			// $82AB74  BF 00 52 7E	| RAM ADDRESS
	STA.l $7E5400,x			// $82AB78  9F 00 54 7E	| RAM ADDRESS
	CPY.w #$0020			// $82AB7C  C0 20 00	| 
	BEQ code_82AB85			// $82AB7F  F0 04	| 
	LSR				// $82AB81  4A		|\ clear high bit of each color component
	AND.w #$3DEF			// $82AB82  29 EF 3D	|/ #%0011110111101111
code_82AB85:				//			| 
	STA.l $7E5200,x			// $82AB85  9F 00 52 7E	| RAM ADDRESS
	DEX				// $82AB89  CA		| 
	DEX				// $82AB8A  CA		| 
	BPL code_82AB6F			// $82AB8B  10 E2	| 
	LDA.w #$0000			// $82AB8D  A9 00 00	| 
	STA.w $0238			// $82AB90  8D 38 02	| RAM ADDRESS
	LDA.w #$0100			// $82AB93  A9 00 01	| 
	STA.w $023A			// $82AB96  8D 3A 02	| RAM ADDRESS
	JSL code_808178			// $82AB99  22 78 81 80	| return next frame
	REP #$30			// $82AB9D  C2 30	| 
	LDX.w #$01FE			// $82AB9F  A2 FE 01	| 
code_82ABA2:				//			| restore palette (but not uploaded to CGRAM yet)
	LDA.l $7E5400,x			// $82ABA2  BF 00 54 7E	| RAM ADDRESS
	STA.l $7E5200,x			// $82ABA6  9F 00 52 7E	| RAM ADDRESS
	DEX				// $82ABAA  CA		| 
	DEX				// $82ABAB  CA		| 
	BPL code_82ABA2			// $82ABAC  10 F4	| 
	REP #$30			// $82ABAE  C2 30	|\ buffer layer 3 GFX for REPLAY menu
	LDA.w #data_9BC203>>16		// $82ABB0  A9 9B 00	|| 
	PHA				// $82ABB3  48		|| 
	LDA.w #data_9BC203+$20		// $82ABB4  A9 23 C2	|| 
	LDX.w #$0010			// $82ABB7  A2 10 00	|| 
	LDY.w #$05E0			// $82ABBA  A0 E0 05	|| 
	JSL code_808AA4			// $82ABBD  22 A4 8A 80	|| 
	LDA.w #data_9BC203+$700		// $82ABC1  A9 03 C9	|| 
	LDX.w #$0440			// $82ABC4  A2 40 04	|| 
	LDY.w #$0080			// $82ABC7  A0 80 00	|| 
	JSL code_808AA4			// $82ABCA  22 A4 8A 80	|| 
	LDA.w #data_9BC203+$780		// $82ABCE  A9 83 C9	|| 
	LDX.w #$04E0			// $82ABD1  A2 E0 04	|| 
	LDY.w #$0040			// $82ABD4  A0 40 00	|| 
	JSL code_808AA4			// $82ABD7  22 A4 8A 80	|| 
	PLA				// $82ABDB  68		|/ 
	LDX.w #$01FE			// $82ABDC  A2 FE 01	| 
	LDA.w #$0000			// $82ABDF  A9 00 00	| 
code_82ABE2:				//			| clear out tilemap buffer
	STA.l $7E5400,x			// $82ABE2  9F 00 54 7E	| RAM ADDRESS
	DEX				// $82ABE6  CA		| 
	DEX				// $82ABE7  CA		| 
	BPL code_82ABE2			// $82ABE8  10 F8	| 
	LDA.w #$007E			// $82ABEA  A9 7E 00	| 
	PHA				// $82ABED  48		| 
	LDA.w #$5400			// $82ABEE  A9 00 54	| INDIRECT RAM ADDRESS
	LDX.w #$0300			// $82ABF1  A2 00 03	| 
	LDY.w #$0200			// $82ABF4  A0 00 02	| 
	JSL code_808AA4			// $82ABF7  22 A4 8A 80	| upload tilemap to VRAM buffer (effectively clear L3)
	PLA				// $82ABFB  68		| 
	SEP #$20			// $82ABFC  E2 20	| 
	LDA.b #$60			// $82ABFE  A9 60	| no L3 X/Y HDMA
	STA.w $021C			// $82AC00  8D 1C 02	| RAM ADDRESS
	JSL code_808178			// $82AC03  22 78 81 80	| return next frame
	REP #$30			// $82AC07  C2 30	| 
	LDA.w $0204			// $82AC09  AD 04 02	| RAM ADDRESS
	ASL				// $82AC0C  0A		| 
	LDA.w #data_80E595		// $82AC0D  A9 95 E5	| 
	LDY.w #$006F			// $82AC10  A0 6F 00	| REPLAY menu Y pos in level
	BCS code_82AC1B			// $82AC13  B0 06	| 
	LDA.w #data_80E59C		// $82AC15  A9 9C E5	| 
	LDY.w #$0057			// $82AC18  A0 57 00	| REPLAY menu Y pos on title screen
code_82AC1B:				//			| 
	STA.w $4362			// $82AC1B  8D 62 43	| 
	LDA.w #data_80E595>>16		// $82AC1E  A9 80 00	| 
	STA.w $4364			// $82AC21  8D 64 43	| 
	SEP #$20			// $82AC24  E2 20	| 
	STZ.w $2109			// $82AC26  9C 09 21	| 
	TYA				// $82AC29  98		| 
	STA.w $2112			// $82AC2A  8D 12 21	| 
	STZ.w $2112			// $82AC2D  9C 12 21	| 
	STZ.w $2111			// $82AC30  9C 11 21	| 
	STZ.w $2111			// $82AC33  9C 11 21	| 
	REP #$20			// $82AC36  C2 20	| 
	LDA.w #$000F			// $82AC38  A9 0F 00	| 
	STA.w $0BC0			// $82AC3B  8D C0 0B	| RAM ADDRESS
	REP #$30			// $82AC3E  C2 30	| 
	LDX.w #$01FE			// $82AC40  A2 FE 01	| 
	LDA.w #$0000			// $82AC43  A9 00 00	| 
code_82AC46:				//			| clear out tilemap buffer again
	STA.l $7E5400,x			// $82AC46  9F 00 54 7E	| 
	DEX				// $82AC4A  CA		| 
	DEX				// $82AC4B  CA		| 
	BPL code_82AC46			// $82AC4C  10 F8	| 
	JSR code_82C1E5			// $82AC4E  20 E5 C1	| SRAM stuff
	BCC code_82AC60			// $82AC51  90 0D	| carry determines if SRAM is b0rked
	LDA.w #code_82AEF6		// $82AC53  A9 F6 AE	| storing ROM loc
	STA.b $90			// $82AC56  85 90	| 
	LDY.w #data_82BF93		// $82AC58  A0 93 BF	| 
	JSR code_82B303			// $82AC5B  20 03 B3	| 
	BRA code_82AC85			// $82AC5E  80 25	| 
code_82AC60:				//			| not b0rked
	JSR code_82C310			// $82AC60  20 10 C3	| 
	JSR code_82C334			// $82AC63  20 34 C3	| 
	REP #$30			// $82AC66  C2 30	| 
	LDA.w #$0000			// $82AC68  A9 00 00	| 
	STA.l $7E5600			// $82AC6B  8F 00 56 7E	| RAM ADDRESS
	STA.l $7E5602			// $82AC6F  8F 02 56 7E	| RAM ADDRESS
	STA.l $7E5604			// $82AC73  8F 04 56 7E	| RAM ADDRESS
	STA.l $7E5606			// $82AC77  8F 06 56 7E	| RAM ADDRESS
	STA.l $7E5608			// $82AC7B  8F 08 56 7E	| RAM ADDRESS
	LDX.w #$0000			// $82AC7F  A2 00 00	| 
	JSR ($0096,x)			// $82AC82  FC 96 00	| INDIRECT RAM ROM JUMP
code_82AC85:				//			| 
	JSL code_808178			// $82AC85  22 78 81 80	| return next frame
	LDX.w #$01FE			// $82AC89  A2 FE 01	| 
	LDA.w #$0000			// $82AC8C  A9 00 00	| 
code_82AC8F:				//			| 
	STA.l $7E5400,x			// $82AC8F  9F 00 54 7E	| RAM ADDRESS
	DEX				// $82AC93  CA		| 
	DEX				// $82AC94  CA		| 
	BPL code_82AC8F			// $82AC95  10 F8	| 
	LDA.w #$007E			// $82AC97  A9 7E 00	| 
	PHA				// $82AC9A  48		| 
	LDA.w #$5400			// $82AC9B  A9 00 54	| RAM ADDRESS
	LDX.w #$0000			// $82AC9E  A2 00 00	| 
	LDY.w #$0200			// $82ACA1  A0 00 02	| 
	JSL code_808AA4			// $82ACA4  22 A4 8A 80	| 
	LDA.w #$5400			// $82ACA8  A9 00 54	| RAM ADDRESS
	LDX.w #$0100			// $82ACAB  A2 00 01	| 
	LDY.w #$0200			// $82ACAE  A0 00 02	| 
	JSL code_808AA4			// $82ACB1  22 A4 8A 80	| 
	LDA.w #$5400			// $82ACB5  A9 00 54	| RAM ADDRESS
	LDX.w #$0200			// $82ACB8  A2 00 02	| 
	LDY.w #$0200			// $82ACBB  A0 00 02	| 
	JSL code_808AA4			// $82ACBE  22 A4 8A 80	| 
	LDA.w #$5400			// $82ACC2  A9 00 54	| RAM ADDRESS
	LDX.w #$0300			// $82ACC5  A2 00 03	| 
	LDY.w #$0200			// $82ACC8  A0 00 02	| 
	JSL code_808AA4			// $82ACCB  22 A4 8A 80	| 
	PLA				// $82ACCF  68		| 
	JSL code_808178			// $82ACD0  22 78 81 80	| return next frame
	REP #$30			// $82ACD4  C2 30	| 
	LDX.w #$0000			// $82ACD6  A2 00 00	| 
	LDA.w #$0440			// $82ACD9  A9 40 04	| 
	STA.b $80			// $82ACDC  85 80	| RAM ADDRESS
code_82ACDE:				//			| 
	LDA.l data_80E4F5,x		// $82ACDE  BF F5 E4 80	| 
	AND.w #$00FF			// $82ACE2  29 FF 00	| 
	BEQ code_82ACFF			// $82ACE5  F0 18	| 
	PHX				// $82ACE7  DA		| 
	ASL				// $82ACE8  0A		| 
	ASL				// $82ACE9  0A		| 
	ASL				// $82ACEA  0A		| 
	ASL				// $82ACEB  0A		| 
	CLC				// $82ACEC  18		| 
	ADC.w #data_9BC203		// $82ACED  69 03 C2	| INDIRECT ROM ADDR?
	LDY.w #data_9BC203>>16		// $82ACF0  A0 9B 00	| 
	PHY				// $82ACF3  5A		| 
	LDX.b $80			// $82ACF4  A6 80	| RAM ADDRESS
	LDY.w #$0010			// $82ACF6  A0 10 00	| 
	JSL code_808AA4			// $82ACF9  22 A4 8A 80	| 
	PLX				// $82ACFD  FA		| 
	PLX				// $82ACFE  FA		| 
code_82ACFF:				//			| 
	LDA.b $80			// $82ACFF  A5 80	| RAM ADDRESS
	CLC				// $82AD01  18		| 
	ADC.w #$0008			// $82AD02  69 08 00	| 
	CMP.w #$0480			// $82AD05  C9 80 04	| 
	BNE code_82AD0D			// $82AD08  D0 03	| 
	LDA.w #$04E0			// $82AD0A  A9 E0 04	| 
code_82AD0D:				//			| 
	STA.b $80			// $82AD0D  85 80	| RAM ADDRESS
	INX				// $82AD0F  E8		| 
	CPX.w #$000C			// $82AD10  E0 0C 00	| 
	BNE code_82ACDE			// $82AD13  D0 C9	| 
	SEP #$20			// $82AD15  E2 20	| 
	LDA.b #$E0			// $82AD17  A9 E0	| 
	STA.w $021C			// $82AD19  8D 1C 02	| 
	JSL code_808178			// $82AD1C  22 78 81 80	| return next frame
	REP #$30			// $82AD20  C2 30	| 
	LDA.w #$0B80			// $82AD22  A9 80 0B	| RAM ADDRESS
	STA.w $4362			// $82AD25  8D 62 43	| 
	SEP #$20			// $82AD28  E2 20	| 
	LDA.b #$00			// $82AD2A  A9 00	| 
	STA.w $4364			// $82AD2C  8D 64 43	| 
	LDA.b #$04			// $82AD2F  A9 04	| 
	STA.w $2109			// $82AD31  8D 09 21	| 
	REP #$30			// $82AD34  C2 30	| 
	LDA.w #$8000			// $82AD36  A9 00 80	| 
	TRB.w $0226			// $82AD39  1C 26 02	| RAM ADDRESS
	TRB.w $0228			// $82AD3C  1C 28 02	| RAM ADDRESS
	TRB.w $022A			// $82AD3F  1C 2A 02	| RAM ADDRESS
	TRB.w $022C			// $82AD42  1C 2C 02	| RAM ADDRESS
	SEP #$20			// $82AD45  E2 20	| 
	LDA.b #$80			// $82AD47  A9 80	| 
	TRB.w $0201			// $82AD49  1C 01 02	| RAM ADDRESS
	REP #$20			// $82AD4C  C2 20	| 
	LDA.w #$0000			// $82AD4E  A9 00 00	| 
	STA.w $0238			// $82AD51  8D 38 02	| RAM ADDRESS
	LDA.w #$0100			// $82AD54  A9 00 01	| 
	STA.w $023A			// $82AD57  8D 3A 02	| RAM ADDRESS
	RTL				// $82AD5A  6B		| 


code_82AD5B:				//----------------------| 
	REP #$30			// $82AD5B  C2 30	| 
	LDA.w #$0004			// $82AD5D  A9 04 00	| 
	STA.l $7E560A			// $82AD60  8F 0A 56 7E	| RAM ADDRESS
	LDA.w $0262			// $82AD64  AD 62 02	| RAM ADDRESS
	BPL code_82AD74			// $82AD67  10 0B	| 
	LDA.w #code_82AEF6		// $82AD69  A9 F6 AE	| 
	STA.b $90			// $82AD6C  85 90	| RAM ADDRESS
	LDY.w #data_82BF5F		// $82AD6E  A0 5F BF	| 
	JSR code_82B303			// $82AD71  20 03 B3	| 
code_82AD74:				//			| 
	JMP code_82B5A7			// $82AD74  4C A7 B5	| 

code_82AD77:				//----------------------| 
	LDY.w #code_808A11-1		// $82AD77  A0 10 8A	|\ turn screen on
	JSL code_808A04			// $82AD7A  22 04 8A 80	|/ 
	REP #$30			// $82AD7E  C2 30	| 
	LDA.w #$8005			// $82AD80  A9 05 80	| ???
	STA.l $7E560A			// $82AD83  8F 0A 56 7E	| RAM ADDRESS
	JMP code_82B5A7			// $82AD87  4C A7 B5	| 

code_82AD8A:				//----------------------| 
	REP #$30			// $82AD8A  C2 30	| 
	JMP code_82B635			// $82AD8C  4C 35 B6	| 

code_82AD8F:				//----------------------| 
	REP #$30			// $82AD8F  C2 30	| 
	LDX.w #$000E			// $82AD91  A2 0E 00	| 
code_82AD94:				//			| 
	LDA.b $80,x			// $82AD94  B5 80	| RAM ADDRESS
	PHA				// $82AD96  48		| 
	DEX				// $82AD97  CA		| 
	DEX				// $82AD98  CA		| 
	BPL code_82AD94			// $82AD99  10 F9	| 
	LDA.w $0240			// $82AD9B  AD 40 02	| RAM ADDRESS
	STA.w $0276			// $82AD9E  8D 76 02	| RAM ADDRESS
	JSR code_82ADDF			// $82ADA1  20 DF AD	| 
	JSL code_808178			// $82ADA4  22 78 81 80	| return next frame
	REP #$30			// $82ADA8  C2 30	| 
	LDX.w #$0000			// $82ADAA  A2 00 00	| 
code_82ADAD:				//			| 
	PLA				// $82ADAD  68		| 
	STA.b $80,x			// $82ADAE  95 80	| RAM ADDRESS
	INX				// $82ADB0  E8		| 
	INX				// $82ADB1  E8		| 
	CPX.w #$0010			// $82ADB2  E0 10 00	| 
	BNE code_82ADAD			// $82ADB5  D0 F6	| 
	LDA.w $0240			// $82ADB7  AD 40 02	| RAM ADDRESS
	AND.w #$0F00			// $82ADBA  29 00 0F	| 
	BEQ code_82ADCC			// $82ADBD  F0 0D	| 
	DEC.w $0278			// $82ADBF  CE 78 02	| RAM ADDRESS
	BNE code_82ADD2			// $82ADC2  D0 0E	| 
	TRB.w $0276			// $82ADC4  1C 76 02	| RAM ADDRESS
	LDA.w #$0003			// $82ADC7  A9 03 00	| 
	BRA code_82ADCF			// $82ADCA  80 03	|
code_82ADCC:				//			| 
	LDA.w #$001E			// $82ADCC  A9 1E 00	| 
code_82ADCF:				//			| 
	STA.w $0278			// $82ADCF  8D 78 02	| RAM ADDRESS
code_82ADD2:				//			| 
	RTS				// $82ADD2  60		| 


code_82ADD3:				//----------------------| 
	REP #$30			// $82ADD3  C2 30	| 
	LDA.w $0276			// $82ADD5  AD 76 02	| RAM ADDRESS
	EOR.w #$FFFF			// $82ADD8  49 FF FF	| 
	AND.w $0240			// $82ADDB  2D 40 02	| 
	RTS				// $82ADDE  60		| 


code_82ADDF:				//----------------------| upload rendered tilemap to VRAM buffer
	REP #$30			// $82ADDF  C2 30	| 
	LDA.w #$007E			// $82ADE1  A9 7E 00	| 
	PHA				// $82ADE3  48		| 
	LDA.w #$5400			// $82ADE4  A9 00 54	| INDIRECT RAM ADDRESS
	LDX.w #$0308			// $82ADE7  A2 08 03	| 
	LDY.w #$0020			// $82ADEA  A0 20 00	| 
	JSL code_808AA4			// $82ADEE  22 A4 8A 80	| 
	LDA.w #$5420			// $82ADF2  A9 20 54	| INDIRECT RAM ADDRESS
	LDX.w #$0328			// $82ADF5  A2 28 03	| 
	LDY.w #$0020			// $82ADF8  A0 20 00	| 
	JSL code_808AA4			// $82ADFB  22 A4 8A 80	| 
	LDA.w #$5440			// $82ADFF  A9 40 54	| INDIRECT RAM ADDRESS
	LDX.w #$0348			// $82AE02  A2 48 03	| 
	LDY.w #$0020			// $82AE05  A0 20 00	| 
	JSL code_808AA4			// $82AE08  22 A4 8A 80	| 
	LDA.w #$5460			// $82AE0C  A9 60 54	| INDIRECT RAM ADDRESS
	LDX.w #$0368			// $82AE0F  A2 68 03	| 
	LDY.w #$0020			// $82AE12  A0 20 00	| 
	JSL code_808AA4			// $82AE15  22 A4 8A 80	| 
	LDA.w #$5480			// $82AE19  A9 80 54	| INDIRECT RAM ADDRESS
	LDX.w #$0388			// $82AE1C  A2 88 03	| 
	LDY.w #$0020			// $82AE1F  A0 20 00	| 
	JSL code_808AA4			// $82AE22  22 A4 8A 80	| 
	LDA.w #$54A0			// $82AE26  A9 A0 54	| INDIRECT RAM ADDRESS
	LDX.w #$03A8			// $82AE29  A2 A8 03	| 
	LDY.w #$0020			// $82AE2C  A0 20 00	| 
	JSL code_808AA4			// $82AE2F  22 A4 8A 80	| 
	LDA.w #$54C0			// $82AE33  A9 C0 54	| INDIRECT RAM ADDRESS
	LDX.w #$03C8			// $82AE36  A2 C8 03	| 
	LDY.w #$0020			// $82AE39  A0 20 00	| 
	JSL code_808AA4			// $82AE3C 22 A4 8A 80	| 
	LDA.w #$54E0			// $82AE40  A9 E0 54	| INDIRECT RAM ADDRESS
	LDX.w #$03E8			// $82AE43  A2 E8 03	| 
	LDY.w #$0020			// $82AE46  A0 20 00	| 
	JSL code_808AA4			// $82AE49  22 A4 8A 80	| 
	PLA				// $82AE4D  68		| 
	RTS				// $82AE4E  60		| 


code_82AE4F:				//----------------------| draw layer 3 menu border in buffer
	REP #$30			// $82AE4F  C2 30	| 
	STA.b $80			// $82AE51  85 80	| RAM ADDRESS
	TXA				// $82AE53  8A		| 
	XBA				// $82AE54  EB		| 
	AND.w #$00FF			// $82AE55  29 FF 00	| 
	STA.b $82			// $82AE58  85 82	| RAM ADDRESS
	TXA				// $82AE5A  8A		| 
	AND.w #$00FF			// $82AE5B  29 FF 00	| 
	STA.b $84			// $82AE5E  85 84	| RAM ADDRESS
	STY.b $86			// $82AE60  84 86	| RAM ADDRESS
	LDX.b $80			// $82AE62  A6 80	| RAM ADDRESS
	LDA.w #$3088			// $82AE64  A9 88 30	| top left corner tile
	ORA.b $86			// $82AE67  05 86	| RAM ADDRESS
	STA.l $7E5400,x			// $82AE69  9F 00 54 7E	| RAM ADDRESS
	LDY.b $82			// $82AE6D  A4 82	| RAM ADDRESS
	DEY				// $82AE6F  88		| 
	DEY				// $82AE70  88		| 
	LDA.w #$3089			// $82AE71  A9 89 30	| top edge tile
	ORA.b $86			// $82AE74  05 86	| RAM ADDRESS
	BRA code_82AE7E			// $82AE76  80 06	| 
code_82AE78:				//			| 
	INX				// $82AE78  E8		| 
	INX				// $82AE79  E8		| 
	STA.l $7E5400,x			// $82AE7A  9F 00 54 7E	| RAM ADDRESS
code_82AE7E:				//			| 
	DEY				// $82AE7E  88		| 
	BPL code_82AE78			// $82AE7F  10 F7	| 
	LDA.w #$308A			// $82AE81  A9 8A 30	| top right corner tile
	ORA.b $86			// $82AE84  05 86	| RAM ADDRESS
	STA.l $7E5402,x			// $82AE86  9F 02 54 7E	| RAM ADDRESS
	LDA.b $84			// $82AE8A  A5 84	| RAM ADDRESS
	DEC				// $82AE8C  3A		| 
	XBA				// $82AE8D  EB		| 
	LSR				// $82AE8E  4A		| 
	LSR				// $82AE8F  4A		| 
	LSR				// $82AE90  4A		| 
	CLC				// $82AE91  18		| 
	ADC.b $80			// $82AE92  65 80	| RAM ADDRESS
	TAX				// $82AE94  AA		| 
	LDA.w #$308B			// $82AE95  A9 8B 30	| bottom left corner tile
	ORA.b $86			// $82AE98  05 86	| RAM ADDRESS
	STA.l $7E5400,x			// $82AE9A  9F 00 54 7E	| RAM ADDRESS
	LDY.b $82			// $82AE9E  A4 82	| RAM ADDRESS
	DEY				// $82AEA0  88		| 
	DEY				// $82AEA1  88		| 
	LDA.w #$308C			// $82AEA2  A9 8C 30	| bottom edge tile
	ORA.b $86			// $82AEA5  05 86	| RAM ADDRESS
	BRA code_82AEAF			// $82AEA7  80 06	| 
code_82AEA9:				//			| 
	INX				// $82AEA9  E8		| 
	INX				// $82AEAA  E8		| 
	STA.l $7E5400,x			// $82AEAB  9F 00 54 7E	| RAM ADDRESS
code_82AEAF:				//			| 
	DEY				// $82AEAF  88		| 
	BPL code_82AEA9			// $82AEB0  10 F7	| 
	LDA.w #$308D			// $82AEB2  A9 8D 30	| bottom right corner tile
	ORA.b $86			// $82AEB5  05 86	| RAM ADDRESS
	STA.l $7E5402,x			// $82AEB7  9F 02 54 7E	| RAM ADDRESS
	LDX.b $80			// $82AEBB  A6 80	| RAM ADDRESS
	LDY.b $84			// $82AEBD  A4 84	| RAM ADDRESS
	DEY				// $82AEBF  88		| 
	DEY				// $82AEC0  88		| 
	BRA code_82AED2			// $82AEC1  80 0F	| 
code_82AEC3:				//			| 
	TXA				// $82AEC3  8A		| 
	CLC				// $82AEC4  18		| 
	ADC.w #$0020			// $82AEC5  69 20 00	| 
	TAX				// $82AEC8  AA		| 
	LDA.w #$308E			// $82AEC9  A9 8E 30	| left edge tile
	ORA.b $86			// $82AECC  05 86	| RAM ADDRESS
	STA.l $7E5400,x			// $82AECE  9F 00 54 7E	| RAM ADDRESS
code_82AED2:				//			| 
	DEY				// $82AED2  88		| 
	BPL code_82AEC3			// $82AED3  10 EE	| 
	LDA.b $82			// $82AED5  A5 82	| RAM ADDRESS
	DEC				// $82AED7  3A		| 
	ASL				// $82AED8  0A		| 
	CLC				// $82AED9  18		| 
	ADC.b $80			// $82AEDA  65 80	| RAM ADDRESS
	TAX				// $82AEDC  AA		| 
	LDY.b $84			// $82AEDD  A4 84	| RAM ADDRESS
	DEY				// $82AEDF  88		| 
	DEY				// $82AEE0  88		| 
	BRA code_82AEF2			// $82AEE1  80 0F	| 
code_82AEE3:				//			| 
	TXA				// $82AEE3  8A		| 
	CLC				// $82AEE4  18		| 
	ADC.w #$0020			// $82AEE5  69 20 00	| 
	TAX				// $82AEE8  AA		| 
	LDA.w #$308F			// $82AEE9  A9 8F 30	| right edge tile
	ORA.b $86			// $82AEEC  05 86	| RAM ADDRESS
	STA.l $7E5400,x			// $82AEEE  9F 00 54 7E	| RAM ADDRESS
code_82AEF2:				//			| 
	DEY				// $82AEF2  88		| 
	BPL code_82AEE3			// $82AEF3  10 EE	| 
	RTS				// $82AEF5  60		| 


code_82AEF6:				//----------------------| 
	REP #$30			// $82AEF6  C2 30	| 
	LDX.w #$00FE			// $82AEF8  A2 FE 00	| 
	LDA.w #$0000			// $82AEFB  A9 00 00	| 
code_82AEFE:				//			| 
	STA.l $7E5500,x			// $82AEFE  9F 00 55 7E	| RAM ADDRESS
	DEX				// $82AF02  CA		| 
	DEX				// $82AF03  CA		| 
	BPL code_82AEFE			// $82AF04  10 F8	| 
	RTS				// $82AF06  60		| 

code_82AF07:				//----------------------| 
	REP #$30			// $82AF07  C2 30	| 
	STA.b $88			// $82AF09  85 88	| RAM ADDRESS
	STY.b $8C			// $82AF0B  84 8C	| RAM ADDRESS
	TXA				// $82AF0D  8A		| 
	XBA				// $82AF0E  EB		| 
	AND.w #$00FF			// $82AF0F  29 FF 00	| 
	DEC				// $82AF12  3A		| 
	STA.b $8E			// $82AF13  85 8E	| RAM ADDRESS
	TXA				// $82AF15  8A		| 
	AND.w #$00FF			// $82AF16  29 FF 00	| 
	DEC				// $82AF19  3A		| 
	ASL				// $82AF1A  0A		| 
	ASL				// $82AF1B  0A		| 
	ASL				// $82AF1C  0A		| 
	ASL				// $82AF1D  0A		| 
	ORA.b $8E			// $82AF1E  05 8E	| RAM ADDRESS
	ASL				// $82AF20  0A		| 
	CLC				// $82AF21  18		| 
	ADC.b $88			// $82AF22  65 88	| RAM ADDRESS
	STA.b $8E			// $82AF24  85 8E	| RAM ADDRESS
	TXA				// $82AF26  8A		| 
	XBA				// $82AF27  EB		| 
	AND.w #$00FE			// $82AF28  29 FE 00	| 
	CLC				// $82AF2B  18		| 
	ADC.b $88			// $82AF2C  65 88	| RAM ADDRESS
	STA.b $80			// $82AF2E  85 80	| RAM ADDRESS
	TXA				// $82AF30  8A		| 
	AND.w #$00FE			// $82AF31  29 FE 00	| 
	ASL				// $82AF34  0A		| 
	ASL				// $82AF35  0A		| 
	ASL				// $82AF36  0A		| 
	ASL				// $82AF37  0A		| 
	CLC				// $82AF38  18		| 
	ADC.b $80			// $82AF39  65 80	| RAM ADDRESS
	STA.b $8A			// $82AF3B  85 8A	| RAM ADDRESS
	SEC				// $82AF3D  38		| 
	SBC.w #$0022			// $82AF3E  E9 22 00	| 
	STA.b $80			// $82AF41  85 80	| RAM ADDRESS
	TXA				// $82AF43  8A		| 
	BIT.w #$0001			// $82AF44  89 01 00	| 
	BEQ code_82AF51			// $82AF47  F0 08	| 
	LDA.b $8A			// $82AF49  A5 8A	| RAM ADDRESS
	CLC				// $82AF4B  18		| 
	ADC.w #$0020			// $82AF4C  69 20 00	| 
	STA.b $8A			// $82AF4F  85 8A	| 
code_82AF51:				//			| 
	TXA				// $82AF51  8A		| 
	BIT.w #$0100			// $82AF52  89 00 01	| 
	BEQ code_82AF5B			// $82AF55  F0 04	| 
	INC.b $8A			// $82AF57  E6 8A	| RAM ADDRESS
	INC.b $8A			// $82AF59  E6 8A	| RAM ADDRESS
code_82AF5B:				//			| 
	LDA.b $8A			// $82AF5B  A5 8A	| RAM ADDRESS
	SEC				// $82AF5D  38		| 
	SBC.b $80			// $82AF5E  E5 80	| RAM ADDRESS
	AND.w #$001E			// $82AF60  29 1E 00	| 
	LSR				// $82AF63  4A		| 
	STA.b $82			// $82AF64  85 82	| RAM ADDRESS
	LDA.b $8A			// $82AF66  A5 8A	| RAM ADDRESS
	SEC				// $82AF68  38		| 
	SBC.b $80			// $82AF69  E5 80	| RAM ADDRESS
	AND.w #$00E0			// $82AF6B  29 E0 00	| 
	ASL				// $82AF6E  0A		| 
	ASL				// $82AF6F  0A		| 
	ASL				// $82AF70  0A		| 
	ORA.b $82			// $82AF71  05 82	| RAM ADDRESS
	XBA				// $82AF73  EB		| 
	CLC				// $82AF74  18		| 
	ADC.w #$0101			// $82AF75  69 01 01	| 
	TAX				// $82AF78  AA	 	| 
	PHX				// $82AF79  DA		| 
	LDA.b $80			// $82AF7A  A5 80	| RAM ADDRESS
	LDY.b $8C			// $82AF7C  A4 8C	| RAM ADDRESS
	JSR code_82AE4F			// $82AF7E  20 4F AE	| 
	LDX.b $80			// $82AF81  A6 80	| RAM ADDRESS
	LDA $01,s			// $82AF83  A3 01	| 
	AND.w #$00FF			// $82AF85  29 FF 00	| 
	TAY				// $82AF88  A8		| 
	DEY				// $82AF89  88		| 
	DEY				// $82AF8A  88		| 
	BRA code_82AFA8			// $82AF8B  80 1B	| 
code_82AF8D:				//			| 
	LDA $02,s			// $82AF8D  A3 02	| 
	PHX				// $82AF8F  DA		| 
	PHY				// $82AF90  5A		| 
	AND.w #$00FF			// $82AF91  29 FF 00	| 
	TAY				// $82AF94  A8		| 
	DEY				// $82AF95  88		| 
	DEY				// $82AF96  88		| 
	BRA code_82AFA1			// $82AF97  80 08	| 
code_82AF99:				//			| 
	LDA.l $7E5500,x			// $82AF99  BF 00 55 7E	| RAM ADDRESS
	STA.l $7E5400,x			// $82AF9D  9F 00 54 7E	| RAM ADDRESS
code_82AFA1:				//			| 
	INX				// $82AFA1  E8		| 
	INX				// $82AFA2  E8		| 
	DEY				// $82AFA3  88		| 
	BPL code_82AF99			// $82AFA4  10 F3	| 
	PLY				// $82AFA6  7A		| 
	PLX				// $82AFA7  FA		| 
code_82AFA8:				//			| 
	TXA				// $82AFA8  8A		| 
code_82AFA9:				//			| 
	CLC				// $82AFA9  18		| 
	ADC.w #$0020			// $82AFAA  69 20 00	| 
	TAX				// $82AFAD  AA		| 
	DEY				// $82AFAE  88		| 
	BPL code_82AF8D			// $82AFAF  10 DC	| 
	PLA				// $82AFB1  68		| 
	JSR code_82AD8F			// $82AFB2  20 8F AD	| 
	LDY.w #$0000			// $82AFB5  A0 00 00	| 
	LDA.b $80			// $82AFB8  A5 80	| RAM ADDRESS
	TAX				// $82AFBA  AA		| 
	EOR.b $88			// $82AFBB  45 88	| RAM ADDRESS
	AND.w #$001E			// $82AFBD  29 1E 00	| 
	BEQ code_82AFC5			// $82AFC0  F0 03	| 
	INY				// $82AFC2  C8		| 
	DEX				// $82AFC3  CA		| 
	DEX				// $82AFC4  CA		| 
code_82AFC5:				//			| 
	TXA				// $82AFC5  8A		| 
	EOR.b $88			// $82AFC6  45 88	| RAM ADDRESS
	AND.w #$00E0			// $82AFC8  29 E0 00	| 
	BEQ code_82AFD4			// $82AFCB  F0 07	| 
	INY				// $82AFCD  C8		| 
	TXA				// $82AFCE  8A		| 
	SEC				// $82AFCF  38		| 
	SBC.w #$0020			// $82AFD0  E9 20 00	| 
	TAX				// $82AFD3  AA		| 
code_82AFD4:				//			| 
	STX.b $80			// $82AFD4  86 80	| RAM ADDRESS
	LDA.b $8A			// $82AFD6  A5 8A	| RAM ADDRESS
	TAX				// $82AFD8  AA		| 
	EOR.b $8E			// $82AFD9  45 8E	| RAM ADDRESS
	AND.w #$001E			// $82AFDB  29 1E 00	| 
	BEQ code_82AFE3			// $82AFDE  F0 03	| 
	INY				// $82AFE0  C8		| 
	INX				// $82AFE1  E8		| 
	INX				// $82AFE2  E8		| 
code_82AFE3:				//			| 
	TXA				// $82AFE3  8A		| 
	EOR.b $8E			// $82AFE4  45 8E	| RAM ADDRESS
	AND.w #$00E0			// $82AFE6  29 E0 00	| 
	BEQ code_82AFF2			// $82AFE9  F0 07	| 
	INY				// $82AFEB  C8		| 
	TXA				// $82AFEC  8A		| 
	CLC				// $82AFED  18		| 
	ADC.w #$0020			// $82AFEE  69 20 00	| 
	TAX				// $82AFF1  AA		| 
code_82AFF2:				//			| 
	STX.b $8A			// $82AFF2  86 8A	| RAM ADDRESS
	TYA				// $82AFF4  98		| 
	BEQ code_82AFFA			// $82AFF5  F0 03	| 
	JMP code_82AF5B			// $82AFF7  4C 5B AF	| 
code_82AFFA:				//			| 
	RTS				// $82AFFA  60		| 


code_82AFFB:				//----------------------| 
	LDA.b $8E			// $82AFFB  A5 8E	| RAM ADDRESS
	AND.w #$00FE			// $82AFFD  29 FE 00	| 
	STA.b $82			// $82B000  85 82	| RAM ADDRESS
	LDA.b $8F			// $82B002  A5 8F	| RAM ADDRESS
	AND.w #$00FE			// $82B004  29 FE 00	| 
	CMP.b $82			// $82B007  C5 82	| RAM ADDRESS
	RTS				// $82B009  60		| 

code_82B00A:				//			| 
	LDA.b $8F			// $82B00A  A5 8F	| RAM ADDRESS
	AND.w #$00FF			// $82B00C  29 FF 00	| 
	TAY				// $82B00F  A8		| 
	BEQ code_82B01A			// $82B010  F0 08	| 
	INC.b $80			// $82B012  E6 80	| RAM ADDRESS
	INC.b $80			// $82B014  E6 80	| RAM ADDRESS
	DEY				// $82B016  88		| 
	BEQ code_82B01A			// $82B017  F0 01	| 
	DEY				// $82B019  88		| 
code_82B01A:				//			| 
	TYA				// $82B01A  98		| 
	SEP #$20			// $82B01B  E2 20	| 
	STA.b $8F			// $82B01D  85 8F	| RAM ADDRESS
	REP #$20			// $82B01F  C2 20	| 
	RTS				// $82B021  60		| 

code_82B022:				//			| 
	LDA.b $8E			// $82B022  A5 8E	| RAM ADDRESS
	AND.w #$00FF			// $82B024  29 FF 00	| 
	TAY				// $82B027  A8		| 
	BEQ code_82B036			// $82B028  F0 0C	| 
	LDA.b $80			// $82B02A  A5 80	| RAM ADDRESS
	CLC				// $82B02C  18		| 
	ADC.w #$0020			// $82B02D  69 20 00	| 
	STA.b $80			// $82B030  85 80	| RAM ADDRESS
	DEY				// $82B032  88		| 
	BEQ code_82B036			// $82B033  F0 01	| 
	DEY				// $82B035  88		| 
code_82B036:				//			| 
	TYA				// $82B036  98		| 
	SEP #$20			// $82B037  E2 20	| 
	STA.b $8E			// $82B039  85 8E	| RAM ADDRESS
	REP #$20			// $82B03B  C2 20	| 
	RTS				// $82B03D  60		| 

code_82B03E:				//----------------------| 
	REP #$30			// $82B03E  C2 30	| 
	STA.b $80			// $82B040  85 80	| RAM ADDRESS
	STY.b $8C			// $82B042  84 8C	| RAM ADDRESS
	STX.b $8E			// $82B044  86 8E	| RAM ADDRESS
code_82B046:				//----------------------| loopback?
	JSR code_82AFFB			// $82B046  20 FB AF	| 
	BCC code_82B058			// $82B049  90 0D	| 
	JSR code_82B00A			// $82B04B  20 0A B0	| 
	JSR code_82AFFB			// $82B04E  20 FB AF	| 
	BCS code_82B065			// $82B051  B0 12	| 
	JSR code_82B022			// $82B053  20 22 B0	| 
	BRA code_82B065			// $82B056  80 0D	| 
code_82B058:				//			| 
	JSR code_82B022			// $82B058  20 22 B0	| 
	JSR code_82AFFB			// $82B05B  20 FB AF	| 
	BEQ code_82B065			// $82B05E  F0 05	| 
	BCC code_82B065			// $82B060  90 03	| 
	JSR code_82B00A			// $82B062  20 0A B0	| 
code_82B065:				//			| 
	LDA.b $8E			// $82B065  A5 8E	| RAM ADDRESS
	AND.w #$00FF			// $82B067  29 FF 00	| 
	CMP.w #$0002			// $82B06A  C9 02 00	| 
	BCC code_82B082			// $82B06D  90 13	| 
	LDA.b $8F			// $82B06F  A5 8F	| RAM ADDRESS
	AND.w #$00FF			// $82B071  29 FF 00	| 
	CMP.w #$0002			// $82B074  C9 02 00	| 
	BCC code_82B082			// $82B077  90 09	| 
	LDA.b $80			// $82B079  A5 80	| RAM ADDRESS
	LDX.b $8E			// $82B07B  A6 8E	| RAM ADDRESS
	LDY.b $8C			// $82B07D  A4 8C	| RAM ADDRESS
	JSR code_82AE4F			// $82B07F  20 4F AE	| 
code_82B082:				//			| 
	LDA.b $8E			// $82B082  A5 8E	| RAM ADDRESS
	AND.w #$00FF			// $82B084  29 FF 00	| 
	ASL				// $82B087  0A		| 
	ASL				// $82B088  0A		| 
	ASL				// $82B089  0A		| 
	ASL				// $82B08A  0A		| 
	ORA.b $8F			// $82B08B  05 8F	| RAM ADDRESS
	AND.w #$00FF			// $82B08D  29 FF 00	| 
	ASL				// $82B090  0A		| 
	CLC				// $82B091  18		| 
	ADC.b $80			// $82B092  65 80	| RAM ADDRESS
	STA.b $82			// $82B094  85 82	| RAM ADDRESS
	LDA.b $80			// $82B096  A5 80	| RAM ADDRESS
	AND.w #$00E0			// $82B098  29 E0 00	| 
	BEQ code_82B0AE			// $82B09B  F0 11	| 
	TAX				// $82B09D  AA		| 
	LDY.w #$000F			// $82B09E  A0 0F 00	| 
code_82B0A1:				//			| 
	LDA.l $7E54E0,x			// $82B0A1  BF E0 54 7E	| RAM ADDRESS
	STA.l $7E53E0,x			// $82B0A5  9F E0 53 7E	| RAM ADDRESS
	INX				// $82B0A9  E8		| 
	INX				// $82B0AA  E8		| 
	DEY				// $82B0AB  88		| 
	BPL code_82B0A1			// $82B0AC  10 F3	| 
code_82B0AE:				//			| 
	LDA.b $80			// $82B0AE  A5 80	| RAM ADDRESS
	AND.w #$001E			// $82B0B0  29 1E 00	| 
	BEQ code_82B0CA			// $82B0B3  F0 15	| 
	TAX				// $82B0B5  AA		| 
	LDY.w #$0007			// $82B0B6  A0 07 00	| 
code_82B0B9:				//			| 
	LDA.l $7E54FE,x			// $82B0B9  BF FE 54 7E	| RAM ADDRESS
	STA.l $7E53FE,x			// $82B0BD  9F FE 53 7E	| RAM ADDRESS
	TXA				// $82B0C1  8A		| 
	CLC				// $82B0C2  18		| 
	ADC.w #$0020			// $82B0C3  69 20 00	| 
	TAX				// $82B0C6  AA		| 
	DEY				// $82B0C7  88		| 
	BPL code_82B0B9			// $82B0C8  10 EF	| 
code_82B0CA:				//			| 
	LDA.b $82			// $82B0CA  A5 82	| RAM ADDRESS
	AND.w #$00E0			// $82B0CC  29 E0 00	| 
	BEQ code_82B0E2			// $82B0CF  F0 11	| 
	TAX				// $82B0D1  AA		| 
	LDY.w #$000F			// $82B0D2  A0 0F 00	| 
code_82B0D5:				//			| 
	LDA.l $7E5500,x			// $82B0D5  BF 00 55 7E	| RAM ADDRESS
	STA.l $7E5400,x			// $82B0D9  9F 00 54 7E	| RAM ADDRESS
	INX				// $82B0DD  E8		| 
	INX				// $82B0DE  E8		| 
	DEY				// $82B0DF  88		| 
	BPL code_82B0D5			// $82B0E0  10 F3	| 
code_82B0E2:				//			| 
	LDA.b $82			// $82B0E2  A5 82	| RAM ADDRESS
	AND.w #$001E			// $82B0E4  29 1E 00	| 
	BEQ code_82B0FE			// $82B0E7  F0 15	| 
	TAX				// $82B0E9  AA		| 
	LDY.w #$0007			// $82B0EA  A0 07 00	| 
code_82B0ED:				//			| 
	LDA.l $7E5500,x			// $82B0ED  BF 00 55 7E	| RAM ADDRESS
	STA.l $7E5400,x			// $82B0F1  9F 00 54 7E	| RAM ADDRESS
	TXA				// $82B0F5  8A		| 
	CLC				// $82B0F6  18		| 
	ADC.w #$0020			// $82B0F7  69 20 00	| 
	TAX				// $82B0FA  AA		| 
	DEY				// $82B0FB  88		| 
	BPL code_82B0ED			// $82B0FC  10 EF	| 
code_82B0FE:				//			| 
	JSR code_82AD8F			// $82B0FE  20 8F AD	| 
	REP #$30			// $82B101  C2 30	| 
	LDA.b $8E			// $82B103  A5 8E	| RAM ADDRESS
	BIT.w #$00FF			// $82B105  89 FF 00	| 
	BEQ code_82B112			// $82B108  F0 08	| 
	BIT.w #$FF00			// $82B10A  89 00 FF	| 
	BEQ code_82B112			// $82B10D  F0 03	| 
	JMP code_82B046			// $82B10F  4C 46 B0	| 
code_82B112:				//			| 
	RTS				// $82B112  60		| 


code_82B113:				//======================| scroll menu into view (upwards)
	REP #$30			// $82B113  C2 30	| 
	LDA.w #$00E0			// $82B115  A9 E0 00	| 
	STA.b $80			// $82B118  85 80	| RAM ADDRESS
code_82B11A:				//			| 
	STZ.b $82			// $82B11A  64 82	| RAM ADDRESS
	LDA.b $80			// $82B11C  A5 80	| RAM ADDRESS
	STA.b $84			// $82B11E  85 84	| RAM ADDRESS
code_82B120:				//			| 
	LDA.b $82			// $82B120  A5 82	| RAM ADDRESS
	CLC				// $82B122  18		| 
	ADC.w #$0020			// $82B123  69 20 00	| 
	STA.b $82			// $82B126  85 82	| RAM ADDRESS
	TAX				// $82B128  AA		| 
	LDY.w #$001E			// $82B129  A0 1E 00	| 
code_82B12C:				//			| 
	DEX				// $82B12C  CA		| 
	DEX				// $82B12D  CA		| 
	LDA.l $7E5500,x			// $82B12E  BF 00 55 7E	| RAM ADDRESS
	STA.w $00C0,y			// $82B132  99 C0 00	| RAM ADDRESS
	DEY				// $82B135  88		| 
	DEY				// $82B136  88		| 
	BPL code_82B12C			// $82B137  10 F3	| 
	LDA.b $84			// $82B139  A5 84	| RAM ADDRESS
	CLC				// $82B13B  18		| 
	ADC.w #$0020			// $82B13C  69 20 00	| 
	STA.b $84			// $82B13F  85 84	| RAM ADDRESS
	TAX				// $82B141  AA		| 
	LDY.w #$001E			// $82B142  A0 1E 00	| 
code_82B145:				//			| 
	DEX				// $82B145  CA		| 
	DEX				// $82B146  CA		| 
	LDA.w $00C0,y			// $82B147  B9 C0 00	| RAM ADDRESS
	STA.l $7E5400,x			// $82B14A  9F 00 54 7E	| RAM ADDRESS
	DEY				// $82B14E  88		| 
	DEY				// $82B14F  88		| 
	BPL code_82B145			// $82B150  10 F3	| 
	LDA.b $84			// $82B152  A5 84	| RAM ADDRESS
	CMP.w #$0100			// $82B154  C9 00 01	| 
	BCC code_82B120			// $82B157  90 C7	| 
	JSR code_82AD8F			// $82B159  20 8F AD	| 
	LDA.b $80			// $82B15C  A5 80	| RAM ADDRESS
	SEC				// $82B15E  38		| 
	SBC.w #$0020			// $82B15F  E9 20 00	| 
	STA.b $80			// $82B162  85 80	| RAM ADDRESS
	BPL code_82B11A			// $82B164  10 B4	| 
	RTS				// $82B166  60		| 

code_82B167:				//======================| scroll menu out of view (downwards)
	REP #$30			// $82B167  C2 30	| 
	LDA.w #$0020			// $82B169  A9 20 00	| 
	STA.b $80			// $82B16C  85 80	| RAM ADDRESS
code_82B16E:				//			| 
	LDX.w #$0100			// $82B16E  A2 00 01	| 
	BRA code_82B17D			// $82B171  80 0A	| 
code_82B173:				//			| 
	DEX				// $82B173  CA		| 
	DEX				// $82B174  CA		| 
	LDA.l $7E53E0,x			// $82B175  BF E0 53 7E	| RAM ADDRESS
	STA.l $7E5400,x			// $82B179  9F 00 54 7E	| RAM ADDRESS
code_82B17D:				//			| 
	CPX.b $80			// $82B17D  E4 80	| RAM ADDRESS
	BNE code_82B173			// $82B17F  D0 F2	| 
	LDY.w #$000F			// $82B181  A0 0F 00	| 
code_82B184:				//			| 
	DEX				// $82B184  CA		| 
	DEX				// $82B185  CA		| 
	LDA.l $7E5500,x			// $82B186  BF 00 55 7E	| RAM ADDRESS
	STA.l $7E5400,x			// $82B18A  9F 00 54 7E	| RAM ADDRESS
	DEY				// $82B18E  88		| 
	BPL code_82B184			// $82B18F  10 F3	| 
	JSR code_82AD8F			// $82B191  20 8F AD	| 
	LDA.b $80			// $82B194  A5 80	| RAM ADDRESS
	CLC				// $82B196  18		| 
	ADC.w #$0020			// $82B197  69 20 00	| 
	STA.b $80			// $82B19A  85 80	| RAM ADDRESS
	CMP.w #$0101			// $82B19C  C9 01 01	| 
	BCC code_82B16E			// $82B19F  90 CD	| 
	RTS				// $82B1A1  60		| 


code_82B1A2:				//======================| the text interpreter
	REP #$30			// $82B1A2  C2 30	| 
	LDA.w #$0000			// $82B1A4  A9 00 00	| 
	PHA				// $82B1A7  48		| 
code_82B1A8:				//			| loop
	LDA.w $0000,y			// $82B1A8  B9 00 00	| 
	INY				// $82B1AB  C8		| 
	AND.w #$00FF			// $82B1AC  29 FF 00	| 
	BIT.w #$0080			// $82B1AF  89 80 00	| 
	BNE code_82B1DF			// $82B1B2  D0 2B	| 
	CMP.w #$0001			// $82B1B4  C9 01 00	| 
	BEQ code_82B1D7			// $82B1B7  F0 1E	| 
	CMP.w #$0060			// $82B1B9  C9 60 00	| 
	BCC code_82B1C2			// $82B1BC  90 04	| 
	CLC				// $82B1BE  18		| 
	ADC.w #$0030			// $82B1BF  69 30 00	| 
code_82B1C2:				//			| 
	ORA.b $80			// $82B1C2  05 80	| RAM ADDRESS
	STA.l $7E5400,x			// $82B1C4  9F 00 54 7E	| RAM ADDRESS
	AND.w #$00FF			// $82B1C8  29 FF 00	| 
	CMP.w #$009A			// $82B1CB  C9 9A 00	| 
	BNE code_82B1D7			// $82B1CE  D0 07	| 
	ORA.w #$3C00			// $82B1D0  09 00 3C	| 
	STA.l $7E5400,x			// $82B1D3  9F 00 54 7E	| RAM ADDRESS
code_82B1D7:				//			| 
	INX				// $82B1D7  E8		| 
	INX				// $82B1D8  E8		| 
	BRA code_82B1A8			// $82B1D9  80 CD	| 
code_82B1DB:				//			| 
	PLY				// $82B1DB  7A		| 
	BNE code_82B1A8			// $82B1DC  D0 CA	| 
	RTS				// $82B1DE  60		| 

code_82B1DF:				//			| 
	CMP.w #$00FF			// $82B1DF  C9 FF 00	| 
	BEQ code_82B1DB			// $82B1E2  F0 F7	| 
	CMP.w #$0088			// $82B1E4  C9 88 00	| 
	BCC code_82B236			// $82B1E7  90 4D	| 
	CMP.w #$0090			// $82B1E9  C9 00 90	| 
	BCC code_82B245			// $82B1EC  90 57	| 
	CMP.w #$0098			// $82B1EE  C9 98 00	| 
	BCC code_82B254			// $82B1F1  90 61	| 
	CMP.w #$00A0			// $82B1F3  C9 A0 00	| 
	BCC code_82B261			// $82B1F6  90 69	| 
	CMP.w #$00FE			// $82B1F8  C9 FE 00	| 
	BEQ code_82B21C			// $82B1FB  F0 1F	| 
	CMP.w #$00FD			// $82B1FD  C9 FD 00	| 
	BEQ code_82B228			// $82B200  F0 26	| 
	PHA				// $82B202  48		| 
	AND.w #$0003			// $82B203  29 03 00	| 
	XBA				// $82B206  EB		| 
	ASL				// $82B207  0A		| 
	ASL				// $82B208  0A		| 
	ORA.w #$3000			// $82B209  09 00 30	| 
	STA.b $80			// $82B20C  85 80	| RAM ADDRESS
	PLA				// $82B20E  68		| 
	AND.w #$0004			// $82B20F  29 04 00	| 
	ASL				// $82B212  0A		| 
	ASL				// $82B213  0A		| 
	ASL				// $82B214  0A		| 
	ASL				// $82B215  0A		| 
	XBA				// $82B216  EB		| 
	TSB.b $80			// $82B217  04 80	| RAM ADDRESS
	JMP code_82B1A8			// $82B219  4C A8 B1	| 

code_82B21C:				//			| 
	LDA.w $0000,y			// $82B21C  B9 00 00	| 
	INY				// $82B21F  C8		| 
	AND.w #$00FF			// $82B220  29 FF 00	| 
	ASL				// $82B223  0A		| 
	TAX				// $82B224  AA		| 
	JMP code_82B1A8			// $82B225  4C A8 B1	| 

code_82B228:				//			| 
	TXA				// $82B228  8A		| 
	SEP #$20			// $82B229  E2 20	| 
	CLC				// $82B22B  18		| 
	ADC.b #$20			// $82B22C  69 20	| 
	AND.b #$E0			// $82B22E  29 E0	| 
	REP #$20			// $82B230  C2 20	| 
	TAX				// $82B232  AA		| 
	JMP code_82B1A8			// $82B233  4C A8 B1	| 

code_82B236:				//			| 
	PHX				// $82B236  DA		| 
	AND.w #$0007			// $82B237  29 07 00	| 
	ASL				// $82B23A  0A		| 
	TAX				// $82B23B  AA		| 
	LDA.b $E0,x			// $82B23C  B5 E0	| RAM ADDRESS
	PLX				// $82B23E  FA		| 
	JSR code_82B275			// $82B23F  20 75 B2	| 
	JMP code_82B1A8			// $82B242  4C A8 B1	| 

code_82B245:				//			| 
	PHX				// $82B245  DA		| 
	AND.w #$0007			// $82B246  29 07 00	| 
	ASL				// $82B249  0A		| 
	TAX				// $82B24A  AA		| 
	LDA.b $E0,x			// $82B24B  B5 E0	| RAM ADDRESS
	PLX				// $82B24D  FA		| 
	JSR code_82B2C0			// $82B24E  20 C0 B2	| 
	JMP code_82B1A8			// $82B251  4C A8 B1	| 

code_82B254:				//			| 
	PHY				// $82B254  5A		| 
	AND.w #$0007			// $82B255  29 07 00	| 
	ASL				// $82B258  0A		| 
	CLC				// $82B259  18		| 
	ADC.w #$00E0			// $82B25A  69 E0 00	| 
	TAY				// $82B25D  A8		| 
	JMP code_82B1A8			// $82B25E  4C A8 B1	| 

code_82B261:				//			| 
	PHY				// $82B261  5A		| 
	AND.w #$0007			// $82B262  29 07 00	| 
	ASL				// $82B265  0A		| 
	CLC				// $82B266  18		| 
	TAY				// $82B267  A8		| 
	LDA.w $00E0,y			// $82B268  B9 E0 00	| RAM ADDRESS???
	TAY				// $82B26B  A8		| 
	JMP code_82B1A8			// $82B26C  4C A8 B1	| 

data_82B26F:				//----------------------| 
	db $E8,$03,$64,$00,$0A,$00	// $82B26F		| 

code_82B275:				//			| 
	REP #$30			// $82B275  C2 30	| 
	STA.b $82			// $82B277  85 82	| RAM ADDRESS
	STZ.b $86			// $82B279  64 86	| RAM ADDRESS
	PHY				// $82B27B  5A		| 
	LDY.w #$0000			// $82B27C  A0 00 00	| 
code_82B27F:				//			| 
	LDA.w data_82B26F,y		// $82B27F  B9 6F B2	| 
	STA.b $84			// $82B282  85 84	| RAM ADDRESS
	PHY				// $82B284  5A		| 
	LDA.b $82			// $82B285  A5 82	| RAM ADDRESS
	LDY.w #$FFFF			// $82B287  A0 FF FF	| 
code_82B28A:				//			| 
	INY				// $82B28A  C8		| 
	SEC				// $82B28B  38		| 
	SBC.b $84			// $82B28C  E5 84	| RAM ADDRESS
	BCS code_82B28A			// $82B28E  B0 FA	| 
	CLC				// $82B290  18		| 
	ADC.b $84			// $82B291  65 84	| RAM ADDRESS
	STA.b $82			// $82B293  85 82	| RAM ADDRESS
	TYA				// $82B295  98		| 
	BNE code_82B29C			// $82B296  D0 04	| 
	LDY.b $86			// $82B298  A4 86	| RAM ADDRESS
	BEQ code_82B2A1			// $82B29A  F0 05	| 
code_82B29C:				//			| 
	ORA.w #$0090			// $82B29C  09 90 00	| 
	STY.b $86			// $82B29F  84 86	| RAM ADDRESS
code_82B2A1:				//			| 
	ORA.b $80			// $82B2A1  05 80	| RAM ADDRESS
	STA.l $7E5400,x			// $82B2A3  9F 00 54 7E	| RAM ADDRESS
	INX				// $82B2A7  E8		| 
	INX				// $82B2A8  E8		| 
	PLY				// $82B2A9  7A		| 
	INY				// $82B2AA  C8		| 
	INY				// $82B2AB  C8		| 
	CPY.w #$0006			// $82B2AC  C0 06 00	| 
	BNE code_82B27F			// $82B2AF  D0 CE	| 
	LDA.b $82			// $82B2B1  A5 82	| RAM ADDRESS
	ORA.w #$0090			// $82B2B3  09 90 00	| 
	ORA.b $80			// $82B2B6  05 80	| RAM ADDRESS
	STA.l $7E5400,x			// $82B2B8  9F 00 54 7E	| RAM ADDRESS
	INX				// $82B2BC  E8		| 
	INX				// $82B2BD  E8		| 
	PLY				// $82B2BE  7A		| 
	RTS				// $82B2BF  60		| 

code_82B2C0:				//----------------------| 
	REP #$30			// $82B2C0  C2 30	| 
	PHY				// $82B2C2  5A		| 
	AND.w #$00FF			// $82B2C3  29 FF 00	| 
	LDY.w #$FFFF			// $82B2C6  A0 FF FF	| 
code_82B2C9:				//			| 
	INY				// $82B2C9  C8		| 
	SEC				// $82B2CA  38		| 
	SBC.w #$000A			// $82B2CB  E9 0A 00	| 
	BCS code_82B2C9			// $82B2CE  B0 F9	| 
	ADC.w #$000A			// $82B2D0  69 0A 00	| 
	PHA				// $82B2D3  48		| 
	TYA				// $82B2D4  98		| 
	BEQ code_82B2E0			// $82B2D5  F0 09	| 
	JSR code_82B2EF			// $82B2D7  20 EF B2	| 
	PLA				// $82B2DA  68		| 
	JSR code_82B2EF			// $82B2DB  20 EF B2	| 
	PLY				// $82B2DE  7A		| 
	RTS				// $82B2DF  60		| 

code_82B2E0:				//			| 
	PLA				// $82B2E0  68		| 
	JSR code_82B2EF			// $82B2E1  20 EF B2	| 
	LDA.w #$0000			// $82B2E4  A9 00 00	| 
	STA.l $7E5400,x			// $82B2E7  9F 00 54 7E	| RAM ADDRESS
	INX				// $82B2EB  E8		| 
	INX				// $82B2EC  E8		| 
	PLY				// $82B2ED  7A		| 
	RTS				// $82B2EE  60		| 

code_82B2EF:				//----------------------| 
	ORA.w #$0090			// $82B2EF  09 90 00	| 
	ORA.b $80			// $82B2F2  05 80	| RAM ADDRESS
	STA.l $7E5400,x			// $82B2F4  9F 00 54 7E	| RAM ADDRESS
	INX				// $82B2F8  E8		| 
	INX				// $82B2F9  E8		| 
	RTS				// $82B2FA  60		| 


code_82B2FB:				//----------------------| ? 1st entry point
	REP #$30			// $82B2FB  C2 30	| 
	LDA.w #$B001			// $82B2FD  A9 01 B0	| 
	PHA				// $82B300  48		| 
	BRA code_82B311			// $82B301  80 0E	| 
code_82B303:				//----------------------| ? 2nd entry point
	REP #$30			// $82B303  C2 30	| 
	LDA.w #$A080			// $82B305  A9 80 A0	| 
	PHA				// $82B308  48		| 
	BRA code_82B311			// $82B309  80 06	| 
code_82B30B:				//----------------------| ? 3rd entry point
	REP #$30			// $82B30B  C2 30	| 
	LDA.w #$A081			// $82B30D  A9 81 A0	| 
	PHA				// $82B310  48		| 
code_82B311:				//----------------------| 
	LDA.w $0000,y			// $82B311  B9 00 00	| 
	PHA				// $82B314  48		| 
	LDA.w $0002,y			// $82B315  B9 02 00	| 
	PHA				// $82B318  48		| 
	LDA.w $0004,y			// $82B319  B9 04 00	| 
	PHA				// $82B31C  48		| 
	TYA				// $82B31D  98		| 
	CLC				// $82B31E  18		| 
	ADC.w #$0006			// $82B31F  69 06 00	| 
	PHA				// $82B322  48		| 
	JSR code_82AEF6			// $82B323  20 F6 AE	| 
	PLY				// $82B326  7A		| 
	JSR code_82B1A2			// $82B327  20 A2 B1	| 
	LDA $01,s			// $82B32A  A3 01	| 
	TAY				// $82B32C  A8		| 
	LDA $03,s			// $82B32D  A3 03	| 
	TAX				// $82B32F  AA		| 
	LDA $05,s			// $82B330  A3 05	| 
	JSR code_82AF07			// $82B332  20 07 AF	| 
	LDA $03,s			// $82B335  A3 03	| 
	ASL				// $82B337  0A		| 
	ASL				// $82B338  0A		| 
	ASL				// $82B339  0A		| 
	ASL				// $82B33A  0A		| 
	CLC				// $82B33B  18		| 
	ADC $04,s			// $82B33C  63 04	| 
	AND.w #$00FF			// $82B33E  29 FF 00	| 
	ASL				// $82B341  0A		| 
	CLC				// $82B342  18		| 
	ADC $05,s			// $82B343  63 05	| 
	SEC				// $82B345  38		| 
	SBC.w #$0024			// $82B346  E9 24 00	| 
	TAX				// $82B349  AA		| 
	STZ.b $C0			// $82B34A  64 C0	| RAM ADDRESS
code_82B34C:				//			| 
	INC.b $C0			// $82B34C  E6 C0	| RAM ADDRESS
	LDA.b $C0			// $82B34E  A5 C0	| RAM ADDRESS
	LSR				// $82B350  4A		| 
	LSR				// $82B351  4A		| 
	LSR				// $82B352  4A		| 
	AND.w #$0001			// $82B353  29 01 00	| 
	DEC				// $82B356  3A		| 
	AND.w #$0011			// $82B357  29 11 00	| 
	EOR.w #$008C			// $82B35A  49 8C 00	| 
	ORA $01,s			// $82B35D  03 01	| 
	STA.l $7E5400,x			// $82B35F  9F 00 54 7E	| RAM ADDRESS
	PHX				// $82B363  DA		| 
	JSR code_82AD8F			// $82B364  20 8F AD	| 
	JSR code_82ADD3			// $82B367  20 D3 AD	| 
	PLX				// $82B36A  FA		| 
	TAY				// $82B36B  A8		| 
	AND $07,s			// $82B36C  23 07	| 
	AND.w #$FFFE			// $82B36E  29 FE FF	| 
	BEQ code_82B34C			// $82B371  F0 D9	| 
	LDA $07,s			// $82B373  A3 07	| 
	LSR				// $82B375  4A		| 
	LDA.w #$0018			// $82B376  A9 18 00	| SFX when returning to REPLAY after no files found
	BCC code_82B384			// $82B379  90 09	| 
	TYA				// $82B37B  98		| 
	BIT.w #$A000			// $82B37C  89 00 A0	| 
	BNE code_82B388			// $82B37F  D0 07	| 
	LDA.w #$0019			// $82B381  A9 19 00	| SFX for ???
code_82B384:				//			| 
	JSL code_808968			// $82B384  22 68 89 80	| 
code_82B388:				//			| 
	PHY				// $82B388  5A		| 
	JSR code_82AEF6			// $82B389  20 F6 AE	| 
	LDX.w #$0000			// $82B38C  A2 00 00	| 
	JSR ($0090,x)			// $82B38F  FC 90 00	| INDIRECT RAM ROM JUMP
	PLA				// $82B392  68		| 
	STA.b $80			// $82B393  85 80	| RAM ADDRESS
	PLY				// $82B395  7A		| 
	PLX				// $82B396  FA		| 
	PLA				// $82B397  68		| 
	STA.b $82			// $82B398  85 82	| RAM ADDRESS
	PLA				// $82B39A  68		| 
	LDA.b $80			// $82B39B  A5 80	| RAM ADDRESS
	PHA				// $82B39D  48		| 
	LDA.b $82			// $82B39E  A5 82	| RAM ADDRESS
	JSR code_82B03E			// $82B3A0  20 3E B0	| 
	PLA				// $82B3A3  68		| 
	RTS				// $82B3A4  60		| 


code_82B3A5:				//----------------------| 
	PHX				// $82B3A5  DA		| 
	LDA.l $7EAFFE			// $82B3A6  AF FE AF 7E	| RAM ADDRESS
	INC				// $82B3AA  1A		| 
	INC				// $82B3AB  1A		| 
	AND.w #$07FE			// $82B3AC  29 FE 07	| 
	TAX				// $82B3AF  AA		| 
	LDA.l $7EB000,x			// $82B3B0  BF 00 B0 7E	| RAM ADDRESS
	INC				// $82B3B4  1A		| 
	BEQ code_82B3C2			// $82B3B5  F0 0B	| 
	LDA.l $7EAFFC			// $82B3B7  AF FC AF 7E	| RAM ADDRESS
	SEC				// $82B3BB  38		| 
	SBC.l $7EB000,x			// $82B3BC  FF 00 B0 7E	| RAM ADDRESS
	BRA code_82B3CF			// $82B3C0  80 0D	| 
code_82B3C2:				//			| 
	LDA.l $7EAFFC			// $82B3C2  AF FC AF 7E	| RAM ADDRESS
	SEC				// $82B3C6  38		| 
	SBC.l $7EAFFE			// $82B3C7  EF FE AF 7E	| RAM ADDRESS
	SEC				// $82B3CB  38		| 
	SBC.w #$0006			// $82B3CC  E9 06 00	| 
code_82B3CF:				//			| 
	AND.w #$07FF			// $82B3CF  29 FF 07	| 
	PLX				// $82B3D2  FA		| 
	STA.b $E0			// $82B3D3  85 E0	| RAM ADDRESS
	LDY.w #data_82BDC3		// $82B3D5  A9 C3 BD	| 
	JMP code_82B1A2			// $82B3D8  4C A2 B1	| 


code_82B3DB:				//----------------------| 
	LDA.w #$0800			// $82B3DB  A9 00 08	| 
	SEC				// $82B3DE  38		| 
	SBC.w $0270			// $82B3DF  ED 70 02	| RAM ADDRESS
	STA.b $E0			// $82B3E2  85 E0	| RAM ADDRESS
	LDY.w #data_82BDC3		// $82B3E4  A0 C3 BD	| 
	JMP code_82B1A2			// $82B3E7  4C A2 B1	| 


code_82B3EA:				//----------------------| 
	REP #$30			// $82B3EA  C2 30	| 
	LDA.w #$0042			// $82B3EC  A9 42 00	| 
	STA.b $D8			// $82B3EF  85 D8	| RAM ADDRESS
	LDA.w #$0005			// $82B3F1  A9 05 00	| 
	STA.b $DA			// $82B3F4  85 DA	| RAM ADDRESS
	STZ.b $DC			// $82B3F6  64 DC	| RAM ADDRESS
code_82B3F8:				//----------------------| handles REPLAY menu player input
	STZ.b $E0			// $82B3F8  64 E0	| RAM ADDRESS
	LDA.b $D2			// $82B3FA  A5 D2	| RAM ADDRESS
	LDX.w #$0000			// $82B3FC  A2 00 00	| 
	LDY.b $94			// $82B3FF  A4 94	| RAM ADDRESS
	JSR code_82B4B8			// $82B401  20 B8 B4	| 
code_82B404:				//			| 
	REP #$30			// $82B404  C2 30	| 
	INC.b $E0			// $82B406  E6 E0	| RAM ADDRESS
	JSR code_82B49C			// $82B408  20 9C B4	| 
	LDA.b $E0			// $82B40B  A5 E0	| RAM ADDRESS
	LSR				// $82B40D  4A		| 
	LSR				// $82B40E  4A		| 
	LSR				// $82B40F  4A		| 
	AND.w #$0001			// $82B410  29 01 00	| 
	DEC				// $82B413  3A		| 
	AND.w #$3040			// $82B414  29 40 30	| 
	STA.l $7E5400,x			// $82B417  9F 00 54 7E	| RAM ADDRESS
	JSR code_82AD8F			// $82B41B  20 8F AD	| 
	JSR code_82B49C			// $82B41E  20 9C B4	| 
	LDA.w #$0000			// $82B421  A9 00 00	| 
	STA.l $7E5400,x			// $82B424  9F 00 54 7E	| RAM ADDRESS
	JSR code_82ADD3			// $82B428  20 D3 AD	| 
	LDY.w #$0000			// $82B42B  A0 00 00	| 
	BIT.w #$0800			// $82B42E  89 00 08	| 
	BEQ code_82B436			// $82B431  F0 03	| 
	LDY.w #$FFFF			// $82B433  A0 FF FF	| 
code_82B436:				//			| 
	BIT.w #$0400			// $82B436  89 00 04	| 
	BEQ code_82B43E			// $82B439  F0 03	| 
	LDY.w #$0001			// $82B43B  A0 01 00	| 
code_82B43E:				//			| 
	TYA				// $82B43E  98		| 
	CLC				// $82B43F  18		| 
	ADC.b $D0			// $82B440  65 D0	| RAM ADDRESS
	CMP.b $D4			// $82B442  C5 D4	| RAM ADDRESS
	BCC code_82B44F			// $82B444  90 09	| 
	ASL				// $82B446  0A		| 
	LDA.w #$0000			// $82B447  A9 00 00	| 
	BCS code_82B44F			// $82B44A  B0 03	| 
	LDA.b $D4			// $82B44C  A5 D4	| RAM ADDRESS
	DEC				// $82B44E  3A		| 
code_82B44F:				//			| 
	CMP.b $D0			// $82B44F  C5 D0	| RAM ADDRESS
	BEQ code_82B460			// $82B451  F0 0D	| 
	STA.b $D0			// $82B453  85 D0	| RAM ADDRESS
	STZ.b $E0			// $82B455  64 E0	| RAM ADDRESS
	LDA.w #$0018			// $82B457  A9 18 00	| SFX for moving up/down in REPLAY menu
	JSL code_808968			// $82B45A  22 68 89 80	| 
	LDA.b $D0			// $82B45E  A5 D0	| RAM ADDRESS
code_82B460:				//			| 
	SEC				// $82B460  38		| 
	SBC.b $D2			// $82B461  E5 D2	| RAM ADDRESS
	CMP.b $DA			// $82B463  C5 DA	| RAM ADDRESS
	BCC code_82B479			// $82B465  90 12	| 
	ASL				// $82B467  0A		| 
	LDA.b $D2			// $82B468  A5 D2	| RAM ADDRESS
	BCS code_82B46E			// $82B46A  B0 02	| 
	INC				// $82B46C  1A		| 
	INC				// $82B46D  1A		| 
code_82B46E:				//			| 
	DEC				// $82B46E  3A		| 
	STA.b $D2			// $82B46F  85 D2	| RAM ADDRESS
	LDX.w #$0000			// $82B471  A2 00 00	| 
	LDY.b $94			// $82B474  A4 94	| RAM ADDRESS
	JSR code_82B4B8			// $82B476  20 B8 B4	| 
code_82B479:				//			| 
	JSR code_82ADD3			// $82B479  20 D3 AD	| 
	BIT.w #$A080			// $82B47C  89 80 A0	| 
	BEQ code_82B404			// $82B47F  F0 83	| 
	LDY.b $D0			// $82B481  A4 D0	| RAM ADDRESS
	BIT.w #$A000			// $82B483  89 00 A0	| 
	BEQ code_82B48D			// $82B486  F0 05	| 
	LDY.w #$FFFF			// $82B488  A0 FF FF	| 
	BRA code_82B494			// $82B48B  80 07	| 
code_82B48D:				//			| 
	LDA.w #$0019			// $82B48D  A9 19 00	| SFX for selecting an item on REPLAY menu
	JSL code_808968			// $82B490  22 68 89 80	| 
code_82B494:				//			| 
	LDA.b $D1			// $82B494  A5 D1	| RAM ADDRESS
	AND.w #$FF00			// $82B496  29 00 FF	| 
	ORA.b $D0			// $82B499  05 D0	| RAM ADDRESS
	RTS				// $82B49B  60		| 


code_82B49C:				//----------------------| 
	LDA.b $D0			// $82B49C  A5 D0	| RAM ADDRESS
	SEC				// $82B49E  38		| 
	SBC.b $D2			// $82B49F  E5 D2	| RAM ADDRESS
	XBA				// $82B4A1  EB		| 
	LSR				// $82B4A2  4A		| 
	LSR				// $82B4A3  4A		| 
	LSR				// $82B4A4  4A		| 
	CLC				// $82B4A5  18		| 
	ADC.b $D8			// $82B4A6  65 D8	| RAM ADDRESS
	TAX				// $82B4A8  AA		| 
	RTS				// $82B4A9  60		| 


code_82B4AA:				//----------------------| 
	REP #$30			// $82B4AA  C2 30	| 
	LDA.w #$0042			// $82B4AC  A9 42 00	| 
	STA.b $D8			// $82B4AF  85 D8	| RAM ADDRESS
	LDA.w #$0005			// $82B4B1  A9 05 00	| 
	STA.b $DA			// $82B4B4  85 DA	| RAM ADDRESS
	STZ.b $DC			// $82B4B6  64 DC	| RAM ADDRESS

code_82B4B8:				//----------------------| draw blinking up/down cursors?
	STY.b $92			// $82B4B8  84 92	| RAM ADDRESS
	TXA				// $82B4BA  8A		| 
	AND.w #$0100			// $82B4BB  29 00 01	| 
	ORA.b $D8			// $82B4BE  05 D8	| RAM ADDRESS
	INC				// $82B4C0  1A		| 
	INC				// $82B4C1  1A		| 
	PHA				// $82B4C2  48		| 
	LDA.b $DC			// $82B4C3  A5 DC	| RAM ADDRESS
	BNE code_82B4FF			// $82B4C5  D0 38	| 
	PHX				// $82B4C7  DA		| 
	TXA				// $82B4C8  8A		| 
	CLC				// $82B4C9  18		| 
	ADC.b $D8			// $82B4CA  65 D8	| RAM ADDRESS
	TAX				// $82B4CC  AA		| 
	LDA.b $D2			// $82B4CD  A5 D2	| 
	BEQ code_82B4D4			// $82B4CF  F0 03	| 
	LDA.w #$309C			// $82B4D1  A9 9C 30	| 
code_82B4D4:				//			| 
	STA.l $7E53E0,x			// $82B4D4  9F E0 53 7E	| RAM ADDRESS
	PLX				// $82B4D8  FA		| 
	LDA.b $DA			// $82B4D9  A5 DA	| RAM ADDRESS
	XBA				// $82B4DB  EB		| 
	LSR				// $82B4DC  4A		| 
	LSR				// $82B4DD  4A		| 
	LSR				// $82B4DE  4A		| 
	CLC				// $82B4DF  18		| 
	ADC.b $D8			// $82B4E0  65 D8	| RAM ADDRESS
	STA.b $80			// $82B4E2  85 80	| RAM ADDRESS
	TXA				// $82B4E4  8A		| 
	CLC				// $82B4E5  18		| 
	ADC.b $80			// $82B4E6  65 80	| RAM ADDRESS
	TAX				// $82B4E8  AA		| 
	LDA.b $D4			// $82B4E9  A5 D4	| RAM ADDRESS
	SEC				// $82B4EB  38		| 
	SBC.b $D2			// $82B4EC  E5 D2	| RAM ADDRESS
	LDY.w #$308C			// $82B4EE  A0 8C 30	| 
	CMP.b $DA			// $82B4F1  C5 DA	| RAM ADDRESS
	BEQ code_82B4FA			// $82B4F3  F0 05	| 
	BCC code_82B4FA			// $82B4F5  90 03	| 
	LDY.w #$309D			// $82B4F7  A0 9D 30	| 
code_82B4FA:				//			| 
	TYA				// $82B4FA  98		| 
	STA.l $7E5400,x			// $82B4FB  9F 00 54 7E	| RAM ADDRESS
code_82B4FF:				//			| 
	PLX				// $82B4FF  FA		| 
	LDA.b $D2			// $82B500  A5 D2	| RAM ADDRESS
	AND.w #$00FF			// $82B502  29 FF 00	| 
	LDY.b $DA			// $82B505  A4 DA	| RAM ADDRESS
code_82B507:				//			| 
	PHA				// $82B507  48		| 
	PHY				// $82B508  5A		| 
	PHX				// $82B509  DA		| 
	CMP.b $D4			// $82B50A  C5 D4	| RAM ADDRESS
	BCS code_82B515			// $82B50C  B0 07	| 
	LDY.w #code_82B518-1		// $82B50E  A0 17 B5	| 
	PHY				// $82B511  5A		| 
	JMP ($0092)			// $82B512  6C 92 00	| 

code_82B515:				//			| 
	LDY.w #data_82BDCE		// $82B515  A0 CE BD	| 
code_82B518:				//			| 
	LDA $01,s			// $82B518  A3 01	| 
	TAX				// $82B51A  AA		| 
	JSR code_82B1A2			// $82B51B  20 A2 B1	| 
	PLA				// $82B51E  68		| 
	CLC				// $82B51F  18		| 
	ADC.w #$0020			// $82B520  69 20 00	| 
	TAX				// $82B523  AA		| 
	PLY				// $82B524  7A		| 
	PLA				// $82B525  68		| 
	INC				// $82B526  1A		| 
	DEY				// $82B527  88		| 
	BNE code_82B507			// $82B528  D0 DD	| 
	RTS				// $82B52A  60		| 


code_82B52B:				//----------------------| 
	REP #$30			// $82B52B  C2 30	| 
	PHA				// $82B52D  48		| 
	AND.w #$00FF			// $82B52E  29 FF 00	| 
	STA.b $D0			// $82B531  85 D0	| RAM ADDRESS
	PLA				// $82B533  68		| 
	XBA				// $82B534  EB		| 
	AND.w #$00FF			// $82B535  29 FF 00	| 
	STA.b $D2			// $82B538  85 D2	| RAM ADDRESS
	STY.b $D4			// $82B53A  84 D4	| RAM ADDRESS
	RTS				// $82B53C  60		| 

code_82B53D:				//----------------------| 
	REP #$30			// $82B53D  C2 30	| 
	JSR code_82B58A			// $82B53F  20 8A B5	| 
	LDX.w #$1006			// $82B542  A2 06 10	| width.height of REPLAY border in levels
	LDY.w #$1000			// $82B545  A0 00 10	| 
	LDA.l $7E560A			// $82B548  AF 0A 56 7E	| RAM ADDRESS
	BPL code_82B551			// $82B54C  10 03	| 
	LDX.w #$1007			// $82B54E  A2 07 10	| width.height of REPLAY border in titlescreen
code_82B551:				//			| 
	LDA.w #$0120			// $82B551  A9 20 01	| 
	JSR code_82AE4F			// $82B554  20 4F AE	| draw border in buffer
	LDY.w #data_82BD90		// $82B557  A0 90 BD	|\ overlay "REPLAY"
	JSR code_82B1A2			// $82B55A  20 A2 B1	|/ 
	LDX.w #$0100			// $82B55D  A2 00 01	| 
	LDY.w #code_82B566		// $82B560  A0 66 B5	| 
	JMP code_82B4B8			// $82B563  4C B8 B4	| 

code_82B566:				//			| 
	ASL				// $82B566  0A		| 
	TAY				// $82B567  A8		| 
	LDA.l $7E560A			// $82B568  AF 0A 56 7E	| RAM ADDRESS
	BMI code_82B573			// $82B56C  30 05	| 
	LDA.w data_82B578,y		// $82B56E  B9 78 B5	| 
	TAY				// $82B571  A8		| 
	RTS				// $82B572  60		| 

code_82B573:				//			| 
	LDA.w data_82B580,y		// $82B573  B9 80 B5	| 
	TAY				// $82B576  A8		| 
	RTS				// $82B577  60		| 

data_82B578:				//^^^^^^^^^^^^^^^^^^^^^^| items in REPLAY menu for levels
	dw data_82BDDD			// $82B578  DD BD	| 戻る
	dw data_82BDEC			// $82B57A  EC BD	| セーブする
	dw data_82BDFB			// $82B57C  FB BD	| 名前を変える
	dw data_82BE0A			// $82B57E  0A BE	| ファイルを消す

data_82B580:				//^^^^^^^^^^^^^^^^^^^^^^| items in REPLAY menu for title screen
	dw data_82BDDD			// $82B580  DD BD	| 戻る
	dw data_82BE19			// $82B582  19 BE	| 再生する
	dw data_82BDEC			// $82B584  EC BD	| セーブする
	dw data_82BDFB			// $82B586  FB BD	| 名前を変える
	dw data_82BE0A			// $82B588  0A BE	| ファイルを消す


code_82B58A:				//----------------------| 
	REP #$30			// $82B58A  C2 30	| 
	LDA.w #$0042			// $82B58C  A9 42 00	| 
	STA.b $D8			// $82B58F  85 D8	| RAM ADDRESS
	LDA.l $7E560A			// $82B591  AF 0A 56 7E	| RAM ADDRESS
	AND.w #$7FFF			// $82B595  29 FF 7F	| 
	TAY				// $82B598  A8		| 
	STY.b $DA			// $82B599  84 DA	| RAM ADDRESS
	LDA.w #$FFFF			// $82B59B  A9 FF FF	| 
	STA.b $DC			// $82B59E  85 DC	| RAM ADDRESS
	LDA.l $7E5600			// $82B5A0  AF 00 56 7E	| RAM ADDRESS
	JMP code_82B52B			// $82B5A4  4C 2B B5	| 

code_82B5A7:				//----------------------| 
	REP #$30			// $82B5A7  C2 30	| 
	JSR code_82B53D			// $82B5A9  20 3D B5	| 
	JSR code_82B113			// $82B5AC  20 13 B1	| 
code_82B5AF:				//			| 
	JSR code_82B58A			// $82B5AF  20 8A B5	| 
	LDA.w #code_82B566		// $82B5B2  A9 66 B5	| 
	STA.b $94			// $82B5B5  85 94	| RAM ADDRESS
	JSR code_82B3F8			// $82B5B7  20 F8 B3	| 
	STA.l $7E5600			// $82B5BA  8F 00 56 7E	| RAM ADDRESS
	TYA				// $82B5BE  98		| 
	BMI code_82B5DA			// $82B5BF  30 19	| 
	BEQ code_82B5DA			// $82B5C1  F0 17	| 
	ASL				// $82B5C3  0A		| 
	TAX				// $82B5C4  AA		| 
	LDA.l $7E560A			// $82B5C5  AF 0A 56 7E	| RAM ADDRESS
	BMI code_82B5D0			// $82B5C9  30 05	| 
	JSR (ptrs_82B5E0-2,x)		// $82B5CB  FC DE B5	| 
	BRA code_82B5AF			// $82B5CE  80 DF	| 
code_82B5D0:				//			| 
	JSR (ptrs_82B5E6-2,x)		// $82B5D0  FC DE B5	| 
	LDA.l $7E560C			// $82B5D3  AF 0C 56 7E	| RAM ADDRESS
	BPL code_82B5AF			// $82B5D7  10 D6	| 
	RTS				// $82B5D9  60		| 
code_82B5DA:				//			| exit REPLAY menu
	JSR code_82AEF6			// $82B5DA  20 F6 AE	| 
	JMP code_82B167			// $82B5DD  4C 67 B1	| 


ptrs_82B5E0:				//^^^^^^^^^^^^^^^^^^^^^^| in-level REPLAY routines
	dw code_82BB1D			// $82B5E0  1D BB	| セーブする
	dw code_82BC35			// $82B5E2  35 BC	| 名前を変える
	dw code_82BD12			// $82B5E4  12 BD	| ファイルを消す

ptrs_82B5E6:				//^^^^^^^^^^^^^^^^^^^^^^| title screen REPLAY routines
	dw code_82BA76			// $82B5E6  76 BA	| 再生する
	dw code_82BB1D			// $82B5E8  1D BB	| セーブする
	dw code_82BC35			// $82B5EA  35 BC	| 名前を変える
	dw code_82BD12			// $82B5EC  12 BD	| ファイルを消す









code_82B635:				//----------------------| 





code_82B675:				//----------------------| 
	REP #$30			// $82B675  C2 30	| 
	JSR code_82AEF6			// $82B677  20 F6 AE	| 
	JSR code_82B6F7			// $82B67A  20 F7 B6	| 
	LDA.w #$0100			// $82B67D  A9 00 01	| 
	LDX.w #$1008			// $82B680  A2 08 10	| 
	LDY.w #$1000			// $82B683  A0 00 10	| 
	JSR code_82AE4F			// $82B686  20 4F AE	| draw border
	LDY.w #data_82BD9A		// $82B689  A0 9A BD	| 
	JSR code_82B1A2			// $82B68C  20 A2 B1	| 
	LDX.w #$0124			// $82B68F  A2 24 01	| 
	JSR code_82B3A5			// $82B692  20 A5 B3	| 
	LDX.w #$0100			// $82B695  A2 00 01	| 
	LDY.w #code_82B6A2		// $82B698  A0 A2 B6	| 
	JMP code_82B4AA			// $82B69B  4C AA B4	| 


code_82B69E:				//----------------------| 
	LDY.w #data_82BDDD		// $82B69E  A0 DD BD	| 
	RTS				// $82B6A1  60		| 
code_82B6A2:				//----------------------| 
	DEC				// $82B6A2  3A		| 
	BMI code_82B69E			// $82B6A3  30 F9	| 
code_82B6A5:				//----------------------| 		
	JSR code_82C366			// $82B6A5  20 66 C3	| 
	LDA.b $84			// $82B6A8  A5 84	| RAM ADDRESS
	BMI code_82B6BC			// $82B6AA  30 10	| 
	LDA.b $82			// $82B6AC  A5 82	| RAM ADDRESS
	CLC				// $82B6AE  18		| 
	ADC.w #$0008			// $82B6AF  69 08 00	| 
	STA.b $E2			// $82B6B2  85 E2	| RAM ADDRESS
	JSR code_82B6C0			// $82B6B4  20 C0 B6	| 
	LDA.w data_82B6E7,y		// $82B6B7  B9 E7 B6	| 
	TAY				// $82B6BA  A8		| 
	RTS				// $82B6BB  60		| 
code_82B6BC:				//			| 
	LDY.w #data_82BE37		// $82B6BC  A0 37 BE	| 
	RTS				// $82B6BF  60		| 


code_82B6C0:				//----------------------| 
	LDA.b $84			// $82B6C0  A5 84	| RAM ADDRESS
	AND.w #$00FF			// $82B6C2  29 FF 00	| 
	JSL code_8090A2			// $82B6C5  22 A2 90 80	| 
	STA.b $E0			// $82B6C9  85 E0	| RAM ADDRESS
	LDA.b $84			// $82B6CB  A5 84	| RAM ADDRESS
	LDX.w #$0003			// $82B6CD  A2 03 00	| 
	JSL code_809089			// $82B6D0  22 89 90 80	| 
	AND.w #$0004			// $82B6D4  29 04 00	| 
	ASL				// $82B6D7  0A		| 
	PHA				// $82B6D8  48		| 
	LDA.b $85			// $82B6D9  A5 85	| RAM ADDRESS
	AND.w #$0060			// $82B6DB  29 60 00	| 
	LSR				// $82B6DE  4A		| 
	LSR				// $82B6DF  4A		| 
	LSR				// $82B6E0  4A		| 
	LSR				// $82B6E1  4A		| 
	ORA $01,s			// $82B6E2  03 01	| 
	PLY				// $82B6E4  7A		| 
	TAY				// $82B6E5  A8		| 
	RTS				// $82B6E6  60		| 


data_82B6E7:				//----------------------| these are all "FIELD blabla" texts of sorts
	dw data_82BE46			// $82B6E7  46 BE	| 
	dw data_82BE78			// $82B6E9  78 BE	| 
	dw data_82BE53			// $82B6EB  53 BE	| 
	dw data_82BE78			// $82B6ED  78 BE	| 
	dw data_82BE5F			// $82B6EF  5F BE	| 
	dw data_82BE85			// $82B6F1  85 BE	| 
	dw data_82BE6C			// $82B6F3  6C BE	| 
	dw data_82BE85			// $82B6F5  85 BE	| 


code_82B6F7:				//----------------------| 
	REP #$20			// $82B6F7  C2 30	| 
	LDA.l $7E5602			// $82B6F9  AF 02 56 7E	| RAM ADDRESS
	LDY.w $0274			// $82B6FD  AC 74 02	| RAM ADDRESS
	INY				// $82B700  C8		| 
	JMP code_82B52B			// $82B701  4C 2B B5	| 


code_82B704:				//----------------------| 
	REP #$30			// $82B704  C2 30	| 
	LDA.w #$0000			// $82B706  A9 00 00	| 
	STA.l $7E5602			// $82B709  8F 02 56 7E	| RAM ADDRESS
	LDA.l $7E5608			// $82B70D  AF 08 56 7E	| RAM ADDRESS
	AND.w #$BFFF			// $82B711  29 FF BF	| 
	STA.l $7E5608			// $82B714  8F 08 56 7E	| RAM ADDRESS
	JSR code_82B675			// $82B718  20 75 B6	| 
	JMP code_82B113			// $82B71B  4C 13 B1	| 


code_82B71E:				//----------------------| 
	JSR code_82B6F7			// $82B71E  20 F7 B6	| 
	LDA.w #code_82B6A2		// $82B721  A9 A2 B6	| 
	STA.b $94			// $82B724  85 94	| RAM ADDRESS
	JSR code_82B3EA			// $82B726  20 EA B3	| 
	STA.l $7E5602			// $82B729  8F 02 56 7E	| RAM ADDRESS
	DEY				// $82B72D  88		| 
	TYA				// $82B72E  TYA		| 
	RTS				// $82B72F  RTS		| 


code_82B730:				//----------------------| 
	REP #$30			// $82B730  C2 30	| 
	JSR code_82AEF6			// $82B732  20 F6 AE	| 
	JSR code_82B7C4			// $82B735  20 C4 B7	| 
	LDA.w #$0100			// $82B738  A9 00 01	| 
	LDX.w #$1008			// $82B73B  A2 08 10	| 
	LDY.w #$1000			// $82B73E  A0 00 10	| 
	JSR code_82AE4F			// $82B741  20 4F AE	| draw border
	LDY.w #data_82BDA4		// $82B744  A0 A4 BD	| 
	JSR code_82B1A2			// $82B747  20 A2 B1	| 
	LDX.w #$0124			// $82B74A  A2 24 01	| 
	JSR code_82B3DB			// $82B74D  20 DB B3	| 
	LDX.w #$0100			// $82B750  A2 00 01	| 
	LDY.w #code_82B76B		// $82B753  A0 6B B7	| 
	JMP code_82B4AA			// $82B756  4C AA B4	| 


code_82B759:				//----------------------| 
	LDY.w #data_82BDDD		// $82B759  A0 DD BD	| 
	RTS				// $82B75C  60		| 
code_82B75D:				//			| 
	LDA.l $7E5608			// $82B75D  AF 08 56 7E	| RAM ADDRESS
	BMI code_82B767			// $82B761  30 04	| 
	LDY.w #data_82BE92		// $82B763  A0 92 BE	| 
	RTS				// $82B766  60		| 
code_82B767:				//			| 
	LDY.w #data_82BEA2		// $82B767  A0 A2 BE	| 
	RTS				// $82B76A  60		| 
code_82B76B:				//----------------------| 
	DEC				// $82B76B  3A		| 
	BMI code_82B759			// $82B76C  30 EB	| 
	DEC				// $82B76E  3A		| 
	BMI code_82B75D			// $82B76F  30 EC	| 
	JSR code_82C73E			// $82B771  20 3E C7	| 
	LDX.b $80			// $82B774  A6 80	| RAM ADDRESS
	LDA.l $700004,x			// $82B776  BF 04 00 70	| SAVEADDR
	STA.b $E4			// $82B77A  85 E4	| RAM ADDRESS
	LDA.l $700006,x			// $82B77C  BF 06 00 70	| SAVEADDR
	STA.b $E6			// $82B780  85 E6	| RAM ADDRESS
	LDA.l $700008,x			// $82B782  BF 08 00 70	| SAVEADDR
	STA.b $E8			// $82B786  85 E8	| RAM ADDRESS
	LDA.l $70000A,x			// $82B788  BF 0A 00 70	| SAVEADDR
	STA.b $EA			// $82B78C  85 EA	| RAM ADDRESS
	LDA.w #$FFFF			// $82B78E  A9 FF FF	| 
	STA.b $EC			// $82B791  85 EC	| RAM ADDRESS
code_82B793:				//----------------------| 
	LDA.l $7E5608			// $82B793  AF 08 56 7E	| RAM ADDRESS
	AND.w #$C000			// $82B797  29 00 C0	| 
	CMP.w #$C000			// $82B79A  C9 00 C0	| 
	LDA.b $82			// $82B79D  A5 82	| RAM ADDRESS
	BCC code_82B7AA			// $82B79F  90 09	| 
	LDA.b $84			// $82B7A1  A5 84	| RAM ADDRESS
	AND.w #$00FF			// $82B7A3  29 FF 00	| 
	JSL code_8090A2			// $82B7A6  22 A2 90 80	| 
code_82B7AA:				//			| 
	STA.b $E2			// $82B7AA  85 E2	| RAM ADDRESS
	JSR code_82B6C0			// $82B7AC  20 C0 B6	| 
	LDA.w data_82B7B4,y		// $82B7AF  B9 B4 B7	| 
	TAY				// $82B7B2  A8		| 
	RTS				// $82B7B3  60		| 

data_82B7B4:				//^^^^^^^^^^^^^^^^^^^^^^| 
	dw data_82BEB2			// $82B7B4  B2 BE	| 
	dw data_82BECC			// $82B7B6  CC BE	| 
	dw data_82BEB9			// $82B7B8  B9 BE	| 
	dw data_82BECC			// $82B7BA  CC BE	| 
	dw data_82BEBF			// $82B7BC  BF BE	| 
	dw data_82BED3			// $82B7BE  D3 BE	| 
	dw data_82BEC6			// $82B7C0  C6 BE	| 
	dw data_82BED3			// $82B7C2  D3 BE	| 


code_82B7C4:				//----------------------| 
	REP #$30			// $82B7C4  C2 30	| 
	LDA.l $7E5604			// $82B7C6  AF 04 56 7E	| RAM ADDRESS
	LDY.w $0272			// $82B7CA  AC 72 02	| RAM ADDRESS
	INY				// $82B7CD  C8		| 
	INY				// $82B7CE  C8		| 
	JMP code_82B52B			// $82B7CF  4C 2B B5	| 


code_82B7D2:				//----------------------| 
	REP #$30			// $82B7D2  C2 30	| 
	LDA.w #$0000			// $82B7D4  A9 00 00	| 
	STA.l $7E5604			// $82B7D7  8F 04 56 7E	| RAM ADDRESS
	LDA.l $7E5608			// $82B7DB  AF 08 56 7E	| RAM ADDRESS
	ORA.w #$4000			// $82B7DF  09 00 40	| 
	STA.l $7E5608			// $82B7E2  8F 08 56 7E	| RAM ADDRESS
	JSR code_82B730			// $82B7E6  20 30 B7	| 
	JMP code_82B113			// $82B7E9  4C 13 B1	| 

code_82B7EC:				//----------------------| 
	JSR code_82B7C4			// $82B7EC  20 C4 B7	| 
	LDA.w #code_82B76B		// $82B7EF  A9 6B B7	| 
	STA.b $94			// $82B7F2  85 94	| RAM ADDRESS
	JSR code_82B3EA			// $82B7F4  20 EA B3	| 
	STA.l $7E5604			// $82B7F7  8F 04 56 7E	| RAM ADDRESS
	DEY				// $82B7FB  88		| 
	BEQ code_82B801			// $82B7FC  F0 03	| 
	DEY				// $82B7FE  88		| 
	TYA				// $82B7FF  98		| 
	RTS				// $82B800  60		| 

code_82B801:				//			| 
	LDA.l $7E5608			// $82B801  AF 08 56 7E	| RAM ADDRESS
	EOR.w #$8000			// $82B805  49 00 80	| 
	STA.l $7E5608			// $82B808  8F 08 56 7E	| RAM ADDRESS
	LDX.w #$0000			// $82B80C  A2 00 00	| 
	LDY.w #code_82B76B		// $82B80F  A0 6B B7	| 
	JSR code_82B4AA			// $82B812  20 AA B4	| 
	BRA code_82B7EC			// $82B815  80 D5	| 


code_82B817:				//----------------------| 
	REP #$30			// $82B817  C2 30	| 
	PHX				// $82B819  DA		| 
	LDA.l $7E5700			// $82B81A  AF 00 57 7E	| RAM ADDRESS
	STA.b $E4			// $82B81E  85 E4	| RAM ADDRESS
	LDA.l $7E5702			// $82B820  AF 02 57 7E	| RAM ADDRESS
	STA.b $E6			// $82B824  85 E6	| RAM ADDRESS
	LDA.l $7E5704			// $82B826  AF 04 57 7E	| RAM ADDRESS
	STA.b $E8			// $82B82A  85 E8	| RAM ADDRESS
	LDA.l $7E5706			// $82B82C  AF 06 57 7E	| RAM ADDRESS
	STA.b $EA			// $82B830  85 EA	| RAM ADDRESS
	LDA.w #$FFFF			// $82B832  A9 FF FF	| 
	STA.b $EC			// $82B835  85 EC	| RAM ADDRESS
	LDA.l $7E5708			// $82B837  AF 08 57 7E	| RAM ADDRESS
	STA.b $82			// $82B83B  85 82	| RAM ADDRESS
	LDA.l $7E570A			// $82B83D  AF 0A 57 7E	| RAM ADDRESS
	STA.b $84			// $82B841  85 84	| RAM ADDRESS
	JSR code_82B793			// $82B843  20 93 B7	| 
	PLX				// $82B846  FA		| 
	JMP code_82B1A2			// $82B847  4C A2 B1	| draw text


code_82B84A:				//----------------------| name entry thingy (load it?)
	REP #$30			// $82B84A  C2 30	| 
	JSR code_82AEF6			// $82B84C  20 F6 AE	| 
	JSR code_82B8BA			// $82B84F  20 BA B8	| 
	LDA.w #$0100			// $82B852  A9 00 01	| 
	LDX.w #$1008			// $82B855  A2 08 10	| 
	LDY.w #$1000			// $82B858  A0 00 10	| 
	JSR code_82AE4F			// $82B85B  20 4F AE	| draw border
	LDY.w #data_82BDAC		// $82B85E  A0 AC BD	| 
	JSR code_82B1A2			// $82B861  20 A2 B1	| draw text
	LDX.w #$0124			// $82B864  A2 24 01	| 
	JSR code_82B817			// $82B867  20 17 B8	| 
	LDX.w #$0142			// $82B86A  A2 42 01	| 
code_82B86D:				//----------------------| 
	PHX				// $82B86D  DA		| 
	LDA.b $D4			// $82B86E  A5 D4	| RAM ADDRESS
	LDY.w #$0005			// $82B870  A0 05 00	| 
code_82B873:				//			| 
	PHA				// $82B873  48		| 
	PHY				// $82B874  5A		| 
	PHX				// $82B875  DA		| 
	ASL				// $82B876  0A		| 
	TAY				// $82B877  A8		| 
	LDA.w data_82B8AA,y		// $82B878  B9 AA B8	| 
	TAY				// $82B87B  A8		| 
	JSR code_82B1A2			// $82B87C  20 A2 B1	| draw text
	PLX				// $82B87F  FA		| 
	PLY				// $82B880  7A		| 
	TXA				// $82B881  8A		| 
	CLC				// $82B882  18		| 
	ADC.w #$0020			// $82B883  69 20 00	| 
	TAX				// $82B886  AA		| 
	PLA				// $82B887  68		| 
	INC				// $82B888  1A		| 
	DEY				// $82B889  88		| 
	BNE code_82B873			// $82B88A  D0 E7	| 
	PLX				// $82B88C  FA		| 
	LDA.b $D4			// $82B88D  A5 D4	| RAM ADDRESS
	BEQ code_82B894			// $82B88F  F0 03	| 
	LDA.w #$309C			// $82B891  A9 9C 30	| 
code_82B894:				//			| 
	STA.l $7E53E0,x			// $82B894  9F E0 53 7E	| RAM ADDRESS
	LDA.b $D4			// $82B898  A5 D4	| RAM ADDRESS
	CMP.w #$0003			// $82B89A  C9 03 00	| 
	LDA.w #$308C			// $82B89D  A9 8C 30	| 
	BCS code_82B8A5			// $82B8A0  B0 03	| 
	LDA.w #$309D			// $82B8A2  A9 9D 30	| 
code_82B8A5:				//			| 
	STA.l $7E54A0,x			// $82B8A5  9F A0 54 7E	| RAM ADDRESS
	RTS				// $82B8A9  60		| 

data_82B8AA:				//^^^^^^^^^^^^^^^^^^^^^^| rows for name entry
	dw data_82BEDA			// $82B8AA  DA BE	| numbers
	dw data_82BEEF			// $82B8AC  EF BE	| letters A-M
	dw data_82BEFF			// $82B8AE  FF BE	| letters N-Z
	dw data_82BF0F			// $82B8B0  0F BF	| あ行、は行
	dw data_82BF1F			// $82B8B2  1F BF	| か行、ま行
	dw data_82BF2F			// $82B8B4  2F BF	| さ行、や行
	dw data_82BF3F			// $82B8B6  3F BF	| た行、ら行
	dw data_82BF4F			// $82B8B8  4F BF	| な行、拗音


code_82B8BA:				//----------------------| 
	REP #$30			// $82B8BA  C2 30	| 
	LDA.l $7E5606			// $82B8BC  AF 06 56 7E	| RAM ADDRESS
	AND.w #$000F			// $82B8C0  29 0F 00	| 
	STA.b $D0			// $82B8C3  85 D0	| RAM ADDRESS
	LDA.l $7E5606			// $82B8C5  AF 06 56 7E	| RAM ADDRESS
	LSR				// $82B8C9  4A		| 
	LSR				// $82B8CA  4A		| 
	LSR				// $82B8CB  4A		| 
	LSR				// $82B8CC  4A		| 
	PHA				// $82B8CD  48		| 
	AND.w #$000F			// $82B8CE  29 0F 00	| 
	STA.b $D2			// $82B8D1  85 D2	| RAM ADDRESS
	PLA				// $82B8D3  68		| 
	XBA				// $82B8D4  EB		| 
	AND.w #$000F			// $82B8D5  29 0F 00	| 
	STA.b $D4			// $82B8D8  85 D4	| RAM ADDRESS
	LDA.l $7E5607			// $82B8DA  AF 07 56 7E	| RAM ADDRESS
	AND.w #$000F			// $82B8DE  29 0F 00	| 
	STA.b $D6			// $82B8E1  85 D6	| RAM ADDRESS
	RTS				// $82B8E3  60		| 


code_82B8E4:				//----------------------| 
	REP #$30			// $82B8E4  C2 30	| 
	LDA.w #$000D			// $82B8E6  A9 0D 00	| 
	STA.l $7E5606			// $82B8E9  8F 06 56 7E	| RAM ADDRESS
	JSR code_82B84A			// $82B8ED  20 4A B8	| 
	JMP code_82B113			// $82B8F0  4C 13 B1	| scroll menu in


code_82B8F3:				//----------------------| 
	JSR code_82B8BA			// $82B8F3  20 BA B8	| 
	STZ.b $EE			// $82B8F6  64 EE	| RAM ADDRESS
code_82B8F8:				//----------------------| loop (i guess the name input handler)
	SEP #$20			// $82B8F8  E2 20	| 
	INC.b $EE			// $82B8FA  E6 EE	| RAM ADDRESS
	INC.b $EF			// $82B8FC  E6 EF	| RAM ADDRESS
	REP #$20			// $82B8FE  C2 20	| 
	JSR code_82BA2A			// $82B900  20 2A BA	| 
	LDA.b $EE			// $82B903  A5 EE	| RAM ADDRESS
	AND.w #$0008			// $82B905  29 08 00	| 
	BNE code_82B911			// $82B908  D0 07	| 
	LDA.w #$389E			// $82B90A  A9 9E 38	| the highlight square icon (the one you move around)
	STA.l $7E5400,x			// $82B90D  9F 00 54 7E	| RAM ADDRESS
code_82B911:				//			| 
	LDA.b $EF			// $82B911  A5 EF	| RAM ADDRESS
	AND.w #$0008			// $82B913  29 08 00	| 
	BNE code_82B93D			// $82B916  D0 25	| 
	LDA.b $D0			// $82B918  A5 D0	| RAM ADDRESS
	XBA				// $82B91A  EB		| 
	ORA.b $D2			// $82B91B  05 D2	| RAM ADDRESS
	CMP.w #$0D00			// $82B91D  C9 00 0D	| 
	BNE code_82B932			// $82B920  D0 10	| 
	LDA.w #$0000			// $82B922  A9 00 00	| 
	LDX.w #$000E			// $82B925  A2 0E 00	| 
code_82B928:				//			| 
	STA.l $7E5424,x			// $82B928  9F 24 54 7E	| RAM ADDRESS
	DEX				// $82B92C  CA		| 
	DEX				// $82B92D  CA		| 
	BPL code_82B928			// $82B92E  10 F8	| 
	BRA code_82B93D			// $82B930  80 0B	| 
code_82B932:				//			| 
	LDA.b $D6			// $82B932  A5 D6	| RAM ADDRESS
	ASL				// $82B934  0A		| 
	TAX				// $82B935  AA		| 
	LDA.w #$389E			// $82B936  A9 9E 38	| the highlight square icon (the one on the name)
	STA.l $7E5424,x			// $82B939  9F 24 54 7E	| RAM ADDRESS
code_82B93D:				//			| 
	JSR code_82AD8F			// $82B93D  20 8F AD	| 
	JSR code_82BA2A			// $82B940  20 2A BA	| 
	LDY.w #$00F0			// $82B943  A0 F0 00	| 
	JSR code_82B1A2			// $82B946  20 A2 B1	| draw text
	LDX.w #$0024			// $82B949  A2 24 00	| 
	JSR code_82B817			// $82B94C  20 17 B8	| 
	JSR code_82ADD3			// $82B94F  20 D3 AD	| 
	LDY.w #$0000			// $82B952  A0 00 00	| 
	BIT.w #$0800			// $82B955  89 00 08	| 
	BEQ code_82B961			// $82B958  F0 07	| 
	LDX.b $D2			// $82B95A  A6 D2	| RAM ADDRESS
	BEQ code_82B961			// $82B95C  F0 03	| 
	DEC.b $D2			// $82B95E  C6 D2	| RAM ADDRESS
	INY				// $82B960  C8		| 
code_82B961:				//			| 
	BIT.w #$0400			// $82B961  89 00 04	| 
	BEQ code_82B970			// $82B964  F0 0A	| 
	LDX.b $D2			// $82B966  A6 D2	| RAM ADDRESS
	CPX.w #$0007			// $82B968  E0 07 00	| 
	BEQ code_82B970			// $82B96B  F0 03	| 
	INC.b $D2			// $82B96D  E6 D2	| RAM ADDRESS
	INY				// $82B96F  C8		| 
code_82B970:				//			| 
	BIT.w #$0200			// $82B970  89 00 02	| 
	BEQ code_82B97F			// $82B973  F0 0A	| 
	INY				// $82B975  C8		| 
	DEC.b $D0			// $82B976  C6 D0	| RAM ADDRESS
	BPL code_82B97F			// $82B978  10 05	| 
	LDX.w #$000D			// $82B97A  A2 0D 00	| 
	STX.b $D0			// $82B97D  86 D0	| RAM ADDRESS
code_82B97F:				//			| 
	BIT.w #$0100			// $82B97F  89 00 01	| 
	BEQ code_82B990			// $82B982  F0 0C	| 
	INY				// $82B984  C8		| 
	INC.b $D0			// $82B985  E6 D0	| RAM ADDRESS
	LDX.b $D0			// $82B987  A6 D0	| RAM ADDRESS
	CPX.w #$000E			// $82B989  E0 0E 00	| 
	BNE code_82B990			// $82B98C  D0 02	| 
	STZ.b $D0			// $82B98E  64 D0	| RAM ADDRESS
code_82B990:				//			| 
	TYA				// $82B990  98		| 
	BEQ code_82B99F			// $82B991  F0 0C	| 
	LDA.w #$00FF			// $82B993  A9 FF 00	| 
	TRB.b $EE			// $82B996  14 EE	| RAM ADDRESS
	LDA.w #$0018			// $82B998  A9 18 00	| SFX for moving on name input
	JSL code_808968			// $82B99B  22 68 89 80	| 
code_82B99F:				//			| 
	LDA.b $D2			// $82B99F  A5 D2	| RAM ADDRESS
	SEC				// $82B9A1  38		| 
	SBC.b $D4			// $82B9A2  E5 D4	| RAM ADDRESS
	CMP.w #$0005			// $82B9A4  C9 05 00	| 
	BCC code_82B9B9			// $82B9A7  90 10	| 
	ASL				// $82B9A9  0A		| 
	LDA.b $D4			// $82B9AA  A5 D4	| RAM ADDRESS
	BCS code_82B9B0			// $82B9AC  B0 02	| 
	INC				// $82B9AE  1A		| 
	INC				// $82B9AF  1A		| 
code_82B9B0:				//			| 
	DEC				// $82B9B0  3A		| 
	STA.b $D4			// $82B9B1  85 D4	| RAM ADDRESS
	LDX.w #$0042			// $82B9B3  A2 42 00	| 
	JSR code_82B86D			// $82B9B6  20 6D B8	| 
code_82B9B9:				//			| 
	JSR code_82ADD3			// $82B9B9  20 D3 AD	| 
	BIT.w #$A080			// $82B9BC  89 80 A0	| 
	BNE code_82B9C4			// $82B9BF  D0 03	| 
	JMP code_82B8F8			// $82B9C1  4C F8 B8	| go loop
code_82B9C4:				//			| 
	AND.w #$A000			// $82B9C4  29 00 A0	| 
	BNE code_82BA0A			// $82B9C7  D0 41	| 
	JSR code_82BA2A			// $82B9C9  20 2A BA	| 
	LDX.b $D6			// $82B9CC  A6 D6	| RAM ADDRESS
	SEP #$20			// $82B9CE  E2 20	| 
	LDA.b $F3			// $82B9D0  A5 F3	| RAM ADDRESS
	BMI code_82B9E4			// $82B9D2  30 10	| 
	STA.l $7E5700,x			// $82B9D4  9F 00 57 7E	| RAM ADDRESS
	REP #$20			// $82B9D8  C2 20	| 
code_82B9DA:				//			| 
	INX				// $82B9DA  E8		| 
	CPX.w #$0008			// $82B9DB  E0 08 00	| 
	BEQ code_82B9F3			// $82B9DE  F0 13	| 
	STX.b $D6			// $82B9E0  86 D6	| RAM ADDRESS
	BRA code_82B9F3			// $82B9E2  80 0F	| 
code_82B9E4:				//			| 
	REP #$20			// $82B9E4  C2 20	| 
	AND.w #$0003			// $82B9E6  29 03 00	| 
	DEC				// $82B9E9  3A		| 
	BEQ code_82B9FF			// $82B9EA  F0 13	| 
	BPL code_82B9DA			// $82B9EC  10 EC	| 
	DEX				// $82B9EE  CA		| 
	BMI code_82B9F3			// $82B9EF  30 02	| 
	STX.b $D6			// $82B9F1  86 D6	| RAM ADDRESS
code_82B9F3:				//			| 
	STZ.b $EE			// $82B9F3  64 EE	| RAM ADDRESS
	LDA.w #$0018			// $82B9F5  A9 18 00	| SFX for selecting character in name input
	JSL code_808968			// $82B9F8  22 68 89 80	| 
	JMP code_82B8F8			// $82B9FC  4C F8 B8	| go loop
code_82B9FF:				//			| 
	PHA				// $82B9FF  48		| 
	LDA.w #$0019			// $82BA00  A9 19 00	| SFX for finishing name input
	JSL code_808968			// $82BA03  22 68 89 80	| 
	PLA				// $82BA07  68		| 
	BRA code_82BA0D			// $82BA08  80 03	| 
code_82BA0A:				//			| 
	LDA.w #$FFFF			// $82BA0A  A9 FF FF	| 
code_82BA0D:				//			| 
	PHA				// $82BA0D  48		| 
	LDA.b $D3			// $82BA0E  A5 D3	| RAM ADDRESS
	AND.w #$FF00			// $82BA10  29 00 FF	| 
	ORA.b $D2			// $82BA13  05 D2	| RAM ADDRESS
	ASL				// $82BA15  0A		| 
	ASL				// $82BA16  0A		| 
	ASL				// $82BA17  0A		| 
	ASL				// $82BA18  0A		| 
	PHA				// $82BA19  48		| 
	LDA.b $D5			// $82BA1A  A5 D5	| RAM ADDRESS
	AND.w #$FF00			// $82BA1C  29 00 FF	| 
	ORA.b $D0			// $82BA1F  05 D0	| RAM ADDRESS
	ORA $01,s			// $82BA21  03 01	| 
	STA.l $7E5606			// $82BA23  8F 06 56 7E	| RAM ADDRESS
	PLA				// $82BA27  68		| 
	PLA				// $82BA28  68		| 
	RTS				// $82BA29  60		| 


code_82BA2A:				//----------------------| 
	REP #$30			// $82BA2A  C2 30	| 
	LDA.w #$3000			// $82BA2C  A9 00 30	| 
	STA.b $80			// $82BA2F  85 80	| RAM ADDRESS
	LDA.b $D2			// $82BA31  A5 D2	| RAM ADDRESS
	ASL				// $82BA33  0A		| 
	TAY				// $82BA34  A8		| 
	LDA.b $D0			// $82BA35  A5 D0	| RAM ADDRESS
	SEC				// $82BA37  38		| 
	ADC.w data_82B8AA,y		// $82BA38  79 AA B8	| 
	TAY				// $82BA3B  A8		| 
	LDA.w $0000,y			// $82BA3C  B9 00 00	| this is loading from ROM
	AND.w #$00FF			// $82BA3F  29 FF 00	| 
	STA.b $F3			// $82BA42  85 F3	| RAM ADDRESS
	ORA.w #$FF00			// $82BA44  09 00 FF	| 
	BIT.w #$0080			// $82BA47  89 80 00	| 
	BEQ code_82BA59			// $82BA4A  F0 0D	| 
	LDY.w #$FFFF			// $82BA4C  A0 FF FF	| 
	STY.b $F1			// $82BA4F  84 F1	| RAM ADDRESS
	AND.w #$0003			// $82BA51  29 03 00	| 
	ASL				// $82BA54  0A		| 
	TAY				// $82BA55  A8		| 
	LDA.w data_82BA6D,y		// $82BA56  B9 6D BA	| 
code_82BA59:				//			| 
	STA.b $F0			// $82BA59  85 F0	| RAM ADDRESS
	LDA.b $D2			// $82BA5B  A5 D2	| RAM ADDRESS
	SEC				// $82BA5D  38		| 
	SBC.b $D4			// $82BA5E  E5 D4	| RAM ADDRESS
	ASL				// $82BA60  0A		| 
	ASL				// $82BA61  0A		| 
	ASL				// $82BA62  0A		| 
	ASL				// $82BA63  0A		| 
	ORA.b $D0			// $82BA64  05 D0	| RAM ADDRESS
	ASL				// $82BA66  0A		| 
	CLC				// $82BA67  18		| 
	ADC.w #$0042			// $82BA68  69 42 00	| 
	TAX				// $82BA6B  AA		| 
	RTS				// $82BA6C  60		| 

data_82BA6D:				//^^^^^^^^^^^^^^^^^^^^^^| ?
	dw $40F5			// $82BA6D		| 
	dw $6FF1			// $82BA6F		| 
	dw $40F1			// $82BA71		| 


code_82BA73:				//----------------------| 
	JMP code_82BC1E			// $82BA73  4C 1E BC	| 
code_82BA76:				//======================| 再生する
	REP #$30			// $82BA76  C2 30	| 
	LDA.w $0272			// $82BA78  AD 72 02	| RAM ADDRESS
	BEQ code_82BA73			// $82BA7B  F0 F6	| 
	LDA.w #$0000			// $82BA7D  A9 00 00	| 
	STA.l $7E5604			// $82BA80  8F 04 56 7E	| RAM ADDRESS
	JSR code_82B7D2			// $82BA84  20 D2 B7	| 
code_82BA87:				//			| 
	JSR code_82B7EC			// $82BA87  20 EC B7	| 
	TAY				// $82BA8A  A8		| 
	BMI code_82BAF1			// $82BA8B  30 64	| 
	PHA				// $82BA8D  48		| 
	JSR code_82C73E			// $82BA8E  20 3E C7	| 
	LDX.b $80			// $82BA91  A6 80	| RAM ADDRESS
	LDA.l $700004,x			// $82BA93  BF 04 00 70	| SAVEADDR
	STA.b $E4			// $82BA97  85 E4	| RAM ADDRESS
	LDA.l $700006,x			// $82BA99  BF 06 00 70	| SAVEADDR
	STA.b $E6			// $82BA9D  85 E6	| RAM ADDRESS
	LDA.l $700008,x			// $82BA9F  BF 08 00 70	| SAVEADDR
	STA.b $E8			// $82BAA3  85 E8	| RAM ADDRESS
	LDA.l $70000A,x			// $82BAA5  BF 0A 00 70	| SAVEADDR
	STA.b $EA			// $82BAA9  85 EA	| RAM ADDRESS
	LDA.w #$FFFF			// $82BAAB  A9 FF FF	| 
	STA.b $EC			// $82BAAE  85 EC	| RAM ADDRESS
	JSR code_82B793			// $82BAB0  20 93 B7	| 
	STY.b $EE			// $82BAB3  84 EE	| RAM ADDRESS
	LDA.w #code_82B730		// $82BAB5  A9 30 B7	| 
	STA.b $90			// $82BAB8  85 90	| RAM ADDRESS
	LDY.w #data_82C108		// $82BABA  A0 08 C1	| 
	JSR code_82B30B			// $82BABD  20 0B B3	| 
	PLX				// $82BAC0  FA		| 
	BIT.w #$A000			// $82BAC1  89 00 A0	| 
	BNE code_82BA87			// $82BAC4  D0 C1	| 
	TXA				// $82BAC6  8A		| 
	JSR code_82C73E			// $82BAC7  20 3E C7	| 
	LDA.w #$0070			// $82BACA  A9 70 00	| 
	STA.w $0264			// $82BACD  8D 64 02	| RAM ADDRESS
	LDA.b $80			// $82BAD0  A5 80	| RAM ADDRESS
	CLC				// $82BAD2  18		| 
	ADC.w #$000E			// $82BAD3  69 0E 00	| SAVEADDR
	STA.w $0262			// $82BAD6  8D 62 02	| RAM ADDRESS
	LDA.w #$0001			// $82BAD9  A9 01 00	| 
	STA.w $0265			// $82BADC  8D 65 02	| RAM ADDRESS
	LDA.b $84			// $82BADF  A5 84	| RAM ADDRESS
	AND.w #$1FFF			// $82BAE1  29 FF 1F	| 
	ORA.w #$8000			// $82BAE4  09 00 80	| 
	STA.l $7E560C			// $82BAE7  8F 0C 56 7E	| RAM ADDRESS
	JSR code_82AEF6			// $82BAEB  20 F6 AE	| 
	JMP code_82B167			// $82BAEE  4C 67 B1	| 
code_82BAF1:				//			| 
	JSR code_82AEF6			// $82BAF1  20 F6 AE	| 
	JSR code_82B53D			// $82BAF4  20 3D B5	| 
	JMP code_82B167			// $82BAF7  4C 67 B1	| 


code_82BAFA:				//----------------------| 
	JSR code_82AEF6			// $82BAFA  20 F6 AE	| 
	JSR code_82B53D			// $82BAFD  20 3D B5	| 
	JMP code_82B167			// $82BB00  4C 67 B1	| 

code_82BB03:				//----------------------| 
	LDA.w #code_82B675		// $82BB03  A9 75 B6	| 
	STA.b $90			// $82BB06  85 90	| RAM ADDRESS
	LDY.w #data_82BFB1		// $82BB08  A0 B1 BF	| 
	JSR code_82B303			// $82BB0B  20 03 B3	| 
	JMP code_82BB22			// $82BB0E  4C 22 BB	| 


code_82BB11:				//----------------------| 
	JSR code_82AEF6			// $82BB11  20 F6 AE	| 
	JSR code_82B675			// $82BB14  20 75 B6	| 
	JSR code_82B167			// $82BB17  20 67 B1	| scroll menu away
	JMP code_82BB22			// $82BB1A  4C 22 BB	| 

code_82BB1D:				//======================| セーブする
	REP #$30			// $82BB1D  C2 30	| 
	JSR code_82B704			// $82BB1F  20 04 B7	| 
code_82BB22:				//			| 
	JSR code_82B71E			// $82BB22  20 1E B7	| 
	AND.w #$FFFF			// $82BB25  29 FF FF	| 
	BMI code_82BAFA			// $82BB28  30 D0	| 
	PHA				// $82BB2A  48		| 
	JSR code_82B6A5			// $82BB2B  20 A5 B6	| 
	PLA				// $82BB2E  68		| 
	LDX.b $84			// $82BB2F  A6 84	| RAM ADDRESS
	BMI code_82BB22			// $82BB31  30 EF	| 
	PHA				// $82BB33  48		| 
	LDA.b $84			// $82BB34  A5 84	| RAM ADDRESS
	PHA				// $82BB36  48		| 
	PHY				// $82BB37  5A		| 
	LDA.b $82			// $82BB38  A5 82	| RAM ADDRESS
	SEC				// $82BB3A  38		| 
	SBC.w #$0004			// $82BB3B  E9 04 00	| 
	INC				// $82BB3E  1A		| 
	AND.w #$FFFE			// $82BB3F  29 FE FF	| 
	TAY				// $82BB42  A8		| 
	LDX.w #$FFFF			// $82BB43  A2 FF FF	| 
	JSR code_82C5FE			// $82BB46  20 FE C5	| 
	PLY				// $82BB49  7A		| 
	PLX				// $82BB4A  FA		| 
	PLA				// $82BB4B  68		| 
	BCS code_82BB03			// $82BB4C  B0 B5	| 
	PHA				// $82BB4E  48		| 
	BVC code_82BB60			// $82BB4F  50 0F	| 
	PHX				// $82BB51  DA		| 
	PHY				// $82BB52  5A		| 
	LDA.w #code_82B675		// $82BB53  A9 75 B6	| 
	STA.b $90			// $82BB56  85 90	| RAM ADDRESS
	LDY.w #data_82BFEC		// $82BB58  A0 EC BF	| 
	JSR code_82B303			// $82BB5B  20 03 B3	| 
	PLY				// $82BB5E  7A		| 
	PLX				// $82BB5F  FA		| 
code_82BB60:				//			| 
	PHX				// $82BB60  DA		| 
	LDX.w #$0300			// $82BB61  A2 00 03	| 
	JSR code_82B1A2			// $82BB64  20 A2 B1	| 
	LDX.w #$0000			// $82BB67  A2 00 00	| 
	LDY.w #$0000			// $82BB6A  A0 00 00	| 
	SEP #$20			// $82BB6D  E2 20	| 
code_82BB6F:				//			| 
	LDA.l $7E5700,x			// $82BB6F  BF 00 57 7E	| RAM ADDRESS
	CMP.b #$90			// $82BB73  C9 90	| 
	BCC code_82BB79			// $82BB75  90 02	| 
	EOR.b #$F0			// $82BB77  49 F0	| 
code_82BB79:				//			| 
	PHX				// $82BB79  DA		| 
	TYX				// $82BB7A  BB		| 
	STA.l $7E5700,x			// $82BB7B  9F 00 57 7E	| RAM ADDRESS
	STA.b $C0,x			// $82BB7F  95 C0	| RAM ADDRESS
	PLX				// $82BB81  FA		| 
	INX				// $82BB82  E8		| 
	INX				// $82BB83  E8		| 
	INY				// $82BB84  C8		| 
	CPY.w #$0008			// $82BB85  C0 08 00	| 
	BNE code_82BB6F			// $82BB88  D0 E5	| 
	REP #$20			// $82BB8A  C2 20	| 
	PLA				// $82BB8C  68		| 
	STA.l $7E570A			// $82BB8D  8F 0A 57 7E	| RAM ADDRESS
	LDA.b $E2			// $82BB91  A5 E2	| RAM ADDRESS
	STA.l $7E5708			// $82BB93  8F 08 57 7E	| RAM ADDRESS
	PLA				// $82BB97  68		| 
	STA.l $7E570C			// $82BB98  8F 0C 57 7E	| RAM ADDRESS
	JSR code_82B8E4			// $82BB9C  20 E4 B8	| 
code_82BB9F:				//----------------------| loop
	JSR code_82B8F3			// $82BB9F  20 F3 B8	| run name input
	AND.w #$FFFF			// $82BBA2  29 FF FF	| 
	BPL code_82BBAA			// $82BBA5  10 03	| 
	JMP code_82BB11			// $82BBA7  4C 11 BB	| 
code_82BBAA:				//			| 
	LDA.l $7E570C			// $82BBAA  AF 0C 57 7E	| RAM ADDRESS
	JSR code_82C366			// $82BBAE  20 66 C3	| 
	LDA.b $80			// $82BBB1  A5 80	| RAM ADDRESS
	CLC				// $82BBB3  18		| 
	ADC.w #$0004			// $82BBB4  69 04 00	| 
	AND.w #$07FF			// $82BBB7  29 FF 07	| 
	TAX				// $82BBBA  AA		| 
	LDA.b $82			// $82BBBB  A5 82	| RAM ADDRESS
	SEC				// $82BBBD  38		| 
	SBC.w #$0004			// $82BBBE  E9 04 00	| 
	INC				// $82BBC1  1A		| 
	AND.w #$FFFE			// $82BBC2  29 FE FF	| 
	TAY				// $82BBC5  A8		| 
	PHX				// $82BBC6  DA		| 
	PHY				// $82BBC7  5A		| 
	LDA.l $7E5700			// $82BBC8  AF 00 57 7E	| RAM ADDRESS
	STA.b $E4			// $82BBCC  85 E4	| RAM ADDRESS
	LDA.l $7E5702			// $82BBCE  AF 02 57 7E	| RAM ADDRESS
	STA.b $E6			// $82BBD2  85 E6	| RAM ADDRESS
	LDA.l $7E5704			// $82BBD4  AF 04 57 7E	| RAM ADDRESS
	STA.b $E8			// $82BBD8  85 E8	| RAM ADDRESS
	LDA.l $7E5706			// $82BBDA  AF 06 57 7E	| RAM ADDRESS
	STA.b $EA			// $82BBDE  85 EA	| RAM ADDRESS
	LDA.w #$FFFF			// $82BBE0  A9 FF FF	| 
	STA.b $EC			// $82BBE3  85 EC	| RAM ADDRESS
	LDA.b $82			// $82BBE5  A5 82	| RAM ADDRESS
	CLC				// $82BBE7  18		| 
	ADC.w #$0008			// $82BBE8  69 08 00	| 
	STA.b $E2			// $82BBEB  85 E2	| RAM ADDRESS
	JSR code_82B6C0			// $82BBED  20 C0 B6	| 
	LDA.w data_82B7B4,y		// $82BBF0  B9 B4 B7	| 
	STA.b $EE			// $82BBF3  85 EE	| RAM ADDRESS
	LDY.w #data_82C022		// $82BBF5  A0 22 C0	| 
	LDA.w #code_82B84A		// $82BBF8  A9 4A B8	| 
	STA.b $90			// $82BBFB  85 90	| RAM ADDRESS
	JSR code_82B30B			// $82BBFD  20 0B B3	| 
	PLY				// $82BC00  7A		| 
	PLX				// $82BC01  FA		| 
	BIT.w #$A000			// $82BC02  89 00 A0	| 
	BEQ code_82BC0A			// $82BC05  F0 03	| 
	JMP code_82BB9F			// $82BC07  4C 9F BB	| go loop
code_82BC0A:				//			| 
	JSR code_82C5FE			// $82BC0A  20 FE C5	| 
	LDA.w #code_82B84A		// $82BC0D  A9 4A B8	| 
	STA.b $90			// $82BC10  85 90	| RAM ADDRESS
	LDY.w #data_82C04E		// $82BC12  A0 4E C0	| 
	JSR code_82B303			// $82BC15  20 03 B3	| 
	JSR code_82C310			// $82BC18  20 10 C3	| 
	JMP code_82BB11			// $82BC1B  4C 11 BB	| 


code_82BC1E:				//----------------------| 
	REP #$30			// $82BC1E  C2 30	| 
	LDA.w #code_82B53D		// $82BC20  A9 3D B5	| 
	STA.b $90			// $82BC23  85 90	| RAM ADDRESS
	LDY.w #data_82C060		// $82BC25  A0 60 C0	| 
	JSR code_82B303			// $82BC28  20 03 B3	| 
	RTS				// $82BC2B  60		| 


code_82BC2C:				//----------------------| 
	JSR code_82AEF6			// $82BC2C  20 F6 AE	| 
	JSR code_82B53D			// $82BC2F  20 3D B5	| 
	JMP code_82B167			// $82BC32  4C 67 B1	| scroll menu out

code_82BC35:				//======================| 名前を変える
	REP #$30			// $82BC35  C2 30	| 
	LDA.w $0272			// $82BC37  AD 72 02	| RAM ADDRESS
	BNE code_82BC3F			// $82BC3A  D0 03	| 
	JMP code_82BC1E			// $82BC3C  4C 1E BC	| 
code_82BC3F:				//			| 
	JSR code_82B7D2			// $82BC3F  20 D2 B7	| 
code_82BC42:				//----------------------| loop
	JSR code_82B7EC			// $82BC42  20 EC B7	| 
	TAY				// $82BC45  A8		| 
	BPL code_82BC4B			// $82BC46  10 03	| 
	JMP code_82BC2C			// $82BC48  4C 2C BC	| 
code_82BC4B:				//			| 
	JSR code_82C73E			// $82BC4B  20 3E C7	| below loads old name
	LDX.b $80			// $82BC4E  A6 80	|\ RAM ADDRESS
	LDA.l $700004,x			// $82BC50  BF 04 00 70	|| SAVEADDR
	STA.l $7E5700			// $82BC54  8F 00 57 7E	|| RAM ADDRESS
	LDA.l $700006,x			// $82BC58  BF 06 00 70	|| SAVEADDR
	STA.l $7E5702			// $82BC5C  8F 02 57 7E	|| RAM ADDRESS
	LDA.l $700008,x			// $82BC60  BF 08 00 70	|| SAVEADDR
	STA.l $7E5704			// $82BC64  8F 04 57 7E	|| RAM ADDRESS
	LDA.l $70000A,x			// $82BC68  BF 0A 00 70	|| SAVEADDR
	STA.l $7E5706			// $82BC6C  8F 06 57 7E	|/ RAM ADDRESS
	LDA.b $82			// $82BC70  A5 82	| RAM ADDRESS
	STA.l $7E5708			// $82BC72  8F 08 57 7E	| RAM ADDRESS
	LDA.b $84			// $82BC76  A5 84	| RAM ADDRESS
	STA.l $7E570A			// $82BC78  8F 0A 57 7E	| RAM ADDRESS
	PHX				// $82BC7C  DA		| 
	JSR code_82B8E4			// $82BC7D  20 E4 B8	| scroll menu in?
	PLX				// $82BC80  FA		| 
code_82BC81:				//----------------------| other loop
	PHX				// $82BC81  DA		| 
	JSR code_82B8F3			// $82BC82  20 F3 B8	| 
	PLX				// $82BC85  FA		| 
	TAY				// $82BC86  A8		| 
	BPL code_82BC8C			// $82BC87  10 03	| 
	JMP code_82BD03			// $82BC89  4C 03 BD	| 
code_82BC8C:				//			| 
	PHX				// $82BC8C  DA		| 
	STZ.b $80			// $82BC8D  64 80	| RAM ADDRESS
	LDY.w #$0000			// $82BC8F  A0 00 00	| 
code_82BC92:				//			| 
	LDA.l $700004,x			// $82BC92  BF 04 00 70	| SAVEADDR
	PHX				// $82BC96  DA		| 
	TYX				// $82BC97  BB		| 
	STA.b $E0,x			// $82BC98  95 E0	| RAM ADDRESS
	EOR.l $7E5700,x			// $82BC9A  5F 00 57 7E	| RAM ADDRESS
	BEQ code_82BCA2			// $82BC9E  F0 02	| 
	STA.b $80			// $82BCA0  85 80	| RAM ADDRESS
code_82BCA2:				//			| 
	LDA.l $7E5700,x			// $82BCA2  BF 00 57 7E	| RAM ADDRESS
	STA.b $EA,x			// $82BCA6  95 EA	| RAM ADDRESS
	PLX				// $82BCA8  FA		| 
	INX				// $82BCA9  E8		| 
	INX				// $82BCAA  E8		| 
	INY				// $82BCAB  C8		| 
	INY				// $82BCAC  C8		| 
	CPY.w #$0008			// $82BCAD  C0 08 00	| 
	BNE code_82BC92			// $82BCB0  D0 E0	| 
	LDA.w #$FFFF			// $82BCB2  A9 FF FF	| 
	STA.b $E8			// $82BCB5  85 E8	| RAM ADDRESS
	STA.b $F2			// $82BCB7  85 F2	| RAM ADDRESS
	PLX				// $82BCB9  FA		| 
	LDA.b $80			// $82BCBA  A5 80	| RAM ADDRESS
	BEQ code_82BD03			// $82BCBC  F0 45	| 
	PHX				// $82BCBE  DA		| 
	LDA.w #code_82B84A		// $82BCBF  A9 4A B8	| 
	STA.b $90			// $82BCC2  85 90	| RAM ADDRESS
	LDY.w #data_82C076		// $82BCC4  A0 76 C0	| 
	JSR code_82B30B			// $82BCC7  20 0B B3	| 
	PLX				// $82BCCA  FA		| 
	BIT.w #$A000			// $82BCCB  89 00 A0	| 
	BNE code_82BC81			// $82BCCE  D0 B1	| go loop?
	PHX				// $82BCD0  DA		| 
	JSR code_82C2BA			// $82BCD1  20 BA C2	| 
	PLX				// $82BCD4  FA		|\ below stores new name
	LDA.l $7E5700			// $82BCD5  AF 00 57 7E	|| RAM ADDRESS
	STA.l $700004,x			// $82BCD9  9F 04 00 70	|| SAVEADDR
	LDA.l $7E5702			// $82BCDD  AF 02 57 7E	|| RAM ADDRESS
	STA.l $700006,x			// $82BCE1  9F 06 00 70	|| SAVEADDR
	LDA.l $7E5704			// $82BCE5  AF 04 57 7E	|| RAM ADDRESS
	STA.l $700008,x			// $82BCE9  9F 08 00 70	|| SAVEADDR
	LDA.l $7E5706			// $82BCED  AF 06 57 7E	|| RAM ADDRESS
	STA.l $70000A,x			// $82BCF1  9F 0A 00 70	|/ SAVEADDR
	JSR code_82C2C5			// $82BCF5  20 C5 C2	| 
	LDA.w #code_82B84A		// $82BCF8  A9 4A B8	| 
	STA.b $90			// $82BCFB  85 90	| RAM ADDRESS
	LDY.w #data_82C0AC		// $82BCFD  A0 AC C0	| 
	JSR code_82B303			// $82BD00  20 03 B3	| 
code_82BD03:				//			| 
	JSR code_82AEF6			// $82BD03  20 F6 AE	| 
	JSR code_82B730			// $82BD06  20 30 B7	| 
	JSR code_82B167			// $82BD09  20 67 B1	| scroll menu away
	JMP code_82BC42			// $82BD0C  4C 42 BC	| go loop


code_82BD0F:				//----------------------| 
	JMP code_82BC1E			// $82BD0F  4C 1E BC	| 
code_82BD12:				//======================| ファイルを消す
	REP #$30			// $82BD12  C2 30	| 
	LDA.w $0272			// $82BD14  AD 72 02	| RAM ADDRESS
	BEQ code_82BD0F			// $82BD17  F0 F6	| 
	LDA.w #$0000			// $82BD19  A9 00 00	| 
	STA.l $7E5604			// $82BD1C  8F 04 56 7E	| RAM ADDRESS
	JSR code_82B7D2			// $82BD20  20 D2 B7	| 
code_82BD23:				//			| loop
	JSR code_82B7EC			// $82BD23  20 EC B7	| 
	TAY				// $82BD26  A8		| 
	BMI code_82BD87			// $82BD27  30 5E	| 
	PHA				// $82BD29  48		| 
	JSR code_82C73E			// $82BD2A  20 3E C7	| 
	LDX.b $80			// $82BD2D  A6 80	| RAM ADDRESS
	LDA.l $700004,x			// $82BD2F  BF 04 00 70	| SAVEADDR
	STA.b $E4			// $82BD33  85 E4	| RAM ADDRESS
	LDA.l $700006,x			// $82BD35  BF 06 00 70	| SAVEADDR
	STA.b $E6			// $82BD39  85 E6	| RAM ADDRESS
	LDA.l $700008,x			// $82BD3B  BF 08 00 70	| SAVEADDR
	STA.b $E8			// $82BD3F  85 E8	| RAM ADDRESS
	LDA.l $70000A,x			// $82BD41  BF 0A 00 70	| SAVEADDR
	STA.b $EA			// $82BD45  85 EA	| RAM ADDRESS
	LDA.w #$FFFF			// $82BD47  A9 FF FF	| 
	STA.b $EC			// $82BD4A  85 EC	| RAM ADDRESS
	JSR code_82B793			// $82BD4C  20 93 B7	| 
	STY.b $EE			// $82BD4F  84 EE	| RAM ADDRESS
	LDA.w #code_82B730		// $82BD51  A9 30 B7	| 
	STA.b $90			// $82BD54  85 90	| RAM ADDRESS
	LDY.w #data_82C0BD		// $82BD56  A0 BD C0	| 
	JSR code_82B2FB			// $82BD59  20 FB B2	| 
	PLA				// $82BD5C  FA		| 
	BIT.w #$A000			// $82BD5D  89 00 A0	| 
	BNE code_82BD23			// $82BD60  D0 C1	| 
	TXA				// $82BD62  8A		| 
	JSR code_82C6DB			// $82BD63  20 DB C6	| 
	JSR code_82C310			// $82BD66  20 10 C3	| 
	JSR code_82B730			// $82BD69  20 30 B7	| 
	PHB				// $82BD6C  8B		| 
	LDX.w #$5500			// $82BD6D  A2 00 55	| src = $7E5500
	LDY.w #$5400			// $82BD70  A0 00 54	| dst = $7E5400
	LDA.w #$00FF			// $82BD73  A9 FF 00	| 
	MVN $7E,$7E			// $82BD76  54 7E 7E	| 
	PLB				// $82BD79  AB		| 
	LDA.w #code_82B730		// $82BD7A  A9 30 B7	| 
	STA.b $90			// $82BD7D  85 90	| RAM ADDRESS
	LDY.w #data_82C0F9		// $82BD7F  A0 F9 C0	| 
	JSR code_82B303			// $82BD82  20 03 B3	| 
	BRA code_82BD23			// $82BD85  80 9C	| go loop
code_82BD87:				//			| 
	JSR code_82AEF6			// $82BD87  20 F6 AE	| 
	JSR code_82B53D			// $82BD8A  20 3D B5	| 
	JMP code_82B167			// $82BD8D  4C 67 B1	| 


//==============================================================| 
// TODO: EXTERNALIZE THESE TABLES THEY TAKE UP WAY TOO MUCH SPACE
//	for each group below:
//	first word (if any) = "position" for border (index into tilemap buffer)
//	second word (if any) = width (high byte) and height (low byte) of border
//	third word (if any) = YXPCCCTT TTTTTTTT for border (low byte ideally clear)
//	then some special bytes for text drawing:
//		01 = skip a tile (+2 index to buffer). usually follows FD command (cuz of border)
//		80 = show free space (4 tiles)
//		81 = probably bytes used by current file (2 tiles)
//		88 = probably field # command (4 tiles?)
//		FD = end of line (jump to beginning of next)
//		FE = position command. byte following is index/2 to tilemap buffer
//		FF = end of text
//		Fx (when not above) is tile/text modifier
//			bits 0,1 = low 2 bits of palette (yxpcCCtt)
//			bit 2 = x-flip (yXpccctt)
//			(p and high c get auto-set (3000))
//		anything else < $80 is tile data (aka text)
//==============================================================| 


data_82BD90:				//----------------------| 
	db $FE,$91			// |
	db $F2				// |
	db $52,$45,$50,$4C,$41,$59	// || text "REPLAY"
	db $FF				// | 

data_82BD9A:				//----------------------| 
	db $FE,$81			// |
	db $F0				// |
	db $42,$55,$46,$46,$45,$52	// || text "BUFFER"
	db $FF				// | 

data_82BDA4:				//----------------------| 
	db $FE,$81			// |
	db $F0				// |
	db $53,$52,$41,$4D		// || text "SRAM"
	db $FF				// | 

data_82BDAC:				//----------------------| 
	db $FE,$81			// |
	db $F0				// |
	db $46,$49,$4C,$45,$00,$4E,$41	// |\ text "FILE NAME"
	db $4D,$45			// |/ 
	db $FF				// | 

data_82BDB9:				//----------------------| 
	db $FE,$A1			// |
	db $F2				// |
	db $52,$45,$50,$4C,$41,$59	// || text "REPLAY"
	db $FF				// | 

data_82BDC3:				//----------------------| 
	db $F2				// | 
	db $11,$17,$14,$38,$11,$05,$05	// |\ text "あきえりあ・・・" (空きエリア)
	db $05				// |/ 
	db $80				// | ?
	db $FF				// | 

data_82BDCE:				//----------------------| 
	db $F0				// | 
	db $10,$10,$10,$10,$10,$10,$10	// |\ text "ーーーーーーー      "
	db $00,$00,$00,$00,$00,$00	// |/ 
	db $FF				// | 

data_82BDDD:				//----------------------| 
	db $F0				// | 
	db $33,$24,$3E,$39,$00,$00,$00	// |\ text "もどる         " (戻る)
	db $00,$00,$00,$00,$00,$00	// |/ 
	db $FF				// | 
data_82BDEC:				//----------------------| 
	db $F0				// | 
	db $1E,$10,$2C,$3E,$1D,$39,$00	// |\ text "せーぶする       " (セーブする)
	db $00,$00,$00,$00,$00,$00	// |/ 
	db $FF				// | 
data_82BDFB:				//----------------------| 
	db $F0				// | 
	db $25,$2F,$14,$06,$16,$14,$39	// |\ text "なまえをかえる      " (名前を変える)
	db $00,$00,$00,$00,$00,$00	// |/ 
	db $FF				// | 
data_82BE0A:				//----------------------| 
	db $F0				// | 
	db $2C,$07,$12,$39,$06,$19,$1D	// |\ text "ふぁいるをけす      " (ファイルを消す)
	db $00,$00,$00,$00,$00,$00	// |/ 
	db $FF				// | 
data_82BE19:				//----------------------| 
	db $F0				// | 
	db $1B,$12,$1E,$12,$1D,$39,$00	// |\ text "さいせいする       " (再生する)
	db $00,$00,$00,$00,$00,$00	// |/ 
	db $FF				// | 

data_82BE28:				//----------------------| 
	db $F0				// | 
	db $21,$0D,$13,$20,$3E,$3D,$1D	// |\ text "ちゅうだんする     " (中断する)
	db $39,$00,$00,$00,$00,$00	// |/ 
	db $FF				// | 

data_82BE37:				//----------------------| 
	db $F2				// | 
	db $10,$10,$10,$10,$10,$10,$10	// |\ text "ーーーーーーー      "
	db $00,$00,$00,$00,$00,$00	// |/ 
	db $FF				// | 

data_82BE46:				//----------------------| 
	db $F0				// | 
	db $46,$49,$45,$4C,$44		// || text "FIELD"
	db $88				// | ?
	db $00				// | 
	db $F2				// | 
	db $81				// | ?
	db $F1				// | *
	db $5E				// | *
	db $FF				// | 
data_82BE53:				//----------------------| 
	db $F0				// | 
	db $46,$49,$45,$4C,$44		// || text "FIELD"
	db $88				// | ?
	db $00				// | 
	db $F2				// | 
	db $81				// | ?
	db $5E				// | *
	db $FF				// | 
data_82BE5F:				//----------------------| 
	db $F0				// | 
	db $46,$49,$45,$4C,$44		// || text "FIELD"
	db $88				// | ?
	db $00				// | 
	db $F2				// | 
	db $81				// | ?
	db $F1				// | *
	db $5F				// | *
	db $FF				// | 
data_82BE6C:				//----------------------| 
	db $F0				// | 
	db $46,$49,$45,$4C,$44		// || text "FIELD"
	db $88				// | ?
	db $00				// | 
	db $F2				// | 
	db $81				// | ?
	db $5F				// | *
	db $FF				// | 
data_82BE78:				//----------------------| 
	db $F0				// | 
	db $46,$49,$45,$4C,$44		// || text "FIELD"
	db $88				// | ?
	db $00				// | 
	db $F2				// | 
	db $81				// | ?
	db $F0				// | *
	db $5E				// | *
	db $FF				// | 
data_82BE85:				//----------------------| 
	db $F0				// | 
	db $46,$49,$45,$4C,$44		// || text "FIELD"
	db $88				// | ?
	db $00				// | 
	db $F2				// | 
	db $81				// | ?
	db $F0				// | *
	db $5F				// | *
	db $FF				// | 

data_82BE92:				//----------------------| 
	db $F0				// | 
	db $2B,$0E,$13,$1C,$3E,$00,$00	// |\ text "ひょうじ   " (表示)?
	db $00				// |/ 
	db $F2				// | 
	db $53,$49,$5A,$45,$00		// || text "SIZE "
	db $FF				// | 
data_82BEA2:				//----------------------| 
	db $F0				// | 
	db $2B,$0E,$13,$1C,$3E,$00,$00	// || text "ひょうじ  " (表示)?
	db $F2				// | 
	db $46,$49,$45,$4C,$44,$00	// || text "FIELD "
	db $FF				// | 

data_82BEB2:				//----------------------| 
	db $F0				// | 
	db $92				// || ???
	db $F2				// | 
	db $81				// | ?
	db $F1				// | * 
	db $5E				// | *
	db $FF				// | 
data_82BEB9:				//----------------------| 
	db $F0				// | 
	db $92				// || ???
	db $F2				// | 
	db $81				// | ?
	db $5E				// | *
	db $FF				// | 
data_82BEBF:				//----------------------| 
	db $F0				// | 
	db $92				// || ???
	db $F2				// | 
	db $81				// | ?
	db $F1				// | * 
	db $5F				// | *
	db $FF				// | 
data_82BEC6:				//----------------------| 
	db $F0				// | 
	db $92				// || ???
	db $F2				// | 
	db $81				// | ?
	db $5F				// | *
	db $FF				// | 
data_82BECC:				//----------------------| 
	db $F0				// | 
	db $92				// || ???
	db $F2				// | 
	db $81				// | ?
	db $F0				// | 
	db $5E				// | *
	db $FF				// | 
data_82BED3:				//----------------------| 
	db $F0				// | 
	db $92				// || ???
	db $F2				// | 
	db $81				// | ?
	db $F0				// | 
	db $5F				// | *
	db $FF				// | 

data_82BEDA:				//----------------------| 
	db $F0				// | 
	db $60,$61,$62,$63,$64,$65,$66	// |\ text "0123456789."
	db $67,$68,$69,$5B		// |/ 
	db $F0				// | ?
	db $F2				// | ?
	db $F1				// | 
	db $F5				// |\ arrow left (x-flipped arrow right)
	db $40				// |/ 
	db $F1				// |\ arrow right
	db $40				// |/ 
	db $6F				// || submit
	db $FF				// | 
data_82BEEF:				//----------------------| 
	db $F0				// | 
	db $00,$41,$42,$43,$44,$45,$46	// |\ text " ABCDEFGHIJKLM"
	db $47,$48,$49,$4A,$4B,$4C,$4D	// |/ 
	db $FF				// | 
data_82BEFF:				//----------------------| 
	db $F0				// | 
	db $4E,$4F,$50,$51,$52,$53,$54	// |\ text "NOPQRSTUVWXYZ:"
	db $55,$56,$57,$58,$59,$5A,$6B	// |/ 
	db $FF				// | 
data_82BF0F:				//----------------------| 
	db $F0				// | 
	db $11,$12,$13,$14,$15		// || text "あいうえお"
	db $05				// || text "・"
	db $2A,$2B,$2C,$2D,$2E		// || text "はひふへほ"
	db $10,$5C,$5D			// || text "ー！？"
	db $FF				// | 
data_82BF1F:				//----------------------| 
	db $F0				// | 
	db $16,$17,$18,$19,$1A		// || text "かきくけこ"
	db $05				// || text "・"
	db $2F,$30,$31,$32,$33		// || text "まみむめも"
	db $02,$3E,$3F			// || text "｀゛゜"
	db $FF				// | 
data_82BF2F:				//----------------------| 
	db $F0				// | 
	db $1B,$1C,$1D,$1E,$1F		// || text "さしすせそ"
	db $05				// || text "・"
	db $34,$35,$36,$3C,$3D		// || text "やゆよわん"
	db $05,$04,$03			// || text "・、。"
	db $FF				// | 
data_82BF3F:				//----------------------| 
	db $F0				// | 
	db $20,$21,$22,$23,$24		// || text "たちつてと"
	db $05				// || text "・"
	db $37,$38,$39,$3A,$3B		// || text "らりるれろ"
	db $0F,$06,$6A			// || text "っを＠" (＠ = cursor icon)
	db $FF				// | 
data_82BF4F:				//----------------------| 
	db $F0				// | 
	db $25,$26,$27,$28,$29		// || text "なにぬねの"
	db $05				// || text "・"
	db $07,$08,$09,$0A,$0B		// || text "ぁぃぅぇぉ"
	db $0C,$0D,$0E			// || text "ゃゅょ"
	db $FF				// | 

data_82BF5F:				//----------------------| 
	dw $0040			// | 
	dw $1005			// | 
	dw $3400			// | 
	db $FE,$B1			// | 
	db $F0				// | 
	db $42,$55,$46,$46,$45,$52,$29	// |\ text "BUFFERのあきえりあが" ([see below])
	db $11,$17,$14,$38,$11,$16,$3E	// |/ 
	db $FD				// | 
	db $01				// | 
	db $20,$38,$25,$12,$29,$23,$3E	// |\ text "たりないので、きろくをちゅ" ([see below])
	db $04,$17,$3B,$18,$06,$21,$0D	// |/ 
	db $FD				// | 
	db $01				// | 
	db $13,$20,$3E,$3D,$1C,$23,$12	// |\ text "うだんしています！" (BUFFERの空きエリアが足りないので、記録を中断しています！)
	db $2F,$1D,$5C			// |/ 
	db $FF				// | 

data_82BF93:				//----------------------| 
	dw $0040			// | 
	dw $1004			// | 
	dw $3400			// | 
	db $FE,$B2			// | 
	db $F0				// | 
	db $53,$52,$41,$4D,$26,$12,$1C	// |\ text "SRAMにいじょうが" ([see below])
	db $3E,$0E,$13,$16,$3E		// |/ 
	db $FD				// | 
	db $01				// | 
	db $01				// | 
	db $11,$38,$2F,$1D,$5C		// || text "あります！" (SRAMに異常が)
	db $FF				// | 

data_82BFB1:				//----------------------| 
	dw $0020			// | 
	dw $1006			// | 
	dw $3400			// | 
	db $FE,$A1			// | 
	db $F0				// | 
	db $53,$52,$41,$4D,$29,$11,$17	// |\ text "SRAMのあきえりあがたり" ([see below])
	db $14,$38,$11,$16,$3E,$20,$38	// |/ 
	db $FD				// | 
	db $01				// | 
	db $2F,$1E,$3D,$5C		// || text "ません！" (SRAMの空きエリアが足りません!)
	db $FD				// | 
	db $01				// | 
	db $12,$37,$25,$12,$2C,$07,$12	// |\ text "いらないふぁいるをけして、や" ([see below])
	db $39,$06,$19,$1C,$23,$04,$34	// |/ 
	db $FD				// | 
	db $01				// | 
	db $38,$25,$15,$1C,$23,$18,$20	// |\ text "りなおしてください。" (いらないファイルを消して、やり直してください。)
	db $3E,$1B,$12,$03		// |/ 
	db $FF				// | 

data_82BFEC:				//----------------------| 
	dw $0040			// | 
	dw $1005			// | 
	dw $3400			// | 
	db $FE,$B1			// | 
	db $F0				// | 
	db $53,$52,$41,$4D,$29,$11,$17	// |\ text "SRAMのあきえりあがたり" ([see below])
	db $14,$38,$11,$16,$3E,$20,$38	// |/ 
	db $FD				// | 
	db $01				// | 
	db $25,$12,$29,$23,$3E,$04,$24	// |\ text "ないので、とちゅうまでし" ([see below])
	db $21,$0D,$13,$2F,$23,$3E,$1C	// |/ 
	db $FD				// | 
	db $01				// | 
	db $16,$1E,$10,$2C,$3E,$23,$3E	// |\ text "かせーぶできません。" (SRAMの空きエリアが足りないので、途中までしかセーブできません。)
	db $17,$2F,$1E,$3D,$03		// |/ 
	db $FF				// | 

data_82C022:				//----------------------| 
	dw $0040			// | 
	dw $1005			// | 
	dw $3800			// | 
	db $FE,$B2			// | 
	db $9F				// || ???
	db $FD				// | 
	db $01				// | 
	db $F0				// | 
	db $06,$53,$52,$41,$4D,$26,$1E	// |\ text "をSRAMにせーぶします" (SRAMにセーブします)
	db $10,$2C,$3E,$1C,$2F,$1D	// |/ 
	db $FD				// | 
	db $01				// | 
	db $05,$05,$05			// || text "・・・" ([see below])
	db $F2				// | 
	db $42				// || text "B" ([see below])
	db $F0				// | 
	db $2E,$3E,$20,$3D,$23,$3E,$24	// |\ text "ぼたんでとりけし" (・・・Bボタンで取り消し)
	db $38,$19,$1C			// |/ 
	db $FF				// | 

data_82C04E:				//----------------------| 
	dw $0064			// | 
	dw $0C03			// | 
	dw $3800			// | 
	db $FE,$C4			// | 
	db $F0				// | 
	db $1E,$10,$2C,$3E,$1C,$2F,$1C	// |\ text "せーぶしました" (セーブしました)
	db $20				// |/ 
	db $FF				// | 

data_82C060:				//----------------------| 
	dw $0060			// | 
	dw $1003			// | 
	dw $3400			// | 
	db $FE,$C2			// | 
	db $F0				// | 
	db $2C,$07,$12,$39,$16,$3E,$11	// |\ text "ふぁいるがありません！" (ファイルがありません！)
	db $38,$2F,$1E,$3D,$5C		// |/ 
	db $FF				// | 

data_82C076:				//----------------------| 
	dw $0020			// | 
	dw $1006			// | 
	dw $3800			// | 
	db $FE,$A2			// | 
	db $F0				// | 
	db $02				// || text "｀"
	db $F2				// | 
	db $90				// || ???
	db $F0				// | 
	db $02,$00,$06			// || text "｀ を"
	db $FD				// | 
	db $01				// | 
	db $01				// | 
	db $02				// || text "｀"
	db $F2				// | 
	db $95				// || ???
	db $F0				// | 
	db $02,$00,$06			// || text "｀ に"
	db $FD				// | 
	db $01				// | 
	db $01				// | 
	db $16,$17,$16,$14,$2F,$1D	// || text "かきかえます" (書き換えます)
	db $FD				// | 
	db $01				// | 
	db $05,$05,$05			// || text "・・・" ([see below])
	db $F2				// | 
	db $42				// || text "B" ([see below])
	db $F0				// | 
	db $2E,$3E,$20,$3D,$23,$3E,$24	// |\ text "ぼたんでとりけし" (・・・Bボタンで取り消し)
	db $38,$19,$1C			// |/ 
	db $FF				// | 

data_82C0AC:				//----------------------| 
	dw $0064			// | 
	dw $0C03			// | 
	dw $3800			// | 
	db $FE,$C4			// | 
	db $F0				// | 
	db $16,$17,$16,$14,$2F,$1C,$20	// || text "かきかえました" (書き換えました)
	db $FF				// | 

data_82C0BD:				//----------------------| 
	dw $0020			// | 
	dw $1006			// | 
	dw $3400			// | 
	db $FE,$A2			// | 
	db $9F				// || ???
	db $FD				// | 
	db $01				// | 
	db $F0				// | 
	db $06,$19,$1C,$2F,$1D,$5C,$00	// || text "をけします！ " (を消します！)
	db $F2				// | 
	db $53,$54,$41,$52,$54		// || text "START" ([see below])
	db $F0				// | 
	db $2E,$3E			// || text "ぼ" ([see below])
	db $FD				// | 
	db $01				// | 
	db $20,$3D,$06,$15,$1C,$23,$18	// |\ text "たんをおしてください" (STARTボタンを押してください)
	db $20,$3E,$1B,$12		// |/ 
	db $FD				// | 
	db $01				// | 
	db $05,$05,$05			// || text "・・・" ([see below])
	db $F2				// | 
	db $42				// || text "B" ([see below])
	db $F0				// | 
	db $2E,$3E,$20,$3D,$23,$3E,$24	// |\ text "ぼたんでとりけし" (・・・Bボタンで取り消し)
	db $38,$19,$1C			// |/ 
	db $FF				// | 

data_82C0F9:				//----------------------| 
	dw $0066			// | 
	dw $0A03			// | 
	dw $3800			// | 
	db $FE,$C5			// | 
	db $F0				// | 
	db $19,$1C,$2F,$1C,$20		// || text "けしました" (消しました)
	db $FF				// | 

data_82C108:				//----------------------| 
	dw $0040			// | 
	dw $1005			// | 
	dw $3800			// | 
	db $FE,$B2			// | 
	db $9F				// || ???
	db $FD				// | 
	db $01				// | 
	db $F0				// | 
	db $06,$1B,$12,$1E,$12,$1C,$2F	// |\ text "をさいせいします！" (を再生します！)
	db $1D,$5C			// |/ 
	db $FD				// | 
	db $01				// | 
	db $05,$05,$05			// || text "・・・" ([see below])
	db $F2				// | 
	db $42				// || text "B" ([see below])
	db $F0				// | 
	db $2E,$3E,$20,$3D,$23,$3E,$24	// |\ text "ぼたんでとりけし" (・・・Bボタンで取り消し)
	db $38,$19,$1C			// |/ 
	db $FF				// | 

data_82C130:				//----------------------| 
	dw $0040			// | 
	dw $1004			// | 
	dw $3800			// | 
	db $FE,$B3			// | 
	db $F0				// | 
	db $21,$0D,$13,$20,$3E,$3D,$1C	// |\ text "ちゅうだんします" (中断します)
	db $2F,$1D			// |/ 
	db $FD				// | 
	db $01				// | 
	db $05,$05,$05			// || text "・・・" ([see below])
	db $F2				// | 
	db $42				// || text "B" ([see below])
	db $F0				// | 
	db $2E,$3E,$20,$3D,$23,$3E,$24	// |\ text "ぼたんでとりけし" (・・・Bボタンで取り消し)
	db $38,$19,$1C			// |/ 
	db $FF				// | 












code_82C1E5:				//----------------------| 
	REP #$30			// $82C1E5  C2 30	| 
	PHB				// $82C1E7  8B		| 
	PHK				// $82C1E8  4B		| 
	PLB				// $82C1E9  AB		| 
	LDX.w #$0000			// $82C1EA  A2 00 00	| 
code_82C1ED:				//			| 
	LDA.l $700000,x			// $82C1ED  BF 00 00 70	| SAVEADDR
	CMP.w data_82C308,x		// $82C1F1  DD 08 C3	| 
	BNE code_82C213			// $82C1F4  D0 1D	| 
	INX				// $82C1F6  E8		| 
	INX				// $82C1F7  E8		| 
	CPX.w #$0008			// $82C1F8  E0 08 00	| 
	BNE code_82C1ED			// $82C1FB  D0 F0	| 
	LDX.w #$07FE			// $82C1FD  A2 FE 07	| 
	LDA.w #$0000			// $82C200  A9 00 00	| 
code_82C203:				//			| 
	CLC				// $82C203  18		| 
	ADC.l $700000,x			// $82C204  7F 00 00 70	| SAVEADDR
	DEX				// $82C208  CA		| 
	DEX				// $82C209  CA		| 
	BPL code_82C203			// $82C20A  10 F7	| 
	CMP.w #$0000			// $82C20C  C9 00 00	| 
	BNE code_82C220			// $82C20F  D0 0F	| 
	BRA code_82C23F			// $82C211  80 2C	| 
code_82C213:				//			| 
	CPX.w #$0006			// $82C213  E0 06 00	| 
	BNE code_82C220			// $82C216  D0 08	| 
	AND.w #$FF00			// $82C218  29 00 FF	| 
	CMP.w #$7700			// $82C21B  C9 00 77	| 
	BEQ code_82C23C			// $82C21E  F0 1C	| 
code_82C220:				//			| 
	LDA.w #$0000			// $82C220  A9 00 00	| 
	LDX.w #$07FE			// $82C223  A2 FE 07	| 
code_82C226:				//			| 
	STA.l $700000,x			// $82C226  9F 00 00 70	| SAVEADDR
	DEX				// $82C22A  CA		| 
	DEX				// $82C22B  CA		| 
	BPL code_82C226			// $82C22C  10 F8	| 
	LDX.w #$0006			// $82C22E  A2 06 00	| 
code_82C231:				//			| 
	LDA.w data_82C308,x		// $82C231  BD 08 C3	| 
	STA.l $700000,x			// $82C234  9F 00 00 70	| SAVEADDR
	DEX				// $82C238  CA		| 
	DEX				// $82C239  CA		| 
	BPL code_82C231			// $82C23A  10 F5	| 
code_82C23C:				//			| 
	JSR code_82C2C5			// $82C23C  20 C5 C2	| 
code_82C23F:				//			| 
	REP #$30			// $82C23F  C2 30	| 
	LDX.w #$07FE			// $82C241  A2 FE 07	| 
	LDA.w #$0000			// $82C244  A9 00 00	| 
code_82C247:				//			| 
	CLC				// $82C247  18		| 
	ADC.l $700000,x			// $82C248  7F 00 00 70	| SAVEADDR
	DEX				// $82C24C  CA		| 
	DEX				// $82C24D  CA		| 
	BPL code_82C247			// $82C24E  10 F7	| 
	CMP.w #$0000			// $82C250  C9 00 00	| 
	BNE code_82C2B7			// $82C253  D0 62	| 
	JSR code_82C2BA			// $82C255  20 BA C2	| 
	LDX.w #$000A			// $82C258  A2 0A 00	| 
	LDA.l $700000,x			// $82C25B  BF 00 00 70	| SAVEADDR
	BEQ code_82C2B1			// $82C25F  F0 50	| 
code_82C261:				//			| 
	TAX				// $82C261  AA		| 
	STX.b $80			// $82C262  86 80	| RAM ADDRESS
	CLC				// $82C264  18		| 
	ADC.l $700002,x			// $82C265  7F 02 00 70	| SAVEADDR
	STA.b $82			// $82C269  85 82	| RAM ADDRESS
	LDA.l $700000,x			// $82C26B  BF 00 00 70	| SAVEADDR
	BNE code_82C274			// $82C26F  D0 03	| 
	LDA.w #$0800			// $82C271  A9 00 08	| 
code_82C274:				//			| 
	CMP.w #$0801			// $82C274  C9 01 08	| 
	BCS code_82C220			// $82C277  B0 A7	| 
	CMP.b $82			// $82C279  C5 82	| RAM ADDRESS
	BEQ code_82C27F			// $82C27B  F0 02	| 
	BCC code_82C220			// $82C27D  90 A1	| 
code_82C27F:				//			| 
	LDA.l $700004,x			// $82C27F  BF 04 00 70	| SAVEADDR
	AND.w #$7F7F			// $82C283  29 7F 7F	| 
	STA.l $700004,x			// $82C286  9F 04 00 70	| SAVEADDR
	LDA.l $700006,x			// $82C28A  BF 06 00 70	| SAVEADDR
	AND.w #$7F7F			// $82C28E  29 7F 7F	| 
	STA.l $700006,x			// $82C291  9F 06 00 70	| SAVEADDR
	LDA.l $700008,x			// $82C295  BF 08 00 70	| SAVEADDR
	AND.w #$7F7F			// $82C299  29 7F 7F	| 
	STA.l $700008,x			// $82C29C  9F 08 00 70	| SAVEADDR
	LDA.l $70000A,x			// $82C2A0  BF 0A 00 70	| SAVEADDR
	AND.w #$7F7F			// $82C2A4  29 7F 7F	| 
	STA.l $70000A,x			// $82C2A7  9F 0A 00 70	| SAVEADDR
	LDA.l $700000,x			// $82C2AB  BF 00 00 70	| SAVEADDR
	BNE code_82C261			// $82C2AF  D0 B0	| 
code_82C2B1:				//			| 
	JSR code_82C2C5			// $82C2B1  20 C5 C2	| 
	PLB				// $82C2B4  AB		| 
	CLC				// $82C2B5  18		| 
	RTS				// $82C2B6		| 
code_82C2B7:				//			| 
	PLB				// $82C2B7  AB		| 
	SEC				// $82C2B8  38		| 
	RTS				// $82C2B9  60		| 

code_82C2BA:				//			| 
	SEP #$20			// $82C2BA  E2 20	| 
	LDA.b #$77			// $82C2BC  A9 77	| 
	STA.l $700007			// $82C2BE  8F 07 00 70	| SAVEADDR
	REP #$20			// $82C2C2  C2 20	| 
	RTS				// $82C2C4  60		| 

code_82C2C5:				//			| 
	REP #$30			// $82C2C5  C2 30	| 
	JSR code_82C2EB			// $82C2C7  20 EB C2	| 
	LDA.l $700008			// $82C2CA  AF 08 00 70	| SAVEADDR
	SEP #$20			// $82C2CE  E2 20	| 
	XBA				// $82C2D0  EB		| 
	CLC				// $82C2D1  18		| 
	ADC.l $700007			// $82C2D2  6F 07 00 70	| SAVEADDR
	SEC				// $82C2D6  38		| 
	SBC.b #$30			// $82C2D7  E9 30	| 
	XBA				// $82C2D9  EB		| 
	REP #$20			// $82C2DA  C2 20	| 
	STA.l $700008			// $82C2DC  8F 08 00 70	| SAVEADDR
	SEP #$20			// $82C2E0  E2 20	| 
	LDA.b #$30			// $82C2E2  A9 30	| 
	STA.l $700007			// $82C2E4  8F 07 00 70	| SAVEADDR
	REP #$20			// $82C2E8  C2 20	| 
	RTS				// $82C2EA  60		| 

code_82C2EB:				//			| 
	REP #$30			// $82C2EB  C2 30	| 
	LDA.w #$0000			// $82C2ED  A9 00 00	| 
	STA.l $700008			// $82C2F0  8F 08 00 70	| SAVEADDR
	LDA.w #$0000			// $82C2F4  A9 00 00	| 
	LDX.w #$07FE			// $82C2F7  A2 FE 07	| 
code_82C2FA:				//			| 
	SEC				// $82C2FA  38		| 
	SBC.l $700000,x			// $82C2FB  FF 00 00 70	| SAVEADDR
	DEX				// $82C2FF  CA		| 
	DEX				// $82C300  CA		| 
	BPL code_82C2FA			// $82C301  10 F7	| 
	STA.l $700008			// $82C303  8F 08 00 70	| SAVEADDR
	RTS				// $82C307  60		| 

data_82C308:				//----------------------| identifier (ウミハラV3.0)
	db $B3,$D0,$CA,$D7,$56,$33,$2E,$30

code_82C310:				//----------------------| 
	REP #$30			// $82C310  C2 30	| 
	LDX.w #$000A			// $82C312  A2 0A 00	| 
	LDY.w #$0000			// $82C315  A0 00 00	| 
code_82C318:				//			| 
	LDA.l $700000,x			// $82C318  BF 00 00 70	| SAVEADDR
	BEQ code_82C322			// $82C31C  F0 04	| 
	INY				// $82C31E  C8		| 
	TAX				// $82C31F  AA		| 
	BRA code_82C318			// $82C320  80 F6	| 
code_82C322:				//			| 
	TXA				// $82C322  8A		| 
	CMP.w #$000A			// $82C323  C9 0A 00	| 
	BEQ code_82C32D			// $82C326  F0 05	| 
	CLC				// $82C328  18		| 
	ADC.l $700002,x			// $82C329  7F 02 00 70	| SAVEADDR
code_82C32D:				//			| 
	STA.w $0270			// $82C32D  8D 70 02	| RAM ADDRESS
	STY.w $0272			// $82C330  8C 72 02	| RAM ADDRESS
	RTS				// $82C333  60		| 

code_82C334:				//----------------------| 
	REP #$30			// $82C334  C2 30	| 
	LDY.w #$0000			// $82C336  A0 00 00	| 
	LDA.l $7EAFFE			// $82C339  AF FE AF 7E	| RAM ADDRESS
	INC				// $82C33D  1A		| 
	INC				// $82C33E  1A		| 
	AND.w #$07FE			// $82C33F  29 FE 07	| 
	TAX				// $82C342  AA		| 
	LDA.l $7EB000,x			// $82C343  BF 00 B0 7E	| RAM ADDRESS
	INC				// $82C347  1A		| 
	BNE code_82C34B			// $82C348  D0 01	| 
	DEY				// $82C34A  88		| 
code_82C34B:				//			| 
	LDA.l $7EAFFE			// $82C34B  AF FE AF 7E	| RAM ADDRESS
	TAX				// $82C34F  AA		| 
code_82C350:				//			| 
	INY				// $82C350  C8		| 
	CPY.w #$0200			// $82C351  C0 00 02	| 
	BEQ code_82C361			// $82C354  F0 0B	| 
	LDA.l $7EB000,x			// $82C356  BF 00 B0 7E	| RAM ADDRESS
	TAX				// $82C35A  AA		| 
	BPL code_82C350			// $82C35B  10 F3	| 
	STY.w $0274			// $82C35D  8C 74 02	| RAM ADDRESS
	RTS				// $82C360  60		| 

code_82C361:				//			| 
	JSR code_82C3BD			// $82C361  20 BD C3	| 
	BRA code_82C334			// $82C364  80 CE	| 


code_82C366:				//----------------------| 
	REP #$30			// $82C366  C2 30	| 
	TAY				// $82C368  A8		| 
	LDA.l $7EAFFE			// $82C369  AF FE AF 7E	| RAM ADDRESS
	TAX				// $82C36D  AA		| 
code_82C36E:				//			| 
	DEY				// $82C36E  88		| 
	BMI code_82C378			// $82C36F  30 07	| 
	LDA.l $7EB000,x			// $82C371  BF 00 B0 7E	| RAM ADDRESS
	TAX				// $82C375  AA		| 
	BPL code_82C36E			// $82C376  10 F6	| 
code_82C378:				//			| 
	TXA				// $82C378  8A		| 
	BMI code_82C3B6			// $82C379  30 3B	| 
	STX.b $80			// $82C37B  86 80	| RAM ADDRESS
	INC				// $82C37D  1A		| 
	INC				// $82C37E  1A		| 
	AND.w #$07FE			// $82C37F  29 FE 07	| 
	PHA				// $82C382  48		| 
	TAX				// $82C383  AA		| 
	LDA.l $7EB000,x			// $82C384  BF 00 B0 7E	| RAM ADDRESS
	CMP.w #$FFFF			// $82C388  C9 FF FF	| 
	BEQ code_82C3B5			// $82C38B  F0 28	| 
	TAY				// $82C38D  A8		| 
	SEC				// $82C38E  38		| 
	SBC.b $80			// $82C38F  E5 80	| RAM ADDRESS
	AND.w #$07FE			// $82C391  29 FE 07	| 
	CPY.w #$0000			// $82C394  C0 00 00	| 
	BPL code_82C39B			// $82C397  10 02	| 
	INC				// $82C399  1A		| 
	INC				// $82C39A  1A		| 
code_82C39B:				//			| 
	STA.b $82			// $82C39B  85 82	| RAM ADDRESS
	PLA				// $82C39D  68		| 
	INC				// $82C39E  1A		| 
	INC				// $82C39F  1A		| 
	AND.w #$07FE			// $82C3A0  29 FE 07	| 
	TAX				// $82C3A3  AA		| 
	LDA.l $7EB000,x			// $82C3A4  BF 00 B0 7E	| RAM ADDRESS
	STA.b $84			// $82C3A8  85 84	| RAM ADDRESS
	BIT.w #$2000			// $82C3AA  89 00 20	| 
	BEQ code_82C3B3			// $82C3AD  F0 04	| 
	INC.b $82			// $82C3AF  E6 82	| RAM ADDRESS
	INC.b $82			// $82C3B1  E6 82	| RAM ADDRESS
code_82C3B3:				//			| 
	CLC				// $82C3B3  18		| 
	RTS				// $82C3B4  60		| 
code_82C3B5:				//			| 
	PLA				// $82C3B5  68		| 
code_82C3B6:				//			| 
	LDA.w #$FFFF			// $82C3B6  A9 FF FF	| 
	STA.b $84			// $82C3B9  85 84	| RAM ADDRESS
	SEC				// $82C3BB  38		| 
	RTS				// $82C3BC  60		| 


code_82C3BD:				//----------------------| 
	REP #$30			// $82C3BD  C2 30	| 
	LDA.w #$FFFF			// $82C3BF  A9 FF FF	| 
	STA.l $7EB000			// $82C3C2  8F 00 B0 7E	| RAM ADDRESS
	STA.l $7EB002			// $82C3C6  8F 02 B0 7E	| RAM ADDRESS
	LDA.w #$0000			// $82C3CA  A9 00 00	| 
	STA.l $7EAFFC			// $82C3CD  8F FC AF 7E	| RAM ADDRESS
	STA.l $7EAFFE			// $82C3D1  8F FE AF 7E	| RAM ADDRESS
	RTL				// $82C3D5  6B		| 






code_82C5FC:				//----------------------| 
	SEC				// $82C5FC  38		| 
	RTS				// $82C5FD  60		| 
code_82C5FE:				//----------------------| 
	REP #$30			// $82C5FE  C2 30	| 
	STX.b $80			// $82C600  86 80	| RAM ADDRESS
	STY.b $82			// $82C602  84 82	| RAM ADDRESS
	LDX.w #$0010			// $82C604  A2 10 00	| 
	LDA.w #$000A			// $82C607  A9 0A 00	| 
code_82C60A:				//			| 
	TAX				// $82C60A  AA		| 
	LDA.l $700000,x			// $82C60B  BF 00 00 70	| SAVEADDR
	BNE code_82C60A			// $82C60F  D0 F9	| 
	STX.b $84			// $82C611  86 84	| RAM ADDRESS
	TXA				// $82C613  8A		| 
	CMP.w #$000A			// $82C614  C9 0A 00	| 
	BNE code_82C61E			// $82C617  D0 05	| 
	LDA.w #$000C			// $82C619  A9 0C 00	| 
	BRA code_82C623			// $82C61C  80 05	| 
code_82C61E:				//			| 
	CLC				// $82C61E  18		| 
	ADC.l $700002,x			// $82C61F  7F 02 00 70	| SAVEADDR
code_82C623:				//			| 
	TAX				// $82C623  AA		| 
	STX.b $86			// $82C624  86 86	| RAM ADDRESS
	CLC				// $82C626  18		| 
	ADC.w #$000C			// $82C627  69 0C 00	| 
	CLC				// $82C62A  18		| 
	ADC.b $82			// $82C62B  65 82	| RAM ADDRESS
	CMP.w #$0801			// $82C62D  C9 01 08	| 
	CLV				// $82C630  B8		| 
	BCC code_82C646			// $82C631  90 13	| 
	LDA.w #$0800			// $82C633  A9 00 08	| 
	SEC				// $82C636  38		| 
	SBC.b $86			// $82C637  E5 86	| RAM ADDRESS
	CMP.w #$0018			// $82C639  C9 18 00	| 
	BCC code_82C5FC			// $82C63C  90 BE	| 
	SEC				// $82C63E  38		| 
	SBC.w #$000C			// $82C63F  E9 0C 00	| 
	STA.b $82			// $82C642  85 82	| RAM ADDRESS
	SEP #$40			// $82C644  E2 40	| 
code_82C646:				//			| 
	PHP				// $82C646  08		| 
	LDA.b $80			// $82C647  A5 80	| RAM ADDRESS
	BPL code_82C64E			// $82C649  10 03	| 
	JMP code_82C6D5			// $82C64B  4C D5 C6	| 
code_82C64E:				//----------------------| 
	JSR code_82C2BA			// $82C64E  20 BA C2	| 
	LDA.b $80			// $82C651  A5 80	| RAM ADDRESS
	AND.w #$07FF			// $82C653  29 FF 07	| 
	STA.b $80			// $82C656  85 80	| RAM ADDRESS
	LDA.w #$0000			// $82C658  A9 00 00	| 
	STA.l $700000,x			// $82C65B  9F 00 00 70	| SAVEADDR
	LDA.b $82			// $82C65F  A5 82	| RAM ADDRESS
	CLC				// $82C661  18		| 
	ADC.w #$000C			// $82C662  69 0C 00	| 
	STA.l $700002,x			// $82C665  9F 02 00 70	| SAVEADDR
	LDA.l $7E5700			// $82C669  AF 00 57 7E	| RAM ADDRESS
	STA.l $700004,x			// $82C66D  9F 04 00 70	| SAVEADDR
	LDA.l $7E5702			// $82C671  AF 02 57 7E	| RAM ADDRESS
	STA.l $700006,x			// $82C675  9F 06 00 70	| SAVEADDR
	LDA.l $7E5704			// $82C679  AF 04 57 7E	| RAM ADDRESS
	STA.l $700008,x			// $82C67D  9F 08 00 70	| SAVEADDR
	LDA.l $7E5706			// $82C681  AF 06 57 7E	| RAM ADDRESS
	STA.l $70000A,x			// $82C685  9F 0A 00 70	| SAVEADDR
	TXA				// $82C689  8A		| 
	CLC				// $82C68A  18		| 
	ADC.w #$000C			// $82C68B  69 0C 00	| 
	TAX				// $82C68E  AA		| 
	LDY.b $82			// $82C68F  A4 82	| RAM ADDRESS
code_82C691:				//			| 
	PHX				// $82C691  DA		| 
	LDX.b $80			// $82C692  A6 80	| RAM ADDRESS
	TXA				// $82C694  8A		| 
	INC				// $82C695  1A		| 
	INC				// $82C696  1A		| 
	AND.w #$07FF			// $82C697  29 FF 07	| 
	STA.b $80			// $82C69A  85 80	| RAM ADDRESS
	LDA.l $7EB000,x			// $82C69C  BF 00 B0 7E	| RAM ADDRESS
	PLX				// $82C6A0  FA		| 
	STA.l $700000,x			// $82C6A1  9F 00 00 70	| SAVEADDR
	INX				// $82C6A5  E8		| 
	INX				// $82C6A6  E8		| 
	DEY				// $82C6A7  88		| 
	DEY				// $82C6A8  88		| 
	BNE code_82C691			// $82C6A9  D0 E6	| 
	PLP				// $82C6AB  28		| 
	PHP				// $82C6AC  08		| 
	PHX				// $82C6AD  DA		| 
	LDX.b $86			// $82C6AE  A6 86	| RAM ADDRESS
	LDA.l $70000C,x			// $82C6B0  BF 0C 00 70	| SAVEADDR
	BVC code_82C6BD			// $82C6B4  50 07	| 
	ORA.w #$2000			// $82C6B6  09 00 20	| 
	STA.l $70000C,x			// $82C6B9  9F 0C 00 70	| SAVEADDR
code_82C6BD:				//			| 
	PLX				// $82C6BD  FA		| 
	BIT.w #$2000			// $82C6BE  89 00 20	| 
	BEQ code_82C6CA			// $82C6C1  F0 07	| 
	LDA.w #$00FF			// $82C6C3  A9 FF 00	| 
	STA.l $6FFFFE,x			// $82C6C6  9F FE FF 6F	| SAVEADDR
code_82C6CA:				//			| 
	LDX.b $84			// $82C6CA  A6 84	| RAM ADDRESS
	LDA.b $86			// $82C6CC  A5 86	| RAM ADDRESS
	STA.l $700000,x			// $82C6CE  9F 00 00 70	| SAVEADDR
	JSR code_82C2C5			// $82C6D2  20 C5 C2	| 
code_82C6D5:				//----------------------| 
	PLP				// $82C6D5  28		| 
	CLC				// $82C6D6  18		| 
	RTS				// $82C6D7  60		| 


code_82C6D8:				//----------------------| 
	PLB				// $82C6D8  AB		| 
code_82C6D9:				//			| 
	SEC				// $82C6D9  38		| 
	RTS				// $82C6DA  60		| 
code_82C6DB:				//----------------------| 
	REP #$30			// $82C6DB  C2 30	| 
	STA.b $80			// $82C6DD  85 80	| RAM ADDRESS
	LDA.w $0272			// $82C6DF  AD 72 02	| RAM ADDRESS
	CLC				// $82C6E2  18		| 
	SBC.b $80			// $82C6E3  E5 80	| RAM ADDRESS
	TAY				// $82C6E5  A8		| 
	LDX.w #$000A			// $82C6E6  A2 0A 00	| 
code_82C6E9:				//			| 
	STX.b $82			// $82C6E9  86 82	| RAM ADDRESS
	LDA.l $700000,x			// $82C6EB  BF 00 00 70	| SAVEADDR
	BEQ code_82C6D9			// $82C6EF  F0 E8	| 
	TAX				// $82C6F1  AA		| 
	DEY				// $82C6F2  88		| 
	BPL code_82C6E9			// $82C6F3  10 F4	| 
	STX.b $80			// $82C6F5  86 80	| RAM ADDRESS
	JSR code_82C2BA			// $82C6F7  20 BA C2	| 
	PHB				// $82C6FA  8B		| 
	SEP #$20			// $82C6FB  E2 20	| 
	LDA.b #$70			// $82C6FD  A9 70	| 
	PHA				// $82C6FF  48		| 
	PLB				// $82C700  AB		| data bank set to $70xxxx here! (SRAM)
	REP #$20			// $82C701  C2 20	| 
	LDX.b $80			// $82C703  A6 80	| RAM ADDRESS
	LDA.w $0000,x			// $82C705  BD 00 00	| SAVEADDR
	BEQ code_82C733			// $82C708  F0 29	| 
code_82C70A:				//			| 
	STX.b $80			// $82C70A  86 80	| RAM ADDRESS
	TXY				// $82C70C  9B		| 
	TAX				// $82C70D  AA		| 
	LDA.w $0002,x			// $82C70E  BD 02 00	| SAVEADDR
	DEC				// $82C711  3A		| 
	BMI code_82C6D8			// $82C712  30 C4	| 
	MVN $70,$70			// $82C714  54 70 70	| lol i wasnt expecting this to happen
	LDX.b $80			// $82C717  A6 80	| RAM ADDRESS
	LDA.w $0000,x			// $82C719  BD 00 00	| SAVEADDR
	BEQ code_82C738			// $82C71C  F0 1A	| 
	TAX				// $82C71E  AA		| 
	LDA.w $0000,x			// $82C71F  BD 00 00	| SAVEADDR
	STA.w $0000,y			// $82C722  99 00 00	| SAVEADDR
	LDX.b $80			// $82C725  A6 80	| RAM ADDRESS
	LDA.w $0000,x			// $82C727  BD 00 00	| SAVEADDR
	PHA				// $82C72A  48		| 
	TYA				// $82C72B  98		| 
	STA.w $0000,x			// $82C72C  9D 00 00	| SAVEADDR
	PLA				// $82C72F  68		| 
	TYX				// $82C730  BB		| 
	BRA code_82C70A			// $82C731  80 D7	| 
code_82C733:				//			| 
	LDX.b $82			// $82C733  A6 82	| RAM ADDRESS
	STZ.w $0000,x			// $82C735  9E 00 00	| SAVEADDR
code_82C738:				//			| 
	PLB				// $82C738  AB		| 
	JSR code_82C2C5			// $82C739  20 C5 C2	| 
	CLC				// $82C73C  18		| 
	RTS				// $82C73D  60		| 


code_82C73E:				//----------------------| 
	REP #$30			// $82C73E  C2 30	| 
	STA.b $80			// $82C740  85 80	| RAM ADDRESS
	LDA.w $0272			// $82C742  AD 72 02	| RAM ADDRESS
	CLC				// $82C745  18		| 
	SBC.b $80			// $82C746  E5 80	| RAM ADDRESS
	TAY				// $82C748  A8		| 
	LDX.w #$000A			// $82C749  A2 0A 00	| 
code_82C74C:				//			| 
	LDA.l $700000,x			// $82C74C  BF 00 00 70	| SAVEADDR
	BEQ code_82C766			// $82C750  F0 14	| 
	TAX				// $82C752  AA		| 
	DEY				// $82C753  88		| 
	BPL code_82C74C			// $82C754  10 F6	| 
	STX.b $80			// $82C756  86 80	| RAM ADDRESS
	LDA.l $700002,x			// $82C758  BF 02 00 70	| SAVEADDR
	STA.b $82			// $82C75C  85 82	| RAM ADDRESS
	LDA.l $70000C,x			// $82C75E  BF 0C 00 70	| SAVEADDR
	STA.b $84			// $82C762  85 84	| RAM ADDRESS
	CLC				// $82C764  18		| 
	RTS				// $82C765  60		| 
code_82C766:				//			| 
	SEC				// $82C766  38		| 
	RTS				// $82C767  60		| 






data_82D996:				//----------------------| initial PPU reg parameters for TNN logo
	db $00,$8F			// $82D996		| format: 21xx,value
	db $05,$01			// $82D998		| 
	db $06,$00			// $82D99A		| 
	db $07,$40			// $82D99C		| 
	db $0B,$00			// $82D99E		| 
	db $0D,$C4			// $82D9A0		| 
	db $0D,$FF			// $82D9A2		| 
	db $0E,$A8			// $82D9A4		| 
	db $0E,$FF			// $82D9A6		| 
	db $23,$00			// $82D9A8		| 
	db $24,$00			// $82D9AA		| 
	db $25,$00			// $82D9AC		| 
	db $2C,$01			// $82D9AE		| only layer 1 enabled
	db $2D,$00			// $82D9B0		| 
	db $2E,$00			// $82D9B2		| 
	db $2F,$00			// $82D9B4		| 
	db $30,$00			// $82D9B6		| 
	db $31,$00			// $82D9B8		| 
	db $33,$00			// $82D9BA		| 
	db $FF				// $82D9BC		| 

code_82D9BD:				//----------------------| TNN logo code (load/display/wait)
	REP #$30			// $82D9BD  C2 30	| 
	PHK				// $82D9BF  4B		| 
	PLB				// $82D9C0  AB		| 
	SEP #$30			// $82D9C1  E2 30	| 
	LDX.b #$00			// $82D9C3  A2 00	| 
	LDY.w data_82D996,x		// $82D9C5  BC 96 D9	| 
code_82D9C8:				//			| 
	INX				// $82D9C8  E8		| 
	LDA.w data_82D996,x		// $82D9C9  BD 96 D9	| 
	INX				// $82D9CC  E8		| 
	STA.w $2100,y			// $82D9CD  99 00 21	| 
	LDY.w data_82D996,x		// $82D9D0  BC 96 D9	| 
	BPL code_82D9C8			// $82D9D3  10 F3	| 
	SEP #$20			// $82D9D5  E2 20	| 
	LDA.b #$80			// $82D9D7  A9 80	| 
	STA.w $2115			// $82D9D9  8D 15 21	| 
	REP #$30			// $82D9DC  C2 30	| 
	STZ.w $2116			// $82D9DE  9C 16 21	| 
	LDX.w #$0010			// $82D9E1  A2 10 00	| 
code_82D9E4:				//			| 
	STZ.w $2118			// $82D9E4  9C 18 21	| 
	DEX				// $82D9E7  CA		| 
	BNE code_82D9E4			// $82D9E8  D0 FA	| 
	LDA.w #$2000			// $82D9EA  A9 00 20	| 
	STA.w $2116			// $82D9ED  8D 16 21	| 
	LDX.w #$0000			// $82D9F0  A2 00 00	| 
code_82D9F3:				//			| 
	LDA.l data_97E660,x		// $82D9F3  BF 60 E6 97	| TNN logo graphics
	STA.w $2118			// $82D9F7  8D 18 21	| 
	INX				// $82D9FA  E8		| 
	INX				// $82D9FB  E8		| 
	CPX.w #data_97E660.size		// $82D9FC  E0 C0 0C	| 
	BCC code_82D9F3			// $82D9FF  90 F2	| 
	LDA.w #$4000			// $82DA01  A9 00 40	| 
	STA.w $2116			// $82DA04  8D 16 21	| 
	LDX.w #$0400			// $82DA07  A2 00 04	| 
code_82DA0A:				//			| 
	STZ.w $2118			// $82DA0A  9C 18 21	| 
	DEX				// $82DA0D  CA		| 
	BNE code_82DA0A			// $82DA0E  D0 FA	| 
	LDA.w #$4000			// $82DA10  A9 00 40	| 
	STA.w $2116			// $82DA13  8D 16 21	| 
	LDX.w #$0000			// $82DA16  A2 00 00	| 
code_82DA19:				//			| 
	LDA.w data_82DABA,x		// $82DA19  BD BA DA	| TNN logo tilemap
	STA.w $2118			// $82DA1C  8D 18 21	| 
	INX				// $82DA1F  E8		| 
	INX				// $82DA20  E8		| 
	CPX.w #data_82DABA.size		// $82DA21  E0 80 01	| 
	BCC code_82DA19			// $82DA24  90 F3	| 
	PHB				// $82DA26  8B		| 
	LDX.w #data_97E640		// $82DA27  A2 40 E6	| src = data_97E640
	LDY.w #$5200			// $82DA2A  A0 00 52	| dst = $7E5200
	LDA.w #$001F			// $82DA2D  A9 1F 00	| 
	MVN $7E,data_97E640>>16		// $82DA30  54 7E 97	| TNN logo palette
	PLB				// $82DA33  AB		| 
	LDX.w #$001E			// $82DA34  A2 1E 00	| 
code_82DA37:				//			| inverse the logo palette.
	LDA.l $7E5200,x			// $82DA37  BF 00 52 7E	| RAM ADDRESS
	EOR.w #$7FFF			// $82DA3B  49 FF 7F	| why not have inverse as default? prolly lazy fix
	STA.l $7E5200,x			// $82DA3E  9F 00 52 7E	| RAM ADDRESS
	DEX				// $82DA42  CA		| 
	DEX				// $82DA43  CA		| 
	BPL code_82DA37			// $82DA44  10 F1	| 
	LDY.w #code_808A99-1		// $82DA46  A0 98 8A	| 
	JSL code_808A04			// $82DA49  22 04 8A 80	| 
	LDY.w #code_808A42-1		// $82DA4D  A0 41 8A	| 
	JSL code_808A04			// $82DA50  22 04 8A 80	| 
	LDY.w #code_808A63-1		// $82DA54  A0 62 8A	| 
	JSL code_808A04			// $82DA57  22 04 8A 80	| 
	LDY.w #code_808A81-1		// $82DA5B  A0 80 8A	| 
	JSL code_808A04			// $82DA5E  22 04 8A 80	| 
	REP #$30			// $82DA62  C2 30	| 
	LDA.w #$0106			// $82DA64  A9 06 01	| 
	STA.w $4209			// $82DA67  8D 09 42	| 
	SEP #$20			// $82DA6A  E2 20	| 
	STZ.w $0201			// $82DA6C  9C 01 02	| RAM ADDRESS
	LDA.w $4210			// $82DA6F  AD 10 42	| 
	LDA.b #$81			// $82DA72  A9 81	| 
	STA.w $4200			// $82DA74  8D 00 42	| 
	STZ.w $021C			// $82DA77  9C 1C 02	| RAM ADDRESS
	STZ.w $020C			// $82DA7A  9C 0C 02	| RAM ADDRESS
	JSL code_808178			// $82DA7D  22 78 81 80	| goes to game mode jumper? (returns next frame)
	SEP #$20			// $82DA81  E2 20	| 
	LDA.b #$0F			// $82DA83  A9 0F	| 
	STA.w $2100			// $82DA85  8D 00 21	| 
	REP #$30			// $82DA88  C2 30	| 
	LDY.w #$00F0			// $82DA8A  A0 F0 00	| how long TNN logo should display
code_82DA8D:				//			| 
	PHY				// $82DA8D  5A		| 
	TYA				// $82DA8E  90		| 
	CMP.w #$0010			// $82DA8F  C9 10 00	| 
	BCS code_82DA99			// $82DA92  B0 05	| 
	SEP #$20			// $82DA94  E2 20	| 
	STA $2100			// $82DA96  8D 00 21	| 
code_82DA99:				//			| 
	JSL code_808178			// $82DA99  22 78 81 80	| game mode jumper (return next frame)
	REP #$30			// $82DA9D  C2 30	| 
	LDY.w #code_808BC0-1		// $82DA9F  A0 BF 8B	| 
	JSL code_808A04			// $82DAA2  22 04 8A 80	| 
	LDA.w $0244			// $82DAA6  AD 44 02	| RAM ADDRESS
	PLY				// $82DAA9  7A		| 
	BIT.w #$9080			// $82DAAA  89 80 90	|\ if B, start, or A pressed on port 1
	BNE code_82DAB2			// $82DAAD  D0 03	|/ skip TNN logo
	DEY				// $82DAAF  88		| 
	BNE code_82DA8D			// $82DAB0  D0 DB	| 
code_82DAB2:				//			| 
	LDY.w #code_808A27-1		// $82DAB2  A0 26 8A	| 
	JSL code_808A04			// $82DAB5  22 04 8A 80	| 
	RTL				// $82DAB9  6B		| 

//--------------------------------------------------------------| MAP for TNN logo
insert data_82DABA, "DATA/data_82DABA.bin"







pad($838000, $00)
warnpc($838000)