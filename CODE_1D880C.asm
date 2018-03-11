arch spc700
base $0700

spc_engine:				;=ARAM===[ROM]======RAW=BYTES===| 
	CLRP				; $0700  [$1D880C]  20		| 
	MOV X, #$DF			; $0701  [$1D880D]  CD DF	| 
	MOV SP, X			; $0703  [$1D880F]  BD		| 
	MOV A, #$00			; $0704  [$1D8810]  E8 00	| 
	MOV X, A			; $0706  [$1D8812]  5D		| 
code_0707:				;				| clear $0000-$00DE
	MOV (X+), A			; $0707  [$1D8813]  AF		| 
	CMP X, #$DF			; $0708  [$1D8814]  C8 DF	| 
	BNE code_0707			; $070A  [$1D8816]  D0 FB	| 
	MOV $48, A			; $070C  [$1D8818]  C4 48	| ARAM
	MOV $49, #$01			; $070E  [$1D881A]  8F 01 49	| ARAM
	MOV Y, A			; $0711  [$1D881D]  FD		| 
code_0712:				;				| clear $0100-$07FF? rofl, definitely a mistake
	MOV ($48)+Y, A			; $0712  [$1D881E]  D7 48	| INDIRECT ARAM
	INC Y				; $0714  [$1D8820]  FC		| D7 becomes 00 (NOP). 48 FC is EOR A, #$FC
	BNE code_0719			; $0715  [$1D8821]  D0 02	| so this wont branch after it loops back (00 xor FC = FC, FC xor FC = 00)
	INC $49				; $0717  [$1D8823]  AB 49	| ARAM
code_0719:				;				| which means $49 increases prematurely
	CMP $49, #$08			; $0719  [$1D8825]  78 08 49	| ARAM
	BNE code_0712			; $071C  [$1D8828]  D0 F4	| which means this wont branch. lucky or madmen?
	MOV $49, #$80			; $071E  [$1D882A]  8F 80 49	| ARAM
	MOV Y, A			; $0721  [$1D882D]  FD		| 
code_0722:				;				| clear $8000-$FEFF
	MOV ($48)+Y, A			; $0722  [$1D882E]  D7 48	| INDIRECT ARAM
	INC Y				; $0724  [$1D8830]  FC		| 
	BNE code_0729			; $0725  [$1D8831]  D0 02	| 
	INC $49				; $0727  [$1D8833]  AB 49	| ARAM
code_0729:				;				| 
	CMP $49, #$FF			; $0729  [$1D8835]  78 FF 49	| ARAM
	BNE code_0722			; $072C  [$1D8838]  D0 F4	| 
	MOV A, #$00			; $072E  [$1D883A]  E8 00	| 
	MOV $F5, A			; $0730  [$1D883C]  C4 F5	| 
	MOV $F6, A			; $0732  [$1D883E]  C4 F6	| 
	MOV $F7, A			; $0734  [$1D8840]  C4 F7	| 
	MOV A, #$F7			; $0736  [$1D8842]  E8 F7	| echo buffer at $F700!
	MOV Y, #$6D			; $0738  [$1D8844]  8D 6D	| DSP REG
	CALL code_135A			; $073A  [$1D8846]  3F 5A 13	| 
	MOV A, #$01			; $073D  [$1D8849]  E8 01	| echo delay
	MOV Y, #$7D			; $073F  [$1D884B]  8D 7D	| DSP REG
	CALL code_135A			; $0741  [$1D884D]  3F 5A 13	| 
	MOV A, #$01			; $0744  [$1D8850]  E8 01	| 
	CALL code_13B0			; $0746  [$1D8852]  3F B0 13	| 
	CALL code_141D			; $0749  [$1D8855]  3F 1D 14	| 
	MOV A, #$50			; $074C  [$1D8858]  E8 50	| main volume
	MOV Y, #$0C			; $074E  [$1D885A]  8D 0C	| DSP REG
	CALL code_135A			; $0750  [$1D885C]  3F 5A 13	| 
	MOV Y, #$1C			; $0753  [$1D885F]  8D 1C	| DSP REG
	CALL code_135A			; $0755  [$1D8861]  3F 5A 13	| 
	MOV A, #$1E			; $0758  [$1D8864]  E8 1E	| source directory at $1E00!
	MOV Y, #$5D			; $075A  [$1D8866]  8D 5D	| DSP REG
	CALL code_135A			; $075C  [$1D8868]  3F 5A 13	| 
	MOV A, #$00			; $075F  [$1D886B]  E8 00	| no pitch modulation or noise
	MOV Y, #$2D			; $0761  [$1D886D]  8D 2D	| DSP REG
	CALL code_135A			; $0763  [$1D886F]  3F 5A 13	| 
	MOV Y, #$3D			; $0766  [$1D8872]  8D 3D	| DSP REG
	CALL code_135A			; $0768  [$1D8874]  3F 5A 13	| 
	MOV A, #$00			; $076B  [$1D8877]  E8 00	| DSP REG
	MOV Y, A			; $076D  [$1D8879]  FD		| 
code_076E:				;				| this loop clears all channel settings
	MOV A, #$00			; $076E  [$1D887A]  E8 00	| 
	CALL code_135A			; $0770  [$1D887C]  3F 5A 13	| 
	INC Y				; $0773  [$1D887F]  FC		| 
	MOV A, Y			; $0774  [$1D8880]  DD		| 
	AND A, #$07			; $0775  [$1D8881]  28 07	| 
	BNE code_076E			; $0777  [$1D8883]  D0 F5	| 
	MOV A, Y			; $0779  [$1D8885]  DD		| 
	AND A, #$F0			; $077A  [$1D8886]  28 F0	| 
	CLRC				; $077C  [$1D8888]  60		| 
	ADC A, #$10			; $077D  [$1D8889]  88 10	| 
	MOV Y, A			; $077F  [$1D888B]  FD		| 
	CMP A, #$80			; $0780  [$1D888C]  68 80	| 
	BNE code_076E			; $0782  [$1D888E]  D0 EA	| 
	MOV $F1, #$00			; $0784  [$1D8890]  8F 00 F1	| clear control reg
	MOV A, #$80			; $0787  [$1D8893]  E8 80	| 
	MOV $FA, A			; $0789  [$1D8895]  C4 FA	| timer 0
	MOV $FB, A			; $078B  [$1D8897]  C4 FB	| timer 1
	MOV $F1, #$03			; $078D  [$1D8899]  8F 03 F1	| enable timers 0 and 1 (the 8khz ones)
	MOV A, $FD			; $0790  [$1D889C]  E4 FD	| 
	MOV A, $FE			; $0792  [$1D889E]  E4 FE	| 
	CALL code_1394			; $0794  [$1D88A0]  3F 94 13	| 
	CALL code_1324			; $0797  [$1D88A3]  3F 24 13	| 
code_079A:				;				| 
	MOV A, #$00			; $079A  [$1D88A6]  E8 00	| 
	MOV $4F+X, A			; $079C  [$1D88A8]  D4 4F	| ARAM
	MOV A, #$00			; $079E  [$1D88AA]  E8 00	| 
	MOV $50+X, A			; $07A0  [$1D88AC]  D4 50	| ARAM
	CALL code_1336			; $07A2  [$1D88AE]  3F 36 13	| 
	CMP $02, #$08			; $07A5  [$1D88B1]  78 08 02	| ARAM
	BNE code_079A			; $07A8  [$1D88B4]  D0 F0	| 
code_07AA:				;-------------------------------| looplooploop
	CALL code_0DFD			; $07AA  [$1D88B6]  3F FD 0D	| 
	MOV Y, $FD			; $07AD  [$1D88B9]  EB FD	| 
	BEQ code_07AA			; $07AF  [$1D88BB]  F0 F9	| 
	MOV $24, Y			; $07B1  [$1D88BD]  CB 24	| ARAM
	MOV A, $FE			; $07B3  [$1D88BF]  E4 FE	| 
	BEQ code_07BE			; $07B5  [$1D88C1]  F0 07	| 
	CMP $2E, $2D			; $07B7  [$1D88C3]  69 2D 2E	| ARAM
	BEQ code_07BE			; $07BA  [$1D88C6]  F0 02	| 
	INC $2E				; $07BC  [$1D88C8]  AB 2E	| ARAM
code_07BE:				;				| 
	MOV A, $0D			; $07BE  [$1D88CA]  E4 0D	| ARAM
	BEQ code_07DA			; $07C0  [$1D88CC]  F0 18	| 
	MOV A, $0202			; $07C2  [$1D88CE]  E5 02 02	| ARAM
	MUL YA				; $07C5  [$1D88D1]  CF		| 
	CLRC				; $07C6  [$1D88D2]  60		| 
	ADC A, $0203			; $07C7  [$1D88D3]  85 03 02	| ARAM
	MOV $0203, A			; $07CA  [$1D88D6]  C5 03 02	| ARAM
	BCC code_07DA			; $07CD  [$1D88D9]  90 0B	| 
	CALL code_1394			; $07CF  [$1D88DB]  3F 94 13	| 
	CALL code_0801			; $07D2  [$1D88DE]  3F 01 08	| 
	CALL code_1585			; $07D5  [$1D88E1]  3F 85 15	| 
	BRA code_07DA			; $07D8  [$1D88E4]  2F 00	| 
code_07DA:				;				| 
	MOV A, $0E			; $07DA  [$1D88E6]  E4 0E	| ARAM
	BEQ code_07F8			; $07DC  [$1D88E8]  F0 1A	| 
	MOV Y, $24			; $07DE  [$1D88EA]  EB 24	| ARAM
	MOV A, $0212			; $07E0  [$1D88EC]  E5 12 02	| ARAM
	MUL YA				; $07E3  [$1D88EF]  CF		| 
	CLRC				; $07E4  [$1D88F0]  60		| 
	ADC A, $0213			; $07E5  [$1D88F1]  85 13 02	| ARAM
	MOV $0213, A			; $07E8  [$1D88F4]  C5 13 02	| ARAM
	BCC code_07F8			; $07EB  [$1D88F7]  90 0B	| 
	CALL code_13A2			; $07ED  [$1D88F9]  3F A2 13	| 
	CALL code_0801			; $07F0  [$1D88FC]  3F 01 08	| 
	CALL code_1585			; $07F3  [$1D88FF]  3F 85 15	| 
	BRA code_07F8			; $07F6  [$1D8902]  2F 00	| 
code_07F8:				;				| 
	CALL code_1555			; $07F8  [$1D8904]  3F 55 15	| 
	CALL code_10F2			; $07FB  [$1D8907]  3F F2 10	| 
	JMP code_07AA			; $07FE  [$1D890A]  5F AA 07	| go loop


code_0801:				;-------------------------------| 
	CALL code_1324			; $0801  [$1D890D]  3F 24 13	|  
	MOV $15, #$00			; $0804  [$1D8910]  8F 00 15	| ARAM
code_0807:				;				| 
	MOV A, $4F+X			; $0807  [$1D8913]  F4 4F	| ARAM
	BPL code_081C			; $0809  [$1D8915]  10 11	| 
	INC $15				; $080B  [$1D8917]  AB 15	| ARAM
	MOV A, $0240+X			; $080D  [$1D8919]  F5 40 02	| ARAM
	DEC A				; $0810  [$1D891C]  9C		| 
	MOV $0240+X, A			; $0811  [$1D891D]  D5 40 02	| ARAM
	BNE code_082D			; $0814  [$1D8920]  D0 17	| 
	CALL code_084C			; $0816  [$1D8922]  3F 4C 08	| 
	CALL code_1443			; $0819  [$1D8925]  3F 43 14	| 
code_081C:				;				| 
	CALL code_1336			; $081C  [$1D8928]  3F 36 13	| 
	CMP $02, #$08			; $081F  [$1D892B]  78 08 02	| ARAM
	BNE code_0807			; $0822  [$1D892E]  D0 E3	| 
	CMP $15, #$00			; $0824  [$1D8930]  78 00 15	| ARAM
	BNE code_082C			; $0827  [$1D8933]  D0 03	| 
	CALL code_125E			; $0829  [$1D8935]  3F 5E 12	| 
code_082C:				;				| 
	RET				; $082C  [$1D8938]  6F		| 

code_082D:				;				| 
	MOV A, $0241+X			; $082D  [$1D8939]  F5 41 02	| ARAM
	CMP A, #$00			; $0830  [$1D893C]  68 00	| 
	BEQ code_081C			; $0832  [$1D893E]  F0 E8	| 
	DEC A				; $0834  [$1D8940]  9C		| 
	MOV $0241+X, A			; $0835  [$1D8941]  D5 41 02	| ARAM
	BEQ code_083F			; $0838  [$1D8944]  F0 05	| 
	CALL code_14B0			; $083A  [$1D8946]  3F B0 14	| 
	BRA code_081C			; $083D  [$1D8949]  2F DD	| 

code_083F:				;				| 
	MOV A, #$00			; $083F  [$1D894B]  E8 00	| 
	MOV $0461+X, A			; $0841  [$1D894D]  D5 61 04	| ARAM
	MOV A, $50+X			; $0844  [$1D8950]  F4 50	| ARAM
	OR A, #$40			; $0846  [$1D8952]  08 40	| 
	MOV $50+X, A			; $0848  [$1D8954]  D4 50	| ARAM
	BRA code_081C			; $084A  [$1D8956]  2F D0	| 


code_084C:				;-------------------------------| 
	MOV A, $4F+X			; $084C  [$1D8958]  F4 4F	| ARAM
	AND A, #$40			; $084E  [$1D895A]  28 40	| 
	BEQ code_085A			; $0850  [$1D895C]  F0 08	| 
	MOV A, $4F+X			; $0852  [$1D895E]  F4 4F	| ARAM
	AND A, #$20			; $0854  [$1D8960]  28 20	| 
	BNE code_08A0			; $0856  [$1D8962]  D0 48	| 
	BRA code_0884			; $0858  [$1D8964]  2F 2A	| 

code_085A:				;				| 
	CALL code_1364			; $085A  [$1D8966]  3F 64 13	| 
	CMP A, #$50			; $085D  [$1D8969]  68 50	| 
	BCC code_0881			; $085F  [$1D896B]  90 20	| 
	SETC				; $0861  [$1D896D]  80		| 
	SBC A, #$50			; $0862  [$1D896E]  A8 50	| 
	MOV Y, #$02			; $0864  [$1D8970]  8D 02	| 
	MUL YA				; $0866  [$1D8972]  CF		| 
	CLRC				; $0867  [$1D8973]  60		| 
	ADC A, #$C0			; $0868  [$1D8974]  88 C0	| 
	MOV $48, A			; $086A  [$1D8976]  C4 48	| ARAM
	MOV A, Y			; $086C  [$1D8978]  DD		| 
	ADC A, #$18			; $086D  [$1D8979]  88 18	| 
	MOV $49, A			; $086F  [$1D897B]  C4 49	| ARAM
code_0871:				;				| 
	MOV Y, #$00			; $0871  [$1D897D]  8D 00	| 
	MOV A, ($48)+Y			; $0873  [$1D897F]  F7 48	| ARAM
	MOV addr_087E+1, A		; $0875  [$1D8981]  C5 7F 08	| this...
	INC Y				; $0878  [$1D8984]  FC		| 
	MOV A, ($48)+Y			; $0879  [$1D8985]  F7 48	| ARAM
	MOV addr_087E+2, A		; $087B  [$1D8987]  C5 80 08	| ... and this...
addr_087E:				;				| 
	JMP code_08BC			; $087E  [$1D898A]  5F BC 08	| <--- store here
									| where exactly can this jump?
									| what are the possible addresses?
									| the default just loops back

code_0881:				;				| 
	JMP code_0C26			; $0881  [$1D898D]  5F 26 0C	| 

code_0884:				;				| 
	CALL code_1364			; $0884  [$1D8990]  3F 64 13	| 
	CMP A, #$50			; $0887  [$1D8993]  68 50	| 
	BCC code_089D			; $0889  [$1D8995]  90 12	| 
	SETC				; $088B  [$1D8997]  80		| 
	SBC A, #$50			; $088C  [$1D8998]  A8 50	| 
	MOV Y, #$02			; $088E  [$1D899A]  8D 02	| 
	MUL YA				; $0890  [$1D899C]  CF		| 
	CLRC				; $0891  [$1D899D]  60		| 
	ADC A, #$20			; $0892  [$1D899E]  88 20	| 
	MOV $48, A			; $0894  [$1D89A0]  C4 48	| ARAM
	MOV A, Y			; $0896  [$1D89A2]  DD		| 
	ADC A, #$1A			; $0897  [$1D89A3]  88 1A	| 
	MOV $49, A			; $0899  [$1D89A5]  C4 49	| ARAM
	BRA code_0871			; $089B  [$1D89A7]  2F D4	| 

code_089D:				;				| 
	JMP code_0DCB			; $089D  [$1D89A9]  5F CB 0D	| 

code_08A0:				;				| 
	CALL code_1364			; $08A0  [$1D89AC]  3F 64 13	| 
	CMP A, #$50			; $08A3  [$1D89AF]  68 50	| 
	BCC code_08B9			; $08A5  [$1D89B1]  90 12	| 
	SETC				; $08A7  [$1D89B3]  80		| 
	SBC A, #$50			; $08A8  [$1D89B4]  A8 50	| 
	MOV Y, #$02			; $08AA  [$1D89B6]  8D 02	| 
	MUL YA				; $08AC  [$1D89B8]  CF		| 
	CLRC				; $08AD  [$1D89B9]  60		| 
	ADC A, #$80			; $08AE  [$1D89BA]  88 80	| 
	MOV $48, A			; $08B0  [$1D89BC]  C4 48	| ARAM
	MOV A, Y			; $08B2  [$1D89BE]  DD		| 
	ADC A, #$1B			; $08B3  [$1D89BF]  88 1B	| 
	MOV $49, A			; $08B5  [$1D89C1]  C4 49	| ARAM
	BRA code_0871			; $08B7  [$1D89C3]  2F B8	| 

code_08B9:				;				| 
	JMP code_0BF6			; $08B9  [$1D89C5]  5F F6 0B	| 


code_08BC:				;-------------------------------| 
	JMP code_084C			; $08BC  [$1D89C8]  5F 4C 08	| loop (this is a temp code it seems)








code_09F5:				;-------------------------------| 
	MOV $03E1+X, A			; $09F5  [$1D8B01]  D5 E1 03	| ARAM
	AND A, #$1F			; $09F8  [$1D8B04]  28 1F	| 
	MOV $03A1+X, A			; $09FA  [$1D8B06]  D5 A1 03	| ARAM
	MOV A, #$00			; $09FD  [$1D8B09]  E8 00	| 
	MOV $03A0+X, A			; $09FF  [$1D8B0B]  D5 A0 03	| ARAM
	MOV $0380+X, A			; $0A02  [$1D8B0E]  D5 80 03	| ARAM
	RET				; $0A05  [$1D8B11]  6F		| 






code_0A1D:				;-------------------------------| 
	ここ！







code_0BD4:				;-------------------------------| 
	MOV A, #$00			; $0BD4  [$1D8CE0]  E8 00	| 
	MOV $4F+X, A			; $0BD6  [$1D8CE2]  D4 4F	| ARAM
	MOV $50+X, A			; $0BD8  [$1D8CE4]  D4 50	| ARAM
	MOV A, $0F			; $0BDA  [$1D8CE6]  E4 0F	| ARAM
	BNE code_0BEE			; $0BDC  [$1D8CE8]  D0 10	| 
	CLR1 $14.0			; $0BDE  [$1D8CEA]  12 14	| ARAM
	MOV X, $27			; $0BE0  [$1D8CEC]  F8 27	| ARAM
	MOV A, $4F+X			; $0BE2  [$1D8CEE]  F4 4F	| ARAM
	BPL code_0BF0			; $0BE4  [$1D8CF0]  10 0A	| 
	MOV A, $50+X			; $0BE6  [$1D8CF2]  F4 50	| ARAM
	OR A, #$B8			; $0BE8  [$1D8CF4]  08 B8	| 
	MOV $50+X, A			; $0BEA  [$1D8CF6]  D4 50	| ARAM
	BRA code_0BF0			; $0BEC  [$1D8CF8]  2F 02	| 
code_0BEE:				;				| 
	CLR1 $14.1			; $0BEE  [$1D8CFA]  32 14	| ARAM
code_0BF0:				;				| 
	OR $31, $04			; $0BF0  [$1D8CFC]  09 04 31	| ARAM
	MOV X, $26			; $0BF3  [$1D8CFF]  F8 26	| ARAM
	RET				; $0BF5  [$1D8D01]  6F		| 


code_0BF6:				;-------------------------------| 
	MOV A, $10			; $0BF6  [$1D8D02]  E4 10	| ARAM
	ASL A				; $0BF8  [$1D8D04]  1C		| 
	ASL A				; $0BF9  [$1D8D05]  1C		| 
	MOV Y, A			; $0BFA  [$1D8D06]  FD		| 
	MOV A, $1D20+Y			; $0BFB  [$1D8D07]  F6 20 1D	| ARAM actually table from ROM [1D9DEC]
	PUSH Y				; $0BFE  [$1D8D0A]  6D		| 
	MOV $0280+X, A			; $0BFF  [$1D8D0B]  D5 80 02	| ARAM
	MOV $46, A			; $0C02  [$1D8D0E]  C4 46	| ARAM
	CALL code_0A1D			; $0C04  [$1D8D10]  3F 1D 0A	| 
	POP Y				; $0C07  [$1D8D13]  EE		| 
	MOV A, $1D21+Y			; $0C08  [$1D8D14]  F6 21 1D	| ARAM actually table from ROM [1D9DEC]
	PUSH Y				; $0C0B  [$1D8D17]  6D		| 
	CALL code_09F5			; $0C0C  [$1D8D18]  3F F5 09	| 
	POP Y				; $0C0F  [$1D8D1B]  EE		| 
	MOV A, $1D22+Y			; $0C10  [$1D8D1C]  F6 22 1D	| ARAM actually table from ROM [1D9DEC]
	BEQ code_0C1B			; $0C13  [$1D8D1F]  F0 06	| 
	MOV A, $50+X			; $0C15  [$1D8D21]  F4 50	| ARAM
	OR A, #$04			; $0C17  [$1D8D23]  08 04	| 
	BRA code_0C1F			; $0C19  [$1D8D25]  2F 04	| 
code_0C1B:				;				| 
	MOV A, $50+X			; $0C1B  [$1D8D27]  F4 50	| ARAM
	AND A, #$FB			; $0C1D  [$1D8D29]  28 FB	| 
code_0C1F:				;				| 
	MOV $50+X, A			; $0C1F  [$1D8D2B]  D4 50	| ARAM
	MOV A, $1D23+Y			; $0C21  [$1D8D2D]  F6 23 1D	| ARAM actually table from ROM [1D9DEC]
	BRA code_0C28			; $0C24  [$1D8D30]  2F 02	| 

code_0C26:				;-------------------------------| 
	MOV A, $10			; $0C26  [$1D8D32]  E4 10	| ARAM

code_0C28:				;				| 
	CLRC				; $0C28  [$1D8D34]  60		| 
	MOV X, $28			; $0C29  [$1D8D35]  F8 28	| ARAM
	ADC A, $020F+X			; $0C2B  [$1D8D37]  95 0F 02	| ARAM
	MOV X, $26			; $0C2E  [$1D8D3A]  F8 26	| ARAM
	CLRC				; $0C30  [$1D8D3C]  60		| 
	ADC A, $02A1+X			; $0C31  [$1D8D3D]  95 A1 02	| ARAM
	MOV $0281+X, A			; $0C34  [$1D8D40]  D5 81 02	| ARAM
	MOV $0421+X, A			; $0C37  [$1D8D43]  D5 21 04	| ARAM
	MOV A, $02A0+X			; $0C3A  [$1D8D46]  F5 A0 02	| ARAM
	MOV $0420+X, A			; $0C3D  [$1D8D49]  D5 20 04	| ARAM
	MOV A, $0241+X			; $0C40  [$1D8D4C]  F5 41 02	| ARAM
	BNE code_0C5D			; $0C43  [$1D8D4F]  D0 18	| 
	MOV A, $0502+X			; $0C45  [$1D8D51]  F5 02 05	| ARAM
	LSR A				; $0C48  [$1D8D54]  5C		| 
	MOV A, #$00			; $0C49  [$1D8D55]  E8 00	| 
	ROR A				; $0C4B  [$1D8D57]  7C		| 
	MOV $04A1+X, A			; $0C4C  [$1D8D58]  D5 A1 04	| ARAM
	MOV A, #$00			; $0C4F  [$1D8D5B]  E8 00	| 
	MOV $04A2+X, A			; $0C51  [$1D8D5D]  D5 A2 04	| ARAM
	MOV $0501+X, A			; $0C54  [$1D8D60]  D5 01 05	| ARAM
	MOV $0541+X, A			; $0C57  [$1D8D63]  D5 41 05	| ARAM
	MOV $0542+X, A			; $0C5A  [$1D8D66]  D5 42 05	| ARAM
code_0C5D:				;				| 
	MOV X, $28			; $0C5D  [$1D8D69]  F8 28	| ARAM
	MOV A, $020E+X			; $0C5F  [$1D8D6B]  F5 0E 02	| ARAM
	OR A, $04			; $0C62  [$1D8D6E]  04 04	| ARAM
	MOV $020E+X, A			; $0C64  [$1D8D70]  D5 0E 02	| ARAM
	MOV X, $26			; $0C67  [$1D8D73]  F8 26	| ARAM
	MOV A, $0461+X			; $0C69  [$1D8D75]  F5 61 04	| ARAM
	BEQ 8				; $0C6C  [$1D8D78]  F0 08	| 
	MOV $0400+X, A			; $0C6E  [$1D8D7A]  D5 00 04	| ARAM
	MOV A, $0460+X			; $0C71  [$1D8D7D]  F5 60 04	| ARAM
	BRA code_0C9A			; $0C74  [$1D8D80]  2F 24	| 
code_0C76:				;				| 
	MOV A, $0480+X			; $0C76  [$1D8D82]  F5 80 04	| ARAM
	BEQ code_0C9D			; $0C79  [$1D8D85]  F0 22	| 
	MOV $0400+X, A			; $0C7B  [$1D8D87]  D5 00 04	| ARAM
	MOV A, $0481+X			; $0C7E  [$1D8D8A]  F5 81 04	| ARAM
	MOV $0401+X, A			; $0C81  [$1D8D8D]  D5 01 04	| ARAM
	MOV A, $0481+X			; $0C84  [$1D8D90]  F5 81 04	| ARAM
	BNE code_0C93			; $0C87  [$1D8D93]  D0 0A	| 
	MOV A, $0421+X			; $0C89  [$1D8D95]  F5 21 04	| ARAM
	SETC				; $0C8C  [$1D8D98]  80		| 
	SBC A, $0482+X			; $0C8D  [$1D8D99]  B5 82 04	| ARAM
	MOV $0421+X, A			; $0C90  [$1D8D9C]  D5 21 04	| ARAM
code_0C93:				;				| 
	MOV A, $0482+X			; $0C93  [$1D8D9F]  F5 82 04	| 
	CLRC				; $0C96  [$1D8DA2]  60		| 
	ADC A, $0421+X			; $0C97  [$1D8DA3]  95 21 04	| ARAM
code_0C9A:				;				| 
	CALL code_1752			; $0C9A  [$1D8DA6]  3F 52 17	| 
code_0C9D:				;				| 
	CALL code_178D			; $0C9D  [$1D8DA9]  3F 8D 17	| 
	CALL code_0CA6			; $0CA0  [$1D8DAC]  3F A6 0C	| 
	JMP code_0D41			; $0CA3  [$1D8DAF]  5F 41 0D	| 


code_0CA6:				;-------------------------------| 
	MOV Y, #$00			; $0CA6  [$1D8DB2]  8D 00	| 
	MOV A, $22			; $0CA8  [$1D8DB4]  E4 22	| ARAM
	SETC				; $0CAA  [$1D8DB6]  80		| 
	SBC A, #$28			; $0CAB  [$1D8DB7]  A8 28	| 
	BCS code_0CB8			; $0CAD  [$1D8DB9]  B0 09	| 
	MOV A, $22			; $0CAF  [$1D8DBB]  E4 22	| ARAM
	SETC				; $0CB1  [$1D8DBD]  80		| 
	SBC A, #$07			; $0CB2  [$1D8DBE]  A8 07	| 
	BCS code_0CBC			; $0CB4  [$1D8DC0]  B0 06	| 
	DEC Y				; $0CB6  [$1D8DC2]  DC		| 
	ASL A				; $0CB7  [$1D8DC3]  1C		| 
code_0CB8:				;				| 
	ADDW YA, $21			; $0CB8  [$1D8DC4]  7A 21	| ARAM
	MOVW $21, YA			; $0CBA  [$1D8DC6]  DA 21	| ARAM
code_0CBC:				;				| 
	MOV A, $22			; $0CBC  [$1D8DC8]  E4 22	| ARAM
	ASL A				; $0CBE  [$1D8DCA]  1C		| 
	MOV Y, #$00			; $0CBF  [$1D8DCB]  8D 00	| 
	MOV X, #$18			; $0CC1  [$1D8DCD]  CD 18	| 
	DIV YA, X			; $0CC3  [$1D8DCF]  9E		| 
	MOV X, A			; $0CC4  [$1D8DD0]  5D		| 
	MOV A, $1842+Y			; $0CC5  [$1D8DD1]  F6 42 18	| ARAM prolly table
	MOV $49, A			; $0CC8  [$1D8DD4]  C4 49	| ARAM
	MOV A, $1841+Y			; $0CCA  [$1D8DD6]  F6 41 18	| ARAM prolly table
	MOV $48, A			; $0CCD  [$1D8DD9]  C4 48	| ARAM
	MOV A, $1844+Y			; $0CCF  [$1D8DDB]  F6 44 18	| ARAM prolly table
	PUSH A				; $0CD2  [$1D8DDE]  2D		| 
	MOV A, $1843+Y			; $0CD3  [$1D8DDF]  F6 43 18	| 
	POP Y				; $0CD6  [$1D8DE2]  EE		| 
	SUBW YA, $48			; $0CD7  [$1D8DE3]  9A 48	| ARAM
	MOV Y, $21			; $0CD9  [$1D8DE5]  EB 21	| ARAM
	MUL YA				; $0CDB  [$1D8DE7]  CF		| 
	MOV A, Y			; $0CDC  [$1D8DE8]  DD		| 
	MOV Y, #$00			; $0CDD  [$1D8DE9]  8D 00	| 
	ADDW YA, $48			; $0CDF  [$1D8DEB]  7A 48	| ARAM
	MOV $49, Y			; $0CE1  [$1D8DED]  CB 49	| ARAM
	ASL A				; $0CE3  [$1D8DEF]  1C		| 
	ROL $49				; $0CE4  [$1D8DF0]  2B 49	| ARAM
	MOV $48, A			; $0CE6  [$1D8DF2]  C4 48	| ARAM
	BRA code_0CEE			; $0CE8  [$1D8DF4]  2F 04	| 

code_0CEA:				;				| 
	LSR $49				; $0CEA  [$1D8DF6]  4B 49	| ARAM
	ROR A				; $0CEC  [$1D8DF8]  7C		| 
	INC X				; $0CED  [$1D8DF9]  3D		| 
code_0CEE:				;				| 
	CMP X, #$07			; $0CEE  [$1D8DFA]  C8 07	| 
	BNE code_0CEA			; $0CF0  [$1D8DFC]  D0 F8	| 
	MOV $48, A			; $0CF2  [$1D8DFE]  C4 48	| ARAM
	MOV X, $26			; $0CF4  [$1D8E00]  F8 26	| ARAM
	MOV A, $02C1+X			; $0CF6  [$1D8E02]  F5 C1 02	| ARAM
	MOV Y, $49			; $0CF9  [$1D8E05]  EB 49	| ARAM
	MUL YA				; $0CFB  [$1D8E07]  CF		| 
	MOVW $4A, YA			; $0CFC  [$1D8E08]  DA 4A	| ARAM
	MOV A, $02C1+X			; $0CFE  [$1D8E0A]  F5 C1 02	| ARAM
	MOV Y, $48			; $0D01  [$1D8E0D]  EB 48	| ARAM
	MUL YA				; $0D03  [$1D8E0F]  CF		| 
	PUSH Y				; $0D04  [$1D8E10]  6D		| 
	MOV A, $02C0+X			; $0D05  [$1D8E11]  F5 C0 02	| ARAM
	MOV Y, $48			; $0D08  [$1D8E14]  EB 48	| ARAM
	MUL YA				; $0D0A  [$1D8E16]  CF		| 
	ADDW YA, $4A			; $0D0B  [$1D9E17]  7A 4A	| ARAM
	MOVW $4A, YA			; $0D0D  [$1D9E19]  DA 4A	| ARAM
	MOV A, $02C0+X			; $0D0F  [$1D9E1B]  F5 C0 02	| ARAM
	MOV Y, $49			; $0D12  [$1D9E1E]  EB 49	| ARAM
	MUL YA				; $0D14  [$1D9E20]  CF		| 
	MOV Y, A			; $0D15  [$1D9E21]  FD		| 
	POP A				; $0D16  [$1D9E22]  AE		| 
	ADDW YA, $4A			; $0D17  [$1D9E23]  7A 4A	| ARAM
	MOVW $4A, YA			; $0D19  [$1D9E25]  DA 4A	| ARAM
	MOV $0681+X, A			; $0D1B  [$1D9E27]  D5 81 06	| ARAM
	MOV A, Y			; $0D1E  [$1D9E2A]  DD		| 
	MOV $0682+X, A			; $0D1F  [$1D9E2B]  D5 82 06	| ARAM
	MOV A, $50+X			; $0D22  [$1D9E2E]  F4 50	| ARAM
	OR A, #$08			; $0D24  [$1D9E30]  08 08	| 
	MOV $50+X, A			; $0D26  [$1D9E32]  D4 50	| ARAM
	RET






code_0D41:				;-------------------------------| 
	ここ！





code_0DCB:				;-------------------------------| 
	ここ！





code_0DFD:				;-------------------------------| might be main port polling routine
	MOV X, $F4			; $0DFD  [$1D8F09]  F8 F4	| 
	MOV $1D, X			; $0DFF  [$1D8F0B]  D8 1D	| ARAM
	BEQ code_0E34			; $0E01  [$1D8F0D]  F0 31	| 
	MOV A, $F5			; $0E03  [$1D8F0F]  E4 F5	| 
	MOV $1E, A			; $0E05  [$1D8F11]  C4 1E	| ARAM
	CMP X, #$01			; $0E07  [$1D8F13]  C8 01	| 
	BNE code_0E10			; $0E09  [$1D8F15]  D0 05	| 
	CALL code_0E3D			; $0E0B  [$1D8F17]  3F 3D 0E	| 
	BRA code_0E34			; $0E0E  [$1D8F1A]  2F 24	| 
code_0E10:				;				| 
	CMP X, #$02			; $0E10  [$1D8F1C]  C8 02	| 
	BNE code_0E1C			; $0E12  [$1D8F1E]  D0 08	| 
	CALL code_0F74			; $0E14  [$1D8F20]  3F 74 0F	| 
	CALL code_0EC1			; $0E17  [$1D8F23]  3F C1 0E	| 
	BRA code_0E34			; $0E1A  [$1D8F26]  2F 18	| 
code_0E1C:				;				| 
	CMP X, #$03			; $0E1C  [$1D8F28]  C8 03	| 
	BNE code_0E2D			; $0E1E  [$1D8F2A]  D0 0D	| 
	CALL code_0F74			; $0E20  [$1D8F2C]  3F 74 0F	| 
	PUSH X				; $0E23  [$1D8F2F]  4D		| 
	CALL code_1281			; $0E24  [$1D8F30]  3F 81 12	| 
	POP X				; $0E27  [$1D8F33]  CE		| 
	CALL code_0FD3			; $0E28  [$1D8F34]  3F D3 0F	| 
	BRA code_0E34			; $0E2B  [$1D8F37]  2F 07	| 
code_0E2D:				;				| 
	CMP X, #$04			; $0E2D  [$1D8F39]  C8 04	| 
	BNE code_0E34			; $0E2F  [$1D8F3B]  D0 03	| 
	CALL code_0EDC			; $0E31  [$1D8F3D]  3F DC 0E	| 
code_0E34:				;				| 
	MOV A, $14			; $0E34  [$1D8F40]  E4 14	| ARAM
	MOV $F7, A			; $0E36  [$1D8F42]  C4 F7	| 
	MOV A, $1D			; $0E38  [$1D8F44]  E4 1D	| ARAM
	MOV $F4, A			; $0E3A  [$1D8F46]  C4 F4	| 
	RET				; $0E3C  [$1D8F48]  6F		| 

code_0E3D:				;-------------------------------| 
	CALL code_1394			; $0E3D  [$1D8F49]  3F 94 13	| 
	CALL code_1324			; $0E40  [$1D8F4C]  3F 24 13	| 
code_0E43:				;				| 
	MOV A, $4F+X			; $0E43  [$1D8F4F]  F4 4F	| ARAM
	BPL code_0E4A			; $0E45  [$1D8F51]  10 03	| 
	CALL code_0BD4			; $0E47  [$1D8F53]  3F D4 0B	| 
code_0E4A:				;				| 
	CALL code_1336			; $0E4A  [$1D8F56]  3F 36 13	| 
	CMP $02, #$08			; $0E4D  [$1D8F59]  78 08 02	| ARAM
	BNE code_0E43			; $0E50  [$1D8F5C]  D0 F1	| 
	MOV A, #$01			; $0E52  [$1D8F5E]  E8 01	| 
	MOV $0D, A			; $0E54  [$1D8F60]  C4 0D	| ARAM
	SET1 $14.0			; $0E56  [$1D8F62]  02 14	| ARAM
	CALL code_1281			; $0E58  [$1D8F64]  3F 81 12	| 
	MOV A, $1E			; $0E5B  [$1D8F67]  E4 1E	| ARAM
	DEC A				; $0E5D  [$1D8F69]  9C		| 
	ASL A				; $0E5E  [$1D8F6A]  1C		| 
	MOV X, A			; $0E5F  [$1D8F6B]  5D		| 
	MOV A, $3100+X			; $0E60  [$1D8F6C]  F5 00 31	| ARAM
	MOV $0B, A			; $0E63  [$1D8F6F]  C4 0B	| ARAM
	MOV A, $3101+X			; $0E65  [$1D8F71]  F5 01 31	| ARAM
	MOV $0C, A			; $0E68  [$1D8F74]  C4 0C	| ARAM
code_0E6A:				;-------------------------------| 
	MOV X, $28			; $0E6A  [$1D8F76]  F8 28	| ARAM
	MOV Y, #$00			; $0E6C  [$1D8F78]  8D 00	| 
	MOV A, ($0B)+Y			; $0E6E  [$1D8F7A]  F7 0B	| INDIRECT ARAM
	INCW $0B			; $0E70  [$1D8F7C]  3A 0B	| 
	MOV $0202+X, A			; $0E72  [$1D8F7E]  D5 02 02	| ARAM
	MOV A, #$00			; $0E75  [$1D8F81]  E8 00	| 
	MOV $0201+X, A			; $0E77  [$1D8F83]  D5 01 02	| ARAM
	CALL code_1324			; $0E7A  [$1D8F86]  3F 24 13	| 
code_0E7D:				;				| 
	MOV Y, #$00			; $0E7D  [$1D8F89]  8D 00	| 
	MOV A, ($0B)+Y			; $0E7F  [$1D8F8B]  F7 0B	| INDIRECT ARAM
	INCW $0B			; $0E81  [$1D8F8D]  3A 0B	| ARAM
	CMP A, #$00			; $0E83  [$1D8F8F]  68 00	| 
	BEQ code_0E92			; $0E85  [$1D8F91]  F0 0B	| 
	MOV A, $4F+X			; $0E87  [$1D8F93]  F4 4F	| ARAM
	OR A, #$80			; $0E89  [$1D8F95]  08 80	| 
	MOV $4F+X, A			; $0E8B  [$1D8F97]  D4 4F	| ARAM
	OR $31, $04			; $0E8D  [$1D8F99]  09 04 31	| ARAM
	BRA code_0E98			; $0E90  [$1D8F9C]  2F 06	| 
code_0E92:				;				| 
	MOV A, $4F+X			; $0E92  [$1D8F9E]  F4 4F	| ARAM
	AND A, #$7F			; $0E94  [$1D8FA0]  28 7F	| 
	MOV $4F+X, A			; $0E96  [$1D8FA2]  D4 4F	| ARAM
code_0E98:				;				| 
	CALL code_1336			; $0E98  [$1D8FA4]  3F 36 13	| 
	CMP $02, #$08			; $0E9B  [$1D8FA7]  78 08 02	| ARAM
	BNE code_0E7D			; $0E9E  [$1D8FAA]  D0 DD	| 
	CALL code_1324			; $0EA0  [$1D8FAC]  3F 24 13	| 
code_0EA3:				;				| 
	MOV Y, #$00			; $0EA3  [$1D8FAF]  8D 00	| 
	MOV A, ($0B)+Y			; $0EA5  [$1D8FB1]  F7 0B	| INDIRECT ARAM
	INCW $0B			; $0EA7  [$1D8FB3]  3A 0B	| ARAM
	MOV $05A1+X, A			; $0EA9  [$1D8FB5]  D5 A1 05	| ARAM
	MOV A, ($0B)+Y			; $0EAC  [$1D8FB8]  F7 0B	| INDIRECT ARAM
	INCW $0B			; $0EAE  [$1D8FBA]  3A 0B	| ARAM
	MOV $05A2+X, A			; $0EB0  [$1D8FBC]  D5 A2 05	| ARAM
	MOV A, #$01			; $0EB3  [$1D8FBF]  E8 01	| 
	MOV $0240+X, A			; $0EB5  [$1D8FC1]  D5 40 02	| ARAM
	CALL code_1336			; $0EB8  [$1D8FC4]  3F 36 13	| 
	CMP $02, #$08			; $0EBB  [$1D8FC7]  78 08 02	| ARAM
	BNE code_0EA3			; $0EBE  [$1D8FCA]  D0 E3	| 
	RET				; $0EC0  [$1D8FCC]  6F		| 


code_0EC1:				;-------------------------------| 
	MOV A, #$01			; $0EC1  [$1D8FCD]  E8 01	| 
	MOV $0E, A			; $0EC3  [$1D8FCF]  C4 0E	| ARAM
	CLR1 $14.2			; $0EC5  [$1D8FD1]  52 14	| ARAM
	SET1 $14.1			; $0EC7  [$1D8FD3]  22 14	| ARAM
	PUSH X				; $0EC9  [$1D8FD5]  4D		| 
	CALL code_12A0			; $0ECA  [$1D8FD6]  3F A0 12	| 
	POP X				; $0ECD  [$1D8FD9]  CE		| 
	CALL code_0FD3			; $0ECE  [$1D8FDA]  3F D3 0F	| 
	MOV A, #$00			; $0ED1  [$1D8FDD]  E8 00	| 
	MOV $0B, A			; $0ED3  [$1D8FDF]  C4 0B	| ARAM
	MOV A, #$20			; $0ED5  [$1D8FE1]  E8 20	| ARAM
	MOV $0C, A			; $0ED7  [$1D8FE3]  C4 0C	| ARAM
	JMP code_0E6A			; $0ED9  [$1D8FE5]  5F 6A 0E	| 


code_0EDC:				;-------------------------------| 
	MOV A, $1E			; $0EDC  [$1D8FE8]  E4 1E	| ARAM
	DEC A				; $0EDE  [$1D8FEA]  9C		| 
	ASL A				; $0EDF  [$1D8FEB]  1C		| 
	MOV X, A			; $0EE0  [$1D8FEC]  5D		| 
	JMP (ptrs_0EE4+X)		; $0EE1  [$1D8FED]  1F E4 0E	| ARAM

ptrs_0EE4:				;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^| 
	dw code_0F00			; $0EE4  [$1D8FF0]  00 0F	| 
	dw code_0EFC			; $0EE6  [$1D8FF2]  FC 0E	| 
	dw code_0EF8			; $0EE8  [$1D8FF4]  F8 0E	| 
	dw code_0F1D			; $0EEA  [$1D8FF6]  1D 0F	| 
	dw code_0F2B			; $0EEC  [$1D8FF8]  2B 0F	| 
	dw code_0F35			; $0EEE  [$1D8FFA]  35 0F	| 
	dw code_0F54			; $0EF0  [$1D8FFC]  54 0F	| 
	dw code_0F62			; $0EF2  [$1D8FFE]  62 0F	| 
	dw code_0F6C			; $0EF4  [$1D9000]  6C 0F	| 
	dw code_0F70			; $0EF6  [$1D9002]  70 0F	| 

code_0EF8:				;				| 
	MOV A, #$7F			; $0EF8  [$1D9004]  E8 7F	| 
	BRA code_0F02			; $0EFA  [$1D9006]  2F 06	| 
code_0EFC:				;				| 
	MOV A, #$40			; $0EFC  [$1D9008]  E8 40	| 
	BRA code_0F02			; $0EFE  [$1D900A]  2F 02	| 
code_0F00:				;				| 
	MOV A, #$10			; $0F00  [$1D900C]  E8 10	| 
code_0F02:				;				| 
	MOV $021A, A			; $0F02  [$1D900E]  C5 1A 02	| ARAM
	PUSH A				; $0F05  [$1D9011]  2D		| 
	MOV A, #$00			; $0F06  [$1D9012]  E8 00	| 
code_0F08:				;				| 
	MOV $021B, A			; $0F08  [$1D9014]  C5 1B 02	| ARAM
	SETC				; $0F0B  [$1D9017]  80		| 
	SBC A, $0219			; $0F0C  [$1D9018]  A5 19 02	| ARAM
	POP X				; $0F0F  [$1D901B]  CE		| 
	CALL code_1798			; $0F10  [$1D901C]  3F 98 17	| 
	MOV $021C, A			; $0F13  [$1D901F]  C5 1C 02	| ARAM
	MOV A, Y			; $0F16  [$1D9022]  DD		| 
	MOV $021D, A			; $0F17  [$1D9023]  C5 1D 02	| ARAM
	SET1 $14.2			; $0F1A  [$1D9026]  42 14	| ARAM
	RET				; $0F1C  [$1D9028]  6F		| 

code_0F1D:				;				| 
	MOV A, #$05			; $0F1D  [$1D9029]  E8 05	| 
	MOV $021A, A			; $0F1F  [$1D902B]  C5 1A 02	| ARAM
	PUSH A				; $0F22  [$1D902E]  2D		| 
	MOV A, $0219			; $0F23  [$1D902F]  E5 19 02	| ARAM
	MOV $1F, A			; $0F26  [$1D9032]  C4 1F	| ARAM
	LSR A				; $0F28  [$1D9034]  5C		| 
	BRA code_0F08			; $0F29  [$1D9035]  2F DD	| 

code_0F2B:				;				| 
	MOV A, #$05			; $0F2B  [$1D9037]  E8 05	| 
	MOV $021A, A			; $0F2D  [$1D9039]  C5 1A 02	| ARAM
	PUSH A				; $0F30  [$1D903C]  2D		| 
	MOV A, $1F			; $0F31  [$1D903D]  E4 1F	| ARAM
	BRA code_0F08			; $0F33  [$1D903F]  2F D3	| 

code_0F35:				;				| 
	MOV A, #$10			; $0F35  [$1D9041]  E8 10	| 
	MOV $0214, A			; $0F37  [$1D9043]  C5 14 02	| ARAM
	PUSH A				; $0F3A  [$1D9046]  2D		| 
	MOV A, $0212			; $0F3B  [$1D9047]  E5 12 02	| ARAM
	MOV $20, A			; $0F3E  [$1D904A]  C4 20	| ARAM
	ASL A				; $0F40  [$1D904C]  1C		| 
code_0F41:				;				| 
	MOV $0215, A			; $0F41  [$1D904D]  C5 15 02	| ARAM
	SETC				; $0F44  [$1D9050]  80		| 
	SBC A, $0212			; $0F45  [$1D9051]  A5 12 02	| ARAM
	POP X				; $0F48  [$1D9054]  CE		| 
	CALL code_1798			; $0F49  [$1D9055]  3F 98 17	| 
	MOV $0216, A			; $0F4C  [$1D9058]  C5 16 02	| ARAM
	MOV A, Y			; $0F4F  [$1D905B]  DD		| 
	MOV $0217, A			; $0F50  [$1D905C]  C5 17 02	| ARAM
	RET				; $0F53  [$1D905F]  6F		| 

code_0F54:				;				| 
	MOV A, #$10			; $0F54  [$1D9060]  E8 10	| 
	MOV $0214, A			; $0F56  [$1D9062]  C5 14 02	| ARAM
	PUSH A				; $0F59  [$1D9065]  2D		| 
	MOV A, $0212			; $0F5A  [$1D9066]  E5 12 02	| ARAM
	MOV $20, A			; $0F5D  [$1D9069]  C4 20	| ARAM
	LSR A				; $0F5F  [$1D906B]  5C		| 
	BRA code_0F41			; $0F60  [$1D906C]  2F DF	| 

code_0F62:				;				| 
	MOV A, #$10			; $0F62  [$1D906E]  E8 10	| 
	MOV $0214, A			; $0F64  [$1D9070]  C5 14 02	| ARAM
	PUSH A				; $0F67  [$1D9073]  2D		| 
	MOV A, $20			; $0F68  [$1D9074]  E4 20	| ARAM
	BRA code_0F41			; $0F6A  [$1D9076]  2F D5	| 

code_0F6C:				;				| 
	MOV $29, #$00			; $0F6C  [$1D9078]  8F 00 29	| ARAM
	RET				; $0F6F  [$1D907B]  6F		| 

code_0F70:				;				| 
	MOV $29, #$01			; $0F70  [$1D907C]  8F 01 29	| 
	RET				; $0F73  [$1D907F]  6F		| 


code_0F74:				;-------------------------------| 
	PUSH X				; $0F74  [$1D9080]  4D		| 
	CALL code_1394			; $0F75  [$1D9081]  3F 94 13	| 
	MOV Y, #$02			; $0F78  [$1D9084]  8D 02	| 
code_0F7A:				;				| 
	PUSH Y				; $0F7A  [$1D9086]  6D		| 
	CALL code_1324			; $0F7B  [$1D9087]  3F 24 13	| 
code_0F7E:				;				| 
	MOV A, #$00			; $0F7E  [$1D908A]  E8 00	| 
	MOV $4F+X, A			; $0F80  [$1D908C]  D4 4F	| ARAM
	MOV $50+X, A			; $0F82  [$1D908E]  D4 50	| ARAM
	MOV $14, A			; $0F84  [$1D9090]  C4 14	| ARAM
	CALL code_1336			; $0F86  [$1D9092]  3F 36 13	| 
	CMP $02, #$08			; $0F89  [$1D9095]  78 08 02	| ARAM
	BNE code_0F7E			; $0F8C  [$1D9098]  D0 F0	| 
	CALL code_13A2			; $0F8E  [$1D909A]  3F A2 13	| 
	POP Y				; $0F91  [$1D909D]  EE		| 
	DEC Y				; $0F92  [$1D909E]  DC		| 
	BNE code_0F7A			; $0F93  [$1D909F]  D0 E5	| 
	MOV A, #$00			; $0F95  [$1D90A1]  E8 00	| 
	MOV $2C, A			; $0F97  [$1D90A3]  C4 2C	| ARAM
	MOV $43, A			; $0F99  [$1D90A5]  C4 43	| ARAM
	MOV $2B, A			; $0F9B  [$1D90A7]  C4 2B	| ARAM
	MOV A, #$FF			; $0F9D  [$1D90A9]  E8 FF	| key off all channels
	MOV Y, #$5C			; $0F9F  [$1D90AB]  8D 5C	| DSP REG
	CALL code_135A			; $0FA1  [$1D90AD]  3F 5A 13	| 
	MOV A, #$00			; $0FA4  [$1D90B0]  E8 00	| clear pitch modulation & noise
	MOV Y, #$2D			; $0FA6  [$1D90B2]  8D 2D	| DSP REG
	CALL code_135A			; $0FA8  [$1D90B4]  3F 5A 13	| 
	MOV Y, #$3D			; $0FAB  [$1D90B7]  8D 3D	| DSP REG
	CALL code_135A			; $0FAD  [$1D90B9]  3F 5A 13	| 
	MOV A, #$01			; $0FB0  [$1D90BC]  E8 01	| 
	CALL code_13B0			; $0FB2  [$1D90BE]  3F B0 13	| 
	CALL code_141D			; $0FB5  [$1D90C1]  3F 1D 14	| 
	MOV A, #$00			; $0FB8  [$1D90C4]  E8 00	| 
	MOV $31, A			; $0FBA  [$1D90C6]  C4 31	| ARAM
	MOV Y, #$5C			; $0FBC  [$1D90C8]  8D 5C	| DSP REG
	CALL code_135A			; $0FBE  [$1D90CA]  3F 5A 13	| 
	MOV $F1, #$00			; $0FC1  [$1D90CD]  8F 00 F1	| clear control reg
	MOV A, #$10			; $0FC4  [$1D90D0]  E8 10	| 
	MOV $FA, A			; $0FC6  [$1D90D2]  C4 FA	| set timer 0
	MOV A, #$80			; $0FC8  [$1D90D4]  E8 80	| 
	MOV $FB, A			; $0FCA  [$1D90D6]  C4 FB	| set timer 1
	MOV $F1, #$03			; $0FCC  [$1D90D8]  8F 03 F1	| enable timers 0 and 1
	MOV A, $FD			; $0FCF  [$1D90DB]  E4 FD	| 
	POP X				; $0FD1  [$1D90DD]  CE		| 
	RET				; $0FD2  [$1D90DE]  6F		| 


code_0FD3:				;-------------------------------| 
	CMP $1D, #$02			; $0FD3  [$1D90DF]  78 02 1D	| ARAM
	BEQ code_0FE0			; $0FD6  [$1D90E2]  F0 08	| 
	MOV $48, #$00			; $0FD8  [$1D90E4]  8F 00 48	| ARAM
	MOV $49, #$31			; $0FDB  [$1D90E7]  8F 31 49	| ARAM (pointer!)
	BRA code_0FE6			; $0FDE  [$1D90EA]  2F 06	| 

code_0FE0:				;				| 
	MOV $48, #$00			; $0FE0  [$1D90EC]  8F 00 48	| ARAM
	MOV $49, #$20			; $0FE3  [$1D90EF]  8F 20 49	| ARAM (pointer!)
code_0FE6:				;				| 
	MOV A, $F6			; $0FE6  [$1D90F2]  E4 F6	| 
	MOV Y, $28			; $0FE8  [$1D90F4]  EB 28	| ARAM
	MOV $0222+Y, A			; $0FEA  [$1D90F6]  D6 22 02	| ARAM
	MOV $F4, X			; $0FED  [$1D90F9]  D8 F4	| 
code_0FEF:				;				| 
	CMP X, $F4			; $0FEF  [$1D90FB]  3E F4	| 
	BEQ code_0FEF			; $0FF1  [$1D90FD]  F0 FC	| 
	MOV X, $F4			; $0FF3  [$1D90FF]  F8 F4	| 
	MOV A, $F6			; $0FF5  [$1D9101]  E4 F6	| 
	MOV $0223+Y, A			; $0FF7  [$1D9103]  D6 23 02	| ARAM
	MOV $F4, X			; $0FFA  [$1D9106]  D8 F4	| 
code_0FFC:				;				| 
	CMP X, $F4			; $0FFC  [$1D9108]  3E F4	| 
	BEQ code_0FFC			; $0FFE  [$1D910A]  F0 FC	| 
	MOV X, $F4			; $1000  [$1D910C]  F8 F4	| 
	MOV Y, #$00			; $1002  [$1D910E]  8D 00	| 
code_1004:				;				| 
	MOV A, $F6			; $1004  [$1D9110]  E4 F6	| 
	MOV ($48)+Y, A			; $1006  [$1D9112]  D7 48	| INDIRECT ARAM
	INCW $48			; $1008  [$1D9114]  3A 48	| ARAM
	MOV $F4, X			; $100A  [$1D9116]  D8 F4	| 
code_100C:				;				| 
	CMP X, $F4			; $100C  [$1D9118]  3E F4	| 
	BEQ code_100C			; $100E  [$1D911A]  F0 FC	| 
	MOV X, $F4			; $1010  [$1D911C]  F8 F4	| 
	BNE code_1004			; $1012  [$1D911E]  D0 F0	| 
	MOV A, $F5			; $1014  [$1D9120]  E4 F5	| 
	BEQ code_1024			; $1016  [$1D9122]  F0 0C	| 
	BPL code_105C			; $1018  [$1D9124]  10 42	| 
	MOV $F4, X			; $101A  [$1D9126]  D8 F4	| 
code_101C:				;				| 
	CMP X, $F4			; $101C  [$1D9128]  3E F4	| 
	BEQ code_101C			; $101E  [$1D912A]  F0 FC	| 
	MOV X, $F4			; $1020  [$1D912C]  F8 F4	| 
	BRA code_1086			; $1022  [$1D912E]  2F 62	| 

code_1024:				;				| 
	MOV A, $F5			; $1024  [$1D9130]  E4 F5	| 
	BNE code_105C			; $1026  [$1D9132]  D0 34	| 
	MOVW YA, $F6			; $1028  [$1D9134]  BA F6	| 
	MOVW $4A, YA			; $102A  [$1D9136]  DA 4A	| ARAM
	MOV $F4, X			; $102C  [$1D9138]  D8 F4	| 
code_102E:				;				| 
	CMP X, $F4			; $102E  [$1D913A]  3E F4	| 
	BEQ code_102E			; $1030  [$1D913C]  F0 FC	| 
	MOVW YA, $F6			; $1032  [$1D913E]  BA F6	| 
	MOVW $48, YA			; $1034  [$1D9140]  DA 48	| ARAM
	MOV X, $F4			; $1036  [$1D9142]  F8 F4	| 
	MOV $F4, X			; $1038  [$1D9144]  D8 F4	| 
code_103A:				;				| 
	CMP X, $F4			; $103A  [$1D9146]  3E F4	| 
	BEQ code_103A			; $103C  [$1D9148]  F0 FC	| 
	MOVW YA, $F6			; $103E  [$1D914A]  BA F6	| 
	MOVW $46, YA			; $1040  [$1D914C]  DA 46	| ARAM
	MOV X, $F4			; $1042  [$1D914E]  F8 F4	| 
	MOV $F4, X			; $1044  [$1D9150]  D8 F4	| 
code_1046:				;				| 
	CMP X, $F4			; $1046  [$1D9152]  3E F4	| 
	BEQ code_1046			; $1048  [$1D9154]  F0 FC	| 
	MOV X, $F4			; $104A  [$1D9156]  F8 F4	| 
	MOV Y, #$00			; $104C  [$1D9158]  8D 00	| 
code_104E:				;				| 
	MOV A, ($4A)+Y			; $104E  [$1D915A]  F7 4A	| INDIRECT ARAM
	MOV ($48)+Y, A			; $1050  [$1D915C]  D7 48	| INDIRECT ARAM
	INCW $4A			; $1052  [$1D915E]  3A 4A	| ARAM
	INCW $48			; $1054  [$1D9160]  3A 48	| ARAM
	DECW $46			; $1056  [$1D9162]  1A 46	| ARAM
	BNE code_104E			; $1058  [$1D9164]  D0 F4	| 
	BRA code_1024			; $105A  [$1D9166]  2F C8	| 

code_105C:				;				| 
	MOVW YA, $F6			; $105C  [$1D9168]  BA F6	| 
	MOVW $48, YA			; $105E  [$1D916A]  DA 48	| ARAM
	MOV $F4, X			; $1060  [$1D916C]  D8 F4	| 
code_1062:				;				| 
	CMP X, $F4			; $1062  [$1D916E]  3E F4	| 
	BEQ code_1062			; $1064  [$1D9170]  F0 FC	| 
	MOV X, $F4			; $1066  [$1D9172]  F8 F4	| 
	MOV Y, #$00			; $1068  [$1D9174]  8D 00	| 
code_106A:				;				| 
	MOV A, $F5			; $106A  [$1D9176]  E4 F5	| 
	MOV ($48)+Y, A			; $106C  [$1D9178]  D7 48	| INDIRECT ARAM
	INCW $48			; $106E  [$1D917A]  3A 48	| ARAM
	MOV A, $F6			; $1070  [$1D917C]  E4 F6	| 
	MOV ($48)+Y, A			; $1072  [$1D917E]  D7 48	| INDIRECT ARAM
	INCW $48			; $1074  [$1D9180]  3A 48	| ARAM
	MOV A, $F7			; $1076  [$1D9182]  E4 F7	| 
	MOV ($48)+Y, A			; $1078  [$1D9184]  D7 48	| INDIRECT ARAM
	INCW $48			; $107A  [$1D9186]  3A 48	| ARAM
	MOV $F4, X			; $107C  [$1D9188]  D8 F4	| 
code_107E:				;				| 
	CMP X, $F4			; $107E  [$1D918A]  3E F4	| 
	BEQ code_107E			; $1080  [$1D918C]  F0 FC	| 
	MOV X, $F4			; $1082  [$1D918E]  F8 F4	| 
	BNE code_106A			; $1084  [$1D9190]  D0 E4	| 

code_1086:				;				| 
	MOV Y, $28			; $1086  [$1D9192]  EB 28	| ARAM
	MOV A, $0224+Y			; $1088  [$1D9194]  F6 24 02	| ARAM
	MOV $48, A			; $108B  [$1D9197]  C4 48	| ARAM
	MOV A, $0225+Y			; $108D  [$1D9199]  F6 25 02	| ARAM
	MOV $49, A			; $1090  [$1D919C]  C4 49	| ARAM
	MOV Y, #$00			; $1092  [$1D919E]  8D 00	| 
	MOV $F5, Y			; $1094  [$1D91A0]  CB F5	| 
code_1096:				;				| 
	MOV A, $F6			; $1096  [$1D91A2]  E4 F6	| 
	MOV ($48)+Y, A			; $1098  [$1D91A4]  D7 48	| INDIRECT ARAM
	INCW $48			; $109A  [$1D91A6]  3A 48	| ARAM
	MOV A, $F7			; $109C  [$1D91A8]  E4 F7	| 
	MOV ($48)+Y, A			; $109E  [$1D91AA]  D7 48	| INDIRECT ARAM
	INCW $48			; $10A0  [$1D91AC]  3A 48	| ARAM
	MOV $F4, X			; $10A2  [$1D91AE]  D8 E4	| 
code_10A4:				;				| 
	CMP X, $F4			; $10A4  [$1D91B0]  3E F4	| 
	BEQ code_10A4			; $10A6  [$1D91B2]  F0 FC	| 
	MOV X, $F4			; $10A8  [$1D91B4]  F8 F4	| 
	BNE code_1096			; $10AA  [$1D91B6]  D0 EA	| 
	MOV Y, $28			; $10AC  [$1D91B8]  EB 28	| ARAM
	MOV A, $0226+Y			; $10AE  [$1D91BA]  F6 26 02	| ARAM
	MOV $48, A			; $10B1  [$1D91BD]  C4 48	| ARAM
	MOV A, $0227+Y			; $10B3  [$1D91BF]  F6 27 02	| ARAM
	MOV $49, A			; $10B6  [$1D91C2]  C4 49	| ARAM
	MOV Y, #$00			; $10B8  [$1D91C4]  8D 00	| 
	MOV A, #$00			; $10BA  [$1D91C6]  E8 00	| 
code_10BC:				;				| 
	MOV ($48)+Y, A			; $10BC  [$1D91C8]  D7 48	| INDIRECT ARAM
	INC Y				; $10BE  [$1D91CA]  FC		| 
	CMP Y, #$60			; $10BF  [$1D91CB]  AD 60	| 
	BNE code_10BC			; $10C1  [$1D91CD]  D0 F9	| 
	MOV Y, #$00			; $10C3  [$1D91CF]  8D 00	| 
code_10C5:				;				| 
	MOV A, $F5			; $10C5  [$1D91D1]  E4 F5	| 
	MOV ($48)+Y, A			; $10C7  [$1D91D3]  D7 48	| INDIRECT ARAM
	INCW $48			; $10C9  [$1D91D5]  3A 48	| ARAM
	MOV A, $F6			; $10CB  [$1D91D7]  E4 F6	| 
	MOV ($48)+Y, A			; $10CD  [$1D91D9]  D7 48	| INDIRECT ARAM
	INCW $48			; $10CF  [$1D91DB]  3A 48	| ARAM
	MOV A, $F7			; $10D1  [$1D91DD]  E4 F7	| 
	MOV ($48)+Y, A			; $10D3  [$1D91DF]  D7 48	| INDIRECT ARAM
	INCW $48			; $10D5  [$1D91E1]  3A 48	| ARAM
	MOV $F4, X			; $10D7  [$1D91E3]  D8 F4	| 
code_10D9:				;				| 
	CMP X, $F4			; $10D9  [$1D91E5]  3E F4	| 
	BEQ code_10D9			; $10DB  [$1D91E7]  F0 FC	| 
	MOV X, $F4			; $10DD  [$1D91E9]  F8 F4	| 
	BNE code_10C5			; $10DF  [$1D91EB]  D0 E4	| 
	MOV A, #$00			; $10E1  [$1D91ED]  E8 00	| 
	DECW $48			; $10E3  [$1D91EF]  1A 48	| ARAM
	MOV ($48)+Y, A			; $10E5  [$1D91F1]  D7 48	| INDIRECT ARAM
	DECW $48			; $10E7  [$1D91F3]  1A 48	| ARAM
	MOV ($48)+Y, A			; $10E9  [$1D91F5]  D7 48	| INDIRECT ARAM
	DECW $48			; $10EB  [$1D91F7]  1A 48	| ARAM
	MOV ($48)+Y, A			; $10ED  [$1D91F9]  D7 48	| INDIRECT ARAM
	MOV $F4, X			; $10EF  [$1D91FB]  D8 F4	| 
	RET				; $10F1  [$1D91FD]  6F		| 


code_10F2:				;-------------------------------| 
	ここ！







code_125E:				;-------------------------------| 
	ここ！








code_1281:				;-------------------------------| 
	CALL code_1394			; $1281  [$1D938D]  3F 94 13	| 
	CALL code_12BF			; $1284  [$1D9390]  3F BF 12	| 
	MOV X, $28			; $1287  [$1D9393]  F8 28	| ARAM
	MOV A, #$00			; $1289  [$1D9395]  E8 00	| 
	MOV $0224+X, A			; $128B  [$1D9397]  D5 24 02	| ARAM
	MOV A, #$1E			; $128E  [$1D939A]  E8 1E	| 
	MOV $0225+X, A			; $1290  [$1D939C]  D5 25 02	| ARAM
	MOV A, #$80			; $1293  [$1D939F]  E8 80	| 
	MOV $0226+X, A			; $1295  [$1D93A1]  D5 26 02	| ARAM
	MOV A, #$1E			; $1298  [$1D93A4]  E8 1E	| 
	MOV $0227+X, A			; $129A  [$1D93A6]  D5 27 02	| ARAM
	MOV X, $26			; $129D  [$1D93A9]  F8 26	| ARAM
	RET				; $129F  [$1D93AB]  6F		| 

code_12A0:				;-------------------------------| 
	CALL code_13A2			; $12A0  [$1D93AC]  3F A2 13	| 
	CALL code_12BF			; $12A3  [$1D93AF]  3F BF 12	| 
	MOV X, $28			; $12A6  [$1D93B2]  F8 28	| ARAM
	MOV A, #$40			; $12A8  [$1D93B4]  E8 40	| 
	MOV $0224+X, A			; $12AA  [$1D93B6]  D5 24 02	| ARAM
	MOV A, #$1E			; $12AD  [$1D93B9]  E8 1E	| 
	MOV $0225+X, A			; $12AF  [$1D93BB]  D5 25 02	| ARAM
	MOV A, #$E0			; $12B2  [$1D93BE]  E8 E0	| 
	MOV $0226+X, A			; $12B4  [$1D93C0]  D5 26 02	| ARAM
	MOV A, #$1E			; $12B7  [$1D93C3]  E8 1E	| 
	MOV $0227+X, A			; $12B9  [$1D93C5]  D5 27 02	| 
	MOV X, $26			; $12BC  [$1D93C8]  F8 26	| ARAM
	RET				; $12BE  [$1D93CA]  6F		| 


code_12BF:				;-------------------------------| 
	PUSH A				; $12BF  [$1D93CB]  2D		| 
	PUSH X				; $12C0  [$1D93CC]  4D		| 
	PUSH Y				; $12C1  [$1D93CD]  6D		| 
	CALL code_1324			; $12C2  [$1D93CE]  3F 24 13	| 
code_12C5:				;				| 
	MOV A, #$7F			; $12C5  [$1D93D1]  E8 7F	| 
	MOV $0321+X, A			; $12C7  [$1D93D3]  D5 21 03	| ARAM
	MOV A, #$10			; $12CA  [$1D93D6]  E8 10	| 
	MOV $0682+X, A			; $12CC  [$1D93D8]  D5 82 06	| ARAM
	MOV A, #$0A			; $12CF  [$1D93DB]  E8 0A	| 
	CALL code_09F5			; $12D1  [$1D93DD]  3F F5 09	| 
	MOV A, #$FF			; $12D4  [$1D93E0]  E8 FF	| 
	MOV $0321+X, A			; $12D6  [$1D93E2]  D5 21 03	| ARAM
	MOV A, #$00			; $12D9  [$1D93E5]  E8 00	| 
	MOV $0280+X, A			; $12DB  [$1D93E7]  D5 80 02	| ARAM
	MOV $02A0+X, A			; $12DE  [$1D93EA]  D5 A0 02	| ARAM
	MOV $02A1+X, A			; $12E1  [$1D93ED]  D5 A1 02	| ARAM
	MOV $0480+X, A			; $12E4  [$1D93F0]  D5 80 04	| ARAM
	MOV $0400+X, A			; $12E7  [$1D93F3]  D5 00 04	| ARAM
	MOV $0461+X, A			; $12EA  [$1D93F6]  D5 61 04	| ARAM
	MOV $0380+X, A			; $12ED  [$1D93F9]  D5 80 03	| ARAM
	MOV $04C1+X, A			; $12F0  [$1D93FC]  D5 C1 04	| ARAM
	MOV $0561+X, A			; $12F3  [$1D93FF]  D5 61 05	| ARAM
	MOV $0301+X, A			; $12F6  [$1D9402]  D5 01 03	| ARAM
	MOV $4F+X, A			; $12F9  [$1D9405]  D4 4F	| ARAM
	MOV $50+X, A			; $12FB  [$1D9407]  D4 50	| ARAM
	CALL code_1336			; $12FD  [$1D9409]  3F 36 13	| 
	CMP $02, #$08			; $1300  [$1D940C]  78 08 02	| ARAM
	BNE code_12C5			; $1303  [$1D940F]  D0 C0	| 
	MOV X, $28			; $1305  [$1D9411]  F8 28	| ARAM
	MOV A, #$00			; $1307  [$1D9413]  E8 00	| 
	MOV $020A+X, A			; $1309  [$1D9415]  D5 0A 02	| ARAM
	MOV $0204+X, A			; $130C  [$1D9418]  D5 04 02	| ARAM
	MOV $020F+X, A			; $130F  [$1D941B]  D5 0F 02	| ARAM
	MOV $3F, A			; $1312  [$1D941E]  C4 3F	| ARAM
	MOV $3A, A			; $1314  [$1D9420]  C4 3A	| ARAM
	MOV A, #$FF			; $1316  [$1D9422]  E8 FF	| 
	MOV $0209+X, A			; $1318  [$1D9424]  D5 09 02	| ARAM
	MOV A, #$20			; $131B  [$1D9427]  E8 20	| 
	MOV $0202+X, A			; $131D  [$1D9429]  D5 02 02	| ARAM
	POP Y				; $1320  [$1D942C]  EE		| 
	POP X				; $1321  [$1D942D]  CE		| 
	POP A				; $1322  [$1D942E]  AE		| 
	RET				; $1323  [$1D942F]  6F		| 


code_1324:				;-------------------------------| 
	MOV X, $28			; $1324  [$1D9430]  F8 28	| ARAM
	MOV $26, X			; $1326  [$1D9432]  D8 26	| ARAM
	MOV $02, #$00			; $1328  [$1D9434]  8F 00 02	| ARAM
	MOV $03, #$00			; $132B  [$1D9437]  8F 00 03	| ARAM
	MOV $04, #$01			; $132E  [$1D943A]  8F 01 04	| ARAM
	MOV A, #$FE			; $1331  [$1D943D]  E8 FE	| 
	MOV $44, A			; $1333  [$1D943F]  C4 44	| ARAM
	RET				; $1335  [$1D9441]  6F		| 


code_1336:				;-------------------------------| 
	MOV X, $27			; $1336  [$1D9442]  F8 27	| ARAM
	INC X				; $1338  [$1D9444]  3D		| 
	INC X				; $1339  [$1D9445]  3D		| 
	MOV $27, X			; $133A  [$1D9446]  D8 27	| ARAM
	MOV X, $26			; $133C  [$1D9448]  F8 26	| ARAM
	INC X				; $133E  [$1D944A]  3D		| 
	INC X				; $133F  [$1D944B]  3D		| 
	MOV $26, X			; $1340  [$1D944C]  D8 26	| ARAM
	INC $02				; $1342  [$1D944E]  AB 02	| ARAM
	MOV A, $03			; $1344  [$1D9450]  E4 03	| ARAM
	CLRC				; $1346  [$1D9452]  60		| 
	ADC A, #$10			; $1347  [$1D9453]  88 10	| 
	MOV $03, A			; $1349  [$1D9455]  C4 03	| ARAM
	ASL $04				; $134B  [$1D9457]  0B 04	| ARAM
	MOV A, $04			; $134D  [$1D9459]  E4 04	| ARAM
	EOR A, #$FF			; $134F  [$1D945B]  48 FF	| 
	MOV $44, A			; $1351  [$1D945D]  C4 44	| ARAM
	RET				; $1353  [$1D945F]  6F		| 


code_1354:				;-------------------------------| 
	PUSH A				; $1354  [$1D9460]  2D		| 
	MOV A, Y			; $1355  [$1D9461]  DD		| 
	OR A, $03			; $1356  [$1D9462]  04 03	| ARAM
	MOV Y, A			; $1358  [$1D9464]  FD		| 
	POP A				; $1359  [$1D9465]  AE		| 
code_135A:				;===============================| DSP write
	MOV $F2, Y			; $135A  [$1D9466]  CB F2	| Y contains DSP reg
	MOV $F3, A			; $135C  [$1D9468]  C4 F3	| A contains value
	RET				; $135E  [$1D946A]  6F		| 

code_135F:				;===============================| DSP read
	MOV $F2, Y			; $135F  [$1D946B]  CB F2	| Y contains DSP reg
	MOV A, $F3			; $1361  [$1D946D]  E4 F3	| A will contain value
	RET				; $1363  [$1D946F]  6F		| 


code_1364:				;-------------------------------| 
	MOV A, $05A1+X			; $1364  [$1D9470]  F5 A1 05	| ARAM
	MOV $48, A			; $1367  [$1D9473]  C4 48	| ARAM
	MOV A, $05A2+X			; $1369  [$1D9475]  F5 A2 05	| ARAM
	MOV $49, A			; $136C  [$1D9478]  C4 49	| ARAM
	MOV Y, #$00			; $136E  [$1D947A]  8D 00	| 
	MOV A, ($48)+Y			; $1370  [$1D947C]  F7 48	| INDIRECT ARAM
	MOV $10, A			; $1372  [$1D947E]  C4 10	| ARAM
	INCW $48			; $1374  [$1D9480]  3A 48	| ARAM
	MOV A, $48			; $1376  [$1D9482]  E4 48	| ARAM
	MOV $05A1+X, A			; $1378  [$1D9484]  D5 A1 05	| ARAM
	MOV A, $49			; $137B  [$1D9487]  E4 49	| ARAM
	MOV $05A2+X, A			; $137D  [$1D9489]  D5 A2 05	| ARAM
	MOV A, $10			; $1380  [$1D948C]  E4 10	| ARAM
	RET				; $1382  [$1D948E]  6F		| 

code_1383:				;-------------------------------| 
	MOV A, $05A1+X			; $1383  [$1D948F]  F5 A1 05	| ARAM
	MOV $48, A			; $1386  [$1D9492]  C4 48	| ARAM
	MOV A, $05A2+X			; $1388  [$1D9494]  F5 A2 05	| ARAM
	MOV $49, A			; $138B  [$1D9497]  C4 49	| ARAM
	MOV Y, #$00			; $138D  [$1D9499]  8D 00	| 
	MOV A, ($48)+Y			; $138F  [$1D949B]  F7 48	| INDIRECT ARAM
	MOV $10, A			; $1391  [$1D949D]  C4 10	| ARAM
	RET				; $1393  [$1D949F]  6F		| 


code_1394:				;-------------------------------| 
	MOV $0F, #$00			; $1394  [$1D94A0]  8F 00 0F	| ARAM
	MOV X, #$10			; $1397  [$1D94A3]  CD 10	| 
	MOV $27, X			; $1399  [$1D94A5]  D8 27	| ARAM
	MOV X, #$00			; $139B  [$1D94A7]  CD 00	| 
	MOV $26, X			; $139D  [$1D94A9]  D8 26	| ARAM
	MOV $28, X			; $139F  [$1D94AB]  D8 28	| ARAM
	RET				; $13A1  [$1D94AD]  6F		| 


code_13A2:				;-------------------------------| 
	MOV $0F, #$01			; $13A2  [$1D94AE]  8F 01 0F	| ARAM
	MOV X, #$00			; $13A5  [$1D94B1]  CD 00	| 
	MOV $27, X			; $13A7  [$1D94B3]  D8 27	| ARAM
	MOV X, #$10			; $13A9  [$1D94B5]  CD 10	| 
	MOV $26, X			; $13AB  [$1D94B7]  D8 26	| ARAM
	MOV $28, X			; $13AD  [$1D94B9]  D8 28	| ARAM
	RET				; $13AF  [$1D94BB]  6F		| 


code_13B0:				;-------------------------------| 
	MOV $2D, A			; $13B0  [$1D94BC]  C4 2D	| ARAM
	MOV Y, #$7D			; $13B2  [$1D94BE]  8D 7D	| DSP REG
	CALL code_135F			; $13B4  [$1D94C0]  3F 5F 13	| 
	CMP A, $2D			; $13B7  [$1D94C3]  64 2D	| ARAM
	BEQ code_13FE			; $13B9  [$1D94C5]  F0 43	| 
	AND A, #$0F			; $13BB  [$1D94C7]  28 0F	| 
	EOR A, #$FF			; $13BD  [$1D94C9]  48 FF	| 
	BBC $2E.7, code_13C5		; $13BF  [$1D94CB]  F3 2E 03	| ARAM
	CLRC				; $13C2  [$1D94CE]  60		| 
	ADC A, $2E			; $13C3  [$1D94CF]  84 2E	| ARAM
code_13C5:				;				| 
	MOV $2E, A			; $13C5  [$1D94D1]  C4 2E	| ARAM
	MOV A, $FE			; $13C7  [$1D94D3]  E4 FE	| 
	MOV Y, #$04			; $13C9  [$1D94D5]  8D 04	| 
code_13CB:				;				| 
	MOV A, data_1419-1+Y		; $13CB  [$1D94D7]  F6 18 14	| 
	MOV $F2, A			; $13CE  [$1D94DA]  C4 F2	| 
	MOV A, #$00			; $13D0  [$1D94DC]  E8 00	| 
	MOV $F3, A			; $13D2  [$1D94DE]  C4 F3	| 
	DBNZ Y, code_13CB		; $13D4  [$1D94E0]  FE F5	| 
	MOV Y, #$6C			; $13D6  [$1D94E2]  8D 6C	| DSP REG
	CALL code_135F			; $13D8  [$1D94E4]  3F 5F 13	| 
	OR A, #$20			; $13DB  [$1D94E7]  08 20	| 
	MOV $2A, A			; $13DD  [$1D94E9]  C4 2A	| ARAM
	MOV Y, #$6C			; $13DF  [$1D94EB]  8D 6C	| DSP REG
	CALL code_135A			; $13E1  [$1D94ED]  3F 5A 13	| 
	MOV A, $2D			; $13E4  [$1D94F0]  E4 2D	| ARAM
	CALL code_1410			; $13E6  [$1D94F2]  3F 10 14	| 
	MOV $49, A			; $13E9  [$1D94F5]  C4 49	| ARAM
	MOV A, #$00			; $13EB  [$1D94F7]  E8 00	| 
	MOV $48, A			; $13ED  [$1D94F9]  C4 48	| ARAM
	MOV Y, A			; $13EF  [$1D94FB]  FD		| 
code_13F0:				;				| 
	MOV ($48)+Y, A			; $13F0  [$1D94FC]  D7 48	| INDIRECT ARAM
	INC Y				; $13F2  [$1D94FE]  FC		| 
	BNE code_13F7			; $13F3  [$1D94FF]  D0 02	| 
	INC $49				; $13F5  [$1D9501]  AB 49	| ARAM
code_13F7:				;				| 
	CMP $49, #$FF			; $13F7  [$1D9503]  78 FF 49	| ARAM
	BNE code_13F0			; $13FA  [$1D9506]  D0 F4	| 
	MOV A, $2D			; $13FC  [$1D9508]  E4 2D	| ARAM
code_13FE:				;				| 
	CALL code_1410			; $13FE  [$1D950A]  3F 10 14	| 
	MOV Y, #$6D			; $1401  [$1D950D]  8D 6D	| DSP REG
	CALL code_135A			; $1403  [$1D950F]  3F 5A 13	| 
	MOV $71, #$00			; $1406  [$1D9512]  8F 00 71	| ARAM
	MOV A, $2D			; $1409  [$1D9515]  E4 2D	| ARAM
	MOV Y, #$7D			; $140B  [$1D9517]  8D 7D	| DSP REG
	JMP code_135A			; $140D  [$1D9519]  5F 5A 13	| 

code_1410:				;-------------------------------| 
	ASL A				; $1410  [$1D951C]  1C		| 
	ASL A				; $1411  [$1D951D]  1C		| 
	ASL A				; $1412  [$1D951E]  1C		| 
	EOR A, #$FF			; $1413  [$1D951F]  48 FF	| 
	SETC				; $1415  [$1D9521]  80		| 
	ADC A, #$FF			; $1416  [$1D9522]  88 FF	| 
	RET				; $1418  [$1D9524]  6F		| 

data_1419:				;-------------------------------| 
	db $2C				; $1419  [$1D9525]		| DSP REG
	db $3C				; $141A  [$1D9526]		| DSP REG
	db $0D				; $141B  [$1D9527]		| DSP REG
	db $4D				; $141C  [$1D9528]		| DSP REG

code_141D:				;-------------------------------| 
	MOV A, #$00			; $141D  [$1D9529]  E8 00	| 
	MOV Y, #$2C			; $141F  [$1D952B]  8D 2C	| 
	CALL code_135A			; $1421  [$1D952D]  3F 5A 13	| 
	MOV Y, #$3C			; $1424  [$1D9530]  8D 3C	| 
	CALL code_135A			; $1426  [$1D9532]  3F 5A 13	| 
	SET1 $2A.5			; $1429  [$1D9535]  A2 2A	| ARAM
	RET				; $142B  [$1D9537]  6F		| 





code_1443:				;-------------------------------| 
	ここ！






code_14B0:				;-------------------------------| 
	ここ！






code_1555:				;-------------------------------| 
	ここ！








code_1585:				;-------------------------------| 
	ここ！







code_1752:				;-------------------------------| 
	ここ！





code_178D:				;-------------------------------| 
	ここ！





code_1798:				;-------------------------------| 
	NOTC				; $1798  [$1D98A4]  ED		| 
	ROR $23				; $1799  [$1D98A5]  6B 23	| ARAM
	BPL code_17A0			; $179B  [$1D98A7]  10 03	| 
	EOR A, #$FF			; $179D  [$1D98A9]  48 FF	| 
	INC A				; $179F  [$1D98AB]  BC		| 
code_17A0:				;				| 
	MOV Y, #$00			; $17A0  [$1D98AC]  8D 00	| 
	DIV YA, X			; $17A2  [$1D98AE]  9E		| 
	PUSH A				; $17A3  [$1D98AF]  2D		| 
	MOV A, #$00			; $17A4  [$1D98B0]  E8 00	| 
	DIV YA, X			; $17A6  [$1D98B2]  9E		| 
	POP Y				; $17A7  [$1D98B3]  EE		| 
	MOV X, $26			; $17A8  [$1D98B4]  F8 26	| ARAM
	BBC $23.7, code_17B3		; $17AA  [$1D98B6]  F3 23 06	| ARAM
	MOVW $46, YA			; $17AD  [$1D98B9]  DA 46	| ARAM
	MOV YA, $00			; $17AF  [$1D98BB]  BA 00	| ARAM
	SUBW YA, $46			; $17B1  [$1D98BD]  9A 46	| ARAM
code_17B3:				;				| 
	RET				; $17B3  [$1D98BF]  6F		| 








base off
arch 65816