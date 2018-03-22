org($818000)






code_819A88:				//----------------------| 
	REP #$30			// $819A88  C2 30	| 
	PHK				// $819A8A  4B		| 
	PLB				// $819A8B  AB		| 
	STZ.w $026B			// $819A8C  9C 6B 02	| RAM ADDRESS
	STZ.w $04C0			// $819A8F  9C C0 04	| RAM ADDRESS
	LDX.w #$0800			// $819A92  A2 00 08	| RAM ADDRESS
	LDY.w #$00FC			// $819A95  A0 FC 00	| 
code_819A98:				//			| 
	STZ.b $00,x			// $819A98  74 00	| RAM ADDRESS
	INX				// $819A9A  E8		| 
	INX				// $819A9B  E8		| 
	DEY				// $819A9C  88		| 
	BNE code_819A98			// $819A9D  D0 F9	| 
	RTL				// $819A9F  6B		| 






code_81CB6D:				//----------------------| 
	REP #$30			// $81CB6D  C2 30	| 
	PHK				// $81CB6F  4B		| 
	PLB				// $81CB70  AB		| 
	LDX.w #$001E			// $81CB71  A2 1E 00	| 
	LDA.w $0406			// $81CB74  AD 06 04	| RAM ADDRESS
	AND.w #$FFF0			// $81CB77  29 F0 FF	| 
	STA.w $04DE			// $81CB7A  8D DE 04	| RAM ADDRESS
	STZ.w $04DC			// $81CB7D  9C DC 04	| RAM ADDRESS
	LSR				// $81CB80  4A		| 
	LSR				// $81CB81  4A		| 
	LSR				// $81CB82  4A		| 
	LSR				// $81CB83  4A		| 
code_81CB84:				//			| 
	STA.w $04E0,x			// $81CB84  9D E0 04	| RAM ADDRESS
	DEX				// $81CB87  CA		| 
	DEX				// $81CB88  CA		| 
	BPL code_81CB84			// $81CB89  10 F9	| 
	LDX.w #$000C			// $81CB8B  A2 0C 00	| 
	JSL code_809071			// $81CB8E  22 71 90 80	| 
	LDA.w #$003C			// $81CB92  A9 3C 00	| 
	LDY.w #$0000			// $81CB95  A0 00 00	| 
code_81CB98:				//			| 
	STA.w $04A0,y			// $81CB98  99 A0 04	| RAM ADDRESS
	PHA				// $81CB9B  48		| 
	LDA.l data_81F218&$FF0000,x	// $81CB9C  BF 00 00 81	| weird ROM addressing
	AND.w #$00FF			// $81CBA0  29 FF 00	| 
	STA.w $04A8,y			// $81CBA3  99 A8 04	| RAM ADDRESS
	LDA.l data_81F218&$FF0000+1,x	// $81CBA6  BF 01 00 81	| weird ROM addressing
	AND.w #$00FF			// $81CBAA  29 FF 00	| 
	STA.w $04B0,y			// $81CBAD  99 B0 04	| RAM ADDRESS
	PLA				// $81CBB0  68		| 
	CLC				// $81CBB1  18		| 
	ADC.w #$001E			// $81CBB2  69 1E 00	| 
	INX				// $81CBB5  E8		| 
	INX				// $81CBB6  E8		| 
	INY				// $81CBB7  C8		| 
	INY				// $81CBB8  C8		| 
	CPY.w #$0008			// $81CBB9  C0 08 00	| 
	BNE code_81CB98			// $81CBBC  D0 DA	| 
	RTL				// $81CBBE  6B		| 







code_81D270:				//----------------------| 
	REP #$30			// $81D270  C2 30	| 
	LDA.w $025B			// $81D272  AD 5B 02	| RAM ADDRESS
	AND.w #$00FF			// $81D275  29 FF 00	| 
	STA.w $023C			// $81D278  8D 3C 02	| RAM ADDRESS
	JSL code_81D346			// $81D27B  22 46 D3 81	| stage # becomes seed for RNG
	STA.w $04B8			// $81D27F  8D B8 04	| RAM ADDRESS
	JSL code_81D346			// $81D282  22 46 D3 81	| 
	STA.w $04BA			// $81D286  8D BA 04	| RAM ADDRESS
	JSL code_81D346			// $81D289  22 46 D3 81	| 
	STA.w $04BC			// $81D28D  8D BC 04	| RAM ADDRESS
	JSL code_81D346			// $81D290  22 46 D3 81	| 
	STA.w $04BE			// $81D294  8D BE 04	| RAM ADDRESS
	RTL				// $81D297  6B		| 







code_81D346:				//----------------------| RNG? another one?
	REP #$30			// $81D346  C2 30	| 
	LDA.w $023C			// $81D348  AD 3C 02	| RAM ADDRESS
	CLC				// $81D34B  18		| 
	ADC.w #$8765			// $81D34C  69 65 87	| 
	ROL				// $81D34F  2A		| 
	XBA				// $81D350  EB		| 
	EOR.w #$BCDE			// $81D351  49 DE BC	| 
	ROR				// $81D354  6A		| 
	ROR				// $81D355  6A		| 
	ADC.w #$1969			// $81D356  69 69 19	| 
	ROR				// $81D359  6A		| 
	ADC.w $023C			// $81D35A  6D 3C 02	| RAM ADDRESS
	STA.w $023C			// $81D35D  8D 3C 02	| RAM ADDRESS
	RTL				// $81D360  6B		| 

code_81D361:				//----------------------| possibly random number RNG number generator
	REP #$30			// $81D361  C2 30	| 
	LDA.w $023E			// $81D363  AD 3E 02	| RAM ADDRESS
	CLC				// $81D366  18		| 
	ADC.w #$8765			// $81D367  69 65 87	| 
	ROL				// $81D36A  2A		| 
	XBA				// $81D36B  EB		| 
	EOR.w #$BCDE			// $81D36C  49 DE BC	| 
	ROR				// $81D36F  6A		| 
	ROR				// $81D370  6A		| 
	ADC.w #$1969			// $81D371  69 69 19	| 
	ROR				// $81D374  6A		| 
	ADC.w $023E			// $81D375  6D 3E 02	| RAM ADDRESS
	STA.w $023E			// $81D378  8D 3E 02	| RAM ADDRESS
	RTL				// $81D37B  6B		| 


code_81D37C:				//----------------------| 
	REP #$30			// $81D37C  C2 30	| 
	LDX.w #$0800			// $81D37E  A2 00 08	| RAM ADDRESS
	LDY.w #$000D			// $81D381  A0 0D 00	| 
	BRA code_81D38C			// $81D384  80 06	| 
code_81D386:				//			| 
	TXA				// $81D386  8A		| 
	CLC				// $81D387  18		| 
	ADC.w #$002A			// $81D388  69 2A 00	| 
	TAX				// $81D38B  AA		| 
code_81D38C:				//			| 
	DEY				// $81D38C  88		| 
	BEQ code_81D395			// $81D38D  F0 06	| 
	LDA.b $00,x			// $81D38F  B5 00	| 
	BMI code_81D386			// $81D391  30 F3	| 
	CLC				// $81D393  18		| 
	RTL				// $81D394  6B		| 
code_81D395:				//			| 
	SEC				// $81D395  38		| 
	RTL				// $81D396  RTL		| 


code_81D397:				//----------------------| 
	REP #$30			// $81D397  C2 30	| 
	STZ.w $0BC8			// $81D399  9C C8 0B	| RAM ADDRESS
	RTL				// $81D39C  6B		| 








data_81D3E9:				//----------------------| 
//	ここ！









code_81D998:				//----------------------| 
	REP #$30			// $81D998  C2 30	| 
	PHK				// $81D99A  4B		| 
	PLB				// $81D99B  AB		| 
	LDA.w #$0A00			// $81D99C  A9 00 0A	| RAM ADDRESS
	LDY.w #$000C			// $81D99F  A0 0C 00	| 
code_81D9A2:				//			| 
	TAX				// $81D9A2  AA		| 
	STZ.b $00,x			// $81D9A3  74 00	| 
	CLC				// $81D9A5  18		| 
	ADC.w #$0020			// $81D9A6  69 20 00	| 
	DEY				// $81D9A9  88		| 
	BNE code_81D9A2			// $81D9AA  D0 F6	| 
	RTL				// $81D9AC  6B		| 











data_81EC32:				//----------------------| PAL for layer 3 text
	dw $0188,$28C6,$7F9D,$7E7A	// $81EC32		| 
	dw $0188,$18CA,$45BF,$34DF	// $81EC3A		| 
	dw $0188,$1926,$43FC,$03F7	// $81EC42		| 
	dw $0188,$495A,$665F,$7F9E	// $81EC4A		| 

data_81EC52:				//----------------------| PAL for Kawase
	dw $3D8E,$1CC9,$2E1B,$42BF	// $81EC52		| 
	dw $5F1F,$024E,$16B1,$2314	// $81EC5A		| 
	dw $2174,$357B,$59FF,$10ED	// $81EC62		| 
	dw $01CC,$4E31,$5EF7,$7BDE	// $81EC6A		| 

code_81EC72:				//			| upload layer 3 palette
	REP #$30			// $81EC72  C2 30	| 
	LDX.w #data_81EC32		// $81EC74  A2 32 EC	| src = data_81EC32
	LDY.w #$5220			// $81EC77  A0 20 52	| dst = $7E5220
	LDA.w #$001F			// $81EC7A  A9 1F 00	| 
	MVN $7E,data_81EC32>>16		// $81EC7D  54 7E 81	| 
	RTL				// $81EC80  6B		| 


code_81EC81:				//----------------------| level init load?
	REP #$30			// $81EC81  C2 30	|\ 
	LDX.w #$00FE			// $81EC83  A2 FE 00	|| 
	LDA.w #$0000			// $81EC86  A9 00 00	|| clear sprite palette area in CGRAM mirror
code_81EC89:				//			|| 
	STA.l $7E5300,x			// $81EC89  9F 00 53 7E	|| RAM ADDRESS
	DEX				// $81EC8D  CA		|| 
	DEX				// $81EC8E  CA		|| 
	BPL code_81EC89			// $81EC8F  10 F8	|/ 
	LDX.w #data_81EC52		// $81EC91  A2 52 EC	|\ src = data_81EC52
	LDY.w #$5300			// $81EC94  A0 00 53	|| dst = $7E5300
	LDA.w #$001F			// $81EC97  A9 1F 00	|| 
	MVN $7E,data_81EC52>>16		// $81EC9A  54 7E 81	|/ upload Kawase's palette to CGRAM mirror
	PHK				// $81EC9D  4B		| 
	PLB				// $81EC9E  AB		| 
	SEP #$20			// $81EC9F  E2 20	| 
	LDA.b #$80			// $81ECA1  A9 80	| 
	STA.w $2115			// $81ECA3  8D 15 21	| 
	REP #$20			// $81ECA6  C2 20	| 
	STZ.w $2116			// $81ECA8  9C 16 21	| 
	LDY.w #$0600			// $81ECAB  A0 00 06	| 
code_81ECAE:				//			| 
	STZ.w $2118			// $81ECAE  9C 18 21	| 
	DEY				// $81ECB1  88		| 
	BNE code_81ECAE			// $81ECB2  D0 FA	| 
	PHK				// $81ECB4  4B		| 
	PLB				// $81ECB5  AB		| 
	LDX.w #$001B			// $81ECB6  A2 1B 00	| 
	JSL code_809084			// $81ECB9  22 84 90 80	| 
	STA.w $0BB6			// $81ECBD  8D B6 0B	| RAM ADDRESS
	STA.w $0BB2			// $81ECC0  8D B2 0B	| RAM ADDRESS
	ASL				// $81ECC3  0A		| 
	ASL				// $81ECC4  0A		| 
	ASL				// $81ECC5  0A		| 
	ASL				// $81ECC6  0A		| 
	ASL				// $81ECC7  0A		| 
	ASL				// $81ECC8  0A		| 
	CLC				// $81ECC9  18		| 
	ADC.w #$4000			// $81ECCA  69 00 40	| 
	STA.w $0BBC			// $81ECCD  8D BC 0B	| RAM ADDRESS
	STA.w $0BBE			// $81ECD0  8D BE 0B	| RAM ADDRESS
	STZ.w $0BB4			// $81ECD3  9C B4 0B	| RAM ADDRESS
	STZ.w $0BB0			// $81ECD6  9C B0 0B	| RAM ADDRESS
	STZ.w $0BB8			// $81ECD9  9C B8 0B	| RAM ADDRESS
	STZ.w $0BBA			// $81ECDC  9C BA 0B	| 
	REP #$30			// $81ECDF  C2 30	| 
	LDA.w #$0001			// $81ECE1  A9 01 00	| 
	STA.w $0480			// $81ECE4  8D 80 04	| RAM ADDRESS
	LDA.w #$0002			// $81ECE7  A9 02 00	| 
	STA.w $048E			// $81ECEA  8D 8E 04	| RAM ADDRESS
	LDX.w #$0006			// $81ECED  A2 06 00	| 
	JSL code_809071			// $81ECF0  22 71 90 80	| 
	LDY.w #$0000			// $81ECF4  A0 00 00	| 
code_81ECF7:				//			| 
	LDA.l data_81F218&$FF0000,x	// $81ECF7  BF 00 00 81	| weird ROM table read
	AND.w #$00FF			// $81ECFB  29 FF 00	| 
	STA.w $0482,y			// $81ECFE  99 82 04	| RAM ADDRESS
	INX				// $81ED01  E8		| 
	INY				// $81ED02  C8		| 
	INY				// $81ED03  C8		| 
	CPY.w #$000C			// $81ED04  C0 0C 00	| 
	BNE code_81ECF7			// $81ED07  D0 EE	| 
	STZ.w $0660			// $81ED09  9C 60 06	| RAM ADDRESS
	LDX.w #$0014			// $81ED0C  A2 14 00	| 
	JSL code_809071			// $81ED0F  22 71 90 80	| 
	LDY.w #$0000			// $81ED13  A0 00 00	| 
code_81ED16:				//			| 
	LDA.l data_81F218&$FF0000,x	// $81ED16  BF 00 00 81	| weird ROM table read
	AND.w #$00FF			// $81ED1A  29 FF 00	| 
	STA.w $0662,y			// $81ED1D  99 62 06	| RAM ADDRESS
	INX				// $81ED20  E8		| 
	INY				// $81ED21  C8		| 
	INY				// $81ED22  C8		| 
	CPY.w #$000E			// $81ED23  C0 0E 00	| 
	BNE code_81ED16			// $81ED26  D0 EE	| 
	LDY.w #$0000			// $81ED28  A0 00 00	| 
code_81ED2B:				//			| 
	LDA.w $0480,y			// $81ED2B  B9 80 04	| RAM ADDRESS
	BEQ code_81ED36			// $81ED2E  F0 06	| 
	ASL				// $81ED30  0A		| 
	TAX				// $81ED31  AA		| 
	LDA.l data_81D3E9,x		// $81ED32  BF E9 D3 81	| 
code_81ED36:				//			| 
	STA.w $0490,y			// $81ED36  99 90 04	| RAM ADDRESS
	INY				// $81ED39  C8		| 
	INY				// $81ED3A  C8		| 
	CPY.w #$0010			// $81ED3B  C0 10 00	| 
	BNE code_81ED2B			// $81ED3E  D0 EB	| 
	LDY.w #$0000			// $81ED40  A0 00 00	| 
code_81ED43:				//			| 
	LDA.w $0660,y			// $81ED43  B9 60 06	| RAM ADDRESS
	BEQ code_81ED4E			// $81ED46  F0 06	| 
	ASL				// $81ED48  0A		| 
	TAX				// $81ED49  AA		| 
	LDA.l data_82A75B,x		// $81ED4A  BF 5B A7 82	| 
code_81ED4E:				//			| 
	STA.w $0670,y			// $81ED4E  99 70 06	| RAM ADDRESS
	INY				// $81ED51  C8		| 
	INY				// $81ED52  C8		| 
	CPY.w #$0010			// $81ED53  C0 10 00	| 
	BNE code_81ED43			// $81ED56  D0 EB	| 
	LDX.w #$0000			// $81ED58  A2 00 00	| 
code_81ED5B:				//			| 
	LDA.w $0480,x			// $81ED5B  BD 80 04	| RAM ADDRESS
	STA.l $7E5460,x			// $81ED5E  9F 60 54 7E	| RAM ADDRESS
	INX				// $81ED62  E8		| 
	INX				// $81ED63  E8		| 
	CPX.w #$0010			// $81ED64  E0 10 00	| 
	BNE code_81ED5B			// $81ED67  D0 F2	| 
	LDX.w #$0000			// $81ED69  A2 00 00	| 
//	ここ！






data_81F218:				//----------------------| field data pointers
	dw data_81F298
	dw data_81F2BD
	dw data_81F2E2
	dw data_81F307
	dw data_81F32C			// $81F220  		| 
	dw data_81F351
	dw data_81F376
	dw data_81F39B
	dw data_81F3C0
	dw data_81F3E5
	dw data_81F40A
	dw data_81F42F
	dw data_81F454			// $81F230  		| 
	dw data_81F479
	dw data_81F49E
	dw data_81F4C3
	dw data_81F4E8
	dw data_81F298
	dw data_81F50D
	dw data_81F298
	dw data_81F532			// $81F240  		| 
	dw data_81F298
	dw data_81F557
	dw data_81F298
	dw data_81F298
	dw data_81F298
	dw data_81F298
	dw data_81F298
	dw data_81F57C			// $81F250  		| 
	dw data_81F298
	dw data_81F298
	dw data_81F298
	dw data_81F298
	dw data_81F298
	dw data_81F298
	dw data_81F298
	dw data_81F5A1			// $81F260  		| 
	dw data_81F5C6
	dw data_81F5EB
	dw data_81F610
	dw data_81F635
	dw data_81F65A
	dw data_81F67F
	dw data_81F6A4
	dw data_81F6C9			// $81F270  		| 
	dw data_81F6EE
	dw data_81F713
	dw data_81F738
	dw data_81F75D
	dw data_81F782
	dw data_81F7A7
	dw data_81F7CC
	dw data_81F7F1			// $81F280  		| 
	dw data_81F816
	dw data_81F83B
	dw data_81F860
	dw data_81F885
	dw data_81F8AA
	dw data_81F8CF
	dw data_81F8F4
	dw data_81F919			// $81F290  		| 
	dw data_81F93E
	dw data_81F963
	dw data_81F988

data_81F298:				//----------------------| stage 0 (not field #)
	dl data_98A10E			// $81F298  0E A1 98	| level pointer (tilemap/etc)
	db $00				// $81F29B		| tileset (FG and BG are tied together)
	db $00				// $81F29C		| field # (aka what the game tells you) (hex)
	db $04				// $81F29D		| song #
	db $04,$07,$00,$00,$00,$17	// $81F29E		| sprites
	dw $643C,$6428,$0000,$0000	// $81F2A4		| ??? (low byte into $04A8, high byte into $04B0)
	db $00,$00,$00,$00,$00,$00,$04	// $81F2AC		| objects?
	db $F0,$01,$02			// $81F2B3		| water stuff
	db $E6				// $81F2B6		| ???
	dw $0500			// $81F2B7		| time (BCD, low byte = seconds, high = minutes)
	db $01,$01,$01,$01		// $81F2B9		| exit pointers

data_81F2BD:				//----------------------| 
//	ここ！
data_81F2E2:				//----------------------| 
data_81F307:				//----------------------| 
data_81F32C:				//----------------------| 
data_81F351:				//----------------------| 
data_81F376:				//----------------------| 
data_81F39B:				//----------------------| 
data_81F3C0:				//----------------------| 
data_81F3E5:				//----------------------| 
data_81F40A:				//----------------------| 
data_81F42F:				//----------------------| 
data_81F454:				//----------------------| 
data_81F479:				//----------------------| 
data_81F49E:				//----------------------| 
data_81F4C3:				//----------------------| 
data_81F4E8:				//----------------------| 
data_81F50D:				//----------------------| 
data_81F532:				//----------------------| 
data_81F557:				//----------------------| 
data_81F57C:				//----------------------| 
data_81F5A1:				//----------------------| 
data_81F5C6:				//----------------------| 
data_81F5EB:				//----------------------| 
data_81F610:				//----------------------| 
data_81F635:				//----------------------| 
data_81F65A:				//----------------------| 
data_81F67F:				//----------------------| 
data_81F6A4:				//----------------------| 
data_81F6C9:				//----------------------| 
data_81F6EE:				//----------------------| 
data_81F713:				//----------------------| 
data_81F738:				//----------------------| 
data_81F75D:				//----------------------| 
data_81F782:				//----------------------| 
data_81F7A7:				//----------------------| 
data_81F7CC:				//----------------------| 
data_81F7F1:				//----------------------| 
data_81F816:				//----------------------| 
data_81F83B:				//----------------------| 
data_81F860:				//----------------------| 
data_81F885:				//----------------------| 
data_81F8AA:				//----------------------| 
data_81F8CF:				//----------------------| 
data_81F8F4:				//----------------------| 
data_81F919:				//----------------------| 
data_81F93E:				//----------------------| 
data_81F963:				//----------------------| 
data_81F988:				//----------------------| 







pad($828000, $00)
warnpc($828000)