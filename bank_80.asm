org($808000)

RESET:					//=ROM======RAW=BYTES===| 
	SEI				// $808000  78		| 
	CLC				// $808001  18		|
	XCE				// $808002  FB		| 
	REP #$30			// $808003  C2 30	| 
	CLD				// $808005  D8		| 
	LDA.w #$1FFF			// $808006  A9 FF 1F	| 
	TCS				// $808009  1B		| 
	PHK				// $80800A  4B		| 
	PLB				// $80800B  AB		| 
	SEP #$20			// $80800C  E2 20	| 
	STZ.w $4200			// $80800E  9C 00 42	| 
	STZ.w $420B			// $808011  9C 0B 42	| 
	STZ.w $420C			// $808014  9C 0C 42	| 
	STZ.w $420D			// $808017  9C 0D 42	| 
	REP #$20			// $80801A  C2 20	| 
	LDA.w #$0106			// $80801C  A9 06 01	| IRQ fires on scanline 262 (prolly temporary)
	STA.w $4209			// $80801F  8D 09 42	| 
	SEP #$20			// $808022  E2 20	| 
	REP #$10			// $808024  C2 10	| 
	LDX.w #$0007			// $808026  A2 07 00	| 
code_808029:				//			| 
	LDA.w data_80845C,x		// $808029  BD 5C 84	| check Shift-JIS string
	CMP.w $0208,x			// $80802C  DD 08 02	| RAM ADDRESS
	BNE code_808036			// $80802F  D0 05	| 
	DEX				// $808031  CA		| 
	BPL code_808029			// $808032  10 F5	| 
	BRA code_80803C			// $808034  80 06	| 
code_808036:				//			| 
	JSL code_82C3BD			// $808036  22 BD C3 82	| 
	BRA code_808040			// $80803A  80 04	| 
code_80803C:				//			| 
	JSL code_82C3BD			// $80803C  22 BD C3 82	| 
code_808040:				//			| 
	REP #$30			// $808040  C2 30	| 
	LDX.w #$0000			// $808042  A2 00 00	| 
	LDA.w #$0000			// $808045  A9 00 00	| 
code_808048:				//			| 
	STA.l $7E0000,x			// $808048  9F 00 00 7E	| clear ram $7E0000-$7E17FF
	INX				// $80804C  E8		| 
	INX				// $80804D  E8		| 
	CPX.w #$1800			// $80804E  E0 00 18	| 
	BNE code_808048			// $808051  D0 F5	| 
	LDX.w #$1A02			// $808053  A2 02 1A	| $7E1800-$7E1A01 isnt cleared
code_808056:				//			| 
	STA.l $7E0000,x			// $808056  9F 00 00 7E	| clear ram $7E1A02-$7E7FFF
	INX				// $80805A  E8		| 
	INX				// $80805B  E8		| 
	CPX.w #$8000			// $80805C  E0 00 80	| 
	BNE code_808056			// $80805F  D0 F5	| 
	LDX.w #$0000			// $808061  A2 00 00	| $7E8000-$7EFFFF isnt cleared
	LDA.w #$0000			// $808064  A9 00 00	| 
code_808067:				//			|
	STA.l $7F0000,x			// $808067  9F 00 00 7F	| clear all of bank $7F
	INX				// $80806B  E8		| 
	INX				// $80806C  E8		| 
	BNE code_808067			// $80806D  D0 F8	| 
	SEP #$20			// $80806F  E2 20	| 
	LDX.w #$0007			// $808071  A2 07 00	| 
code_808074:				//			| 
	LDA.w data_80845C,x		// $808074  BD 5C 84	| store Shift-JIS string
	STA.w $0208,x			// $808077  9D 08 02	| RAM ADDRESS
	DEX				// $80807A  CA		| 
	BPL code_808074			// $80807B  10 F7	| 
	REP #$30			// $80807D  C2 30	| 
	LDX.w #$8000			// $80807F  A2 00 80	| 
	STZ.w $2116			// $808082  9C 16 21	| 
code_808085:				//			| 
	STZ.w $2118			// $808085  9C 18 21	| 
	DEX				// $808088  CA		| 
	BNE code_808085			// $808089  D0 FA	| 
	REP #$30			// $80808B  C2 30	| stack setup code below
	LDX.w #$1E38			// $80808D  A2 38 1E	| 
	LDY.w #$1F00			// $808090  A0 00 1F	| 
code_808093:				//			| 
	LDA.w #$8000			// $808093  A9 00 80	| 
	STA.b $06,x			// $808096  95 06	| RAM ADDRESS
	STA.b $03,x			// $808098  95 03	| RAM ADDRESS
	LDA.w #code_808197-1		// $80809A  A9 96 81	| 
	STA.b $05,x			// $80809D  95 05	| RAM ADDRESS
	STZ.b $01,x			// $80809F  74 01	| RAM ADDRESS
	STX.b $00,y			// $8080A1  96 00	| RAM ADDRESS
	INY				// $8080A3  C8		| 
	INY				// $8080A4  C8		| 
	TXA				// $8080A5  8A		| 
	CLC				// $8080A6  18		| 
	ADC.w #$0040			// $8080A7  69 40 00	| 
	TAX				// $8080AA  AA		| 
	CPY.w #$1F08			// $8080AB  C0 08 1F	| 
	BNE code_808093			// $8080AE  D0 E3	| 
	LDA.w #code_8084DF-1		// $8080B0  A9 DE 84	| first game mode loc
	STA.w $1E3D			// $8080B3  8D 3D 1E	| RAM ADDRESS
	JSL code_1D8000			// $8080B6  22 00 80 1D	| upload SPC engine
	REP #$30			// $8080BA  C2 30	| 
	STZ.w $1A00			// $8080BC  9C 00 1A	| RAM ADDRESS
	STZ.w $1A04			// $8080BF  9C 04 1A	| RAM ADDRESS
	STZ.w $1A06			// $8080C2  9C 06 1A	| RAM ADDRESS
	JSL code_8088E5			// $8080C5  22 E5 88 80	| 
	SEP #$20			// $8080C9  E2 20	| 
	STZ.w $021C			// $8080CB  9C 1C 02	| RAM ADDRESS
	STZ.w $210C			// $8080CE  9C 0C 21	| 
	STZ.w $0201			// $8080D1  9C 01 02	| RAM ADDRESS
	LDA.w $4210			// $8080D4  AD 10 42	| 
	LDA.b #$81			// $8080D7  A9 81	| 
	STA.w $4200			// $8080D9  8D 00 42	| 
	CLI				// $8080DC  58		| 
	REP #$30			// $8080DD  C2 30	| 
	LDA.w #$FFFF			// $8080DF  A9 FF FF	| 
	STA.w $024A			// $8080E2  8D 4A 02	| RAM ADDRESS
	STA.w $024A			// $8080E5  8D 4A 02	| RAM ADDRESS
code_8080E8:				//----------------------| 
	SEP #$20			// $8080E8  E2 20	| 
	LDA.w $0200			// $8080EA  AD 00 02	| RAM ADDRESS
code_8080ED:				//			| this is the NMI wait loop
	CMP.w $0200			// $8080ED  CD 00 02	| RAM ADDRESS
	BEQ code_8080ED			// $8080F0  F0 FB	| 
	LDA.b #$01			// $8080F2  A9 01	| 
code_8080F4:				//			| 
	BIT.w $4212			// $8080F4  2C 12 42	| wait for joypad automatic read to finish
	BNE code_8080F4			// $8080F7  D0 FB	| 
	REP #$20			// $8080F9  C2 20	| store joypad regs to RAM
	LDA.w $4218			// $8080FB  AD 18 42	| [port 1]
	AND.w #$FFF0			// $8080FE  29 F0 FF	| 
	STA.w $0240			// $808101  8D 40 02	| RAM ADDRESS
	XBA				// $808104  EB		|\ 
	AND.w #$4040			// $808105  29 40 40	|| [port1] Y mimics A button, X mimics B button
	ASL				// $808108  0A		|| 
	ORA.w $0240			// $808109  0D 40 02	|| RAM ADDRESS
	STA.w $0240			// $80810C  8D 40 02	|/ RAM ADDRESS
	LDA.w $421A			// $80810F  AD 1A 42	| [port 2]
	AND.w #$FFF0			// $808112  29 F0 FF	| 
	STA.w $0242			// $808115  8D 42 02	| RAM ADDRESS
	XBA				// $808118  EB		|\ 
	AND.w #$4040			// $808119  29 40 40	|| [port2] Y mimics A button, X mimics B button
	ASL				// $80811C  0A		|| 
	ORA.w $0242			// $80811D  0D 42 02	|| RAM ADDRESS
	STA.w $0242			// $808120  8D 42 02	|/ RAM ADDRESS
	LDA.w $4016			// $808123  AD 16 40	| read joypad ports again
	AND.w #$0101			// $808126  29 01 01	| to determine if connected
	SEP #$20			// $808129  E2 20	| 
	TSB.w $0240			// $80812B  0C 40 02	| RAM ADDRESS
	XBA				// $80812E  EB		| 
	TSB.w $0242			// $80812F  0C 42 02	| RAM ADDRESS
	REP #$20			// $808132  C2 20	| 
	LDA.w $0240			// $808134  AD 40 02	| RAM ADDRESS
	STA.w $024C			// $808137  8D 4C 02	| RAM ADDRESS
	LDA.w $0242			// $80813A  AD 42 02	| RAM ADDRESS
	STA.w $024E			// $80813D  8D 4E 02	| RAM ADDRESS
	REP #$30			// $808140  C2 30	| 
	LDA.w $1A06			// $808142  AD 06 1A	| RAM ADDRESS
	BPL code_808165			// $808145  10 1E	| 
	AND.w #$7FFF			// $808147  29 FF 7F	| 
	STA.w $1A06			// $80814A  8D 06 1A	| RAM ADDRESS
	AND.w #$00FF			// $80814D  29 FF 00	| 
	TAX				// $808150  AA		| 
	LDA.l data_8089C9,x		// $808151  BF C9 89 80	| 
	AND.w #$00FF			// $808155  29 FF 00	| 
	STA.w $1902			// $808158  8D 02 19	| RAM ADDRESS
	LDA.w #$0001			// $80815B  A9 01 00	| 
	STA.w $1900			// $80815E  8D 00 19	| RAM ADDRESS
	JSL code_1D8004			// $808161  22 04 80 1D	| 
code_808165:				//			| 
	REP #$30			// $808165  C2 30	| 
	LDX.w #$1F00			// $808167  A2 00 1F	| 
code_80816A:				//			| 
	TSC				// $80816A  3B		| 
	STX.w $1F10			// $80816B  8E 10 1F	| RAM ADDRESS
	STA.w $1F12			// $80816E  8D 12 1F	| RAM ADDRESS
	LDA.b $00,x			// $808171  B5 00	| RAM ADDRESS
	TCS				// $808173  1B		| 
	PLP				// $808174  28		| 
	PLD				// $808175  2B		| 
	PLB				// $808176  AB		| 
	RTL				// $808177  6B		| apparently this is the game jumper...

code_808178:				//======================| 
	PHB				// $808178  8B		| 
	PHD				// $808179  0B		| 
	PHP				// $80817A  08		| 
	REP #$30			// $80817B  C2 30	| 
	PHK				// $80817D  4B		| 
	PLB				// $80817E  AB		| 
	LDA.w #$0000			// $80817F  A9 00 00	| 
	TCD				// $808182  5B		| 
	LDX.w $1F10			// $808183  AE 10 1F	| RAM ADDRESS
	TSC				// $808186  3B		| 
	STA.b $00,x			// $808187  95 00	| RAM ADDRESS
	LDA.w $1F12			// $808189  AD 12 1F	| RAM ADDRESS
	TCS				// $80818C  1B		| 
	INX				// $80818D  E8		| 
	INX				// $80818E  E8		| 
	CPX.w #$1F08			// $80818F  E0 08 1F	| 
	BNE code_80816A			// $808192  D0 D6	| 
	JMP code_8080E8			// $808194  4C E8 80	| 

code_808197:				//----------------------| 
	JSL code_808178			// $808197  22 78 81 80	| 
	BRA code_808197			// $80819B  80 FA	| infinite loop??

code_80819D:				//----------------------| 
	BIT.b #$40			// $80819D  89 40	| 
	BEQ code_8081A4			// $80819F  F0 03	| 
	JMP code_8083D8			// $8081A1  4C D8 83	| 

code_8081A4:				//----------------------| 
	REP #$30			// $8081A4  C2 30	| 
	PLY				// $8081A6  7A		| 
	PLX				// $8081A7  FA		| 
	PLB				// $8081A8  AB		| 
	PLD				// $8081A9  2B		| 
	PLA				// $8081AA  68		| 
	RTI				// $8081AB  40		| 

NMI:					//======================| 
	REP #$30			// $8081AC  C2 30	| 
	PHA				// $8081AE  48		| 
	PHD				// $8081AF  0B		| 
	PHB				// $8081B0  8B		| 
	LDA.w #$0000			// $8081B1  A9 00 00	| 
	TCD				// $8081B4  5B		| 
	PHK				// $8081B5  4B		| 
	PLB				// $8081B6  AB		| 
	PHX				// $8081B7  DA		| 
	PHY				// $8081B8  5A		| 
	SEP #$20			// $8081B9  E2 20	| 
	LDA.w $4210			// $8081BB  AD 10 42	| 
	INC.w $0200			// $8081BE  EE 00 02	| RAM ADDRESS
	LDA.w $0201			// $8081C1  AD 01 02	| RAM ADDRESS
	BPL code_80819D			// $8081C4  10 D7	| 
	REP #$30			// $8081C6  C2 30	| 
	STZ.w $2102			// $8081C8  9C 02 21	| 
	LDA.w #$0400			// $8081CB  A9 00 04	| 
	STA.w $4310			// $8081CE  8D 10 43	| 
	SEP #$20			// $8081D1  E2 20	| 
	LDX.w #$1BE0			// $8081D3  A2 E0 1B	| INDIRECT RAM ADDRESS
	STX.w $4312			// $8081D6  8E 12 43	| 
	STZ.w $4314			// $8081D9  9C 14 43	| 
	LDX.w #$0220			// $8081DC  A2 20 02	| 
	STX.w $4315			// $8081DF  8E 15 43	| 
	LDA.b #$02			// $8081E2  A9 02	| 
	STA.w $420B			// $8081E4  8D 0B 42	| 
	JSR code_8083EC			// $8081E7  20 EC 83	| 2115b [80] and 4300w [1801] set in here
	REP #$30			// $8081EA  C2 30	| below uploads Kawase's GFX
	LDA.w $0226			// $8081EC  AD 26 02	| RAM ADDRESS
	BMI code_80824A			// $8081EF  30 59	| 
	ORA.w #$8000			// $8081F1  09 00 80	| 
	STA.w $0226			// $8081F4  8D 26 02	| RAM ADDRESS
	CMP.w #$FFFF			// $8081F7  C9 FF FF	| 
	BNE code_808207			// $8081FA  D0 0B	| 
	LDA.w #$6000			// $8081FC  A9 00 60	| INDIRECT RAM ADDRESS
	STA.w $4302			// $8081FF  8D 02 43	| 
	LDA.w #$007E			// $808202  A9 7E 00	| 
	BRA code_808211			// $808205  80 0A	| 
code_808207:				//			| 
	CLC				// $808207  18		| 
	ADC.w #data_8F8000&$7FFF	// $808208  69 00 00	| prolly used to be #$8000, but set above with ORA
	STA.w $4302			// $80820B  8D 02 43	| 
	LDA.w #data_8F8000>>16		// $80820E  A9 8F 00	| cuz Kawase's GFX are at $8F8000
code_808211:				//			| 
	STA.w $4304			// $808211  8D 04 43	| 
	LDX.w #$0001			// $808214  A2 01 00	| 
	LDY.w #$0060			// $808217  A0 60 00	| 
	LDA.w #$0010			// $80821A  A9 10 00	| 
	STA.w $2116			// $80821D  8D 16 21	| 
	STY.w $4305			// $808220  8C 05 43	| 
	STX.w $420B			// $808223  8E 0B 42	| 
	LDA.w #$0110			// $808226  A9 10 01	| 
	STA.w $2116			// $808229  8D 16 21	| 
	STY.w $4305			// $80822C  8C 05 43	| 
	STX.w $420B			// $80822F  8E 0B 42	| 
	LDA.w #$0210			// $808232  A9 10 02	| 
	STA.w $2116			// $808235  8D 16 21	| 
	STY.w $4305			// $808238  8C 05 43	| 
	STX.w $420B			// $80823B  8E 0B 42	| 
	LDA.w #$0310			// $80823E  A9 10 03	| 
	STA.w $2116			// $808241  8D 16 21	| 
	STY.w $4305			// $808244  8C 05 43	| 
	STX.w $420B			// $808247  8E 0B 42	| 
code_80824A:				//			| below uploads GFX for Kawase's arm (and death ani?)
	LDA.w $0228			// $80824A  AD 28 02	| RAM ADDRESS
	BMI code_808280			// $80824D  30 31	| 
	ORA.w #$8000			// $80824F  09 00 80	| 
	STA.w $0228			// $808252  8D 28 02	| RAM ADDRESS
	CLC				// $808255  18		| 
	ADC.w #data_99D049&$7FFF	// $808256  69 49 50	| 
	STA.w $4302			// $808259  8D 02 43	| 
	LDA.w #data_99D049>>16		// $80825C  A9 99 00	| 
	STA.w $4304			// $80825F  8D 04 43	| 
	LDX.w #$0001			// $808262  A2 01 00	| 
	LDY.w #$0040			// $808265  A0 40 00	| 
	LDA.w #$0400			// $808268  A9 00 04	| 
	STA.w $2116			// $80826B  8D 16 21	| 
	STY.w $4305			// $80826E  8C 05 43	| 
	STX.w $420B			// $808271  8E 0B 42	| 
	LDA.w #$0500			// $808274  A9 00 05	| 
	STA.w $2116			// $808277  8D 16 21	| 
	STY.w $4305			// $80827A  8C 05 43	| 
	STX.w $420B			// $80827D  8E 0B 42	| 
code_808280:				//			| below uploads GFX for fishing lure
	LDA.w $022A			// $808280  AD 2A 02	| RAM ADDRESS
	BMI code_8082B6			// $808283  30 31	| 
	ORA.w #$8000			// $808285  09 00 80	| 
	STA.w $022A			// $808288  8D 2A 02	| RAM ADDRESS
	CLC				// $80828B  18		| 
	ADC.w #data_9BD9AF&$7FFF	// $80828C  69 AF 59	| 
	STA.w $4302			// $80828F  8D 02 43	| 
	LDA.w #data_9BD9AF>>16		// $808292  A9 9B 00	| 
	STA.w $4304			// $808295  8D 04 43	| 
	LDX.w #$0001			// $808298  A2 01 00	| 
	LDY.w #$0040			// $80829B  A0 40 00	| 
	LDA.w #$0420			// $80829E  A9 20 04	| 
	STA.w $2116			// $8082A1  8D 16 21	| 
	STY.w $4305			// $8082A4  8C 05 43	| 
	STX.w $420B			// $8082A7  8E 0B 42	| 
	LDA.w #$0520			// $8082AA  A9 20 05	| 
	STA.w $2116			// $8082AD  8D 16 21	| 
	STY.w $4305			// $8082B0  8C 05 43	| 
	STX.w $420B			// $8082B3  8E 0B 42	| 
code_8082B6:				//			| below uploads GFX for fishing hook
	LDA.w $022C			// $8082B6  AD 2C 02	| RAM ADDRESS
	BMI code_8082E0			// $8082B9  30 25	| 
	ORA.w #$8000			// $8082BB  09 00 80	| 
	STA.w $022C			// $8082BE  8D 2C 02	| RAM ADDRESS
	CLC				// $8082C1  18		| 
	ADC.w #data_9BD9AF&$7FFF	// $8082C2  69 AF 59	| 
	STA.w $4302			// $8082C5  8D 02 43	| 
	LDA.w #data_9BD9AF>>16		// $8082C8  A9 9B 00	| 
	STA.w $4304			// $8082CB  8D 04 43	| 
	LDX.w #$0001			// $8082CE  A2 01 00	| 
	LDY.w #$0020			// $8082D1  A0 20 00	| 
	LDA.w #$0100			// $8082D4  A9 00 01	| 
	STA.w $2116			// $8082D7  8D 16 21	| 
	STY.w $4305			// $8082DA  8C 05 43	| 
	STX.w $420B			// $8082DD  8E 0B 42	| 
code_8082E0:				//			| below uploads GFX for fishing line
	LDA.w $0220			// $8082E0  AD 20 02	| RAM ADDRESS
	BEQ code_808340			// $8082E3  F0 5B	| 
	LDX.w #$1000			// $8082E5  A2 00 10	| INDIRECT RAM ADDRESS
	STX.w $4302			// $8082E8  8E 02 43	| 
	STZ.w $4304			// $8082EB  9C 04 43	| 
	LDX.w #$0001			// $8082EE  A2 01 00	| 
	LDY.w #$0010			// $8082F1  A0 10 00	| 
	LDA.w #$0040			// $8082F4  A9 40 00	|
code_8082F7:				//			| 
	STA.w $2116			// $8082F7  8D 16 21	| 
	STY.w $4305			// $8082FA  8C 05 43	| 
	STX.w $420B			// $8082FD  8E 0B 42	| 
	EOR.w #$0100			// $808300  49 00 01	| 
	STA.w $2116			// $808303  8D 16 21	| 
	STY.w $4305			// $808306  8C 05 43	| 
	STX.w $420B			// $808309  8E 0B 42	| 
	EOR.w #$0110			// $80830C  49 10 01	| 
	STA.w $2116			// $80830F  8D 16 21	| 
	STY.w $4305			// $808312  8C 05 43	| 
	STX.w $420B			// $808315  8E 0B 42	| 
	EOR.w #$0100			// $808318  49 00 01	| 
	STA.w $2116			// $80831B  8D 16 21	| 
	STY.w $4305			// $80831E  8C 05 43	| 
	STX.w $420B			// $808321  8E 0B 42	| 
	CLC				// $808324  18		| 
	ADC.w #$FF10			// $808325  69 10 FF	| 
	CMP.w $0220			// $808328  CD 20 02	| RAM ADDRESS
	BCC code_8082F7			// $80832B  90 CA	| 
	LDA.w $0222			// $80832D  AD 22 02	| RAM ADDRESS
	BEQ code_80833D			// $808330  F0 0B	| 
	STA.w $0220			// $808332  8D 20 02	| RAM ADDRESS
	STZ.w $0222			// $808335  9C 22 02	| RAM ADDRESS
	LDA.w #$0240			// $808338  A9 40 02	| 
	BRA code_8082F7			// $80833B  80 BA	| 
code_80833D:				//			| 
	STZ.w $0220			// $80833D  9C 20 02	| RAM ADDRESS
code_808340:				//			| below updates time/scores during gameplay
	LDA.w $0201			// $808340  AD 01 02	| RAM ADDRESS
	BIT.w #$0010			// $808343  89 10 00	| 
	BEQ code_80837E			// $808346  F0 36	| 
	LDX.w #$0300			// $808348  A2 00 03	| INDIRECT RAM ADDRESS
	STX.w $4302			// $80834B  8E 02 43	| 
	STZ.w $4304			// $80834E  9C 04 43	| 
	LDX.w #$0001			// $808351  A2 01 00	| 
	LDA.w #$05F6			// $808354  A9 F6 05	|\ 
	LDY.w #$000C			// $808357  A0 0C 00	|| 
	STA.w $2116			// $80835A  8D 16 21	|| high score
	STY.w $4305			// $80835D  8C 05 43	|| 
	STX.w $420B			// $808360  8E 0B 42	|/ 
	LDA.w #$05A7			// $808363  A9 A7 05	|\ 
	STA.w $2116			// $808366  8D 16 21	|| score
	STY.w $4305			// $808369  8C 05 43	|| 
	STX.w $420B			// $80836C  8E 0B 42	|/ 
	LDA.w #$05B8			// $80836F  A9 B8 05	|\ 
	LDY.w #$0008			// $808372  A0 08 00	|| 
	STA.w $2116			// $808375  8D 16 21	|| time
	STY.w $4305			// $808378  8C 05 43	|| 
	STX.w $420B			// $80837B  8E 0B 42	|/ 
code_80837E:				//			| CGRAM uploader
	SEP #$10			// $80837E  E2 10	| 
	LDA.w $0238			// $808380  AD 38 02	| RAM ADDRESS
	BMI code_8083AE			// $808383  30 29	| 
	TAX				// $808385  AA		| 
	STX $2121			// $808386  8E 21 21	| 
	ASL				// $808389  0A		| 
	CLC				// $80838A  18		| 
	ADC.w #$5200			// $80838B  69 00 52	| INDIRECT RAM ADDRESS
	STA.w $4302			// $80838E  8D 02 43	| 
	LDX.b #$7E			// $808391  AD 7E	| 
	STX.w $4304			// $808393  8E 04 43	| 
	LDA.w #$2200			// $808396  A9 00 22	| 
	STA.w $4300			// $808399  8D 00 43	| 
	LDA.w $023A			// $80839C  AD 3A 02	| RAM ADDRESS
	ASL				// $80839F  0A		| 
	STA.w $4305			// $8083A0  8D 05 43	| 
	LDX.b #$01			// $8083A3  A2 01	| 
	STX.w $420B			// $8083A5  8E 0B 42	| 
	LDA.w #$8000			// $8083A8  A9 00 80	| 
	TSB.w $0238			// $8083AB  0C 38 02	| RAM ADDRESS
code_8083AE:				//			| 
	LDX.w $0210			// $8083AE  AE 10 02	| RAM ADDRESS
	STX.w $210D			// $8083B1  8E 0D 21	| 
	LDX.w $0211			// $8083B4  AE 11 02	| RAM ADDRESS
	STX.w $210D			// $8083B7  8E 0D 21	| 
	LDA.w $0212			// $8083BA  AD 12 02	| RAM ADDRESS
	DEC				// $8083BD  3A		| 
	TAX				// $8083BE  AA		| 
	STX.w $210E			// $8083BF  8E 0E 21	| 
	XBA				// $8083C2  EB		| 
	TAX				// $8083C3  AA		| 
	STX.w $210E			// $8083C4  8E 0E 21	| 
	LDA.w $0236			// $8083C7  AD 36 02	| RAM ADDRESS
	ORA.w #$8000			// $8083CA  09 00 80	| 
	STA.w $2102			// $8083CD  8D 02 21	| 
	SEP #$20			// $8083D0  E2 20	| 
	LDA.w $021C			// $8083D2  AD 1C 02	| RAM ADDRESS
	STA.w $420C			// $8083D5  8D 0C 42	| 
code_8083D8:				//			| 
	SEP #$20			// $8083D8  E2 20	| 
	LDA.b #$A1			// $8083DA  A9 A1	| 
	STA.w $4200			// $8083DC  8D 00 42	| 
	LDA.b #$0F			// $8083DF  A9 0F	| 
	STA.w $2100			// $8083E1  8D 00 21	| 
	REP #$30			// $8083E4  C2 30	| 
	PLY				// $8083E6  7A		| 
	PLX				// $8083E7  FA		| 
	PLB				// $8083E8  AB		| 
	PLD				// $8083E9  2B		| 
	PLA				// $8083EA  68		| 
	RTI				// $8083EB  40		| 

code_8083EC:				//----------------------| VRAM DMA buffer uploader
	SEP #$20			// $8083EC  E2 20	| 
	LDA.b #$80			// $8083EE  A9 80	| 
	STA.w $2115			// $8083F0  8D 15 21	| 
	REP #$30			// $8083F3  C2 30	| 
	LDA.w #$1801			// $8083F5  A9 01 18	| 
	STA.w $4300			// $8083F8  8D 00 43	| 
	LDX.w #$0280			// $8083FB  A2 80 02	| INDIRECT RAM ADDRESS
	LDY.b $00,x			// $8083FE  B4 00	| 
	BEQ code_808428			// $808400  F0 26	| 
code_808402:				//			| 
	LDY.b $00,x			// $808402  B4 00	| 
	STY.w $4305			// $808404  8C 05 43	| 
	LDY.b $02,x			// $808407  B4 02	| 
	STY.w $2116			// $808409  8C 16 21	| 
	SEP #$20			// $80840C  E2 20	| 
	LDY.b $04,x			// $80840E  B4 04	| 
	LDA.b $06,x			// $808410  B5 06	| 
	STY.w $4302			// $808412  8C 02 43	| 
	STA.w $4304			// $808415  8D 04 43	| 
	LDA.b #$01			// $808418  A9 01	| 
	STA.w $420B			// $80841A  8D 0B 42	| 
	REP #$21			// $80841D  C2 21	| 
	TXA				// $80841F  8A		| 
	ADC.w #$0007			// $808420  69 07 00	| 
	TAX				// $808423  AA		| 
	LDY.b $00,x			// $808424  B4 00	| 
	BNE code_808402			// $808426  D0 DA	| 
code_808428:				//			| reset DMA buffer when finished
	REP #$30			// $808428  C2 30	| 
	LDX.w #$0280			// $80842A  A2 80 02	| INDIRECT RAM ADDRESS
	STX.w $02F2			// $80842D  8E F2 02	| RAM ADDRESS
	STZ.b $00,x			// $808430  74 00	| 
	RTS				// $808432  60		| 

IRQ:					//======================| 
	SEP #$20			// $808433  E2 20	| 
	PHA				// $808435  48		| 
	LDA.l $004211			// $808436  AF 11 42 00	| 
	LDA.b #$81			// $80843A  A9 81	| 
	STA.l $004200			// $80843C  8F 00 42 00	| 
	LDA.l $00213F			// $808440  AF 3F 21 00	| 
code_808444:				//			| 
	LDA.l $002137			// $808444  AF 37 21 00	| 
	LDA.l $00213C			// $808448  AF 3C 21 00	| 
	LDA.l $00213C			// $80844C  AF 3C 21 00	| 
	LSR				// $808450  4A		| 
	BCC code_808444			// $808451  90 F1	| 
	LDA.w $0BC0			// $808453  AD C0 0B	| RAM ADDRESS
	STA.l $002100			// $808456  8F 00 21 00	| 
	PLA				// $80845A  68		| 
	RTI				// $80845B  40		| 

data_80845C:				//----------------------| game title in Shift-JIS (海腹川背)
	db $8A,$43,$95,$A0,$90,$EC,$94,$77


data_808464:				//----------------------| table of PPU register:value pairs for initializing
	db $00,$8F			// $808464		| 1st byte is $21xx, 2nd is value
	db $01,$00			// $808466		| 
	db $05,$29			// $808468		| layer 2 uses 16x16 tiles
	db $06,$00			// $80846A		| 
	db $07,$41			// $80846C		| layer 1 MAP at VRAM $4000-$47FF
	db $08,$3C			// $80846E		| layer 2 MAP at VRAM $3C00-$3FFF
	db $09,$04			// $808470		| layer 3 MAP at VRAM $0400-$07FF
	db $0B,$40			// $808472		| layer 2 GFX in second half of VRAM
	db $0C,$00			// $808474		| 
	db $0D,$00			// $808476		| 
	db $0D,$00			// $808478		| 
	db $0E,$FF			// $80847A		| 
	db $0E,$FF			// $80847C		| 
	db $0F,$00			// $80847E		| 
	db $0F,$00			// $808480		| 
	db $10,$FF			// $808482		| 
	db $10,$FF			// $808484		| 
	db $11,$00			// $808486		| 
	db $11,$00			// $808488		| 
	db $12,$FF			// $80848A		| 
	db $12,$FF			// $80848C		| 
	db $13,$00			// $80848E		| 
	db $13,$00			// $808490		| 
	db $14,$FF			// $808492		| 
	db $14,$FF			// $808494		| 
	db $23,$00			// $808496		| 
	db $24,$00			// $808498		| 
	db $25,$00			// $80849A		| 
	db $2C,$00			// $80849C		| 
	db $2D,$00			// $80849E		| 
	db $2E,$00			// $8084A0		| 
	db $2F,$00			// $8084A2		| 
	db $30,$00			// $8084A4		| 
	db $31,$00			// $8084A6		| 
	db $33,$00			// $8084A8		| 
	db $FF				// $8084AA		| 
data_8084AB:				//			| same as above but for CPU registers
	db $00,$00			// $8084AB		| 1st byte is $42xx, 2nd is value
	db $0B,$00			// $8084AD		| 
	db $0C,$00			// $8084AF		| 
	db $0D,$01			// $8084B1		| FastROM enabled here
	db $FF				// $8084B3		| 

code_8084B4:				//======================| initializes all registers
	REP #$30			// $8084B4  C2 30	| 
	PHK				// $8084B6  4B		| 
	PLB				// $8084B7  AB		| 
	SEP #$30			// $8084B8  E2 30	| 
	LDX.b #$00			// $8084BA  A2 00	| 
	LDY.w data_808464,x		// $8084BC  BC 64 84	| 
code_8084BF:				//			| 
	INX				// $8084BF  E8		| 
	LDA.w data_808464,x		// $8084C0  BD 64 84	| 
	INX				// $8084C3  E8		| 
	STA.w $2100,y			// $8084C4  99 00 21	| 
	LDY.w data_808464,x		// $8084C7  BC 64 84	| 
	BPL code_8084BF			// $8084CA  10 F3	| 
	LDX.b #$00			// $8084CC  A2 00	| 
	LDY.w data_8084AB,x		// $8084CE  BC AB 84	| 
code_8084D1:				//			| 
	INX				// $8084D1  E8		| 
	LDA.w data_8084AB,x		// $8084D2  BD AB 84	| 
	INX				// $8084D5  E8		| 
	STA.w $4200,y			// $8084D6  99 00 42	| 
	LDY.w data_8084AB,x		// $8084D9  BC AB 84	| 
	BPL code_8084D1			// $8084DC  10 F3	| 
	RTS				// $8084DE  60		| 


code_8084DF:				//----------------------| start here
	REP #$30			// $8084DF  C2 30	| 
	LDA.w #$0000			// $8084E1  A9 00 00	| 
	STA.w $0255			// $8084E4  8D 55 02	| RAM ADDRESS
	LDA.w #$6158			// $8084E7  A9 58 61	| 
	STA.w $0254			// $8084EA  8D 54 02	| RAM ADDRESS
	JSR code_8084B4			// $8084ED  20 B4 84	| initialize registers
	JSL code_82D9BD			// $8084F0  22 BD D9 82	| TNN logo stuff
	JSR code_8084B4			// $8084F4  20 B4 84	| initialize registers again
	SEP #$20			// $8084F7  E2 20	| 
	STZ.w $025B			// $8084F9  9C 5B 02	| RAM ADDRESS
code_8084FC:				//			| 
	REP #$30			// $8084FC  C2 30	| 
	JSR code_80EBC6			// $8084FE  20 C6 EB	| title screen stuff
	REP #$30			// $808501  C2 30	|\ A has cursor pos (high bit set if 5 MIN)
	BIT.w #$00FF			// $808503  89 FF 00	|| 
	BEQ code_80851B			// $808506  F0 13	|| START
	BMI code_808516			// $808508  30 0C	|| START (5 MIN)
	JSR code_808840			// $80850A  20 40 88	|/ REPLAY
	BCC code_8084FC			// $80850D  90 ED	| 
	SEP #$20			// $80850F  E2 20	| 
	STA.w $025B			// $808511  8D 5B 02	| RAM ADDRESS
	BRA code_808522			// $808514  80 0C	| 
code_808516:				//			| 
	JSR code_8088B2			// $808516  20 B2 88	| 
	BRA code_8084FC			// $808519  80 E1	| 
code_80851B:				//			| 
//	ここ！

code_808522:				//			| 








code_8087F6:				//----------------------| 
	JSR code_808A2B			// $8087F6  20 2B 8A	| 
	SEP #$20			// $8087F9  E2 20	| 
	LDA.b #$10			// $8087FB  A9 10	| 
	TSB.w $0201			// $8087FD  0C 01 02	| RAM ADDRESS
	JSR code_808A99			// $808800  20 99 8A	| 
	JSR code_808A42			// $808803  20 42 8A	| 
	JSR code_808A63			// $808806  20 63 8A	| 
	REP #$20			// $808809  C2 20	| 
	LDA.w #$0106			// $80880B  A9 06 01	| 
	STA.w $4209			// $80880E  8D 09 42	| 
	SEP #$20			// $808811  E2 20	| 
	LDA.w $4210			// $808813  AD 10 42	| 
	LDA.b #$81			// $808816  A9 81	| 
	STA.w $4200			// $808818  8D 00 42	| 
	STZ.w $021C			// $80881B  9C 1C 02	| RAM ADDRESS
	STZ.w $210C			// $80881E  9C 0C 02	| 
	JSL code_808178			// $808821  22 78 81 80	| return next frame
	JSL code_81EC72			// $808825  22 72 EC 81	| 
	REP #$20			// $808829  C2 20	| 
	LDA.w #$FFFF			// $80882B  A9 FF FF	| 
	STA.w $0226			// $80882E  8D 26 02	| RAM ADDRESS
	STA.w $0228			// $808831  8D 28 02	| RAM ADDRESS
	STA.w $022A			// $808834  8D 2A 02	| RAM ADDRESS
	STA.w $022C			// $808837  8D 2C 02	| RAM ADDRESS
	STA.w $0238			// $80883A  8D 38 02	| RAM ADDRESS
	RTS				// $80883D  60		| 


code_80883E:				//----------------------| 
	CLC				// $80883E  18		| 
	RTS				// $80883F  60		| 
code_808840:				//			| code for REPLAY menu (from title screen)
	JSR code_808A27			// $808840  20 27 8A	| turn screen off
	JSR code_80E49A			// $808843  20 9A E4	| upload L3 GFX to buffer
	JSR code_80E501			// $808846  20 01 E5	| set up HDMA
	JSR code_809022			// $808849  20 22 90	| kill sprites
	JSR code_808A81			// $80884C  20 81 8A	| upload palette to CGRAM
	REP #$30			// $80884F  C2 30	| 
	STZ.w $0204			// $808851  9C 04 02	| RAM ADDRESS
	BRA code_80885E			// $808854  80 08	| 
code_808854:				//			| code for REPLAY menu (from level?)
	REP #$30			// $808856  C2 30	| 
	LDA.w #$8000			// $808858  A9 00 80	| 
	STA.w $0204			// $80885B  8D 04 02	| RAM ADDRESS
code_80885E:				//			| 
	JSR code_808A11			// $80885E  20 11 8A	| turn screen on
	JSL code_82AB1E			// $808861  22 1E AB 82	| 
	REP #$30			// $808865  C2 30	| 
	LDA.l $7E560C			// $808867  AF 0C 56 7E	| RAM ADDRESS
	BPL code_80883E			// $80886B  10 D1	| 
	BIT.w #$4000			// $80886D  89 00 40	| 
	BEQ code_808877			// $808870  F0 05	| 
	AND.w #$00FF			// $808872  29 FF 00	| 
	SEC				// $808875  38		| 
	RTS				// $808876  60		| 

code_808877:				//			| 
	SEP #$20			// $808877  E2 20	| 
	STA.w $025B			// $808879  8D 5B 02	| RAM ADDRESS
	REP #$30			// $80887C  C2 30	| 
	XBA				// $80887E  EB		| 
	LSR				// $80887F  4A		| 
	LSR				// $808880  4A		| 
	LSR				// $808881  4A		| 
	LSR				// $808882  4A		| 
	AND.w #$0001			// $808883  29 01 00	| 
	ORA.w #$8100			// $808886  09 00 81	| 
	STA.w $0204			// $808889  8D 04 02	| RAM ADDRESS
	PHK				// $80888C  4B		| 
	PLB				// $80888D  AB		| 
	JSR code_8087F6			// $80888E  20 F6 87	| 
	REP #$30			// $808891  C2 30	| 
	STZ.w $0257			// $808893  9C 57 02	| RAM ADDRESS
	LDA.w #$1000			// $808896  A9 00 10	| 
	STA.w $0259			// $808899  8D 59 02	| RAM ADDRESS
	JSL code_81EC81			// $80889C  22 81 EC 81	| 
//	ここ！





code_8088B2:				//----------------------| 
	JSL code_82AA9A			// $8088B2  22 9A AA 82	| 
//	ここ！







code_8088E5:				//----------------------| 
	REP #$30			// $8088E5  C2 30	| 
	STZ.w $1A00			// $8088E7  9C 00 1A	| RAM ADDRESS
	LDA.w #$0001			// $8088EA  A9 01 00	| 
	STA.w $1902			// $8088ED  8D 02 19	| RAM ADDRESS
	LDA.w #$0003			// $8088F0  A9 03 00	| 
	STA.w $1900			// $8088F3  8D 00 19	| RAM ADDRESS
	JSL code_1D8004			// $8088F6  22 04 80 1D	| 
	STZ.w $1902			// $8088FA  9C 02 19	| RAM ADDRESS
	LDA.w #$0002			// $8088FD  A9 02 00	| 
	STA.w $1900			// $808900  8D 00 19	| RAM ADDRESS
	JML code_1D8004			// $808903  5C 04 80 1D	| 

code_808907:				//======================| song player. A = song to play
	REP #$30			// $808907  C2 30	| 
	AND.w #$003F			// $808909  29 3F 00	| 
	PHA				// $80890C  48		| 
	LDA.w $1A00			// $80890D  AD 00 1A	| RAM ADDRESS
	ASL				// $808910  0A		| 
	LDA $01,s			// $808911  A3 01	| 
	BCC code_808937			// $808913  90 22	| 
	EOR.w $1A00			// $808915  4D 00 1A	| RAM ADDRESS
	BIT.w #$003F			// $808918  89 3F 00	| 
	BEQ code_808966			// $80891B  F0 49	| 
	REP #$30			// $80891D  C2 30	| 
	LDA.w #$0001			// $80891F  A9 01 00	| 
	STA.w $1902			// $808922  8D 02 19	| RAM ADDRESS
	LDA.w #$0004			// $808925  A9 04 00	| 
	STA.w $1900			// $808928  8D 00 19	| RAM ADDRESS
	JSL code_1D8004			// $80892B  22 04 80 1D	| 
code_80892F:				//			| 
	LDA.w $2143			// $80892F  AD 43 21	| 
	BIT.w #$0004			// $808932  89 04 00	| 
	BNE code_80892F			// $808935  D0 F8	| 
code_808937:				//			| 
	LDA.w $1A00			// $808937  AD 00 1A	| RAM ADDRESS
	AND.w #$FFC0			// $80893A  29 C0 FF	| 
	ORA $01,s			// $80893D  03 01	| 
	ORA.w #$8000			// $80893F  09 00 80	| 
	STA.w $1A00			// $808942  8D 00 1A	| RAM ADDRESS
	LDA.w #$0001			// $808945  A9 01 00	| 
	STA.w $1902			// $808948  8D 02 19	| RAM ADDRESS
	LDA.w #$0003			// $80894B  A9 03 00	| 
	STA.w $1900			// $80894E  8D 00 19	| RAM ADDRESS
	JSL code_1D8004			// $808951  22 04 80 1D	| 
	PLA				// $808955  68		| 
	AND.w #$00FF			// $808956  29 FF 00	| 
	STA.w $1902			// $808959  8D 02 19	| RAM ADDRESS
	LDA.w #$0002			// $80895C  A9 02 00	| 
	STA.w $1900			// $80895F  8D 00 19	| RAM ADDRESS
	JML code_1D8004			// $808962  5C 04 80 1D	| 
code_808966:				//			| 
	PLA				// $808966  68		| 
	RTL				// $808967  6B		| 


code_808968:				//======================| SFX player. A = SFX to play
	REP #$30			// $808968  C2 30	| 
	PHX				// $80896A  DA		| 
	AND.w #$00FF			// $80896B  29 FF 00	| 
	TAX				// $80896E  AA		| 
	CPX.w #$001B			// $80896F  E0 1B 00	| 
	BNE code_80897F			// $808972  D0 0B	| 
	LDA.w $1A06			// $808974  AD 06 1A	| RAM ADDRESS
	AND.w #$00FF			// $808977  29 FF 00	| 
	CMP.w #$0008			// $80897A  C9 08 00	| 
	BNE code_8089A7			// $80897D  D0 28	| 
code_80897F:				//			| 
	LDA.w $1A06			// $80897F  AD 06 1A	| RAM ADDRESS
	BMI code_80898A			// $808982  30 06	| 
	LDA.w $2143			// $808984  AD 43 21	| 
	LSR				// $808987  4A		| 
	BCC code_808996			// $808988  90 0C	| 
code_80898A:				//			| 
	LDA.l data_8089A9,x		// $80898A  BF A9 89 80	| 
	AND.w #$00FF			// $80898E  29 FF 00	| 
	CMP.w $1A04			// $808991  CD 04 1A	| RAM ADDRESS
	BCC code_8089A7			// $808994  90 11	| 
code_808996:				//			| 
	LDA.l data_8089A9,x		// $808996  BF A9 89 80	| 
	AND.w #$00FF			// $80899A  29 FF 00	| 
	STA.w $1A04			// $80899D  8D 04 1A	| RAM ADDRESS
	TXA				// $8089A0  8A		| 
	ORA.w #$8000			// $8089A1  09 00 80	| 
	STA.w $1A06			// $8089A4  8D 06 1A	| RAM ADDRESS
code_8089A7:				//			| 
	PLX				// $8089A7  FA		| 
	RTL				// $8089A8  6B		| 

data_8089A9:				//^^^^^^^^^^^^^^^^^^^^^^| 
	db $00,$10,$10,$10		// $8089A9		| 
	db $10,$20,$20,$18		// $8089AD		| 
	db $18,$18,$18,$14		// $8089B1		| 
	db $14,$15,$10,$11		// $8089B5		| 
	db $10,$11,$10,$12		// $8089B9		| 
	db $10,$12,$20,$20		// $8089BD		| 
	db $20,$21,$FF,$18		// $8089C1		| 
	db $10,$10,$10,$10		// $8089C5		| 

data_8089C9:				//----------------------| 
	db $1A,$01,$02,$03		// $8089C9		| 
	db $04,$05,$06,$07		// $8089CD		| 
	db $08,$09,$0A,$0B		// $8089D1		| 
	db $0C,$0D,$0E,$0F		// $8089D5		| 
	db $10,$11,$12,$13		// $8089D9		| 
	db $14,$15,$16,$17		// $8089DD		| 
	db $18,$19,$1A,$1A		// $8089E1		| 
	db $1A,$1A,$1A,$1A		// $8089E5		| 










code_808A04:				//======================| used by other banks to jump to addrs in this bank
	REP #$30			// $808A04  C2 30	| 
	PHA				// $808A06  48		| 
	PHY				// $808A07  5A		| Y contains address to jump to!
	PHA				// $808A08  48		| 
	LDA.w #code_808A10-1		// $808A09  A9 0F 8A	| store RTL address below
	STA $05,s			// $808A0C  83 05	| 
	PLA				// $808A0E  68		| 
	RTS				// $808A0F  60		| 
code_808A10:				//			| 
	RTL				// $808A10  6B		| 


code_808A11:				//======================| turn screen on
	SEP #$20			// $808A11  E2 20	| 
	LDA.b #$80			// $808A13  A9 80	| 
	TSB.w $0201			// $808A15  0C 01 02	| RAM ADDRESS
	JSL code_808178			// $808A18  22 78 81 80	| return next frame
	SEI				// $808A1C  78		| 
	LDA.b #$0F			// $808A1D  A9 0F	| 
	STA.w $2100			// $808A1F  8D 00 21	| 
	STA.w $0BC0			// $808A22  8D C0 0B	| RAM ADDRESS
	CLI				// $808A25  58		| 
	RTS				// $808A26  60		| 


code_808A27:				//======================| 
	JSL code_808178			// $808A27  22 78 81 80	| return next frame
code_808A2B:				//======================| NMI & F-blank enable (turn screen off)
	SEI				// $808A2B  78		| 
	SEP #$20			// $808A2C  E2 20	| 
	LDA.b #$80			// $808A2E  A9 80	| 
	TRB.w $0201			// $808A30  1C 01 02	| RAM ADDRESS
	LDA.b #$81			// $808A33  A9 81	| 
	STA.w $4200			// $808A35  8D 00 42	| 
	LDA.b #$8F			// $808A38  A9 8F	| 
	STA.w $2100			// $808A3A  8D 00 21	| 
	STZ.w $420C			// $808A3D  9C 0C 42	| 
	CLI				// $808A40  58		| 
	RTS				// $808A41  60		| 


code_808A42:				//----------------------| 
	REP #$30			// $808A42  C2 30	| 
	LDX.w #$1BE0			// $808A44  A2 E0 1B	| INDIRECT RAM ADDRESS
	LDA.w #$E000			// $808A47  A9 00 E0	| 
	LDY.w #$0080			// $808A4A  A0 80 00	| 
code_808A4D:				//			| 
	STA.b $00,x			// $808A4D  95 00	| RAM ADDRESS
	STZ.b $02,x			// $808A4F  74 02	| RAM ADDRESS
	INX				// $808A51  E8		| 
	INX				// $808A52  E8		| 
	INX				// $808A53  E8		| 
	INX				// $808A54  E8		| 
	DEY				// $808A55  88		| 
	BNE code_808A4D			// $808A56  D0 F5	| 
	LDY.w #$0020			// $808A58  A0 20 00	| 
code_808A5B:				//			| 
	STZ.b $00,x			// $808A5B  74 00	| 
	INX				// $808A5D  E8		| 
	INX				// $808A5E  E8		| 
	DEY				// $808A5F  88		| 
	BNE code_808A5B			// $808A60  D0 F9	| 
	RTS				// $808A62  60		| 

code_808A63:				//----------------------| 
	REP #$30			// $808A63  C2 30	| 
	LDX.w #$1BE0			// $808A65  A2 E0 1B	| INDIRECT RAM ADDRESS
	STZ.w $2102			// $808A68  9C 02 21	| 
	LDY.w #$0110			// $808A6B  A0 10 01	| 
code_808A6E:				//			| 
	REP #$20			// $808A6E  C2 20	| 
	LDA.b $00,x			// $808A70  B5 00	| RAM ADDRESS
	SEP #$20			// $808A72  E2 20	| 
	STA.w $2104			// $808A74  8D 04 21	| 
	XBA				// $808A77  EB		| 
	STA.w $2104			// $808A78  8D 04 21	| 
	INX				// $808A7B  E8		| 
	INX				// $808A7C  E8		| 
	DEY				// $808A7D  88		| 
	BNE code_808A6E			// $808A7E  D0 EE	| 
	RTS				// $808A80  60		| 


code_808A81:				//----------------------| upload palette to CGRAM
	SEP #$20			// $808A81  E2 20	| 
	REP #$10			// $808A83  C2 10	| 
	STZ.w $2121			// $808A85  9C 21 21	| 
	LDX.w #$0000			// $808A88  A2 00 00	| 
code_808A8B:				//			| 
	LDA.l $7E5200,x			// $808A8B  BF 00 52 7E	| RAM ADDRESS
	STA.w $2122			// $808A8F  8D 22 21	| 
	INX				// $808A92  E8		| 
	CPX.w #$0200			// $808A93  E0 00 02	| 
	BNE code_808A8B			// $808A96  D0 F3	| 
	RTS				// $808A98  60		| 


code_808A99:				//----------------------| resets VRAM DMA buffer
	REP #$30			// $808A99  C2 30	| 
	LDX.w #$0280			// $808A9B  A2 80 02	| INDIRECT RAM ADDRESS
	STX.w $02F2			// $808A9E  8E F2 02	| RAM ADDRESS
	STZ.b $00,x			// $808AA1  74 00	| RAM ADDRESS
	RTS				// $808AA3  60		| 

code_808AA4:				//======================| VRAM DMA buffer handler
	REP #$30			// $808AA4  C2 30	| A = srcaddr, X = vramaddr, Y = bytes, stack = srcbank
	PHA				// $808AA6  48		| 
	PHX				// $808AA7  DA		| 
	LDX.w $02F2			// $808AA8  AE F2 02	| RAM ADDRESS
	CPX.w #$02F0			// $808AAB  E0 F0 02	| INDIRECT RAM ADDRESS
	BEQ code_808ACC			// $808AAE  F0 1C	| 
	STY.b $00,x			// $808AB0  94 00	| RAM ADDRESS
	STA.b $04,x			// $808AB2  95 04	| RAM ADDRESS
	LDA $01,s			// $808AB4  A3 01	| 
	STA.b $02,x			// $808AB6  95 02	| RAM ADDRESS
	STZ.b $07,x			// $808AB8  74 07	| RAM ADDRESS
	SEP #$20			// $808ABA  E2 20	| 
	LDA $08,s			// $808ABC  A3 08	| 
	STA.b $06,x			// $808ABE  95 06	| RAM ADDRESS
	REP #$21			// $808AC0  C2 21	| 
	TXA				// $808AC2  8A		| 
	ADC.w #$0007			// $808AC3  69 07 00	| 
	STA.w $02F2			// $808AC6  8D F2 02	| RAM ADDRESS
	PLX				// $808AC9  FA		| 
	PLA				// $808ACA  68		| 
	RTL				// $808ACB  6B		| 
code_808ACC:				//			| why not jump 3 bytes up...
	PLX				// $808ACC  FA		| 
	PLA				// $808ACD  68		| 
	RTL				// $808ACE  6B		| 








code_808BC0:				//======================| joypad RAM updater
	REP #$20			// $808BC0  C2 20	| 
	LDA.w $0240			// $808BC2  AD 40 02	| RAM ADDRESS
	AND.w $0248			// $808BC5  2D 48 02	| RAM ADDRESS
	STA.w $0244			// $808BC8  8D 44 02	| RAM ADDRESS
	LDA.w $0240			// $808BCB  AD 40 02	| RAM ADDRESS
	EOR.w #$FFFF			// $808BCE  49 FF FF	| 
	STA.w $0248			// $808BD1  8D 48 02	| RAM ADDRESS
	LDA.w $0242			// $808BD4  AD 42 02	| RAM ADDRESS
	AND.w $024A			// $808BD7  2D 4A 02	| RAM ADDRESS
	STA.w $0246			// $808BDA  8D 46 02	| RAM ADDRESS
	LDA.w $0242			// $808BDD  AD 02 42	| RAM ADDRESS
	EOR.w #$FFFF			// $808BE0  49 FF FF	| 
	STA.w $024A			// $808BE3  8D 4A 02	| 
	RTS				// $808BE6  60		| 








code_809022:				//----------------------| place all sprites offscreen
	REP #$30			// $809022  C3 30	| 
	LDX.w #$1BE0			// $809024  A2 E0 1B	| INDIRECT RAM ADDRESS
	LDA.w #$E000			// $809027  A9 00 E0	| 
code_80902A:				//			| 
	STA.b $00,x			// $80902A  95 00	| 
	INX				// $80902C  E8		| 
	INX				// $80902D  E8		| 
	INX				// $80902E  E8		| 
	INX				// $80902F  E8		| 
	CPX.w #$1DE0			// $809030  E0 E0 1D	| INDIRECT RAM ADDRESS
	BNE code_80902A			// $809033  D0 F5	| 
	RTS				// $809035  60		| 







code_809071:				//----------------------| 
	REP #$30			// $809071  C2 30	| 
	PHX				// $809073  DA		| 
	LDA.w $025B			// $809074  AD 5B 02	| RAM ADDRESS
	AND.w #$00FF			// $809077  29 FF 00	| 
	ASL				// $80907A  0A		| 
	TAX				// $80907B  AA		| 
	PLA				// $80907C  68		| 
	CLC				// $80907D  18		| 
	ADC.l data_81F218,x		// $80907E  7F 18 F2 81	| 
	TAX				// $809082  AA		| 
	RTL				// $809083  6B		| 


code_809084:				//----------------------| 
	REP #$30			// $809084  C2 30	| 
	LDA.w $025B			// $809086  AD 5B 02	| RAM ADDRESS
code_809089:				//			| 
	REP #$30			// $809089  C2 30	| 
	PHX				// $80908B  DA		| 
	AND #$00FF			// $80908C  29 FF 00	| 
	ASL				// $80908F  0A		| 
	TAX				// $809090  AA		| 
	PLA				// $809091  68		| 
	CLC				// $809092  18		| 
	ADC.l data_81F218,x		// $809093  7F 18 F2 81	| 
	TAX				// $809097  AA		| 
	LDA.l data_81F218&$FF0000,x	// $809098  BF 00 00 81	| weird ROM table read
	RTL				// $80909C  6B		| 


code_80909D:				//----------------------| 
	REP #$30			// $80909D  C2 30	| 
	LDA.w $025B			// $80909F  AD 5B 02	| 
code_8090A2:				//----------------------| 
	REP #$30			// $8090A2  C2 30	| 
	LDX.w #$0004			// $8090A4  A2 04 00	| 
	JSL code_809089			// $8090A7  22 89 90 80	| 
	AND.w #$00FF			// $8090AB  29 FF 00	| 
	RTL				// $8090AE  6B		| 








code_80E3AB:				//----------------------| This is the BG uploader (handles pal, gfx, map)
	PHK				// $80E3AB  4B		| 
	PLB				// $80E3AC  AB		| 
	SEP #$20			// $80E3AD  E2 20	| 
	STZ.w $210F			// $80E3AF  9C 0F 21	| 
	STZ.w $210F			// $80E3B2  9C 0F 21	| 
	LDA.b #$1F			// $80E3B5  A9 1F	| 
	STA.w $2110			// $80E3B7  8D 10 21	| 
	LDA.b #$01			// $80E3BA  A9 01	| 
	STA.w $2110			// $80E3BC  8D 10 21	| 
	REP #$30			// $80E3BF  C2 30	| 
	LDX.w #data_80E47A		// $80E3C1  A2 7A E4	| src = data_80E47A
	LDY.w #$5200			// $80E3C4  A0 00 52	| dst = $7E5200
	LDA.w #$001F			// $80E3C7  A9 1F 00	| 
	MVN $7E,data_80E47A>>16		// $80E3CA  54 7E 80	| 
	PHK				// $80E3CD  4B		| 
	PLB				// $80E3CE  AB		| 
	SEP #$20			// $80E3CF  E2 20	| 
	LDA.b #$80			// $80E3D1  A9 80	| 
	STA.w $2115			// $80E3D3  8D 15 21	| 
	REP #$30			// $80E3D6  C2 30	| 
	LDA.w #$4800			// $80E3D8  A9 00 48	| 
	STA.w $2116			// $80E3DB  8D 16 21	| 
	LDA.b $90			// $80E3DE  A5 90	| RAM ADDRESS
	BNE code_80E3FD			// $80E3E0  D0 1B	| 
	JSL code_808178			// $80E3E2  22 78 81 80	| return next frame if $90 clear
	LDX.w #$0003			// $80E3E6  A2 03 00	| 
	JSL code_809084			// $80E3E9  22 84 90 80	| 
	AND.w #$0007			// $80E3ED  29 07 00	| 
	ASL				// $80E3F0  0A		| 
	ASL				// $80E3F1  0A		| 
	TAX				// $80E3F2  AA		| 
	LDA.w data_80E45B,x		// $80E3F3  BD 5B E4	| 
	STA.b $90			// $80E3F6  85 90	| RAM ADDRESS
	LDA.w data_80E45B+1,x		// $80E3F8  BD 5C E4	| 
	STA.b $91			// $80E3FB  85 91	| RAM ADDRESS
code_80E3FD:				//			| 
	LDY.w #$0000			// $80E3FD  A0 00 00	| 
	LDX.w #$3800			// $80E400  A2 00 38	| 
code_80E403:				//			| 
	LDA [$90],y			// $80E403  B7 90	| RAM ADDRESS
	STA.w $2118			// $80E405  8D 18 21	| 
	INY				// $80E408  C8		| 
	INY				// $80E409  C8		| 
	DEX				// $80E40A  CA		| 
	BNE code_80E403			// $80E40B  D0 F6	| 
	LDA.w #$3F20			// $80E40D  A9 20 3F	| below code generates tilemap for BGs (shared)
	STA.w $2116			// $80E410  8D 16 21	| 
	LDA.w #$0080			// $80E413  A9 80 00	| 
	LDY.w #$0007			// $80E416  A0 07 00	| 
code_80E419:				//			| 
	PHY				// $80E419  5A		| 
	LDY.w #$0008			// $80E41A  A0 08 00	| 
code_80E41D:				//			| 
	STA.w $2118			// $80E41D  8D 18 21	| 
	INC				// $80E420  1A		| 
	INC				// $80E421  1A		| 
	DEY				// $80E422  88		| 
	BNE code_80E41D			// $80E423  D0 F8	| 
	CLC				// $80E425  18		| 
	ADC.w #$01B0			// $80E426  A9 B0 01	| 
	LDY.w #$0008			// $80E429  A0 08 00	| 
code_80E42C:				//			| 
	STA.w $2118			// $80E42C  8D 18 21	| 
	INC				// $80E42F  1A		| 
	INC				// $80E430  1A		| 
	DEY				// $80E431  88		| 
	BNE code_80E42C			// $80E432  D0 F8	| 
	CLC				// $80E434  18		| 
	ADC.w #$FF10			// $80E435  69 10 FF	| 
	LDY.w #$0008			// $80E438  A0 08 00	| 
code_80E43B:				//			| 
	STA.w $2118			// $80E43B  8D 18 21	| 
	INC				// $80E43E  1A		| 
	INC				// $80E43F  1A		| 
	DEY				// $80E440  88		| 
	BNE code_80E43B			// $80E441  D0 F8	| 
	CLC				// $80E443  18		| 
	ADC.w #$01B0			// $80E444  69 B0 01	| 
	LDY.w #$0008			// $80E447  A0 08 00	| 
code_80E44A:				//			| 
	STA.w $2118			// $80E44A  8D 18 21	| 
	INC				// $80E44D  1A		| 
	INC				// $80E44E  1A		| 
	DEY				// $80E44F  88		| 
	BNE code_80E44A			// $80E450  D0 F8	| 
	CLC				// $80E452  18		| 
	ADC.w #$FD70			// $80E453  69 70 FD	| 
	PLY				// $80E456  7A		| 
	DEY				// $80E457  88		| 
	BNE code_80E419			// $80E458  D0 BF	| 
	RTS				// $80E45A  60		| 

data_80E45B:				//^^^^^^^^^^^^^^^^^^^^^^| pointers to GFX for all the stage BGs
	dd data_838000			// $80E45B  00 80 83 00	| 
	dd data_858000			// $80E45F  00 80 85 00	| 
	dd data_868000			// $80E463  00 80 86 00	| 
	dd data_838000			// $80E467  00 80 83 00	| 
	dd data_848000			// $80E46B  00 80 84 00	| 
	dd data_878000			// $80E46F  00 80 87 00	| 
	dd data_888000			// $80E473  00 80 88 00	| 
	dl data_888000			// $80E477  00 80 88	| 

data_80E47A:				//^^^^^^^^^^^^^^^^^^^^^^| palette for stage BGs (shared)
	dw $0883,$0CA4,$10C5,$14E6,$1907,$1D28,$2149,$256A
	dw $298B,$2DAC,$31CD,$35EE,$3A0F,$3E30,$4251,$4672


code_80E49A:				//----------------------| upload select layer 3 GFX during levels
	PHK				// $80E49A  4B		| 
	PLB				// $80E49B  AB		| 
	SEP #$20			// $80E49C  E2 20	| 
	LDA.b #$80			// $80E49E  A9 80	| 
	STA.w $2115			// $80E4A0  8D 15 21	| 
	REP #$30			// $80E4A3  C2 30	| 
	STZ $2116			// $80E4A5  9C 16 21	| 
	LDX.w #$0010			// $80E4A8  A2 10 00	| 
code_80E4AB:				//			| 
	STZ.w $2118			// $80E4AB  9C 18 21	| 
	DEX				// $80E4AE  CA		| 
	BNE code_80E4AB			// $80E4AF  D0 FA	| 
	LDA.w #$0440			// $80E4B1  A9 40 04	| 
	STA.w $2116			// $80E4B4  8D 16 21	| 
	LDX.w #$0000			// $80E4B7  A2 00 00	| 
code_80E4BA:				//			| 
	LDA.w data_80E4DD,x		// $80E4BA  BD DD E4	| 
	AND.w #$00FF			// $80E4BD  29 FF 00	| 
	PHX				// $80E4C0  DA		| 
	ASL				// $80E4C1  0A		| 
	ASL				// $80E4C2  0A		| 
	ASL				// $80E4C3  0A		| 
	ASL				// $80E4C4  0A		| 
	TAX				// $80E4C5  AA		| 
	LDY.w #$0008			// $80E4C6  A0 08 00	| 
code_80E4C9:				//			| 
	LDA.l data_9BC203,x		// $80E4C9  BF 03 C2 9B	| layer 3 text
	STA.w $2118			// $80E4CD  8D 18 21	| 
	INX				// $80E4D0  E8		| 
	INX				// $80E4D1  E8		| 
	DEY				// $80E4D2  88		| 
	BNE code_80E4C9			// $80E4D3  D0 F4	| 
	PLX				// $80E4D5  FA		| 
	INX				// $80E4D6  E8		| 
	CPX.w #$0018			// $80E4D7  E0 18 00	| 
	BNE code_80E4BA			// $80E4DA  D0 DE	| 
	RTS				// $80E4DC  60		| 

data_80E4DD:				//^^^^^^^^^^^^^^^^^^^^^^| essentially, text chars to upload for levels (when not in REPLAY menu)
	db $50,$41,$55,$45,$5C,$46,$4C,$44
	db $60,$61,$62,$63,$64,$65,$66,$67
	db $68,$69,$6A,$6B,$48,$49,$53,$43

data_80E4F5:				//----------------------| ???
	db $50,$41,$55,$45,$5C,$00,$00,$00
	db $48,$49,$53,$43


code_80E501:				//----------------------| set up HDMA on channels 5,6,7
	PHK				// $80E501  4B		| 
	PLB				// $80E502  AB		| 
	REP #$30			// $80E503  C2 30	| 
	SEP #$20			// $80E505  E2 20	| 
	LDX.w #$0000			// $80E507  A2 00 00	| 
code_80E50A:				//			| 
	LDA.w data_80E5A3,x		// $80E50A  BD A3 E5	| 
	STA.w $0B80,x			// $80E50D  9D 80 0B	| RAM ADDRESS
	INX				// $80E510  E8		| 
	CPX.w #$0013			// $80E511  E0 13 00	| 
	BNE code_80E50A			// $80E514  D0 F4	| 
	LDX.w #$0000			// $80E516  A2 00 00	| 
code_80E519:				//			| 
	LDA.w data_80E5B6,x		// $80E519  BD B6 E5	| 
	STA.w $0B98,x			// $80E51C  9D 98 0B	| RAM ADDRESS
	INX				// $80E51F  E8		| 
	CPX.w #$0015			// $80E520  E0 15 00	| 
	BNE code_80E519			// $80E523  D0 F4	| 
	REP #$20			// $80E525  C2 20	| 
	LDA.w #$0F03			// $80E527  A9 03 0F	| 
	STA.w $4350			// $80E52A  8D 50 43	| 
	LDA.w #data_80E568		// $80E52D  A9 68 E5	| 
	STA.w $4352			// $80E530  8D 52 43	| 
	LDA.w #data_80E568>>16		// $80E533  A9 80 00	| 
	STA.w $4354			// $80E536  8D 54 43	| 
	LDA.w #$2C00			// $80E539  A9 00 2C	| 
	STA.w $4360			// $80E53C  8D 60 43	| 
	LDA.w #$0B80			// $80E53F  A9 80 0B	| INDIRECT RAM ADDRESS
	STA.w $4362			// $80E542  8D 62 43	| 
	LDA.w #$0000			// $80E545  A9 00 00	| 
	STA.w $4364			// $80E548  8D 64 43	| 
	LDA.w #$1103			// $80E54B  A9 03 11	| 
	STA.w $4370			// $80E54E  8D 70 43	| 
	LDA.w #$0B98			// $80E551  A9 98 0B	| INDIRECT RAM ADDRESS
	STA.w $4372			// $80E554  8D 72 43	| 
	LDA.w #$0000			// $80E557  A9 00 00	| 
	STA.w $4374			// $80E55A  8D 74 43	| 
	JSR code_80E5CB			// $80E55D  20 CB E5	| 
	SEP #$20			// $80E560  E2 20	| 
	LDA.b #$E0			// $80E562  A9 E0	| 
	STA.w $021C			// $80E564  8D 1C 02	| RAM ADDRESS
	RTS				// $80E567  60		| 

data_80E568:				//^^^^^^^^^^^^^^^^^^^^^^| HDMA table for layer 2 X/Y (static)
	db $70; dw $0000,$018F		// $80E568		| 
	db $01; dw $0100,$011F		// $80E56D		| 
	db $00				// $80E572		| 






data_80E595:				//^^^^^^^^^^^^^^^^^^^^^^| HDMA table for mainscreen (static), used for REPLAY menu in level
	db $50,$13			// $80E595		| L3 disabled
	db $40,$17			// $80E597		| show REPLAY menu
	db $01,$13			// $80E599		| L3 disabled
	db $00				// $80E59B		| 

data_80E59C:				//^^^^^^^^^^^^^^^^^^^^^^| HDMA table for mainscreen (static), used for REPLAY menu in titlescreen
	db $68,$13			// $80E59C		| L3 disabled
	db $40,$17			// $80E59E		| show REPLAY menu
	db $01,$13			// $80E5A0		| L3 disabled
	db $00				// $80E5A2		| 

data_80E5A3:				//^^^^^^^^^^^^^^^^^^^^^^| HDMA table for mainscreen (uploaded to RAM), used during level
	db $40,$13			// $80E5A3		| L3 disabled
	db $10,$17			// $80E5A5		| show lives, score, time
	db $20,$13			// $80E5A7		| 
	db $08,$17			// $80E5A9		| show FIELD/PAUSE
	db $18,$13			// $80E5AB		| 
	db $08,$17			// $80E5AD		| show high score
	db $01,$13			// $80E5AF		|\
	db $00,$17			// $80E5B1		|| L3 water depends on L1 Ypos, hence why this is in RAM
	db $01,$13			// $80E5B3		|/
	db $00				// $80E5B5		| 

data_80E5B6:				//^^^^^^^^^^^^^^^^^^^^^^| HDMA table for layer 3 X/Y (uploaded to RAM), used during level
	db $70; dw $0000,$001F		// $80E5B6		| lives, score, time
	db $20; dw $0000,$FFFF		// $80E5BB		| FIELD/PAUSE
	db $08; dw $0000,$FFE7		// $80E5C0		| high score
	db $08; dw $0000,$FFB7		// $80E5C5		| L3 water (Xpos varies, hence why this is in RAM)
	db $00				// $80E5CA		| 


code_80E5CB:				//----------------------| do L3 water stuff?
	REP #$30			// $80E5CB  C2 30	| 
	JSL code_81D397			// $80E5CD  22 97 D3 81	| 
	JSR code_80E706			// $80E5D1  20 06 E7	| 
	JSR code_80E730			// $80E5D4  20 30 E7	| 
	RTS				// $80E5D7  60		| 








data_80E6E6:				//----------------------| water images. latter byte is timer.framecount
	dl data_9C9CDC; db $54		// $80E6E6  DC 9C 9C 54	| 
	dl data_9C9CDC; db $54		// $80E6EA  DC 9C 9C 54	| 
	dl data_9C9CDC; db $54		// $80E6EE  DC 9C 9C 54	| 
	dl data_9C9CDC; db $54		// $80E6F2  DC 9C 9C 54	| 
	dl data_9C934E; db $86		// $80E6F6  4E 93 9C 86	| 
	dl data_9C934E; db $86		// $80E6FA  4E 93 9C 86	| 
	dl data_9C934E; db $86		// $80E6FE  4E 93 9C 86	| 
	dl data_9C934E; db $86		// $80E702  4E 93 9C 86	| 

code_80E706:				//----------------------| set up timer for water animation
	REP #$30			// $80E706  C2 30	| 
	LDA.w #$FFFF			// $80E708  A9 FF FF	| 
	STA.w $0BC2			// $80E70B  8D C2 0B	| RAM ADDRESS
	LDX.w #$0003			// $80E70E  A2 03 00	| 
	JSL code_809084			// $80E711  22 84 90 80	| 
	AND.w #$0007			// $80E715  29 07 00	| 
	ASL				// $80E718  0A		| 
	ASL				// $80E719  0A		| 
	TAY				// $80E71A  A8		| 
	LDA.w data_80E6E6+2,y		// $80E71B  B9 E8 E6	| 
	AND.w #$0F00			// $80E71E  29 00 0F	| 
	STA.w $0BC6			// $80E721  8D C6 0B	| RAM ADDRESS
	LDA.w data_80E6E6+3,y		// $80E724  B9 E9 E6	| 
	AND.w #$00F0			// $80E727  29 F0 00	| 
	LSR				// $80E72A  4A		| 
	LSR				// $80E72B  4A		| 
	STA.w $0BC4			// $80E72C  8D C4 0B	| RAM ADDRESS
code_80E72F:				//			| 
	RTS				// $80E72F  60		| 

code_80E730:				//			| upload and animate L3 water
	REP #$30			// $80E730  C2 30	| 
	LDA.w $0BC2			// $80E732  AD C2 0B	| RAM ADDRESS
	STA.b $80			// $80E735  85 80	| RAM ADDRESS
	CLC				// $80E737  18		| 
	ADC.w $0BC4			// $80E738  6D C4 0B	| RAM ADDRESS
	STA.w $0BC2			// $80E73B  8D C2 0B	| RAM ADDRESS
	EOR.b $80			// $80E73E  45 80	| RAM ADDRESS
	BIT.w #$FF00			// $80E740  89 00 FF	| 
	BEQ code_80E72F			// $80E743  F0 EA	| 
	LDA.w $0BC2			// $80E745  AD C2 0B	| RAM ADDRESS
	CMP.w $0BC6			// $80E748  CD C6 0B	| RAM ADDRESS
	BCC code_80E75D			// $80E74B  90 10	| 
	AND.w #$00FF			// $80E74D  29 FF 00	| 
	STA.w $0BC2			// $80E750  8D C2 0B	| RAM ADDRESS
	LDA.w $0BB0			// $80E753  AD B0 0B	| RAM ADDRESS
	CLC				// $80E756  18		| 
	ADC.w #$0010			// $80E757  69 10 00	| 
	STA.w $0BB0			// $80E75A  8D B0 0B	| RAM ADDRESS
code_80E75D:				//			| 
	LDX.w #$0003			// $80E75D  A2 03 00	| 
	JSL code_809084			// $80E760  22 84 90 80	| 
	AND.w #$0007			// $80E764  29 07 00	| 
	ASL				// $80E767  0A		| 
	ASL				// $80E768  0A		| 
	TAY				// $80E769  A8		| 
	LDA.w data_80E6E6+2,y		// $80E76A  B9 E8 E6	| 
	PHA				// $80E76D  48		| 
	LDA.w $0BC2			// $80E76E  AD C2 0B	| RAM ADDRESS
	AND.w #$FF00			// $80E771  29 00 FF	| 
	LSR				// $80E774  4A		| 
	LSR				// $80E775  4A		| 
	CLC				// $80E776  18		| 
	ADC.w data_80E6E6,y		// $80E777  79 E6 E6	| 
	LDX.w #$0540			// $80E77A  A2 40 05	| 
	LDY.w #$0040			// $80E77D  A0 40 00	| 
	JSL code_808AA4			// $80E780  22 A4 8A 80	| 
	REP #$30			// $80E784  C2 30	| 
	PLA				// $80E786  68		| 
	RTS				// $80E787  60		| 









code_80EBC6:				//----------------------| title screen code
	REP #$30			// $80EBC6  C2 30	| 
	PHK				// $80EBC8  4B		| 
	PLB				// $80EBC9  AB		| 
	JSR code_8087F6			// $80EBCA  20 F6 87	| 
	SEP #$20			// $80EBCD  E2 20	| 
	LDA.b #$10			// $80EBCF  A9 10	| 
	TRB.w $0201			// $80EBD1  1C 01 02	| RAM ADDRESS
	JSR code_80E49A			// $80EBD4  20 9A E4	| 
	JSR code_80E501			// $80EBD7  20 01 E5	| 
	JSR code_8083EC			// $80EBDA  20 EC 83	| 
	SEP #$20			// $80EBDD  E2 20	| 
	LDA.b #$20			// $80EBDF  A9 20	| only enable L2 X/Y HDMA
	STA.w $021C			// $80EBE1  8D 1C 02	| RAM ADDRESS
	JSL code_81EC72			// $80EBE4  22 72 EC 81	| 
	JSR code_80EC60			// $80EBE8  20 60 EC	| 
	JSR code_808A81			// $80EBEB  20 81 8A	| 
	JSR code_808A11			// $80EBEE  20 11 8A	| 
	REP #$30			// $80EBF1  C2 30	| 
	LDA.w #$0007			// $80EBF3  A9 07 00	| only L1/L2 enabled
	STA.w $212C			// $80EBF6  8D 2C 21	| 
	REP #$30			// $80EBF9  C2 30	| 
	STZ.w $0202			// $80EBFB  9C 02 02	| RAM ADDRESS
	STZ.w $0204			// $80EBFE  9C 04 02	| RAM ADDRESS
	STZ.w $0250			// $80EC01  9C 50 02	| RAM ADDRESS
	STZ.w $0270			// $80EC04  9C 70 02	| RAM ADDRESS
	LDA.w #$05DC			// $80EC07  A9 DC 05	| title screen timer
	STA.w $0272			// $80EC0A  8D 72 02	| RAM ADDRESS
	STZ.w $0274			// $80EC0D  9C 74 02	| RAM ADDRESS
	JSR code_80EDBA			// $80EC10  20 BA ED	| 
	LDA.w #$0005			// $80EC13  A9 05 00	| title screen song #
	JSL code_808907			// $80EC16  22 07 89 80	| 
code_80EC1A:				//			| 
	SEP #$20			// $80EC1A  E2 20	| 
	LDA.b #$80			// $80EC1C  A9 80	| 
	TSB.w $0201			// $80EC1E  0C 01 02	| RAM ADDRESS
	JSL code_808178			// $80EC21  22 78 81 80	| return next frame
	SEP #$20			// $80EC25  E2 20	| 
	LDA.b #$80			// $80EC27  A9 80	| 
	TRB.w $0201			// $80EC29  1C 01 02	| RAM ADDRESS
	REP #$30			// $80EC2C  C2 30	| 
	INC.w $0250			// $80EC2E  EE 50 02	| RAM ADDRESS
	JSR code_808BC0			// $80EC31  20 C0 8B	| 
	JSR code_80EF41			// $80EC34  20 41 EF	| 
	JSL code_81D361			// $80EC37  22 61 D3 81	| 
	REP #$30			// $80EC3B  C2 30	| 
	LDA.w $0202			// $80EC3D  AD 02 02	| RAM ADDRESS
	BMI code_80EC4D			// $80EC40  30 0B	| 
	DEC.w $0272			// $80EC42  CE 72 02	| RAM ADDRESS
	BNE code_80EC1A			// $80EC45  D0 D3	| 
	LDA.w #$FFFF			// $80EC47  A9 FF FF	| 
	STA.w $0270			// $80EC4A  8D 70 02	| RAM ADDRESS
code_80EC4D:				//			| 
	REP #$30			// $80EC4D  C2 30	| 
	LDA.w $0270			// $80EC4F  AD 70 02	| RAM ADDRESS
	BNE code_80EC5F			// $80EC52  D0 0B	| 
	LDY.w $0274			// $80EC54  AC 74 02	| RAM ADDRESS
	CPY.w #$0064			// $80EC57  C0 64 00	| 
	BNE code_80EC5F			// $80EC5A  D0 03	| 
	ORA.w #$8000			// $80EC5C  09 00 80	| 
code_80EC5F:				//			| 
	RTS				// $80EC5F  60		| 


code_80EC60:				//			| this uploads the title screen bg, text, etc
	SEP #$20			// $80EC60  E2 20	| 
	LDA.b #$80			// $80EC62  A9 80	| 
	STA.w $2115			// $80EC64  8D 15 21	| 
	REP #$30			// $80EC67  C2 30	| 
	LDA.w #data_898000		// $80EC69  A9 00 80	| 
	STA.b $90			// $80EC6C  85 90	| RAM ADDRESS
	LDA.w #data_898000>>16		// $80EC6E  A9 89 00	| 
	STA.b $92			// $80EC71  85 92	| RAM ADDRESS
	JSR code_80E3AB			// $80EC73  20 AB E3	| 
	REP #$30			// $80EC76  C2 30	| 
	LDX.w #data_80EF01		// $80EC78  A2 01 EF	| src = data_80EF01
	LDY.w #$5200			// $80EC7B  A0 00 52	| dst = $7E5200
	LDA.w #$001F			// $80EC7E  A9 1F 00	| 
	MVN $7E,data_80EF01>>16		// $80EC81  54 7E 80	| 
	PHK				// $80EC84  4B		| 
	PLB				// $80EC85  AB		| 
	SEP #$20			// $80EC86  E2 20	| 
	STZ.w $2111			// $80EC88  9C 11 21	| 
	STZ.w $2111			// $80EC8B  9C 11 21	| 
	LDA.b #$FF			// $80EC8E  A9 FF	| 
	STA.w $2112			// $80EC90  8D 12 21	| 
	STA.w $2112			// $80EC93  8D 12 21	| 
	REP #$30			// $80EC96  C2 30	| 
	STZ.w $0210			// $80EC98  9C 10 02	| RAM ADDRESS
	STZ.w $0212			// $80EC9B  9C 12 02	| RAM ADDRESS
	STZ.w $0214			// $80EC9E  9C 14 02	| RAM ADDRESS
	STZ.w $0216			// $80ECA1  9C 16 02	| RAM ADDRESS
	STZ.w $0218			// $80ECA4  9C 18 02	| RAM ADDRESS
	STZ.w $021A			// $80ECA7  9C 1A 02	| RAM ADDRESS
	LDA.w #$4000			// $80ECAA  A9 00 40	| 
	STA.w $2118			// $80ECAD  8D 18 21	| looks like a typo... (luckily $2116 = x4000?)
	LDY.w #$0380			// $80ECB0  A0 80 03	| 
code_80ECB3:				//			| 
	STZ.w $2118			// $80ECB3  9C 18 21	| 
	DEY				// $80ECB6  88		| 
	BNE code_80ECB3			// $80ECB7  D0 FA	| 
	LDA.w #$2000			// $80ECB9  A9 00 20	| 
	STA.w $2116			// $80ECBC  8D 16 21	| 
	LDX.w #$0000			// $80ECBF  A2 00 00	| 
	LDY.w #data_8ED415.size/2	// $80ECC2  A0 00 0E	| 
code_80ECC5:				//			| 
	LDA.l data_8ED415,x		// $80ECC5  BF 15 D4 8E	| 
	STA.w $2118			// $80ECC9  8D 18 21	| 
	INX				// $80ECCC  E8		| 
	INX				// $80ECCD  E8		| 
	DEY				// $80ECCE  88		| 
	BNE code_80ECC5			// $80ECCF  D0 F4	| 
	LDA.w #$0820			// $80ECD1  A9 20 08	| 
	STA.w $2116			// $80ECD4  8D 16 21	| 
	LDX.w #$0000			// $80ECD7  A2 00 00	| 
	LDY.w #$00FB			// $80ECDA  A0 FB 00	| 
code_80ECDD:				//			| 
	STX.b $80			// $80ECDD  86 80	| RAM ADDRESS
	PHY				// $80ECDF  5A		| 
	LDY.w #$0008			// $80ECE0  A0 08 00	| 
code_80ECE3:				//			| 2bpp GFX copied as 4BPP GFX here
	LDA.l data_9BC203+$20,x		// $80ECE3  BF 23 C2 9B	| 
	STA.w $2118			// $80ECE7  8D 18 21	| 
	INX				// $80ECEA  E8		| 
	INX				// $80ECEB  E8		| 
	DEY				// $80ECEC  88		| 
	BNE code_80ECE3			// $80ECED  D0 F4	| 
	PLY				// $80ECEF  7A		| 
	TYA				// $80ECF0  98		| 
	LSR				// $80ECF1  4A		| 
	BCC code_80ECF6			// $80ECF2  90 02	| 
	LDX.b $80			// $80ECF4  A6 80	| RAM ADDRESS
code_80ECF6:				//			| 
	DEY				// $80ECF6  88		| 
	BPL code_80ECDD			// $80ECF7  10 E4	| 
	LDA.l $7E5222			// $80ECF9  AF 22 52 7E	| RAM ADDRESS
	STA.l $7E524A			// $80ECFD  8F 4A 52 7E	| RAM ADDRESS
	LDA.l $7E5224			// $80ED01  AF 24 52 7E	| RAM ADDRESS
	STA.l $7E5254			// $80ED05  8F 54 52 7E	| RAM ADDRESS
	LDA.l $7E5226			// $80ED09  AF 26 52 7E	| RAM ADDRESS
	STA.l $7E525E			// $80ED0D  8F 5E 52 7E	| RAM ADDRESS
	LDX.w #$0000			// $80ED11  A2 00 00	| 
code_80ED14:				//			| 
	LDA.w data_80EDDB,x		// $80ED14  BD DB ED	| 
	STA.w $2116			// $80ED17  8D 16 21	| 
	LDA.w data_80EDDB+4,x		// $80ED1A  BD DF ED	| 
	TAY				// $80ED1D  A8		| 
	LDA.w data_80EDDB+2,x		// $80ED1E  BD DD ED	| 
code_80ED21:				//			| 
	STA.w $2118			// $80ED21  8D 18 21	| 
	INC				// $80ED24  1A		| 
	DEY				// $80ED25  88		| 
	BNE code_80ED21			// $80ED26  D0 F9	| 
	INX				// $80ED28  E8		| 
	INX				// $80ED29  E8		| 
	INX				// $80ED2A  E8		| 
	INX				// $80ED2B  E8		| 
	INX				// $80ED2C  E8		| 
	INX				// $80ED2D  E8		| 
	LDA.w data_80EDDB,x		// $80ED2E  BD DB ED	| 
	BNE code_80ED14			// $80ED31  D0 E1	| 
	REP #$30			// $80ED33  C2 30	| 
	LDX.w #data_80EF21		// $80ED35  A2 21 EF	| src = data_80EF21
	LDY.w #$5260			// $80ED38  A0 60 52	| dst = $7E5260
	LDA.w #$001F			// $80ED3B  A9 1F 00	| 
	MVN $7E,data_80EF21>>16		// $80ED3E  54 7E 80	| 
	PHK				// $80ED41  4B		| 
	PLB				// $80ED42  AB		| 
	SEP #$20			// $80ED43  E2 20	| 
	STZ.w $2113			// $80ED45  9C 13 21	| 
	STZ.w $2113			// $80ED48  9C 13 21	| 
	LDA.b #$FF			// $80ED4B  A9 FF	| 
	STA.w $2114			// $80ED4D  8D 14 21	| 
	STA.w $2114			// $80ED50  8D 14 21	| 
	REP #$30			// $80ED53  C2 30	| 
	LDA.w #$0400			// $80ED55  A9 00 04	| 
	STA.w $2116			// $80ED58  8D 16 21	| 
	LDY.w #$0380			// $80ED5B  A0 80 03	| 
code_80ED5E:				//			| 
	STZ.w $2118			// $80ED5E  9C 18 21	| 
	DEY				// $80ED61  88		| 
	BNE code_80ED5E			// $80ED62  D0 FA	| 
	LDA.w #$0010			// $80ED64  A9 10 00	| 
	STA.w $2116			// $80ED67  8D 16 21	| 
	LDX.w #$0000			// $80ED6A  A2 00 00	| 
	LDY.w #$03F0			// $80ED6D  A0 F0 03	| 
code_80ED70:				//			| 
	LDA.l data_9BC203+$20,x		// $80ED70  BF 23 C2 9B	| 
	STA.w $2118			// $80ED74  8D 18 21	| 
	INX				// $80ED77  E8		| 
	INX				// $80ED78  E8		| 
	DEY				// $80ED79  88		| 
	BNE code_80ED70			// $80ED7A  D0 F4	| 
	LDY.w #data_80EE55		// $80ED7C  A0 55 EE	| 
	JSL code_80ED8B			// $80ED7F  22 8B ED 80	| 
	JSR code_80EDA9			// $80ED83  20 A9 ED	| 
	JSL code_80ED8B			// $80ED86  22 8B ED 80	| 
	RTS				// $80ED8A  60		| 

code_80ED8B:				//			| 
	STY.b $90			// $80ED8B  84 90	| 
	LDY.w #$0000			// $80ED8D  A0 00 00	| 
code_80ED90:				//			| 
	LDA ($90),y			// $80ED90  B1 90	| RAM ADDRESS
	STA.w $2116			// $80ED92  8D 16 21	| 
	INY				// $80ED95  C8		| 
	INY				// $80ED96  C8		| 
	LDA ($90),y			// $80ED97  B1 90	| RAM ADDRESS
code_80ED99:				//			| 
	STA.w $2118			// $80ED99  8D 18 21	| 
	INY				// $80ED9C  C8		| 
	INY				// $80ED9D  C8		| 
	LDA ($90),y			// $80ED9E  B1 90	| RAM ADDRESS
	BNE code_80ED99			// $80EDA0  D0 F7	| 
	INY				// $80EDA2  C8		| 
	INY				// $80EDA3  C8		| 
	LDA ($90),y			// $80EDA4  B1 90	| RAM ADDRESS
	BNE code_80ED90			// $80EDA6  D0 E8	| 
	RTL				// $80EDA8  6B		| 

code_80EDA9:				//			| which of STEREO/MONAURAL to display on title
	REP #$30			// $80EDA9  C2 30	| 
	LDY.w #data_80EEAD		// $80EDAB  A0 AD EE	| 
	LDA.w $1A00			// $80EDAE  AD 00 1A	| RAM ADDRESS
	BIT.w #$4000			// $80EDB1  89 00 40	| 
	BEQ code_80EDB9			// $80EDB4  F0 03	| 
	LDY.w #data_80EEC7		// $80EDB6  A0 C7 EE	| 
code_80EDB9:				//			| 
	RTS				// $80EDB9  60		| 

code_80EDBA:				//			| process stereo/mono output
	REP #$30			// $80EDBA  C2 30	| 
	LDY.w #$0009			// $80EDBC  A0 09 00	| 
	LDA.w $1A00			// $80EDBF  AD 00 1A	| RAM ADDRESS
	BIT.w #$4000			// $80EDC2  89 00 40	| 
	BIT.w #$4000			// $80EDC5  89 00 40	| 
	BEQ code_80EDCD			// $80EDC8  F0 03	| 
	LDY.w #$000A			// $80EDCA  A0 0A 00	| 
code_80EDCD:				//			| 
	STY.w $1902			// $80EDCD  8C 02 19	| RAM ADDRESS
	LDA.w #$0004			// $80EDD0  A9 04 00	| 
	STA.w $1900			// $80EDD3  8D 00 19	| RAM ADDRESS
	JSL code_1D8004			// $80EDD6  22 04 80 1D	| 
	RTS				// $80EDDA  60		| 

data_80EDDB:				//			| compressed MAP for title screen game logo
	dw $4063,$0E00,$0010		// $80EDDB		| VRAMADDR,TILE,LENGTH (for TILE += 1)
	dw $4073,$0E80,$000A		// $80EDE1		| 
	dw $4083,$0E10,$0010		// $80EDE7		| 
	dw $4093,$0E90,$000A		// $80EDED		| 
	dw $40A3,$0E20,$0010		// $80EDF3		| 
	dw $40B3,$0EA0,$000A		// $80EDF9		| 
	dw $40C3,$0E30,$0010		// $80EDFF		| 
	dw $40D3,$0EB0,$000A		// $80EE05		| 
	dw $40E3,$0E40,$0010		// $80EE0B		| 
	dw $40F3,$0E8A,$0006		// $80EE11		| 
	dw $40F9,$0EC0,$0004		// $80EE17		| 
	dw $4103,$0E50,$0010		// $80EE1D		| 
	dw $4113,$0E9A,$0006		// $80EE23		| 
	dw $4119,$0ED0,$0004		// $80EE29		| 
	dw $4123,$0E60,$0010		// $80EE2F		| 
	dw $4133,$0EAA,$0006		// $80EE35		| 
	dw $4139,$0EC4,$0004		// $80EE3B		| 
	dw $4143,$0E70,$0010		// $80EE41		| 
	dw $4153,$0EBA,$0006		// $80EE47		| 
	dw $4159,$0ED4,$0004		// $80EE4D		| 
	dw $0000			// $80EE53		| end of map

data_80EE55:				//			| title screen text tilemaps
	dw $4307			// $80EE55		| VRAMADDR
	dw $08ED,$08E1,$08E9,$08E9	// $80EE57		|\ "©1994  TNN / NHK SC" (layer 1)
	dw $08E4,$0800,$0800,$08D4	// $80EE5F		|| 
	dw $08CE,$08CE,$0800,$08EC	// $80EE67		|| 
	dw $0800,$08CE,$08C8,$08CB	// $80EE6F		|| 
	dw $0800,$08D3,$08C3		// $80EE77		|/ 
	dw $0000			// $80EE7D		| end of map
	dw $060C			// $80EE7F		| VRAMADDR
	dw $3C6A,$3000,$3005,$3053	// $80EE81		|\ "＠ ・START" (＠ = cursor icon)
	dw $3054,$3041,$3052,$3054	// $80EE89		|/ 
	dw $0000			// $80EE91		| end of map
	dw $064E			// $80EE93		| VRAMADDR
	dw $3005,$3052,$3045,$3050	// $80EE95		|\ "・REPLAY"
	dw $304C,$3041,$3059		// $80EE9D		|/ 
	dw $0000			// $80EEA3		| end of map
	dw $0000			// $80EEA5		| end of map for real

data_80EEA7:				//			| title screen cursor positions (VRAMADDR)
	dw $060C			// $80EEA7		| 
	dw $064C			// $80EEA9		| 
	dw $068C			// $80EEAB		| 

data_80EEAD:				//			| "( STEREO )"
	dw $068D			// $80EEAD		| VRAMADDR
	dw $306E,$3000,$3053,$3054	// $80EEAF		| 
	dw $3045,$3052,$3045,$304F	// $80EEB7		| 
	dw $3000,$306F			// $80EEBF		| 
	dw $0000			// $80EEC3		| end of map
	dw $0000			// $80EEC5		| end of map for real

data_80EEC7:				//			| "(MONAURAL)"
	dw $068D			// $80EEC7		| VRAMADDR
	dw $306E,$304D,$304F,$304E	// $80EEC9		| 
	dw $3041,$3055,$3052,$3041	// $80EED1		| 
	dw $304C,$306F			// $80EED9		| 
	dw $0000			// $80EEDD		| end of map
	dw $0000			// $80EEDF		| end of map for real

data_80EEE1:				//			| this uploads in place of below
	dw $3000,$3000,$3000,$3000	// $80EEE1		| 
	dw $3000,$3000,$3000,$3000	// $80EEE9		| 

data_80EEF1:				//			| title screen "(5 MIN.)" text
	dw $386E,$3865,$3800,$384D	// $80EEF1		| 
	dw $3849,$384E,$385B,$386F	// $80EEF9		| 

data_80EF01:				//			| PAL for title screen BG
	dw $0443,$04A4,$04C4,$10A6	// $80EF01		| 
	dw $1107,$1D28,$1149,$1D4A	// $80EF09		| 
	dw $1D6B,$298C,$1DAD,$29CD	// $80EF11		| 
	dw $31CD,$2DF1,$3211,$3631	// $80EF19		| 

data_80EF21:				//			| PAL for title screen game logo
	dw $04C4,$08E5,$1106,$1948	// $80EF21		| 
	dw $1D69,$25AB,$2DCC,$31EE	// $80EF29		| 
	dw $3A2F,$4251,$4692,$4EB4	// $80EF31		| 
	dw $56D5,$5B17,$6338,$6759	// $80EF39		| 

code_80EF41:				//			| title screen menu handler
	REP #$30			// $80EF41  C2 30	| 
	PHK				// $80EF43  4B		| 
	PLB				// $80EF44  AB		| 
	LDY.w $0270			// $80EF45  AC 70 02	| RAM ADDRESS
	PHY				// $80EF48  5A		| 
	LDA.w $0244			// $80EF49  AD 44 02	| RAM ADDRESS
	BIT.w #$2000			// $80EF4C  89 00 20	| check if select is pressed
	BEQ code_80EF84			// $80EF4F  F0 33	| 
	PHA				// $80EF51  48		| 
	PHX				// $80EF52  DA		| 
	PHY				// $80EF53  5A		| 
	INC.w $0274			// $80EF54  EE 74 02	| RAM ADDRESS
	LDA.w $0274			// $80EF57  AD 74 02	| RAM ADDRESS
	CMP.w #$0064			// $80EF5A  C9 64 00	| # of times select needs to be pressed for 5 MIN.
	BNE code_80EF64			// $80EF5D  D0 05	| 
	LDY.w #data_80EEF1		// $80EF5F  A0 F1 EE	| 
	BRA code_80EF6C			// $80EF62  80 08	| 
code_80EF64:				//			| 
	CMP.w #$0065			// $80EF64  C9 65 00	| delete 5 MIN. at this amount
	BNE code_80EF81			// $80EF67  D0 18	| 
	LDY.w #data_80EEE1		// $80EF69  A0 E1 EE	| 
code_80EF6C:				//			| 
	PHK				// $80EF6C  4B		| 
	PHK				// $80EF6D  4B		| 
	LDA.w data_80EEA7		// $80EF6E  AD A7 EE	| 
	CLC				// $80EF71  18		| 
	ADC.w #$0008			// $80EF72  69 08 00	| 
	TAX				// $80EF75  AA		| 
	TYA				// $80EF76  98		| 
	LDY.w #$0010			// $80EF77  A0 10 00	| 
	JSL code_808AA4			// $80EF7A  22 A4 8A 80	| 
	REP #$30			// $80EF7E  C2 30	| 
	PLA				// $80EF80  68		| 
code_80EF81:				//			| 
	PLY				// $80EF81  7A		| 
	PLX				// $80EF82  FA		| 
	PLA				// $80EF83  68		| 
code_80EF84:				//			| 
	BIT.w #$0800			// $80EF84  89 00 08	| 
	BEQ code_80EF91			// $80EF87  F0 08	| 
	DEY				// $80EF89  88		| 
	BPL code_80EF91			// $80EF8A  10 05	| 
	LDY.w #$0002			// $80EF8C  A0 02 00	| 
	BRA code_80EF9F			// $80EF8F  80 0E	| 
code_80EF91:				//			| 
	BIT.w #$2400			// $80EF91  89 00 24	| 
	BEQ code_80EF9F			// $80EF94  F0 09	| 
	INY				// $80EF96  C8		| 
	CPY.w #$0003			// $80EF97  C0 03 00	| 
	BCC code_80EF9F			// $80EF9A  90 03	| 
	LDY.w #$0000			// $80EF9C  A0 00 00	| 
code_80EF9F:				//			| 
	STY.w $0270			// $80EF9F  8C 70 02	| RAM ADDRESS
	BIT.w #$1080			// $80EFA2  89 80 10	| check if start or A pressed
	BEQ code_80EFE6			// $80EFA5  F0 3F	| 
	CPY.w #$0002			// $80EFA7  C0 02 00	| 
	BEQ code_80EFBB			// $80EFAA  F0 0F	| 
	LDA.w #$0019			// $80EFAC  A9 19 00	| SFX for choosing title screen item (except 3rd)
	JSL code_808968			// $80EFAF  22 68 89 80	| 
	LDA.w #$8000			// $80EFB3  A9 00 80	| 
	TSB.w $0202			// $80EFB6  0C 02 02	| RAM ADDRESS
	BRA code_80EFE6			// $80EFB9  80 2B	| 
code_80EFBB:				//			| handles toggling STEREO/MONAURAL
	LDA.w $1A00			// $80EFBB  AD 00 1A	| RAM ADDRESS
	EOR.w #$4000			// $80EFBE  49 00 40	| 
	STA.w $1A00			// $80EFC1  8D 00 1A	| RAM ADDRESS
	JSR code_80EDBA			// $80EFC4  20 BA ED	| 
	LDA.w #$0018			// $80EFC7  A9 18 00	| SFX for toggling STEREO/MONAURAL
	JSL code_808968			// $80EFCA  22 68 89 80	| 
	JSR code_80EDA9			// $80EFCE  20 A9 ED	| 
	PHK				// $80EFD1  4B		| 
	PHK				// $80EFD2  4B		| 
	TYA				// $80EFD3  98		| 
	INC				// $80EFD4  1A		| 
	INC				// $80EFD5  1A		| 
	LDX.w data_80EEAD		// $80EFD6  AE AD EE	| 
	LDY.w #$0014			// $80EFD9  A0 14 00	| 
	JSL code_808AA4			// $80EFDC  22 A4 8A 80	| 
	REP #$30			// $80EFE0  C2 30	| 
	PLA				// $80EFE2  68		| 
	JSR code_80F023			// $80EFE3  20 23 F0	| 
code_80EFE6:				//			| 
	PLA				// $80EFE6  68		| 
	CMP.w $0270			// $80EFE7  CD 70 02	| RAM ADDRESS
	BEQ code_80F022			// $80EFEA  F0 36	| 
	AND.w #$001F			// $80EFEC  29 1F 00	| 
	ASL				// $80EFEF  0A		| 
	TAY				// $80EFF0  A8		| 
	LDX.w data_80EEA7,y		// $80EFF1  BE A7 EE	| 
	PHK				// $80EFF4  4B		| 
	LDY.w #$0002			// $80EFF5  A0 02 00	| 
	LDA.w #data_80F032		// $80EFF8  A9 32 F0	| 
	JSL code_808AA4			// $80EFFB  22 A4 8A 80	| 
	LDA.w $0270			// $80EFFF  AD 70 02	| RAM ADDRESS
	AND.w #$001F			// $80F002  29 1F 00	| 
	ASL				// $80F005  0A		| 
	TAY				// $80F006  A8		| 
	LDX.w data_80EEA7,y		// $80F007  BE A7 EE	| 
	PHK				// $80F00A  4B		| 
	LDY.w #$0002			// $80F00B  A0 02 00	| 
	LDA.w #data_80F034		// $80F00E  A9 34 F0	| 
	JSL code_808AA4			// $80F011  22 A4 8A 80	| 
	REP #$30			// $80F015  C2 30	| 
	PLA				// $80F017  68		| 
	LDA.w #$0018			// $80F018  A9 18 00	| SFX for moving up/down on title screen menu
	JSL code_808968			// $80F01B  22 68 89 80	| 
	JSR code_80F023			// $80F01F  20 23 F0	| 
code_80F022:				//			| 
	RTS				// $80F022  60		| 

code_80F023:				//			| 
	LDA.w $0272			// $80F023  AD 72 02	| RAM ADDRESS
	CMP.w #$012C			// $80F026  C9 2C 01	| 
	BCS code_80F031			// $80F029  B0 06	| 
	LDA.w #$012C			// $80F02B  A9 2C 01	| 
	STA.w $0272			// $80F02E  8D 72 02	| RAM ADDRESS
code_80F031:				//			| 
	RTS				//			| 

data_80F032:				//			| nullifies below
	dw $0000			// $80F032		| 

data_80F034:				//			| cursor tile
	dw $3C6A			// $80F034		| 

pad($80F800, $FF)
pad($80FFA0, $00)
warnpc($80FFA0)

org($80F2B2); db $7F
org($80F4B4); db $BF
org($80FA71); db $40,$00,$20
org($80FAF2); db $02
org($80FAFF); db $20
org($80FB7F); db $20
org($80FBF6); db $12
org($80FDFE); db $80
org($80FF72); db $08,$00,$00,$00,$04


org($80FFA0)
VECTOR_NULL:				//======================| 
	RTI				// $80FFA0  40		| 
VECTOR_NMI:				//======================| 
	JML NMI				// $80FFA1  5C AC 81 80	| 
VECTOR_RESET:				//======================| 
	SEI				// $80FFA5  78		| 
	CLC				// $80FFA6  18		| 
	XCE				// $80FFA7  FB		| 
	JML RESET			// $80FFA8  5C 00 80 80	| 
VECTOR_IRQ:				//======================| 
	JML IRQ				// $80FFAC  5C 33 84 80	| 
warnpc($80FFB0)


// Extended Header

org($80FFB0)
	db "8H"				// $80FFB0  38 48	| Maker Code
	db "ATAJ"			// $80FFB2  41 54 41 4A	| Game Code
	db $00,$00,$00,$00,$00		// $80FFB6		| 
	db $00,$00,$00,$00,$00		// $80FFBB		| 
warnpc($80FFC0)


// Cartridge Header

org($80FFC0)
	db "UMIHARAKAWASE"		// $80FFC0		| Cartridge title (21 [x15] bytes)
	pad($80FFD5, $20)
warnpc($80FFD5)

org($80FFD5)
	db $30				// $80FFD5		| ROM Speed and Map Mode [FastROM]
	db $02				// $80FFD6		| Chipset [ROM+RAM+BATTERY]
	db $0A				// $80FFD7		| ROM size [2^xA KB = 1 MB]
	db $01				// $80FFD8		| RAM size [2^1 KB = 2 KB]
	db $00				// $80FFD9		| Country [Japan]
	db $33				// $80FFDA		| Developer ID code [new, use $80FFB0]
	db $00				// $80FFDB		| ROM Version number [v1.00]
	dw $6746			// $80FFDC		| Checksum complement (inverse of below)
	dw $98B9			// $80FFDE		| Checksum
warnpc($80FFE0)

// CPU Exception Vectors
org($80FFE0)
	db $00,$00,$00,$00		// $80FFE0		| 
	dw VECTOR_NULL			// $80FFE4  A0 FF	| (Native) COP
	dw VECTOR_NULL			// $80FFE6  A0 FF	| (Native) BRK
	dw VECTOR_NULL			// $80FFE8  A0 FF	| (Native) ABORT
	dw VECTOR_NMI			// $80FFEA  A1 FF	| (Native) NMI
	db $00,$00			// $80FFEC 		| 
	dw VECTOR_IRQ			// $80FFEE  AC FF	| (Native) IRQ
	db $00,$41,$04,$40		// $80FFF0 		| 
	dw VECTOR_NULL			// $80FFF4  A0 FF	| (Emulation) COP
	dw VECTOR_NULL			// $80FFF6  A0 FF	| 
	dw VECTOR_NULL			// $80FFF8  A0 FF	| (Emulation) ABORT
	dw VECTOR_NULL			// $80FFFA  A0 FF	| (Emulation) NMI
	dw VECTOR_RESET			// $80FFFC  A5 FF	| (Emulation) RESET
	dw VECTOR_NULL			// $80FFFE  A0 FF	| (Emulation) IRQ/BRK

warnpc($818000)