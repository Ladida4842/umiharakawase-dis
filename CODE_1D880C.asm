arch spc700
base $0700

spc_engine:			;-ARAM---[ROM]------RAW-BYTES---| 
	CLRP			; $0700  [$1D880C]  20		| 
	MOV X, #$DF		; $0701  [$1D880D]  CD DF	| 
	MOV SP, X		; $0703  [$1D880F]  BD		| 
	MOV A, #$00		; $0704  [$1D8810]  E8 00	| 
	MOV X, A		; $0706  [$1D8812]  5D		| 
code_0707:			;				| clear $0000-$00DE
	MOV (X+), A		; $0707  [$1D8813]  AF		| 
	CMP X, #$DF		; $0708  [$1D8814]  C8 DF	| 
	BNE code_0707		; $070A  [$1D8816]  D0 FB	| 
	MOV $48, A		; $070C  [$1D8818]  C4 48	| ARAM
	MOV $49, #$01		; $070E  [$1D881A]  8F 01 49	| ARAM
	MOV Y, A		; $0711  [$1D881D]  FD		| 
code_0712:			;				| clear $0100-$07FF? rofl, definitely a mistake
	MOV ($48)+Y, A		; $0712  [$1D881E]  D7 48	| INDIRECT ARAM
	INC Y			; $0714  [$1D8820]  FC		| D7 becomes 00 (NOP). 48 FC is EOR A, #$FC
	BNE code_0719		; $0715  [$1D8821]  D0 02	| so this wont branch after it loops back (00 xor FC = FC, FC xor FC = 00)
	INC $49			; $0717  [$1D8823]  AB 49	| ARAM
code_0719:			;				| which means $49 increases prematurely
	CMP $49, #$08		; $0719  [$1D8825]  78 08 49	| ARAM
	BNE code_0712		; $071C  [$1D8828]  D0 F4	| which means this wont branch. lucky or madmen?
	MOV $49, #$80		; $071E  [$1D882A]  8F 80 49	| ARAM
	MOV Y, A		; $0721  [$1D882D]  FD		| 
code_0722:			;				| clear $8000-$FEFF
	MOV ($48)+Y, A		; $0722  [$1D882E]  D7 48	| INDIRECT ARAM
	INC Y			; $0724  [$1D8830]  FC		| 
	BNE code_0729		; $0725  [$1D8831]  D0 02	| 
	INC $49			; $0727  [$1D8833]  AB 49	| ARAM
code_0729:			;				| 
	CMP $49, #$FF		; $0729  [$1D8835]  78 FF 49	| ARAM
	BNE code_0722		; $072C  [$1D8838]  D0 F4	| 
	MOV A, #$00		; $072E  [$1D883A]  E8 00	| 
	MOV $F5, A		; $0730  [$1D883C]  C4 F5	| 
	MOV $F6, A		; $0732  [$1D883E]  C4 F6	| 
	MOV $F7, A		; $0734  [$1D8840]  C4 F7	| 
	MOV A, #$F7		; $0736  [$1D8842]  E8 F7	| 
	MOV Y, #$6D		; $0738  [$1D8844]  8D 6D	| 
	CALL code_135A		; $073A  [$1D8846]  3F 5A 13	| 
	MOV A, #$01		; $073D  [$1D8849]  E8 01	| 
	MOV Y, #$7D		; $073F  [$1D884B]  8D 7D	| 
	CALL code_135A		; $0741  [$1D884D]  3F 5A 13	| 
	MOV A, #$01		; $0744  [$1D8850]  E8 01	| 
	CALL code_13B0		; $0746  [$1D8852]  3F B0 13	| 
	CALL code_141D		; $0749  [$1D8855]  3F 1D 14	| 
	MOV A, #$50		; $074C  [$1D8858]  E8 50	| 
	MOV Y, #$0C		; $074E  [$1D885A]  8D 0C	| 
	CALL code_135A		; $0750  [$1D885C]  3F 5A 13	| 
	MOV Y, #$1C		; $0753  [$1D885F]  8D 1C	| 
	CALL code_135A		; $0755  [$1D8861]  3F 5A 13	| 









code_135A:			;-------------------------------| DSP write
	MOV $F2, Y		; $135A  [$1D9466]  CB F2	| Y contains DSP reg
	MOV $F3, A		; $135C  [$1D9468]  C4 F3	| A contains value
	RET			; $135E  [$1D946A]  6F		| 

code_135F:			;-------------------------------| DSP read
	MOV $F2, Y		; $135F  [$1D946B]  CB F2	| Y contains DSP reg
	MOV A, $F3		; $1361  [$1D946D]  E4 F3	| A will contain value
	RET			; $1363  [$1D946F]  6F		| 






code_13B0:			;-------------------------------| 
	MOV $2D, A		; $13B0  [$1D94BC]  C4 2D	| ARAM
	MOV Y, #$7D		; $13B2  [$1D94BE]  8D 7D	| 
	CALL code_135F		; $13B4  [$1D94C0]  3F 5F 13	| 
	CMP A, $2D		; $13B7  [$1D94C3]  64 2D	| ARAM
	BEQ code_13FE		; $13B9  [$1D94C5]  F0 43	| 
	AND A, #$0F		; $13BB  [$1D94C7]  28 0F	| 
	EOR A, #$FF		; $13BD  [$1D94C9]  48 FF	| 
	BBC $2E.7, code_13C5	; $13BF  [$1D94CB]  F3 2E 03	| ARAM
	CLRC			; $13C2  [$1D94CE]  60		| 
	ADC A, $2E		; $13C3  [$1D94CF]  84 2E	| ARAM
code_13C5:			;				| 
	MOV $2E, A		; $13C5  [$1D94D1]  C4 2E	| ARAM
	MOV A, $FE		; $13C7  [$1D94D3]  E4 FE	| 
	MOV Y, #$04		; $13C9  [$1D94D5]  8D 04	| 
code_13CB:			;				| 
	MOV A, data_1419-1+Y	; $13CB  [$1D94D7]  F6 18 14	| 
	MOV $F2, A		; $13CE  [$1D94DA]  C4 F2	| 
	MOV A, #$00		; $13D0  [$1D94DC]  E8 00	| 
	MOV $F3, A		; $13D2  [$1D94DE]  C4 F3	| 
	DBNZ Y, code_13CB	; $13D4  [$1D94E0]  FE F5	| 
	MOV Y, #$6C		; $13D6  [$1D94E2]  8D 6C	| 
	CALL code_135F		; $13D8  [$1D94E4]  3F 5F 13	| 
	OR A, #$20		; $13DB  [$1D94E7]  08 20	| 
	MOV $2A, A		; $13DD  [$1D94E9]  C4 2A	| ARAM
	MOV Y, #$6C		; $13DF  [$1D94EB]  8D 6C	| 
	CALL code_135A		; $13E1  [$1D94ED]  3F 5A 13	| 
	MOV A, $2D		; $13E4  [$1D94F0]  E4 2D	| ARAM
	CALL code_1410		; $13E6  [$1D94F2]  3F 10 14	| 
	MOV $49, A		; $13E9  [$1D94F5]  C4 49	| ARAM
	MOV A, #$00		; $13EB  [$1D94F7]  E8 00	| 
	MOV $48, A		; $13ED  [$1D94F9]  C4 48	| ARAM
	MOV Y, A		; $13EF  [$1D94FB]  FD		| 
code_13F0:			;				| 
	MOV ($48)+Y, A		; $13F0  [$1D94FC]  D7 48	| INDIRECT ARAM
	INC Y			; $13F2  [$1D94FE]  FC		| 
	BNE code_13F7		; $13F3  [$1D94FF]  D0 02	| 
	INC $49			; $13F5  [$1D9501]  AB 49	| ARAM
code_13F7:			;				| 
	CMP $49, #$FF		; $13F7  [$1D9503]  78 FF 49	| ARAM
	BNE code_13F0		; $13FA  [$1D9506]  D0 F4	| 
	MOV A, $2D		; $13FC  [$1D9508]  E4 2D	| ARAM
code_13FE:			;				| 
	CALL code_1410		; $13FE  [$1D950A]  3F 10 14	| 
	MOV Y, #$6D		; $1401  [$1D950D]  8D 6D	| 
	CALL code_135A		; $1403  [$1D950F]  3F 5A 13	| 
	MOV $71, #$00		; $1406  [$1D9512]  8F 00 71	| ARAM
	MOV A, $2D		; $1409  [$1D9515]  E4 2D	| ARAM
	MOV Y, #$7D		; $140B  [$1D9517]  8D 7D	| 
	JMP code_135A		; $140D  [$1D9519]  5F 5A 13	| 

code_1410:			;-------------------------------| 
	ASL A			; $1410  [$1D951C]  1C		| 
	ASL A			; $1411  [$1D951D]  1C		| 
	ASL A			; $1412  [$1D951E]  1C		| 
	EOR A, #$FF		; $1413  [$1D951F]  48 FF	| 
	SETC			; $1415  [$1D9521]  80		| 
	ADC A, #$FF		; $1416  [$1D9522]  88 FF	| 
	RET			; $1418  [$1D9524]  6F		| 

data_1419:			;-------------------------------| 
	db $2C			; $1419  [$1D9525]		| 
	db $3C			; $141A  [$1D9526]		| 
	db $0D			; $141B  [$1D9527]		| 
	db $4D			; $141C  [$1D9528]		| 

code_141D:			;-------------------------------| 
	MOV A, #$00		; $141D  [$1D9529]  E8 00	| 
	MOV Y, #$2C		; $141F  [$1D952B]  8D 2C	| 
	CALL code_135A		; $1421  [$1D952D]  3F 5A 13	| 
	MOV Y, #$3C		; $1424  [$1D9530]  8D 3C	| 
	CALL code_135A		; $1426  [$1D9532]  3F 5A 13	| 
	SET1 $2A.5		; $1429  [$1D9535]  A2 2A	| ARAM
	RET			; $142B  [$1D9537]  6F		| 




base off
arch 65816