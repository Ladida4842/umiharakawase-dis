org($1D8000)

code_1D8000:				//----------------------| SPC Upload
	JSR code_1D8008			// $1D8000  20 08 80	| 
	RTL				// $1D8003  6B		| 

code_1D8004:				//----------------------| SPC Process
	JSR code_1D80DA			// $1D8004  20 DA 80	| 
	RTL				// $1D8007  6B		| 

code_1D8008:				//----------------------| the initial SPC uploader
	PHB				// $1D8008  8B		| 
	PHD				// $1D8009  0B		| 
	PHP				// $1D800A  08		| 
	SEP #$20			// $1D800B  E2 20	| 
	REP #$10			// $1D800D  C2 10	| 
	LDA.b #$1D			// $1D800F  A9 1D	| 
	PHA				// $1D8011  48		| 
	PLB				// $1D8012  AB		| 
	LDX.w #$1900			// $1D8013  A2 00 19	| INDIRECT RAM ADDRESS
	PHX				// $1D8016  DA		| 
	PLD				// $1D8017  2B		| 
	SEP #$20			// $1D8018  E2 20	| 
	LDX.w #$01C0			// $1D801A  A2 C0 01	| 
code_1D801D:				//			| 
	STZ.w $183F,x			// $1D801D  9E 3F 18	| RAM ADDRESS
	DEX				// $1D8020  CA		| 
	BNE code_1D801D			// $1D8021  D0 FA	| 
	REP #$20			// $1D8023  C2 20	| 
	LDA.w #$BBAA			// $1D8025  A9 AA BB	| 
code_1D8028:				//			| 
	CMP.w $2140			// $1D8028  CD 40 21	| 
	BNE code_1D8028			// $1D802B  D0 FB	| 
	SEP #$20			// $1D802D  E2 20	| 
	LDX.w #$0000			// $1D802F  A2 00 00	| 
	LDA.w data_1D8808+1,x		// $1D8032  BD 09 88	| 
	XBA				// $1D8035  EB		| 
	LDA.w data_1D8808,x		// $1D8036  BD 08 88	| 
	REP #$20			// $1D8039  C2 20	| 
	TAY				// $1D803B  A8		| 
	SEP #$20			// $1D803C  E2 20	| 
	INX				// $1D803E  E8		| 
	INX				// $1D803F  E8		| 
	LDA.w data_1D8808,x		// $1D8040  BD 08 88	| 
	STA.w $2142			// $1D8043  8D 42 21	| 
	LDA.w data_1D8808+1,x		// $1D8046  BD 09 88	| 
	STA.w $2143			// $1D8049  8D 43 21	| 
	LDA.b #$01			// $1D804C  A9 01	| 
	STA.w $2141			// $1D804E  8D 41 21	| 
	INX				// $1D8051  E8		| 
	INX				// $1D8052  E8		| 
	LDA.b #$CC			// $1D8053  A9 CC	| 
	STA.w $2140			// $1D8055  8D 40 21	| 
code_1D8058:				//			| 
	CMP.w $2140			// $1D8058  CD 40 21	| 
	BNE code_1D8058			// $1D805B  D0 FB	| 
	STZ.b $0A			// $1D805D  64 0A	| RAM ADDRESS
code_1D805F:				//			| 
	LDA.w data_1D8808,x		// $1D805F  BD 08 88	| 
	STA.w $2141			// $1D8062  8D 41 21	| 
	LDA.b $0A			// $1D8065  A5 0A	| RAM ADDRESS
	STA.w $2140			// $1D8067  8D 40 21	| 
	INC.b $0A			// $1D806A  E6 0A	| RAM ADDRESS
code_1D806C:				//			| 
	CMP.w $2140			// $1D806C  CD 40 21	| 
	BNE code_1D806C			// $1D806F  D0 FB	| 
	INX				// $1D8071  E8		| 
	DEY				// $1D8072  88		| 
	BNE code_1D805F			// $1D8073  D0 EA	| 
	INC.b $0A			// $1D8075  E6 0A	| RAM ADDRESS
	INC.b $0A			// $1D8077  E6 0A	| RAM ADDRESS
	INC.b $0A			// $1D8079  E6 0A	| RAM ADDRESS
	REP #$20			// $1D807B  C2 20	| 
	LDA.w data_1D8808,x		// $1D807D  BD 08 88	| 
	INX				// $1D8080  E8		| 
	INX				// $1D8081  E8		| 
	TAY				// $1D8082  A8		| 
	BEQ code_1D80A8			// $1D8083  F0 23	| 
	SEP #$20			// $1D8085  E2 20	| 
	LDA.w data_1D8808,x		// $1D8087  BD 08 88	| 
	STA.w $2142			// $1D808A  8D 42 21	| 
	LDA.w data_1D8808+1,x		// $1D808D  BD 09 88	| 
	STA.w $2143			// $1D8090  8D 43 21	| 
	LDA.b #$01			// $1D8093  A9 01	| 
	STA.w $2141			// $1D8095  8D 41 21	| 
	INX				// $1D8098  E8		| 
	INX				// $1D8099  E8		| 
	LDA.b $0A			// $1D809A  A5 0A	| RAM ADDRESS
	STA.w $2140			// $1D809C  8D 40 21	| 
code_1D809F:				//			| 
	CMP.w $2140			// $1D809F  CD 40 21	| 
	BNE code_1D809F			// $1D80A2  D0 FB	| 
	STZ.b $0A			// $1D80A4  64 0A	| RAM ADDRESS
	BRA code_1D805F			// $1D80A6  80 B7	| 
code_1D80A8:				//			| 
	SEP #$20			// $1D80A8  E2 20	| 
	LDA.w data_1D8808,x		// $1D80AA  BD 08 88	| 
	STA.w $2142			// $1D80AD  8D 42 21	| 
	LDA.w data_1D8808+1,x		// $1D80B0  BD 09 88	| 
	STA.w $2143			// $1D80B3  8D 43 21	| 
	LDA.b #$00			// $1D80B6  A9 00	| 
	STA.w $2141			// $1D80B8  8D 41 21	| 
	LDA.b $0A			// $1D80BB  A5 0A	| RAM ADDRESS
	STA.w $2140			// $1D80BD  8D 40 21	| 
code_1D80C0:				//			| 
	CMP.w $2140			// $1D80C0  CD 40 21	| 
	BNE code_1D80C0			// $1D80C3  D0 FB	| 
	STZ $2140			// $1D80C5  9C 40 21	| 
	LDX.w #$4800			// $1D80C8  A2 00 48	| this looks like an ARAM address (SAMPLES)
	STX.b $60			// $1D80CB  86 60	| RAM ADDRESS
	STX.w $1860			// $1D80CD  8E 60 18	| RAM ADDRESS
	LDX.w #$0800			// $1D80D0  A2 00 08	|\ 
code_1D80D3:				//			|| waste time
	DEX				// $1D80D3  CA		|| in a loop
	BNE code_1D80D3			// $1D80D4  D0 FD	|/ 
	PLP				// $1D80D6  28		| 
	PLD				// $1D80D7  2B		| 
	PLB				// $1D80D8  AB		| 
	RTS				// $1D80D9  60		| 

code_1D80DA:				//----------------------| the runtime SFX/music processor
	PHB				// $1D80DA  8B		| 
	PHD				// $1D80DB  0B		| 
	PHP				// $1D80DC  08		| 
	REP #$20			// $1D80DD  C2 20	| 
	REP #$10			// $1D80DF  C2 10	| 
	PHA				// $1D80E1  48		| 
	PHX				// $1D80E2  DA		| 
	PHY				// $1D80E3  5A		| 
	SEP #$20			// $1D80E4  E2 20	| 
	LDA.b #$1D			// $1D80E6  A9 1D	| 
	PHA				// $1D80E8  48		| 
	PLB				// $1D80E9  AB		| 
	LDX.w #$1900			// $1D80EA  A2 00 19	| INDIRECT RAM ADDRESS
	PHX				// $1D80ED  DA		| 
	PLD				// $1D80EE  2B		| 
	SEP #$20			// $1D80EF  E2 20	| 
	LDA.b $00			// $1D80F1  A5 00	| RAM ADDRESS
	BEQ code_1D8119			// $1D80F3  F0 24	| 
	STA.b $0A			// $1D80F5  85 0A	| RAM ADDRESS
	CMP.b #$01			// $1D80F7  C9 01	| 
	BNE code_1D8100			// $1D80F9  D0 05	| 
	JSR code_1D814E			// $1D80FB  20 4E 81	|| SFX playback if $1900 = 1
	BRA code_1D8119			// $1D80FE  80 19	| 
code_1D8100:				//			| 
	CMP.b #$02			// $1D8100  C9 02	| 
	BNE code_1D8109			// $1D8102  D0 05	| 
	JSR code_1D812A			// $1D8104  20 2A 81	|| music upload if $1900 = 2
	BRA code_1D8119			// $1D8107  80 10	| 
code_1D8109:				//			| 
	CMP.b #$03			// $1D8109  C9 03	| 
	BNE code_1D8112			// $1D810B  D0 05	| 
	JSR code_1D81BF			// $1D810D  20 BF 81	|| SFX upload if $1900 = 3
	BRA code_1D8119			// $1D8110  80 07	| 
code_1D8112:				//			| 
	CMP.b #$04			// $1D8112  C9 04	| 
	BCC code_1D8119			// $1D8114  90 03	| 
	JSR code_1D8170			// $1D8116  20 70 81	|| misc upload? (aka stereo/mono) $1900 = 4
code_1D8119:				//			| 
	SEP #$20			// $1D8119  E2 20	| 
	STZ.b $00			// $1D811B  64 00	| RAM ADDRESS
	STZ.b $02			// $1D811D  64 02	| RAM ADDRESS
	REP #$10			// $1D811F  C2 10	| 
	PLY				// $1D8121  7A		| 
	PLX				// $1D8122  FA		| 
	REP #$20			// $1D8123  C2 20	| 
	PLA				// $1D8125  68		| 
	PLP				// $1D8126  28		| 
	PLD				// $1D8127  2B		| 
	PLB				// $1D8128  AB		| 
	RTS				// $1D8129  60		| 


code_1D812A:				//----------------------| music upload
	SEP #$20			// $1D812A  E2 20	| 
	LDA.b #$00			// $1D812C  A9 00	| 
	XBA				// $1D812E  EB		| 
	LDA.b $02			// $1D812F  A5 02	| RAM ADDRESS
	CMP.b $06			// $1D8131  C5 06	| RAM ADDRESS
	BEQ code_1D813D			// $1D8133  F0 08	| 
	STA.b $06			// $1D8135  85 06	| 
	JSR code_1D8206			// $1D8137  20 06 82	| 
	JSR code_1D8236			// $1D813A  20 06 82	| 
code_1D813D:				//			| 
	STZ.w $2140			// $1D813D  9C 40 21	| 
	STZ.w $2141			// $1D8140  9C 41 21	| 
	STZ.w $2142			// $1D8143  9C 42 21	| 
	STZ.w $2143			// $1D8146  9C 43 21	| 
	STZ.b $00			// $1D8149  64 00	| RAM ADDRESS
	STZ.b $02			// $1D814B  64 02	| RAM ADDRESS
	RTS				// $1D814D  60		| 


code_1D814E:				//----------------------| SFX upload
	SEP #$20			// $1D814E  E2 20	| 
	LDA.b $02			// $1D8150  A5 02	| RAM ADDRESS
	STA.w $2141			// $1D8152  8D 41 21	| 
	LDA.b $00			// $1D8155  A5 00	| RAM ADDRESS
	STA.w $2140			// $1D8157  8D 40 21	| 
code_1D815A:				//			| 
	CMP.w $2140			// $1D815A  CD 40 21	| 
	BNE code_1D815A			// $1D815D  D0 FB	| 
	STZ.w $2140			// $1D815F  9C 40 21	| 
	STZ.w $2141			// $1D8162  9C 41 21	| 
	STZ.w $2142			// $1D8165  9C 42 21	| 
	STZ.w $2143			// $1D8168  9C 43 21	| 
	STZ.b $00			// $1D816B  64 00	| RAM ADDRESS
	STZ.b $02			// $1D816D  64 02	| RAM ADDRESS
	RTS				// $1D816F  60		| 


code_1D8170:				//----------------------| misc upload
	SEP #$20			// $1D8170  E2 20	| 
	LDA.b $02			// $1D8172  A5 02	| RAM ADDRESS
	STA.w $2141			// $1D8174  8D 41 21	| 
	LDA.b $00			// $1D8177  A5 00	| RAM ADDRESS
	STA.w $2140			// $1D8179  8D 40 21	| 
code_1D817C:				//			| 
	CMP.w $2140			// $1D817C  CD 40 21	| 
	BNE code_1D817C			// $1D817F  D0 FB	| 
	LDA.b #$00			// $1D8181  A9 00	| 
	XBA				// $1D8183  EB		| 
	LDA.b $02			// $1D8184  A5 02	| RAM ADDRESS
	DEC				// $1D8186  3A		| 
	ASL				// $1D8187  0A		| 
	TAX				// $1D8188  AA		| 
	JSR (PTRS_1D819D,x)		// $1D8189  FC 9D 81	| 
	STZ.w $2140			// $1D818C  9C 40 21	| 
	STZ.w $2141			// $1D818F  9C 41 21	| 
	STZ.w $2142			// $1D8192  9C 42 21	| 
	STZ.w $2143			// $1D8195  9C 43 21	| 
	STZ.b $00			// $1D8198  64 00	| RAM ADDRESS
	STZ.b $02			// $1D819A  64 02	| RAM ADDRESS
	RTS				// $1D819C  60		| 

PTRS_1D819D:				//^^^^^^^^^^^^^^^^^^^^^^| 
	dw code_1D81B1			// $1D819D  B1 81	| 
	dw code_1D81B1			// $1D819F  B1 81	| 
	dw code_1D81B1			// $1D81A1  B1 81	| 
	dw code_1D81B4			// $1D81A3  B4 81	| 
	dw code_1D81B4			// $1D81A5  B4 81	| 
	dw code_1D81B4			// $1D81A7  B4 81	| 
	dw code_1D81B4			// $1D81A9  B4 81	| 
	dw code_1D81B4			// $1D81AB  B4 81	| 
	dw code_1D81B5			// $1D81AD  B5 81	| goes here if stereo
	dw code_1D81B9			// $1D81AF  B9 81	| goes here if mono

code_1D81B1:				//			| 
	STZ.w $1906			// $1D81B1  9C 06 19	| RAM ADDRESS
code_1D81B4:				//			| 
	RTS				// $1D81B4  60		| 
code_1D81B5:				//			| 
	STZ.w $1908			// $1D81B5  9C 08 19	| RAM ADDRESS
	RTS				// $1D81B8  60		| 
code_1D81B9:				//			| 
	LDA.b #$01			// $1D81B9  A9 01	| 
	STA.w $1908			// $1D81BB  8D 08 19	| RAM ADDRESS
	RTS				// $1D81BE  60		| 


code_1D81BF:				//----------------------| sample upload?
	SEP #$20			// $1D81BF  E2 20	| 
	JSR code_1D81F8			// $1D81C1  20 F8 81	| 
	JSR code_1D8236			// $1D81C4  20 36 81	| 
	LDX.w #$0000			// $1D81C7  A2 00 00	| 
code_1D81CA:				//			| 
	STZ.w $1840,x			// $1D81CA  9E 40 18	| RAM ADDRESS
	INX				// $1D81CD  E8		| 
	CPX.w #$00C0			// $1D81CE  E0 C0 00	| 
	BNE code_1D81CA			// $1D81D1  D0 F7	| 
	REP #$20			// $1D81D3  C2 20	| 
	LDX.w #$0000			// $1D81D5  A2 00 00	| 
code_1D81D8:				//			| 
	LDA.b $40,x			// $1D81D8  B5 40	| RAM ADDRESS
	BEQ code_1D81EC			// $1D81DA  F0 10	| 
	INX				// $1D81DC  E8		| 
	INX				// $1D81DD  E8		| 
	CPX.w #$0020			// $1D81DE  E0 20 00	| 
	BNE code_1D81D8			// $1D81E1  D0 F5	| 
	DEX				// $1D81E3  CA		| 
	DEX				// $1D81E4  CA		| 
	LDA.b $60,x			// $1D81E5  B5 60	| RAM ADDRESS
	CLC				// $1D81E7  18		| 
	ADC.b $80,x			// $1D81E8  75 80	| RAM ADDRESS
	BRA code_1D81EE			// $1D81EA  80 02	| 
code_1D81EC:				//			| 
	LDA.b $60,x			// $1D81EC  B5 60	| RAM ADDRESS
code_1D81EE:				//			| 
	STA.w $1860			// $1D81EE  8D 60 18	| RAM ADDRESS
	SEP #$20			// $1D81F1  E2 20	| 
	STZ.b $00			// $1D81F3  64 00	| RAM ADDRESS
	STZ.b $02			// $1D81F5  64 02	| RAM ADDRESS
	RTS				// $1D81F7  60		| 


code_1D81F8:				//----------------------| 
	PHP				// $1D81F8  08		| 
	REP #$20			// $1D81F9  C2 20	| 
	LDA.b $21			// $1D81FB  A5 21	| RAM ADDRESS
	BEQ code_1D8204			// $1D81FD  F0 05	| 
	STZ.b $21			// $1D81FF  64 21	| RAM ADDRESS
	JSR code_1D8217			// $1D8201  20 17 82	| 
code_1D8204:				//			| 
	PLP				// $1D8204  28		| 
	RTS				// $1D8205  60		| 

code_1D8206:				//----------------------| 
	PHP				// $1D8206  08		| 
	REP #$20			// $1D8207  C2 20	| 
	LDA.b $21			// $1D8209  A5 21	| RAM ADDRESS
	BNE code_1D8215			// $1D820B  D0 08	| 
	LDA.w #$0001			// $1D820D  A9 01 00	| 
	STA.b $21			// $1D8210  85 21	| RAM ADDRESS
	JSR code_1D8217			// $1D8212  20 17 82	| 
code_1D8215:				//			| 
	PLP				// $1D8215  28		| 
	RTS				// $1D8216  60		| 

code_1D8217:				//----------------------| 
	LDX.w #$0000			// $1D8217  A2 00 00	| 
code_1D821A:				//			| 
	LDA.b $40,x			// $1D821A  B5 40	| RAM ADDRESS
	TAY				// $1D821C  A8		| 
	LDA.w $1840,x			// $1D821D  BD 40 18	| RAM ADDRESS
	STA.b $40,x			// $1D8220  95 40	| RAM ADDRESS
	TYA				// $1D8222  98		| 
	STA.w $1840,x			// $1D8223  9D 40 18	| RAM ADDRESS
	INX				// $1D8226  E8		| 
	INX				// $1D8227  E8		| 
	CPX.w #$00C0			// $1D8228  E0 C0 00	| 
	BNE code_1D821A			// $1D822B  D0 ED	| 
	LDX.b $23			// $1D822D  A6 23	| RAM ADDRESS
	LDA.b $25			// $1D822F  A5 25	| RAM ADDRESS
	STX.b $25			// $1D8231  86 25	| RAM ADDRESS
	STA.b $23			// $1D8233  85 23	| RAM ADDRESS
	RTS				// $1D8235  60		| 


code_1D8236:				//----------------------| 
	PHP				// $1D8236  08		| 
	SEP #$20			// $1D8237  E2 20	| 
	LDA.b $02			// $1D8239  A5 02	| RAM ADDRESS
	DEC				// $1D823B  3A		| 
	STA.w $4202			// $1D823C  8D 02 42	| 
	LDA.b #$03			// $1D823F  A9 03	| 
	STA.w $4203			// $1D8241  8D 03 42	| 
	LDA.b $00			// $1D8244  A5 00	| RAM ADDRESS
	CMP.b #$03			// $1D8246  C9 03	| 
	BEQ code_1D825B			// $1D8248  F0 11	| 
	LDA.w data_1DA003		// $1D824A  AD 03 A0	| 
	STA.b $17			// $1D824D  85 17	| RAM ADDRESS
	LDA.w data_1DA003+1		// $1D824F  AD 04 A0	| 
	STA.b $18			// $1D8252  85 18	| RAM ADDRESS
	LDA.w data_1DA003+2		// $1D8254  AD 05 A0	| 
	STA.b $19			// $1D8257  85 19	| RAM ADDRESS
	BRA code_1D826A			// $1D8259  80 0F	| 
code_1D825B:				//			| 
	LDA.w data_1DA000		// $1D825B  AD 00 A0	| 
	STA.b $17			// $1D825E  85 17	| RAM ADDRESS
	LDA.w data_1DA000+1		// $1D8260  AD 04 A0	| 
	STA.b $18			// $1D8263  85 18	| RAM ADDRESS
	LDA.w data_1DA000+2		// $1D8265  AD 05 A0	| 
	STA.b $19			// $1D8268  85 19	| RAM ADDRESS
code_1D826A:				//			| 
	JSR code_1D87C9			// $1D826A  20 C9 87	| 
	LDA.b $17			// $1D826D  A5 17	| RAM ADDRESS
	STA.b $0E			// $1D826F  85 0E	| RAM ADDRESS
	LDA.b $18			// $1D8271  A5 18	| RAM ADDRESS
	STA.b $0F			// $1D8273  85 0F	| RAM ADDRESS
	LDA.b $19			// $1D8275  A5 19	| RAM ADDRESS
	STA.b $10			// $1D8277  85 10	| RAM ADDRESS
	LDA.b $19			// $1D8279  A5 19	| RAM ADDRESS
	STA.b $10			// $1D827B  85 10	| RAM ADDRESS
	REP #$20			// $1D827D  C2 20	| 
	LDA.b $17			// $1D827F  A5 17	| RAM ADDRESS
	CLC				// $1D8281  18		| 
	ADC.w $4216			// $1D8282  6D 16 42	| 
	BCC code_1D828C			// $1D8285  90 05	| 
	INC.b $10			// $1D8287  E6 10	| RAM ADDRESS
	SBC.w #$8000			// $1D8289  E9 00 80	| 
code_1D828C:				//			| 
	STA.b $0E			// $1D828C  85 0E	| RAM ADDRESS
	SEP #$20			// $1D828E  E2 20	| 
	LDA [$0E]			// $1D8290  A7 0E	| INDIRECT RAM ADDRESS
	STA.b $17			// $1D8292  85 17	| RAM ADDRESS
	LDY.b $0E			// $1D8294  A4 0E	| RAM ADDRESS
	INY				// $1D8296  C8		| 
	BNE code_1D829E			// $1D8297  D0 05	| 
	INC.b $10			// $1D8299  E6 10	| RAM ADDRESS
	LDY.w #$8000			// $1D829B  A0 00 80	| 
code_1D829E:				//			| 
	STY.b $0E			// $1D829E  84 0E	| RAM ADDRESS
	LDA [$0E]			// $1D82A0  A7 0E	| INDIRECT RAM ADDRESS
	STA.b $18			// $1D82A2  85 18	| RAM ADDRESS
	LDY.b $0E			// $1D82A4  A4 0E	| RAM ADDRESS
	INY				// $1D82A6  C8		| 
	BNE code_1D82AE			// $1D82A7  D0 05	| 
	INC.b $10			// $1D82A9  E6 10	| RAM ADDRESS
	LDY.w #$8000			// $1D82AB  A0 00 80	| 
code_1D82AE:				//			| 
	STY.b $0E			// $1D82AE  84 0E	| RAM ADDRESS
	LDA [$0E]			// $1D82B0  A7 0E	| INDIRECT RAM ADDRESS
	STA.b $19			// $1D82B2  85 19	| RAM ADDRESS
	JSR code_1D87C9			// $1D82B4  20 C9 87	| 
	LDA.b $17			// $1D82B7  A5 17	| RAM ADDRESS
	STA.b $0E			// $1D82B9  85 0E	| RAM ADDRESS
	LDA.b $18			// $1D82BB  A5 18	| RAM ADDRESS
	STA.b $0F			// $1D82BD  85 0F	| RAM ADDRESS
	LDA.b $19			// $1D82BF  A5 19	| RAM ADDRESS
	STA.b $10			// $1D82C1  85 10	| RAM ADDRESS
	LDA [$0E]			// $1D82C3  A7 0E	| INDIRECT RAM ADDRESS
	XBA				// $1D82C5  EB		| 
	LDY.b $0E			// $1D82C6  A4 0E	| RAM ADDRESS
	INY				// $1D82C8  C8		| 
	BNE code_1D82D0			// $1D82C9  D0 05	| 
	INC.b $10			// $1D82CB  E6 10	| RAM ADDRESS
	LDY.w #$8000			// $1D82CD  A0 00 80	| 
code_1D82D0:				//			| 
	STY.b $0E			// $1D82D0  84 0E	| RAM ADDRESS
	LDA [$0E]			// $1D82D2  A7 0E	| INDIRECT RAM ADDRESS
	XBA				// $1D82D4  EB		| 
	LDY.b $0E			// $1D82D5  A4 0E	| RAM ADDRESS
	INY				// $1D82D7  C8		| 
	BNE code_1D82DF			// $1D82D8  D0 05	| 
	INC.b $10			// $1D82DA  E6 10	| RAM ADDRESS
	LDY.w #$8000			// $1D82DC  A0 00 80	| 
code_1D82DF:				//			| 
	STY.b $0E			// $1D82DF  84 0E	| RAM ADDRESS
	LDY.b $0E			// $1D82E1  A4 0E	| RAM ADDRESS
	INY				// $1D82E3  C8		| 
	BNE code_1D82EB			// $1D82E4  D0 05	| 
	INC.b $10			// $1D82E6  E6 10	| RAM ADDRESS
	LDY.w #$8000			// $1D82E8  A0 00 80	| 
code_1D82EB:				//			| 
	STY.b $0E			// $1D82EB  84 0E	| RAM ADDRESS
	LDY.b $0E			// $1D82ED  A4 0E	| RAM ADDRESS
	INY				// $1D82EF  C8		| 
	BNE code_1D82F7			// $1D82F0  D0 05	| 
	INC.b $10			// $1D82F2  E6 10	| RAM ADDRESS
	LDY.w #$8000			// $1D82F4  A0 00 80	| 
code_1D82F7:				//			| 
	STY.b $0E			// $1D82F7  84 0E	| RAM ADDRESS
	REP #$20			// $1D82F9  C2 20	| 
	TAX				// $1D82FB  AA		| 
	SEP #$20			// $1D82FC  E2 20	| 
code_1D82FE:				//			| 
	LDA [$0E]			// $1D82FE  A7 0E	| INDIRECT RAM ADDRESS
	STA.w $2142			// $1D8300  8D 42 21	| 
	LDA.b $0A			// $1D8303  A5 0A	| RAM ADDRESS
	STA.w $2140			// $1D8305  8D 40 21	| 
	LDY.b $0E			// $1D8308  A4 0E	| RAM ADDRESS
	INY				// $1D830A  C8		| RAM ADDRESS
	BNE code_1D8312			// $1D830B  D0 05	| 
	INC.b $10			// $1D830D  E6 10	| RAM ADDRESS
	LDY.w #$8000			// $1D830F  A0 00 80	| 
code_1D8312:				//			| 
	STY.b $0E			// $1D8312  84 0E	| RAM ADDRESS
	INC.b $0A			// $1D8314  E6 0A	| RAM ADDRESS
	BNE code_1D831A			// $1D8316  D0 02	| 
	INC.b $0A			// $1D8318  E6 0A	| RAM ADDRESS
code_1D831A:				//			| 
	CMP.w $2140			// $1D831A  CD 40 21	| 
	BNE code_1D831A			// $1D831D  D0 FB	| 
	DEX				// $1D831F  CA		| 
	BNE code_1D82FE			// $1D8320  D0 DC	| 
	LDA.b $00			// $1D8322  A5 00	| RAM ADDRESS
	CMP.b #$03			// $1D8324  C9 03	| 
	BEQ code_1D8339			// $1D8326  F0 11	| 
	LDA.w data_1DA009		// $1D8328  AD 09 A0	| 
	STA.b $17			// $1D832B  85 17	| RAM ADDRESS
	LDA.w data_1DA009+1		// $1D832D  AD 0A A0	| 
	STA.b $18			// $1D8330  85 18	| RAM ADDRESS
	LDA.w data_1DA009+2		// $1D8332  AD 0B A0	| 
	STA.b $19			// $1D8335  85 19	| RAM ADDRESS
	BRA code_1D8348			// $1D8337  80 0F	| 
code_1D8339:				//			| 
	LDA.w data_1DA006		// $1D8339  AD 06 A0	| 
	STA.b $17			// $1D833C  85 17	| RAM ADDRESS
	LDA.w data_1DA006+1		// $1D833E  AD 07 A0	| 
	STA.b $18			// $1D8341  85 18	| RAM ADDRESS
	LDA.w data_1DA006+2		// $1D8343  AD 08 A0	| 
	STA.b $19			// $1D8346  85 19	| RAM ADDRESS
code_1D8348:				//			| 
	JSR code_1D87C9			// $1D8348  20 C9 87	| 
	LDA.b $17			// $1D834B  A5 17	| RAM ADDRESS
	STA.b $0E			// $1D834D  85 0E	| RAM ADDRESS
	LDA.b $18			// $1D834F  A5 18	| RAM ADDRESS
	STA.b $0F			// $1D8351  85 0F	| RAM ADDRESS
	LDA.b $19			// $1D8353  A5 19	| RAM ADDRESS
	STA.b $10			// $1D8355  85 10	| RAM ADDRESS
	LDA.b #$00			// $1D8357  A9 00	| 
	XBA				// $1D8359  EB		| 
	LDA.b $02			// $1D835A  A5 02	| RAM ADDRESS
	DEC				// $1D835C  3A		| 
	REP #$20			// $1D835D  C2 20	| 
	ASL				// $1D835F  0A		| 
	ASL				// $1D8360  0A		| 
	ASL				// $1D8361  0A		| 
	ASL				// $1D8362  0A		| 
	CLC				// $1D8363  18		| 
	ADC.b $0E			// $1D8364  65 0E	| RAM ADDRESS
	BCC code_1D836D			// $1D8366  90 05	| 
	INC.b $10			// $1D8368  E6 10	| RAM ADDRESS
	SBC.w #$8000			// $1D836A  E9 00 80	| 
code_1D836D:				//			| 
	STA.b $0E			// $1D836D  85 0E	| RAM ADDRESS
	LDX.w #$0000			// $1D836F  A2 00 00	| 
	SEP #$20			// $1D8372  E2 20	| 
code_1D8374:				//			| 
	LDA [$0E]			// $1D8374  A7 0E	| INDIRECT RAM ADDRESS
	STA.b $C0,x			// $1D8376  95 C0	| RAM ADDRESS
	STA.b $E0,x			// $1D8378  95 E0	| RAM ADDRESS
	LDY.b $0E			// $1D837A  A4 0E	| RAM ADDRESS
	INY				// $1D837C  C8		| 
	BNE code_1D8384			// $1D837D  D0 05	| 
	INC.b $10			// $1D837F  E6 10	| RAM ADDRESS
	LDY.w #$8000			// $1D8381  A0 00 80	| 
code_1D8384:				//			| 
	STY.b $0E			// $1D8384  84 0E	| RAM ADDRESS
	LDA.b #$00			// $1D8386  A9 00	| 
	STA.b $A0,x			// $1D8388  95 A0	| RAM ADDRESS
	STA.b $A1,x			// $1D838A  95 A1	| RAM ADDRESS
	INX				// $1D838C  E8		| 
	INX				// $1D838D  E8		| 
	CPX.w #$0020			// $1D838E  E0 20 00	| 
	BNE code_1D8374			// $1D8391  D0 E1	| 
	REP #$20			// $1D8393  C2 20	| 
	LDY.w #$0000			// $1D8395  A0 00 00	| 
code_1D8398:				//			| 
	LDA.w $1940,y			// $1D8398  B9 40 19	| RAM ADDRESS
	BEQ code_1D83BC			// $1D839B  F0 1F	| 
	LDX.w #$0000			// $1D839D  A2 00 00	| 
code_1D83A0:				//			| 
	CMP.b $E0,x			// $1D83A0  D5 E0	| RAM ADDRESS
	BEQ code_1D83AD			// $1D83A2  F0 09	| RAM ADDRESS
	INX				// $1D83A4  E8		| 
	INX				// $1D83A5  E8		| 
	CPX.w #$0020			// $1D83A6  E0 20 00	| 
	BNE code_1D83A0			// $1D83A9  D0 F5	| 
	BRA code_1D83B5			// $1D83AB  80 08	| 
code_1D83AD:				//			| 
	STA.w $19A0,y			// $1D83AD  99 A0 19	| RAM ADDRESS
	LDA.w #$0000			// $1D83B0  A9 00 00	| 
	STA.b $E0,x			// $1D83B3  95 E0	| RAM ADDRESS
code_1D83B5:				//			| 
	INY				// $1D83B5  C8		| 
	INY				// $1D83B6  C8		| 
	CPY.w #$0020			// $1D83B7  C0 20 00	| 
	BNE code_1D8398			// $1D83BA  D0 DC	| 
code_1D83BC:				//			| 
	LDA.w #$0000			// $1D83BC  A9 00 00	| 
	STA.w $2141			// $1D83BF  8D 41 21	| 
	TYA				// $1D83C2  98		| 
	BEQ code_1D83EF			// $1D83C3  F0 2A	| 
	LDX.w #$0000			// $1D83C5  A2 00 00	| 
	LDA.w #$0000			// $1D83C8  A9 00 00	| 
	CLC				// $1D83CB  18		| 
code_1D83CC:				//			| 
	ADC.b $E0,x			// $1D83CC  75 E0	| RAM ADDRESS
	INX				// $1D83CE  E8		| 
	INX				// $1D83CF  E8		| 
	CPX.w #$0020			// $1D83D0  E0 20 00	| 
	BNE code_1D83CC			// $1D83D3  D0 F7	| 
	TAX				// $1D83D5  AA		| 
	BNE code_1D8410			// $1D83D6  D0 38	| 
	SEP #$20			// $1D83D8  E2 20	| 
	LDA.b #$FF			// $1D83DA  A9 FF	| 
	STA.w $2141			// $1D83DC  8D 41 21	| 
	LDA.b #$00			// $1D83DF  A9 00	| 
	STA.w $2140			// $1D83E1  8D 40 21	| 
code_1D83E4:				//			| 
	CMP.w $2140			// $1D83E4  CD 40 21	| 
	BNE code_1D83E4			// $1D83E7  D0 FB	| 
	INC				// $1D83E9  1A		| 
	STA.b $0A			// $1D83EA  85 0A	| RAM ADDRESS
	JMP code_1D85E9			// $1D83EC  4C E9 85	| 
code_1D83EF:				//			| 
	SEP #$20			// $1D83EF  E2 20	| 
	LDA.b $60			// $1D83F1  A5 60	| RAM ADDRESS
	STA.w $2142			// $1D83F3  8D 42 21	| 
	LDA.b $61			// $1D83F6  A5 61	| RAM ADDRESS
	STA.w $2143			// $1D83F8  8D 43 21	| 
	LDA.b #$11			// $1D83FB  A9 11	| 
	STA.w $2141			// $1D83FD  8D 41 21	| 
	LDA.b #$00			// $1D8400  A9 00	| 
	STA.w $2140			// $1D8402  8D 40 21	| 
code_1D8405:				//			| 
	CMP.w $2140			// $1D8405  CD 40 21	| 
	BNE code_1D8405			// $1D8408  D0 FB	| 
	INC				// $1D840A  1A		| 
	STA.b $0A			// $1D840B  85 0A	| RAM ADDRESS
	JMP code_1D849A			// $1D840D  4C 9A 84	| 
code_1D8410:				//			| 
	REP #$20			// $1D8410  C2 20	| 
	STZ.b $0A			// $1D8412  64 0A	| 
	LDX.w #$0000			// $1D8414  A2 00 00	| 
code_1D8417:				//			| 
	LDA.b $A0,x			// $1D8417  B5 A0	| 
	BEQ code_1D8425			// $1D8419  F0 0A	| 
	INX				// $1D841B  E8		| 
	INX				// $1D841C  E8		| 
	CPX.w #$0020			// $1D841D  E0 20 00	| 
	BNE code_1D8417			// $1D8420  D0 F5	| 
	JMP code_1D849A			// $1D8422  4C 9A 84	| 
code_1D8425:				//			| 
	TXY				// $1D8425  9B		| 
	INX				// $1D8426  E8		| 
	INX				// $1D8427  E8		| 
code_1D8428:				//			| 
	LDA.b $A0,x			// $1D8428  B5 A0	| RAM ADDRESS
	BNE code_1D843B			// $1D842A  D0 0F	| 
code_1D842C:				//			| 
	INX				// $1D842C  E8		| 
	INX				// $1D842D  E8		| 
	CPX.w #$0020			// $1D842E  E0 20 00	| 
	BNE code_1D8428			// $1D8431  D0 F5	| 
	LDA.w $1960,y			// $1D8433  B9 60 19	| RAM ADDRESS
	STA.w $2142			// $1D8436  8D 42 21	| 
	BRA code_1D8487			// $1D8439  80 4C	| 
code_1D843B:				//			| 
	STA.w $1940,y			// $1D843B  99 40 19	| RAM ADDRESS
	LDA.b $60,x			// $1D843E  B5 60	| RAM ADDRESS
	STA.w $2142			// $1D8440  8D 42 21	| 
	LDA.b $0A			// $1D8443  A5 0A	| RAM ADDRESS
	STA.w $2140			// $1D8445  8D 40 21	| 
	INC.b $0A			// $1D8448  E6 0A	| RAM ADDRESS
code_1D844A:				//			| 
	CMP.w $2140			// $1D844A  CD 40 21	| 
	BNE code_1D844A			// $1D844D  D0 FB	| 
	LDA.b $80,x			// $1D844F  B5 80	| RAM ADDRESS
	STA.w $1980,y			// $1D8451  99 80 19	| RAM ADDRESS
	CLC				// $1D8454  18		| 
	ADC.w $1960,y			// $1D8455  79 60 19	| RAM ADDRESS
	STA.w $1962,y			// $1D8458  99 62 19	| RAM ADDRESS
	LDA.w $1960,y			// $1D845B  B9 60 19	| RAM ADDRESS
	STA.w $2142			// $1D845E  8D 42 21	| 
	LDA.b $0A			// $1D8461  A5 0A	| RAM ADDRESS
	STA.w $2140			// $1D8463  8D 40 21	| 
	INC.b $0A			// $1D8466  E6 0A	| RAM ADDRESS
code_1D8468:				//			| 
	CMP.w $2140			// $1D8468  CD 40 21	| 
	BNE code_1D8468			// $1D846B  D0 FB	| 
	LDA.b $80,x			// $1D846D  B5 80	| RAM ADDRESS
	STA.w $2142			// $1D846F  8D 42 21	| 
	LDA.b $0A			// $1D8472  A5 0A	| RAM ADDRESS
	STA.w $2140			// $1D8474  8D 40 21	| 
	INC.b $0A			// $1D8477  E6 0A	| RAM ADDRESS
code_1D8479:				//			| 
	CMP.w $2140			// $1D8479  CD 40 21	| 
	BNE code_1D8479			// $1D847C  D0 FB	| 
	INY				// $1D847E  C8		| 
	INY				// $1D847F  C8		| 
	LDA.w #$0000			// $1D8480  A9 00 00	| 
	STA.b $A0,x			// $1D8483  95 A0	| RAM ADDRESS
	BRA code_1D842C			// $1D8485  80 A5	| 
code_1D8487:				//			|
	SEP #$20			// $1D8487  E2 20	| 
	LDA.b #$22			// $1D8489  A9 22	| 
	STA.w $2141			// $1D848B  8D 41 21	| 
	LDA.b $0A			// $1D848E  A5 0A	| RAM ADDRESS
	STA.w $2140			// $1D8490  8D 40 21	| 
	INC.b $0A			// $1D8493  E6 0A	| RAM ADDRESS
code_1D8495:				//			| 
	CMP.w $2140			// $1D8495  CD 40 21	| 
	BNE code_1D8495			// $1D8498  D0 FB	| 
code_1D849A:				//			|
	SEP #$20			// $1D849A  E2 20	| 
	STY.b $0C			// $1D849C  84 0C	| RAM ADDRESS
	LDA.w data_1DA00C		// $1D849E  AD 0C A0	| 
	STA.b $17			// $1D84A1  85 17	| RAM ADDRESS
	LDA.w data_1DA00C+1		// $1D84A3  AD 0D A0	| 
	STA.b $18			// $1D84A6  85 18	| RAM ADDRESS
	LDA.w data_1DA00C+2		// $1D84A8  AD 0E A0	| 
	STA.b $19			// $1D84AB  85 18	| RAM ADDRESS
	JSR code_1D87C9			// $1D84AD  20 C9 87	| 
	LDA.b $17			// $1D84B0  A5 17	| RAM ADDRESS
	STA.b $0E			// $1D84B2  85 0E	| RAM ADDRESS
	LDA.b $18			// $1D84B4  A5 17	| RAM ADDRESS
	STA.b $0F			// $1D84B6  85 0E	| RAM ADDRESS
	LDA.b $19			// $1D84B8  A5 17	| RAM ADDRESS
	STA.b $10			// $1D84BA  85 0E	| RAM ADDRESS
	REP #$20			// $1D84BC  C2 20	| 
	LDY.w #$0000			// $1D84BE  A0 00 00	| 
code_1D84C1:				//			| 
	LDA.w $19E0,y			// $1D84C1  B9 E0 19	| RAM ADDRESS
	BNE code_1D84D0			// $1D84C4  D0 0A	| 
	INY				// $1D84C6  C8		| 
	INY				// $1D84C7  C8		| 
code_1D84C8:				//			| 
	CPY.w #$0020			// $1D84C8  C0 20 00	| 
	BNE code_1D84C1			// $1D84CB  D0 F4	| 
	JMP code_1D85D4			// $1D84CD  4C D4 85	| 
code_1D84D0:				//			| 
	INY				// $1D84D0  C8		| 
	INY				// $1D84D1  C8		| 
	PHY				// $1D84D2  5A		| 
	SEP #$20			// $1D84D3  E2 20	| 
	STA.b $1A			// $1D84D5  85 1A	| RAM ADDRESS
	STA.w $4202			// $1D84D7  8D 02 42	| 
	LDA.b #$03			// $1D84DA  A9 03	| 
	STA.w $4203			// $1D84DC  8D 03 42	| 
	LDA.b $10			// $1D84DF  A5 10	| RAM ADDRESS
	STA.b $13			// $1D84E1  85 13	| RAM ADDRESS
	REP #$20			// $1D84E3  C2 20	| 
	LDA.b $0E			// $1D84E5  A5 0E	| RAM ADDRESS
	CLC				// $1D84E7  18		| 
	ADC.w $4216			// $1D84E8  6D 16 42	| 
	BCC code_1D84F2			// $1D84EB  90 05	| 
	INC.b $13			// $1D84ED  E6 13	| RAM ADDRESS
	SBC.w #$8000			// $1D84EF  E9 00 80	| 
code_1D84F2:				//			| 
	STA.b $11			// $1D84F2  85 11	| RAM ADDRESS
	SEP #$20			// $1D84F4  E2 20	| 
	LDA [$11]			// $1D84F6  A7 11	| INDIRECT RAM ADDRESS
	STA.b $17			// $1D84F8  85 17	| RAM ADDRESS
	LDY.b $11			// $1D84FA  A4 11	| RAM ADDRESS
	INY				// $1D84FC  C8		| 
	BNE code_1D8504			// $1D84FD  D0 05	| 
	INC.b $13			// $1D84FF  E6 13	| RAM ADDRESS
	LDY.w #$8000			// $1D8501  A0 00 80	| 
code_1D8504:				//			| 
	STY.b $11			// $1D8504  84 11	| RAM ADDRESS
	LDA [$11]			// $1D8506  A7 11	| INDIRECT RAM ADDRESS
	STA.b $18			// $1D8508  85 18	| RAM ADDRESS
	LDY.b $11			// $1D850A  A4 11	| RAM ADDRESS
	INY				// $1D850C  C8		| 
	BNE code_1D8514			// $1D850D  D0 05	| 
	INC.b $13			// $1D850F  E6 13	| RAM ADDRESS
	LDY.w #$8000			// $1D8511  A0 00 80	| 
code_1D8514:				//			| 
	STY.b $11			// $1D8514  84 11	| RAM ADDRESS
	LDA [$11]			// $1D8516  A7 11	| INDIRECT RAM ADDRESS
	STA.b $19			// $1D8518  85 19	| RAM ADDRESS
	JSR code_1D87C9			// $1D851A  20 C9 87	| 
	LDA.b $17			// $1D851D  A5 17	| RAM ADDRESS
	STA.b $14			// $1D851F  85 14	| RAM ADDRESS
	LDA.b $18			// $1D8521  A5 18	| RAM ADDRESS
	STA.b $15			// $1D8523  85 15	| RAM ADDRESS
	LDA.b $19			// $1D8525  A5 19	| RAM ADDRESS
	STA.b $16			// $1D8527  85 16	| RAM ADDRESS
	LDA [$14]			// $1D8529  A7 14	| INDIRECT RAM ADDRESS
	XBA				// $1D852B  EB		| 
	LDY.b $14			// $1D852C  A4 14	| RAM ADDRESS
	INY				// $1D852E  C8		| 
	BNE code_1D8536			// $1D852F  D0 05	| 
	INC.b $16			// $1D8531  E6 16	| RAM ADDRESS
	LDY.w #$8000			// $1D8533  A0 00 80	| 
code_1D8536:				//			| 
	STY.b $14			// $1D8536  84 14	| RAM ADDRESS
	LDA [$14]			// $1D8538  A7 14	| INDIRECT RAM ADDRESS
	XBA				// $1D853A  EB		| 
	LDY.b $14			// $1D853B  A4 14	| RAM ADDRESS
	INY				// $1D853D  C8		| 
	BNE code_1D8545			// $1D853E  D0 05	| 
	INC.b $16			// $1D8540  E6 16	| RAM ADDRESS
	LDY.w #$8000			// $1D8542  A0 00 80	| 
code_1D8545:				//			| 
	STY.b $14			// $1D8545  84 14	| RAM ADDRESS
	REP #$20			// $1D8547  C2 20	| 
	TAX				// $1D8549  AA		| 
	LDA [$14]			// $1D854A  A7 14	| INDIRECT RAM ADDRESS
	STA.b $1C			// $1D854C  85 1C	| RAM ADDRESS
	LDY.b $14			// $1D854E  A4 14	| RAM ADDRESS
	INY				// $1D8550  C8		| 
	BNE code_1D8558			// $1D8551  D0 05	| 
	INC.b $16			// $1D8553  E6 16	| RAM ADDRESS
	LDY.w #$8000			// $1D8555  A0 00 80	| 
code_1D8558:				//			| 
	STY.b $14			// $1D8558  84 14	| RAM ADDRESS
	LDY.b $14			// $1D855A  A4 14	| RAM ADDRESS
	INY				// $1D855C  C8		| 
	BNE code_1D8564			// $1D855D  D0 05	| 
	INC.b $16			// $1D855F  E6 16	| RAM ADDRESS
	LDY.w #$8000			// $1D8561  A0 00 80	| 
code_1D8564:				//			| 
	STY.b $14			// $1D8564  84 14	| RAM ADDRESS
	TXA				// $1D8566  8A		| 
	LDY.b $0C			// $1D8567  A4 0C	| RAM ADDRESS
	STA.w $1980,y			// $1D8569  99 80 19	| RAM ADDRESS
	CLC				// $1D856C  18		| 
	ADC.w $1960,y			// $1D856D  79 60 19	| RAM ADDRESS
	CPY.w #$001E			// $1D8570  C0 1E 00	| 
	BNE code_1D857A			// $1D8573  D0 05	| 
	STA.w $1923			// $1D8575  8D 23 19	| RAM ADDRESS
	BRA code_1D857D			// $1D8578  80 03	| 
code_1D857A:				//			| 
	STA.w $1962,y			// $1D857A  99 62 19	| RAM ADDRESS
code_1D857D:				//			| 
	LDA.b $1A			// $1D857D  A5 1A	| RAM ADDRESS
	STA.w $1940,y			// $1D857F  99 40 19	| RAM ADDRESS
	INY				// $1D8582  C8		| 
	INY				// $1D8583  C8		| 
	STY.b $0C			// $1D8584  84 0C	| RAM ADDRESS
	SEP #$20			// $1D8586  E2 20	| 
code_1D8588:				//			| 
	LDA [$14]			// $1D8588  A7 14	| INDIRECT RAM ADDRESS
	STA.w $2141			// $1D858A  8D 41 21	| 
	LDY.b $14			// $1D858D  A4 14	| RAM ADDRESS
	INY				// $1D858F  C8		| 
	BNE code_1D8597			// $1D8590  D0 05	| 
	INC.b $16			// $1D8592  E6 16	| RAM ADDRESS
	LDY.w #$8000			// $1D8594  A0 00 80	| 
code_1D8597:				//			| 
	STY.b $14			// $1D8597  84 14	| RAM ADDRESS
	LDA [$14]			// $1D8599  A7 14	| INDIRECT RAM ADDRESS
	STA.w $2142			// $1D859B  8D 42 21	| 
	LDY.b $14			// $1D859E  A4 14	| RAM ADDRESS
	INY				// $1D85A0  C8		| 
	BNE code_1D85A8			// $1D85A1  D0 05	| 
	INC.b $16			// $1D85A3  E6 16	| RAM ADDRESS
	LDY.w #$8000			// $1D85A5  A0 00 80	| 
code_1D85A8:				//			| 
	STY.b $14			// $1D85A8  84 14	| RAM ADDRESS
	LDA [$14]			// $1D85AA  A7 14	| INDIRECT RAM ADDRESS
	STA.w $2143			// $1D85AC  8D 42 21	| 
	LDY.b $14			// $1D85AF  A4 14	| RAM ADDRESS
	INY				// $1D85B1  C8		| 
	BNE code_1D85B9			// $1D85B2  D0 05	| 
	INC.b $16			// $1D85B4  E6 16	| RAM ADDRESS
	LDY.w #$8000			// $1D85B6  A0 00 80	| 
code_1D85B9:				//			| 
	STY.b $14			// $1D85B9  84 14	| RAM ADDRESS
	LDA.b $0A			// $1D85BB  A5 0A	| RAM ADDRESS
	STA.w $2140			// $1D85BD  8D 40 21	| 
	INC.b $0A			// $1D85C0  E6 0A	| RAM ADDRESS
	BNE code_1D85C6			// $1D85C2  D0 02	| 
	INC.b $0A			// $1D85C4  E6 0A	| RAM ADDRESS
code_1D85C6:				//			| 
	CMP.w $2140			// $1D85C6  CD 40 21	| 
	BNE code_1D85C6			// $1D85C9  D0 FB	| 
	DEX				// $1D85CB  CA		| 
	DEX				// $1D85CC  CA		| 
	DEX				// $1D85CD  CA		| 
	BNE code_1D8588			// $1D85CE  D0 B8	| 
	PLY				// $1D85D0  7A		| 
	JMP code_1D84C8			// $1D85D1  4C C8 84	| 
code_1D85D4:				//			| 
	LDX.w $190C			// $1D85D4  AE 0C 19	| RAM ADDRESS
	REP #$20			// $1D85D7  C2 20	| 
	LDA.w #$0000			// $1D85D9  A9 00 00	| 
	BRA code_1D85E2			// $1D85DC  80 04	| 
code_1D85DE:				//			| 
	STA.b $40,x			// $1D85DE  95 40	| RAM ADDRESS
	INX				// $1D85E0  E8		| 
	INX				// $1D85E1  E8		| 
code_1D85E2:				//			| 
	CPX.w #$0020			// $1D85E2  E0 20 00	| 
	BNE code_1D85DE			// $1D85E5  D0 F7	| 
	STZ.b $0A			// $1D85E7  64 0A	| RAM ADDRESS
code_1D85E9:				//			|
	SEP #$20			// $1D85E9  E2 20	| 
	LDA.w data_1DA00F		// $1D85EB  AD 0F A0	| 
	STA.b $17			// $1D85EE  85 17	| RAM ADDRESS
	LDA.w data_1DA00F+1		// $1D85F0  AD 10 A0	| 
	STA.b $18			// $1D85F3  85 18	| RAM ADDRESS
	LDA.w data_1DA00F+2		// $1D85F5  AD 11 A0	| 
	STA.b $19			// $1D85F8  85 19	| RAM ADDRESS
	JSR code_1D87C9			// $1D85FA  20 C9 87	| 
	LDA.b $17			// $1D85FD  A5 17	| RAM ADDRESS
	STA.b $0E			// $1D85FF  85 0E	| RAM ADDRESS
	LDA.b $18			// $1D8601  A5 18	| RAM ADDRESS
	STA.b $0F			// $1D8603  85 0F	| RAM ADDRESS
	LDA.b $19			// $1D8605  A5 19	| RAM ADDRESS
	STA.b $10			// $1D8607  85 10	| RAM ADDRESS
	LDY.w #$0000			// $1D8609  A0 00 00	| 
code_1D860C:				//			| 
	REP #$20			// $1D860C  C2 20	| 
	LDA.w $1940,y			// $1D860E  B9 40 19	| RAM ADDRESS
	BNE code_1D8616			// $1D8611  D0 03	| 
	JMP code_1D86E7			// $1D8613  4C E7 86	| 
code_1D8616:				//			| 
	PHY				// $1D8616  5A		| 
	LDX.b $0F			// $1D8617  A6 0F	| RAM ADDRESS
	STX.b $15			// $1D8619  86 15	| RAM ADDRESS
	LDX.w #$0000			// $1D861B  A2 00 00	| 
code_1D861E:				//			| 
	CMP.b $40,x			// $1D861E  D5 40	| RAM ADDRESS
	BEQ code_1D8626			// $1D8620  F0 04	| 
	INX				// $1D8622  E8		| 
	INX				// $1D8623  E8		| 
	BRA code_1D861E			// $1D8624  80 F8	| 
code_1D8626:				//			| 
	SEP #$20			// $1D8626  E2 20	| 
	STA.w $4202			// $1D8628  8D 02 42	| 
	LDA.b #$03			// $1D862B  A9 03	| 
	STA.w $4203			// $1D862D  8D 03 42	| 
	LDA.b $10			// $1D8630  A5 10	| RAM ADDRESS
	STA.b $16			// $1D8632  85 16	| RAM ADDRESS
	REP #$20			// $1D8634  C2 20	| 
	LDA.b $0E			// $1D8636  A5 0E	| RAM ADDRESS
	CLC				// $1D8638  18		| 
	ADC.w $4216			// $1D8639  6D 16 42	| 
	BCC code_1D8643			// $1D863C  90 05	| 
	INC.b $16			// $1D863E  E6 16	| RAM ADDRESS
	SBC.w #$8000			// $1D8640  E9 00 80	| 
code_1D8643:				//			| 
	STA.b $14			// $1D8643  85 14	| RAM ADDRESS
	SEP #$20			// $1D8645  E2 20	| 
	LDA [$14]			// $1D8647  A7 14	| INDIRECT RAM ADDRESS
	LDY.b $14			// $1D8649  A4 14	| RAM ADDRESS
	INY				// $1D864B  C8		| 
	BNE code_1D8653			// $1D864C  D0 05	| 
	INC.b $16			// $1D864E  E6 16	| RAM ADDRESS
	LDY.w #$8000			// $1D8650  A0 00 80	| 
code_1D8653:				//			| 
	STY.b $14			// $1D8653  84 14	| RAM ADDRESS
	STA.b $17			// $1D8655  85 17	| RAM ADDRESS
	LDA [$14]			// $1D8657  A7 14	| INDIRECT RAM ADDRESS
	LDY.b $14			// $1D8659  A4 14	| RAM ADDRESS
	INY				// $1D865B  C8		| 
	BNE code_1D8663			// $1D865C  D0 05	| 
	INC.b $16			// $1D865E  E6 16	| RAM ADDRESS
	LDY.w #$8000			// $1D8660  A0 00 80	| 
code_1D8663:				//			| 
	STY.b $14			// $1D8663  84 14	| RAM ADDRESS
	STA.b $18			// $1D8665  85 18	| RAM ADDRESS
	LDA [$14]			// $1D8667  A7 14	| INDIRECT RAM ADDRESS
	STA.b $19			// $1D8669  85 19	| RAM ADDRESS
	JSR code_1D87C9			// $1D866B  20 C9 87	| 
	LDA.b $17			// $1D866E  A5 17	| RAM ADDRESS
	STA.b $14			// $1D8670  85 14	| RAM ADDRESS
	LDA.b $18			// $1D8672  A5 18	| RAM ADDRESS
	STA.b $15			// $1D8674  85 15	| RAM ADDRESS
	LDA.b $19			// $1D8676  A5 19	| RAM ADDRESS
	STA.b $16			// $1D8678  85 16	| RAM ADDRESS
	LDA [$14]			// $1D867A  A7 14	| INDIRECT RAM ADDRESS
	XBA				// $1D867C  EB		| 
	LDY.b $14			// $1D867D  A4 14	| RAM ADDRESS
	INY				// $1D867F  C8		| 
	BNE code_1D8687			// $1D8680  D0 05	| 
	INC.b $16			// $1D8682  E6 16	| RAM ADDRESS
	LDY.w #$8000			// $1D8684  A0 00 80	| 
code_1D8687:				//			| 
	STY.b $14			// $1D8687  84 14	| RAM ADDRESS
	LDA [$14]			// $1D8689  A7 14	| INDIRECT RAM ADDRESS
	XBA				// $1D868B  EB		| 
	LDY.b $14			// $1D868C  A4 14	| RAM ADDRESS
	INY				// $1D868E  C8		| 
	BNE code_1D8696			// $1D868F  D0 05	| 
	INC.b $16			// $1D8691  E6 16	| RAM ADDRESS
	LDY.w #$8000			// $1D8693  A0 00 80	| 
code_1D8696:				//			| 
	STY.b $14			// $1D8696  84 14	| RAM ADDRESS
	REP #$20			// $1D8698  C2 20	| 
	SEC				// $1D869A  38		| 
	SBC.w $191C			// $1D869B  ED 1C 19	| RAM ADDRESS
	CLC				// $1D869E  18		| 
	ADC.b $60,x			// $1D869F  75 60	| RAM ADDRESS
	STA.w $2142			// $1D86A1  8D 42 21	| 
	LDA.b $0A			// $1D86A4  A5 0A	| RAM ADDRESS
	STA.w $2140			// $1D86A6  8D 40 21	| 
	INC.b $0A			// $1D86A9  E6 0A	| RAM ADDRESS
code_1D86AB:				//			| 
	CMP.w $2140			// $1D86AB  CD 40 21	| 
	BNE code_1D86AB			// $1D86AE  D0 FB	| 
	SEP #$20			// $1D86B0  E2 20	| 
	LDA [$14]			// $1D86B2  A7 14	| INDIRECT RAM ADDRESS
	XBA				// $1D86B4  EB		| 
	LDY.b $14			// $1D86B5  A4 14	| RAM ADDRESS
	INY				// $1D86B7  C8		| 
	BNE code_1D86BF			// $1D86B8  D0 05	| 
	INC.b $16			// $1D86BA  E6 16	| RAM ADDRESS
	LDY.w #$8000			// $1D86BC  A0 00 80	| 
code_1D86BF:				//			| 
	STY.b $14			// $1D86BF  84 14	| RAM ADDRESS
	LDA [$14]			// $1D86C1  A7 14	| INDIRECT RAM ADDRESS
	XBA				// $1D86C3  EB		| 
	REP #$20			// $1D86C4  C2 20	| 
	SEC				// $1D86C6  38		| 
	SBC.w $191C			// $1D86C7  ED 1C 19	| RAM ADDRESS
	CLC				// $1D86CA  18		| 
	ADC.b $60,x			// $1D86CB  75 60	| RAM ADDRESS
	STA.w $2142			// $1D86CD  8D 42 21	| 
	LDA.b $0A			// $1D86D0  A5 0A	| RAM ADDRESS
	STA.w $2140			// $1D86D2  8D 40 21	| 
	INC.b $0A			// $1D86D5  E6 0A	| RAM ADDRESS
code_1D86D7:				//			| 
	CMP.w $2140			// $1D86D7  CD 40 21	| 
	BNE code_1D86D7			// $1D86DA  D0 FB	| 
	PLY				// $1D86DC  7A		| 
	INY				// $1D86DD  C8		| 
	INY				// $1D86DE  C8		| 
	CPY.w #$0020			// $1D86DF  C0 20 00	| 
	BEQ code_1D86E7			// $1D86E2  F0 03	| 
	JMP code_1D860C			// $1D86E4  4C 0C 86	| 
code_1D86E7:				//			| 
	STZ.b $0A			// $1D86E7  64 0A	| RAM ADDRESS
	SEP #$20			// $1D86E9  E2 20	| 
	LDA.w data_1DA012		// $1D86EB  AD 12 A0	| 
	STA.b $17			// $1D86EE  85 17	| RAM ADDRESS
	LDA.w data_1DA012+1		// $1D86F0  AD 13 A0	| 
	STA.b $18			// $1D86F3  85 18	| RAM ADDRESS
	LDA.w data_1DA012+2		// $1D86F5  AD 14 A0	| 
	STA.b $19			// $1D86F8  85 19	| RAM ADDRESS
	JSR code_1D87C9			// $1D86FA  20 C9 87	| 
	LDA.b $17			// $1D86FD  A5 17	| RAM ADDRESS
	STA.b $0E			// $1D86FF  85 0E	| RAM ADDRESS
	LDA.b $18			// $1D8701  A5 18	| RAM ADDRESS
	STA.b $0F			// $1D8703  85 0F	| RAM ADDRESS
	LDA.b $19			// $1D8705  A5 19	| RAM ADDRESS
	STA.b $10			// $1D8707  85 10	| RAM ADDRESS
	LDX.w #$0000			// $1D8709  A2 00 00	| 
code_1D870C:				//			| 
	LDA.b $40,x			// $1D870C  B5 40	| RAM ADDRESS
	BNE code_1D8713			// $1D870E  D0 03	| 
	JMP code_1D87AE			// $1D8710  4C AE 87	| 
code_1D8713:				//			| 
	STA.w $4202			// $1D8713  8D 02 42	| 
	LDA.b #$06			// $1D8716  A9 06	| 
	STA.w $4203			// $1D8718  8D 03 42	| 
	LDA.b $10			// $1D871B  A5 10	| RAM ADDRESS
	STA.b $16			// $1D871D  85 16	| RAM ADDRESS
	REP #$20			// $1D871F  C2 20	| 
	LDA.b $0E			// $1D8721  A5 0E	| RAM ADDRESS
	CLC				// $1D8723  18		| 
	ADC.w $4216			// $1D8724  6D 16 42	| 
	BCC code_1D872E			// $1D8727  90 05	| 
	INC.b $16			// $1D8729  E6 16	| RAM ADDRESS
	SBC.w #$8000			// $1D872B  E9 00 00	| 
code_1D872E:				//			| 
	STA.b $14			// $1D872E  85 14	| RAM ADDRESS
	SEP #$20			// $1D8730  E2 20	| 
	LDY.b $14			// $1D8732  A4 14	| RAM ADDRESS
	INY				// $1D8734  C8		| 
	BNE code_1D873C			// $1D8735  D0 05	| 
	INC.b $16			// $1D8737  E6 16	| RAM ADDRESS
	LDY.w #$8000			// $1D8739  A0 00 80	| 
code_1D873C:				//			| 
	STY.b $14			// $1D873C  84 14	| RAM ADDRESS
	LDA.b $40,x			// $1D873E  B5 40	| RAM ADDRESS
	STA.w $2141			// $1D8740  8D 41 21	| 
	LDA [$14]			// $1D8743  A7 14	| INDIRECT RAM ADDRESS
	STA.w $2142			// $1D8745  8D 42 21	| 
	LDY.b $14			// $1D8748  A4 14	| RAM ADDRESS
	INY				// $1D874A  C8		| 
	BNE code_1D8752			// $1D874B  D0 05	| 
	INC.b $16			// $1D874D  E6 16	| RAM ADDRESS
	LDY.w #$8000			// $1D874F  A0 00 80	| 
code_1D8752:				//			| 
	STY.b $14			// $1D8752  84 14	| RAM ADDRESS
	LDA [$14]			// $1D8754  A7 14	| INDIRECT RAM ADDRESS
	STA.w $2143			// $1D8756  8D 43 21	| 
	LDY.b $14			// $1D8759  A4 14	| RAM ADDRESS
	INY				// $1D875B  C8		| 
	BNE code_1D8763			// $1D875C  D0 05	| 
	INC.b $16			// $1D875E  E6 16	| RAM ADDRESS
	LDY.w #$8000			// $1D8760  A0 00 80	| 
code_1D8763:				//			| 
	STY.b $14			// $1D8763  84 14	| RAM ADDRESS
	LDA.b $0A			// $1D8765  A5 0A	| RAM ADDRESS
	STA.w $2140			// $1D8767  8D 40 21	| 
	INC.b $0A			// $1D876A  E6 0A	| RAM ADDRESS
code_1D876C:				//			| 
	CMP.w $2140			// $1D876C  CD 40 21	| 
	BNE code_1D876C			// $1D876F  D0 FB	| 
	LDA [$14]			// $1D8771  A7 14	| INDIRECT RAM ADDRESS
	STA.w $2141			// $1D8773  8D 41 21	| 
	LDY.b $14			// $1D8776  A4 14	| RAM ADDRESS
	INY				// $1D8778  C8		| 
	BNE code_1D8780			// $1D8779  D0 05	| 
	INC.b $16			// $1D877B  E6 16	| RAM ADDRESS
	LDY.w #$8000			// $1D877D  A0 00 80	| 
code_1D8780:				//			| 
	STY.b $14			// $1D8780  84 14	| RAM ADDRESS
	LDA [$14]			// $1D8782  A7 14	| INDIRECT RAM ADDRESS
	STA.w $2142			// $1D8784  8D 42 21	| 
	LDY.b $14			// $1D8787  A4 14	| RAM ADDRESS
	INY				// $1D8789  C8		| 
	BNE code_1D8791			// $1D878A  D0 05	| 
	INC.b $16			// $1D878C  E6 16	| RAM ADDRESS
	LDY.w #$8000			// $1D878E  A0 00 80	| 
code_1D8791:				//			| 
	STY.b $14			// $1D8791  84 14	| RAM ADDRESS
	LDA [$14]			// $1D8793  A7 14	| INDIRECT RAM ADDRESS
	STA.w $2143			// $1D8795  8D 43 21	| 
	LDA.b $0A			// $1D8798  A5 0A	| RAM ADDRESS
	STA.w $2140			// $1D879A  8D 40 21	| 
	INC.b $0A			// $1D879D  E6 0A	| RAM ADDRESS
code_1D879F:				//			| 
	CMP.w $2140			// $1D879F  CD 40 21	| 
	BNE code_1D879F			// $1D87A2  D0 FB	| 
	INX				// $1D87A4  E8		| 
	INX				// $1D87A5  E8		| 
	CPX.w #$0020			// $1D87A6  E0 20 00	| 
	BEQ code_1D87AE			// $1D87A9  F0 03	| 
	JMP code_1D870C			// $1D87AB  4C 0C 87	| 
code_1D87AE:				//			| 
	LDA.w $190A			// $1D87AE  AD 0A 19	| RAM ADDRESS
	STA.w $2140			// $1D87B1  8D 40 21	| 
code_1D87B4:				//			| 
	CMP.w $2140			// $1D87B4  CD 40 21	| 
	BNE code_1D87B4			// $1D87B7  D0 FB	| 
	LDA.b #$00			// $1D87B9  A9 00	| 
	STA.w $2140			// $1D87BB  8D 40 21	| 
	STA.w $2141			// $1D87BE  8D 41 21	| 
	STA.w $2142			// $1D87C1  8D 42 21	| 
	STA.w $2143			// $1D87C4  8D 43 21	| 
	PLP				// $1D87C7  28		| 
	RTS				// $1D87C8  60		| 	

code_1D87C9:				//----------------------| 
	PHP				// $1D87C9  08		| 
	REP #$20			// $1D87CA  C2 20	| 
	LDA.b $18			// $1D87CC  A5 18	| RAM ADDRESS
	CMP.w #$0060			// $1D87CE  C9 60 00	| 
	BCS code_1D87D8			// $1D87D1  B0 05	| 
	ADC.w #$1DA0			// $1D87D3  69 A0 1D	| 1DA0xx + (0000xx ~ 005Fxx)
	BRA code_1D8804			// $1D87D6  80 2C	| 
code_1D87D8:				//			| 
	CMP.w #$00E0			// $1D87D8  C9 E0 00	| 
	BCS code_1D87E2			// $1D87DB  B0 05	| 
	ADC.w #$1E20			// $1D87DD  69 20 1E	| 1E20xx + (0060xx ~ 00DFxx)
	BRA code_1D8804			// $1D87E0  80 22	| 
code_1D87E2:				//			| 
	CMP.w #$0160			// $1D87E2  C9 60 01	| 
	BCS code_1D87EC			// $1D87E5  B0 05	| 
	ADC.w #$1EA0			// $1D87E7  69 A0 1E	| 1EA0xx + (00E0xx ~ 015Fxx)
	BRA code_1D8804			// $1D87EA  80 18	| 
code_1D87EC:				//			| 
	CMP.w #$01E0			// $1D87EC  C9 E0 01	| 
	BCS code_1D87F6			// $1D87EF  B0 05	| 
	ADC.w #$1F20			// $1D87F1  69 20 1F	| 1F20xx + (0160xx ~ 01DFxx)
	BRA code_1D8804			// $1D87F4  80 0E	| 
code_1D87F6:				//			| 
	CMP.w #$0260			// $1D87F6  C9 60 02	| 
	BCS code_1D8800			// $1D87F9  B0 05	| 
	ADC.w #$1FA0			// $1D87FB  69 A0 1F	| 1FA0xx + (01E0xx ~ 025Fxx)
	BRA code_1D8804			// $1D87FE  80 04	| 
code_1D8800:				//			| 
	CLC				// $1D8800  18		| 
	ADC.w #$2020			// $1D8801  69 20 20	| 2020xx + (0260xx ~ ) (probably bogus)
code_1D8804:				//			| 
	STA.b $18			// $1D8804  85 18	| 
	PLP				// $1D8806  28		| 
	RTS				// $1D8807  60		| 

data_1D8808:				//----------------------| SPC program
	include "SPC/spc_engine.asm"


pad($1DA000, $00)
warnpc($1DA000)
org($1DA000)

data_1DA000:;	dl sfx_data
data_1DA003:;	dl music_point
data_1DA006:;	dl sfx_samples
data_1DA009:;	dl song_samples
data_1DA00C:;	dl sample_point
data_1DA00F:;	dl sample_offsets
data_1DA012:;	dl sample_tuning

pushpc($000015)

include "SPC/SFX/sfx.asm"
include "SPC/MUSIC/music.asm"
include "SPC/SAMPLE/samples.asm"

pullpc()

pad($208000, $00)
warnpc($208000)