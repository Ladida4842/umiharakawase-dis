architecture spc700

dw spc_code_end-spc_engine,spc_engine

pushbase($0700)

spc_engine:				//ARAM===[ROM]======RAW=BYTES===| 
	CLRP				// $0700  [$1D880C]  20		| 
	LDX #$DF			// $0701  [$1D880D]  CD DF	| 
	TXS				// $0703  [$1D880F]  BD		| 
	LDA #$00			// $0704  [$1D8810]  E8 00	| 
	TAX				// $0706  [$1D8812]  5D		| 
code_0707:				//				| clear $0000-$00DE
	STA (X+)			// $0707  [$1D8813]  AF		| 
	CPX #$DF			// $0708  [$1D8814]  C8 DF	| 
	BNE code_0707			// $070A  [$1D8816]  D0 FB	| 
	STA $48				// $070C  [$1D8818]  C4 48	| ARAM
	STA $49=#$01			// $070E  [$1D881A]  8F 01 49	| ARAM
	TAY				// $0711  [$1D881D]  FD		| 
code_0712:				//				| clear $0100-$07FF? rofl=definitely a mistake
	STA ($48)+Y			// $0712  [$1D881E]  D7 48	| INDIRECT ARAM
	INY				// $0714  [$1D8820]  FC		| D7 becomes 00 (NOP). 48 FC is EOR #$FC
	BNE code_0719			// $0715  [$1D8821]  D0 02	| so this wont branch after it loops back (00 xor FC = FC=FC xor FC = 00)
	INC $49				// $0717  [$1D8823]  AB 49	| ARAM
code_0719:				//				| which means $49 increases prematurely
	CMP $49=#$08			// $0719  [$1D8825]  78 08 49	| ARAM
	BNE code_0712			// $071C  [$1D8828]  D0 F4	| which means this wont branch. lucky or madmen?
	STA $49=#$80			// $071E  [$1D882A]  8F 80 49	| ARAM
	TAY				// $0721  [$1D882D]  FD		| 
code_0722:				//				| clear $8000-$FEFF
	STA ($48)+Y			// $0722  [$1D882E]  D7 48	| INDIRECT ARAM
	INY				// $0724  [$1D8830]  FC		| 
	BNE code_0729			// $0725  [$1D8831]  D0 02	| 
	INC $49				// $0727  [$1D8833]  AB 49	| ARAM
code_0729:				//				| 
	CMP $49=#$FF			// $0729  [$1D8835]  78 FF 49	| ARAM
	BNE code_0722			// $072C  [$1D8838]  D0 F4	| 
	LDA #$00			// $072E  [$1D883A]  E8 00	| 
	STA $F5				// $0730  [$1D883C]  C4 F5	| 
	STA $F6				// $0732  [$1D883E]  C4 F6	| 
	STA $F7				// $0734  [$1D8840]  C4 F7	| 
	LDA #$F7			// $0736  [$1D8842]  E8 F7	| echo buffer at $F700!
	LDY #$6D			// $0738  [$1D8844]  8D 6D	| DSP REG
	CALL code_135A			// $073A  [$1D8846]  3F 5A 13	| 
	LDA #$01			// $073D  [$1D8849]  E8 01	| echo delay
	LDY #$7D			// $073F  [$1D884B]  8D 7D	| DSP REG
	CALL code_135A			// $0741  [$1D884D]  3F 5A 13	| 
	LDA #$01			// $0744  [$1D8850]  E8 01	| 
	CALL code_13B0			// $0746  [$1D8852]  3F B0 13	| 
	CALL code_141D			// $0749  [$1D8855]  3F 1D 14	| 
	LDA #$50			// $074C  [$1D8858]  E8 50	| main volume
	LDY #$0C			// $074E  [$1D885A]  8D 0C	| DSP REG
	CALL code_135A			// $0750  [$1D885C]  3F 5A 13	| 
	LDY #$1C			// $0753  [$1D885F]  8D 1C	| DSP REG
	CALL code_135A			// $0755  [$1D8861]  3F 5A 13	| 
	LDA #$1E			// $0758  [$1D8864]  E8 1E	| source directory at $1E00!
	LDY #$5D			// $075A  [$1D8866]  8D 5D	| DSP REG
	CALL code_135A			// $075C  [$1D8868]  3F 5A 13	| 
	LDA #$00			// $075F  [$1D886B]  E8 00	| no pitch modulation or noise
	LDY #$2D			// $0761  [$1D886D]  8D 2D	| DSP REG
	CALL code_135A			// $0763  [$1D886F]  3F 5A 13	| 
	LDY #$3D			// $0766  [$1D8872]  8D 3D	| DSP REG
	CALL code_135A			// $0768  [$1D8874]  3F 5A 13	| 
	LDA #$00			// $076B  [$1D8877]  E8 00	| DSP REG
	TAY				// $076D  [$1D8879]  FD		| 
code_076E:				//				| this loop clears all channel settings
	LDA #$00			// $076E  [$1D887A]  E8 00	| 
	CALL code_135A			// $0770  [$1D887C]  3F 5A 13	| 
	INY				// $0773  [$1D887F]  FC		| 
	TYA				// $0774  [$1D8880]  DD		| 
	AND #$07			// $0775  [$1D8881]  28 07	| 
	BNE code_076E			// $0777  [$1D8883]  D0 F5	| 
	TYA				// $0779  [$1D8885]  DD		| 
	AND #$F0			// $077A  [$1D8886]  28 F0	| 
	CLRC				// $077C  [$1D8888]  60		| 
	ADC #$10			// $077D  [$1D8889]  88 10	| 
	TAY				// $077F  [$1D888B]  FD		| 
	CMP #$80			// $0780  [$1D888C]  68 80	| 
	BNE code_076E			// $0782  [$1D888E]  D0 EA	| 
	STA $F1=#$00			// $0784  [$1D8890]  8F 00 F1	| clear control reg
	LDA #$80			// $0787  [$1D8893]  E8 80	| 
	STA $FA				// $0789  [$1D8895]  C4 FA	| timer 0
	STA $FB				// $078B  [$1D8897]  C4 FB	| timer 1
	STA $F1=#$03			// $078D  [$1D8899]  8F 03 F1	| enable timers 0 and 1 (the 8khz ones)
	LDA $FD				// $0790  [$1D889C]  E4 FD	| 
	LDA $FE				// $0792  [$1D889E]  E4 FE	| 
	CALL code_1394			// $0794  [$1D88A0]  3F 94 13	| 
	CALL code_1324			// $0797  [$1D88A3]  3F 24 13	| 
code_079A:				//				| 
	LDA #$00			// $079A  [$1D88A6]  E8 00	| 
	STA $4F+X			// $079C  [$1D88A8]  D4 4F	| ARAM
	LDA #$00			// $079E  [$1D88AA]  E8 00	| 
	STA $50+X			// $07A0  [$1D88AC]  D4 50	| ARAM
	CALL code_1336			// $07A2  [$1D88AE]  3F 36 13	| 
	CMP $02=#$08			// $07A5  [$1D88B1]  78 08 02	| ARAM
	BNE code_079A			// $07A8  [$1D88B4]  D0 F0	| 
code_07AA:				//------------------------------| looplooploop
	CALL code_0DFD			// $07AA  [$1D88B6]  3F FD 0D	| 
	LDY $FD				// $07AD  [$1D88B9]  EB FD	| 
	BEQ code_07AA			// $07AF  [$1D88BB]  F0 F9	| 
	STY $24				// $07B1  [$1D88BD]  CB 24	| ARAM
	LDA $FE				// $07B3  [$1D88BF]  E4 FE	| 
	BEQ code_07BE			// $07B5  [$1D88C1]  F0 07	| 
	CMP $2E=$2D			// $07B7  [$1D88C3]  69 2D 2E	| ARAM
	BEQ code_07BE			// $07BA  [$1D88C6]  F0 02	| 
	INC $2E				// $07BC  [$1D88C8]  AB 2E	| ARAM
code_07BE:				//				| 
	LDA $0D				// $07BE  [$1D88CA]  E4 0D	| ARAM
	BEQ code_07DA			// $07C0  [$1D88CC]  F0 18	| 
	LDA $0202			// $07C2  [$1D88CE]  E5 02 02	| ARAM
	MUL				// $07C5  [$1D88D1]  CF		| 
	CLRC				// $07C6  [$1D88D2]  60		| 
	ADC $0203			// $07C7  [$1D88D3]  85 03 02	| ARAM
	STA $0203			// $07CA  [$1D88D6]  C5 03 02	| ARAM
	BCC code_07DA			// $07CD  [$1D88D9]  90 0B	| 
	CALL code_1394			// $07CF  [$1D88DB]  3F 94 13	| 
	CALL code_0801			// $07D2  [$1D88DE]  3F 01 08	| 
	CALL code_1585			// $07D5  [$1D88E1]  3F 85 15	| 
	BRA code_07DA			// $07D8  [$1D88E4]  2F 00	| 
code_07DA:				//				| 
	LDA $0E				// $07DA  [$1D88E6]  E4 0E	| ARAM
	BEQ code_07F8			// $07DC  [$1D88E8]  F0 1A	| 
	LDY $24				// $07DE  [$1D88EA]  EB 24	| ARAM
	LDA $0212			// $07E0  [$1D88EC]  E5 12 02	| ARAM
	MUL				// $07E3  [$1D88EF]  CF		| 
	CLRC				// $07E4  [$1D88F0]  60		| 
	ADC $0213			// $07E5  [$1D88F1]  85 13 02	| ARAM
	STA $0213			// $07E8  [$1D88F4]  C5 13 02	| ARAM
	BCC code_07F8			// $07EB  [$1D88F7]  90 0B	| 
	CALL code_13A2			// $07ED  [$1D88F9]  3F A2 13	| 
	CALL code_0801			// $07F0  [$1D88FC]  3F 01 08	| 
	CALL code_1585			// $07F3  [$1D88FF]  3F 85 15	| 
	BRA code_07F8			// $07F6  [$1D8902]  2F 00	| 
code_07F8:				//				| 
	CALL code_1555			// $07F8  [$1D8904]  3F 55 15	| 
	CALL code_10F2			// $07FB  [$1D8907]  3F F2 10	| 
	JMP code_07AA			// $07FE  [$1D890A]  5F AA 07	| go loop


code_0801:				//------------------------------| 
	CALL code_1324			// $0801  [$1D890D]  3F 24 13	|  
	STA $15=#$00			// $0804  [$1D8910]  8F 00 15	| ARAM
code_0807:				//				| 
	LDA $4F+X			// $0807  [$1D8913]  F4 4F	| ARAM
	BPL code_081C			// $0809  [$1D8915]  10 11	| 
	INC $15				// $080B  [$1D8917]  AB 15	| ARAM
	LDA $0240+X			// $080D  [$1D8919]  F5 40 02	| ARAM
	DEC				// $0810  [$1D891C]  9C		| 
	STA $0240+X			// $0811  [$1D891D]  D5 40 02	| ARAM
	BNE code_082D			// $0814  [$1D8920]  D0 17	| 
	CALL code_084C			// $0816  [$1D8922]  3F 4C 08	| 
	CALL code_1443			// $0819  [$1D8925]  3F 43 14	| 
code_081C:				//				| 
	CALL code_1336			// $081C  [$1D8928]  3F 36 13	| 
	CMP $02=#$08			// $081F  [$1D892B]  78 08 02	| ARAM
	BNE code_0807			// $0822  [$1D892E]  D0 E3	| 
	CMP $15=#$00			// $0824  [$1D8930]  78 00 15	| ARAM
	BNE code_082C			// $0827  [$1D8933]  D0 03	| 
	CALL code_125E			// $0829  [$1D8935]  3F 5E 12	| 
code_082C:				//				| 
	RET				// $082C  [$1D8938]  6F		| 

code_082D:				//				| 
	LDA $0241+X			// $082D  [$1D8939]  F5 41 02	| ARAM
	CMP #$00			// $0830  [$1D893C]  68 00	| 
	BEQ code_081C			// $0832  [$1D893E]  F0 E8	| 
	DEC				// $0834  [$1D8940]  9C		| 
	STA $0241+X			// $0835  [$1D8941]  D5 41 02	| ARAM
	BEQ code_083F			// $0838  [$1D8944]  F0 05	| 
	CALL code_14B0			// $083A  [$1D8946]  3F B0 14	| 
	BRA code_081C			// $083D  [$1D8949]  2F DD	| 

code_083F:				//				| 
	LDA #$00			// $083F  [$1D894B]  E8 00	| 
	STA $0461+X			// $0841  [$1D894D]  D5 61 04	| ARAM
	LDA $50+X			// $0844  [$1D8950]  F4 50	| ARAM
	ORA #$40			// $0846  [$1D8952]  08 40	| 
	STA $50+X			// $0848  [$1D8954]  D4 50	| ARAM
	BRA code_081C			// $084A  [$1D8956]  2F D0	| 


code_084C:				//------------------------------| 
	LDA $4F+X			// $084C  [$1D8958]  F4 4F	| ARAM
	AND #$40			// $084E  [$1D895A]  28 40	| 
	BEQ code_085A			// $0850  [$1D895C]  F0 08	| 
	LDA $4F+X			// $0852  [$1D895E]  F4 4F	| ARAM
	AND #$20			// $0854  [$1D8960]  28 20	| 
	BNE code_08A0			// $0856  [$1D8962]  D0 48	| 
	BRA code_0884			// $0858  [$1D8964]  2F 2A	| 

code_085A:				//				| 
	CALL code_1364			// $085A  [$1D8966]  3F 64 13	| 
	CMP #$50			// $085D  [$1D8969]  68 50	| 
	BCC code_0881			// $085F  [$1D896B]  90 20	| 
	SETC				// $0861  [$1D896D]  80		| 
	SBC #$50			// $0862  [$1D896E]  A8 50	| 
	LDY #$02			// $0864  [$1D8970]  8D 02	| 
	MUL				// $0866  [$1D8972]  CF		| 
	CLRC				// $0867  [$1D8973]  60		| 
	ADC #ptrs_18C0			// $0868  [$1D8974]  88 C0	| 
	STA $48				// $086A  [$1D8976]  C4 48	| ARAM
	TYA				// $086C  [$1D8978]  DD		| 
	ADC #ptrs_18C0>>8		// $086D  [$1D8979]  88 18	| 
	STA $49				// $086F  [$1D897B]  C4 49	| ARAM
code_0871:				//				| 
	LDY #$00			// $0871  [$1D897D]  8D 00	| 
	LDA ($48)+Y			// $0873  [$1D897F]  F7 48	| ARAM
	STA addr_087E+1			// $0875  [$1D8981]  C5 7F 08	| this...
	INY				// $0878  [$1D8984]  FC		| 
	LDA ($48)+Y			// $0879  [$1D8985]  F7 48	| ARAM
	STA addr_087E+2			// $087B  [$1D8987]  C5 80 08	| ... and this...
addr_087E:				//				| 
	JMP code_08BC			// $087E  [$1D898A]  5F BC 08	| <--- store here


code_0881:				//				| 
	JMP code_0C26			// $0881  [$1D898D]  5F 26 0C	| 

code_0884:				//				| 
	CALL code_1364			// $0884  [$1D8990]  3F 64 13	| 
	CMP #$50			// $0887  [$1D8993]  68 50	| 
	BCC code_089D			// $0889  [$1D8995]  90 12	| 
	SETC				// $088B  [$1D8997]  80		| 
	SBC #$50			// $088C  [$1D8998]  A8 50	| 
	LDY #$02			// $088E  [$1D899A]  8D 02	| 
	MUL				// $0890  [$1D899C]  CF		| 
	CLRC				// $0891  [$1D899D]  60		| 
	ADC #ptrs_1A20			// $0892  [$1D899E]  88 20	| 
	STA $48				// $0894  [$1D89A0]  C4 48	| ARAM
	TYA				// $0896  [$1D89A2]  DD		| 
	ADC #ptrs_1A20>>8		// $0897  [$1D89A3]  88 1A	| 
	STA $49				// $0899  [$1D89A5]  C4 49	| ARAM
	BRA code_0871			// $089B  [$1D89A7]  2F D4	| 

code_089D:				//				| 
	JMP code_0DCB			// $089D  [$1D89A9]  5F CB 0D	| 

code_08A0:				//				| 
	CALL code_1364			// $08A0  [$1D89AC]  3F 64 13	| 
	CMP #$50			// $08A3  [$1D89AF]  68 50	| 
	BCC code_08B9			// $08A5  [$1D89B1]  90 12	| 
	SETC				// $08A7  [$1D89B3]  80		| 
	SBC #$50			// $08A8  [$1D89B4]  A8 50	| 
	LDY #$02			// $08AA  [$1D89B6]  8D 02	| 
	MUL				// $08AC  [$1D89B8]  CF		| 
	CLRC				// $08AD  [$1D89B9]  60		| 
	ADC #ptrs_1B80			// $08AE  [$1D89BA]  88 80	| 
	STA $48				// $08B0  [$1D89BC]  C4 48	| ARAM
	TYA				// $08B2  [$1D89BE]  DD		| 
	ADC #ptrs_1B80>>8		// $08B3  [$1D89BF]  88 1B	| 
	STA $49				// $08B5  [$1D89C1]  C4 49	| ARAM
	BRA code_0871			// $08B7  [$1D89C3]  2F B8	| 

code_08B9:				//				| 
	JMP code_0BF6			// $08B9  [$1D89C5]  5F F6 0B	| 


code_08BC:				//------------------------------| 
	JMP code_084C			// $08BC  [$1D89C8]  5F 4C 08	| loop (this is a temp code it seems)


code_08BF:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	LDA $10				// $08BF  [$1D89CB]  E4 10	| 
	AND #$0F			// $08C1  [$1D89CD]  28 0F	| 
	TAY				// $08C3  [$1D89CF]  FD		| 
	LDA data_18B0+Y			// $08C4  [$1D89D0]  F6 B0 18	| ARAM (ROM table)
	STA $0321+X			// $08C7  [$1D89D3]  D5 21 03	| ARAM
	JMP code_084C			// $08CA  [$1D89D6]  5F 4C 08	| 


code_08CD:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	CALL code_1364			// $08CD  [$1D89D9]  3F 64 13	| 
	LDX $28				// $08D0  [$1D89DC]  F8 28	| ARAM
	STA $0202+X			// $08D2  [$1D89DE]  D5 02 02	| ARAM
	LDA #$00			// $08D5  [$1D89E1]  E8 00	| 
	STA $0201+X			// $08D7  [$1D89E3]  D5 01 02	| ARAM
	LDX $26				// $08DA  [$1D89E6]  F8 26	| ARAM
	JMP code_084C			// $08DC  [$1D89E8]  5F 4C 08	| 


code_08DF:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	LDX $28				// $08DF  [$1D89EB]  F8 28	| ARAM
	LDA $0202+X			// $08E1  [$1D89ED]  F5 02 02	| ARAM
	STA $46				// $08E4  [$1D89F0]  C4 46	| ARAM
	LDX $26				// $08E6  [$1D89F2]  F8 26	| ARAM
	CALL code_1364			// $08E8  [$1D89F4]  3F 64 13	| 
	LDX $28				// $08EB  [$1D89F7]  F8 28	| ARAM
	STA $0204+X			// $08ED  [$1D89F9]  D5 04 02	| ARAM
	LDX $26				// $08F0  [$1D89FC]  F8 26	| ARAM
	CALL code_1364			// $08F2  [$1D89FE]  3F 64 13	| 
	LDX $28				// $08F5  [$1D8A01]  F8 28	| ARAM
	STA $0205+X			// $08F7  [$1D8A03]  D5 05 02	| ARAM
	SETC				// $08FA  [$1D8A06]  80		| 
	SBC $0202+X			// $08FB  [$1D8A07]  B5 02 02	| ARAM
	PHA				// $08FE  [$1D8A0A]  2D		| 
	LDA $0204+X			// $08FF  [$1D8A0B]  F5 04 02	| ARAM
	TAX				// $0902  [$1D8A0E]  5D		| 
	PLA				// $0903  [$1D8A0F]  AE		| 
	CALL code_1798			// $0904  [$1D8A10]  3F 98 17	| 
	LDX $28				// $0907  [$1D8A13]  F8 28	| ARAM
	STA $0206+X			// $0909  [$1D8A15]  D5 06 02	| ARAM
	TYA				// $090C  [$1D8A18]  DD		| 
	STA $0207+X			// $090D  [$1D8A19]  D5 07 02	| ARAM
	LDX $26				// $0910  [$1D8A1C]  F8 26	| ARAM
	JMP code_084C			// $0912  [$1D8A1E]  5F 4C 08	| 


code_0915:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	LDA $10				// $0915  [$1D8A21]  E4 10	| ARAM
	AND #$07			// $0917  [$1D8A23]  28 07	| 
	ORA $03				// $0919  [$1D8A25]  04 03	| ARAM
	PHA				// $091B  [$1D8A27]  2D		| 
	CALL code_1364			// $091C  [$1D8A28]  3F 64 13	| 
	PLY				// $091F  [$1D8A2B]  EE		| 
	CALL code_135A			// $0920  [$1D8A2C]  3F 5A 13	| dsp write
	JMP code_084C			// $0923  [$1D8A2F]  5F 4C 08	| 


code_0926:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	CALL code_1364			// $0926  [$1D8A32]  3F 64 13	| 
	STA $3F				// $0929  [$1D8A35]  C4 3F	| ARAM
	CALL code_1364			// $092B  [$1D8A37]  3F 64 13	| 
	AND #$1F			// $092E  [$1D8A3A]  28 1F	| 
	STA $40				// $0930  [$1D8A3C]  C4 40	| ARAM
	JMP code_084C			// $0932  [$1D8A3E]  5F 4C 08	| 


code_0935:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	LDA $10				// $0935  [$1D8A41]  E4 10	| ARAM
	AND #$1F			// $0937  [$1D8A43]  28 1F	| 
	STA $3E				// $0939  [$1D8A45]  C4 3E	| ARAM
	STA $3D=#$00			// $093B  [$1D8A47]  8F 00 3D	| ARAM
	LDA $3F				// $093E  [$1D8A4A]  E4 3F	| ARAM
	BEQ code_0959			// $0940  [$1D8A4C]  F0 17	| 
	TAX				// $0942  [$1D8A4E]  5D		| 
	LDA $40				// $0943  [$1D8A4F]  E4 40	| ARAM
	SETC				// $0945  [$1D8A51]  80		| 
	SBC $3E				// $0946  [$1D8A52]  A4 3E	| ARAM
	CALL code_1798			// $0948  [$1D8A54]  3F 98 17	| 
	STAW $41			// $094B  [$1D8A57]  DA 41	| ARAM
	LDX $28				// $094D  [$1D8A59]  F8 28	| ARAM
	LDA $020E+X			// $094F  [$1D8A5B]  F5 0E 02	| ARAM
	ORA $04				// $0952  [$1D8A5E]  04 04	| ARAM
	STA $020E+X			// $0954  [$1D8A60]  D5 0E 02	| ARAM
	LDX $26				// $0957  [$1D8A63]  F8 26	| ARAM
code_0959:				//				| 
	JMP code_0D41			// $0959  [$1D8A65]  5F 41 0D	| 


code_095C:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	LDA $4F+X			// $095C  [$1D8A68]  F4 4F	| ARAM
	ORA #$10			// $095E  [$1D8A6A]  08 10	| 
	STA $4F+X			// $0960  [$1D8A6C]  D4 4F	| ARAM
	JMP code_084C			// $0962  [$1D8A6E]  5F 4C 08	| 


code_0965:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	LDA $4F+X			// $0965  [$1D8A71]  F4 4F	| ARAM
	AND #$EF			// $0967  [$1D8A73]  28 EF	| 
	STA $4F+X			// $0969  [$1D8A75]  D4 4F	| ARAM
	JMP code_084C			// $096B  [$1D8A77]  5F 4C 08	| 


code_096E:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	CALL code_1364			// $096E  [$1D8A7A]  3F 64 13	| 
	CALL code_13B0			// $0971  [$1D8A7D]  3F B0 13	| 
	CALL code_1364			// $0974  [$1D8A80]  3F 64 13	| 
	STA $2F				// $0977  [$1D8A83]  C4 2F	| ARAM
	CALL code_1364			// $0979  [$1D8A85]  3F 64 13	| 
	STA $6F				// $097C  [$1D8A88]  C4 6F	| ARAM
	STA $71=#$01			// $097E  [$1D8A8A]  8F 01 71	| ARAM
	STA $33=#$00			// $0981  [$1D8A8D]  8F 00 33	| ARAM
	STA $32=#$00			// $0984  [$1D8A90]  8F 00 32	| ARAM
	CALL code_1364			// $0987  [$1D8A93]  3F 64 13	| 
	STA $70				// $098A  [$1D8A96]  C4 70	| ARAM
	STA $35=#$00			// $098C  [$1D8A98]  8F 00 35	| ARAM
	STA $34=#$00			// $098F  [$1D8A9B]  8F 00 34	| ARAM
	CALL code_1364			// $0992  [$1D8A9E]  3F 64 13	| 
	LDY #$08			// $0995  [$1D8AA1]  8D 08	| 
	MUL				// $0997  [$1D8AA3]  CF		| 
	TAX				// $0998  [$1D8AA4]  5D		| 
	LDY #$0F			// $0999  [$1D8AA5]  8D 0F	| DSP REG
code_099B:				//				| 
	LDA data_185B+X			// $099B  [$1D8AA7]  F5 5B 18	| ARAM (ROM table)
	CALL code_135A			// $099E  [$1D8AAA]  3F 5A 13	| dsp write
	INX				// $09A1  [$1D8AAD]  3D		| 
	TYA				// $09A2  [$1D8AAE]  DD		| 
	CLRC				// $09A3  [$1D8AAF]  60		| 
	ADC #$10			// $09A4  [$1D8AB0]  88 10	| 
	TAY				// $09A6  [$1D8AB2]  FD		| 
	BPL code_099B			// $09A7  [$1D8AB3]  10 F2	| 
	CLR1 $2A.5			// $09A9  [$1D8AB5]  B2 2A	| ARAM
	LDX $26				// $09AB  [$1D8AB7]  F8 26	| ARAM
	JMP code_084C			// $09AD  [$1D8AB9]  5F 4C 08	| 


code_09B0:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	LDA $50+X			// $09B0  [$1D8ABC]  F4 50	| ARAM
	ORA #$04			// $09B2  [$1D8ABE]  08 04	| 
	STA $50+X			// $09B4  [$1D8AC0]  D4 50	| ARAM
	LDA $71				// $09B6  [$1D8AC2]  E4 71	| ARAM
	BEQ code_09C3			// $09B8  [$1D8AC4]  F0 09	| 
	STA $33=$6F			// $09BA  [$1D8AC6]  FA 6F 33	| ARAM
	STA $35=$70			// $09BD  [$1D8AC9]  FA 70 35	| ARAM
	STA $71=#$00			// $09C0  [$1D8ACC]  8F 00 71	| ARAM
code_09C3:				//				| 
	JMP code_084C			// $09C3  [$1D8ACF]  5F 4C 08	| 


code_09C6:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	LDA $50+X			// $09C6  [$1D8AD2]  F4 50	| ARAM
	AND #$FB			// $09C8  [$1D8AD4]  28 FB	| 
	STA $50+X			// $09CA  [$1D8AD6]  D4 50	| ARAM
	JMP code_084C			// $09CC  [$1D8AD8]  5F 4C 08	| 


code_09CF:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	CALL code_176C			// $09CF  [$1D8ADB]  3F 6C 17	| 
	JMP code_084C			// $09D2  [$1D8ADE]  5F 4C 08	| 


code_09D5:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	JMP code_084C			// $09D5  [$1D8AE1]  5F 4C 08	| 


code_09D8:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	LDA #$00			// $09D8  [$1D8AE4]  E8 00	| 
	STA $0461+X			// $09DA  [$1D8AE6]  D5 61 04	| ARAM
	STA $0400+X			// $09DD  [$1D8AE9]  D5 00 04	| ARAM
	JMP code_084C			// $09E0  [$1D8AEC]  5F 4C 08	| 


code_09E3:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	JMP code_084C			// $09E3  [$1D8AEF]  5F 4C 08	| 

code_09E6:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	JMP code_084C			// $09E6  [$1D8AF2]  5F 4C 08	| 

code_09E9:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	JMP code_084C			// $09E9  [$1D8AF5]  5F 4C 08	| 


code_09EC:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	CALL code_1364			// $09EC  [$1D8AF8]  3F 64 13	| 
	CALL code_09F5			// $09EF  [$1D8AFB]  3F F5 09	| 
	JMP code_084C			// $09F2  [$1D8AFE]  5F 4C 08	| 

code_09F5:				//------------------------------| 
	STA $03E1+X			// $09F5  [$1D8B01]  D5 E1 03	| ARAM
	AND #$1F			// $09F8  [$1D8B04]  28 1F	| 
	STA $03A1+X			// $09FA  [$1D8B06]  D5 A1 03	| ARAM
	LDA #$00			// $09FD  [$1D8B09]  E8 00	| 
	STA $03A0+X			// $09FF  [$1D8B0B]  D5 A0 03	| ARAM
	STA $0380+X			// $0A02  [$1D8B0E]  D5 80 03	| ARAM
	RET				// $0A05  [$1D8B11]  6F		| 


code_0A06:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	CALL code_1364			// $0A06  [$1D8B12]  3F 64 13	| 
	STA $02A0+X			// $0A09  [$1D8B15]  D5 A0 02	| ARAM
	JMP code_084C			// $0A0C  [$1D8B18]  5F 4C 08	| 


code_0A0F:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	CALL code_1364			// $0A0F  [$1D8B1B]  3F 64 13	| 
	STA $0280+X			// $0A12  [$1D8B1E]  D5 80 02	| ARAM
	STA $46				// $0A15  [$1D8B21]  C4 46	| ARAM
	CALL code_0A1D			// $0A17  [$1D8B23]  3F 1D 0A	| 
	JMP code_084C			// $0A1A  [$1D8B26]  5F 4C 08	| 

code_0A1D:				//------------------------------| 
	CALL code_126A			// $0A1D  [$1D8B29]  3F 6A 12	| 
	STA $06A1+X			// $0A20  [$1D8B2C]  D5 A1 06	| ARAM
	INY				// $0A23  [$1D8B2F]  FC		| 
	LDA $1E80+Y			// $A024  [$1D8B30]  F6 80 1E	| ARAM (ROM table?)
	STA $06A2+X			// $0A27  [$1D8B33]  D5 A2 06	| ARAM
	INY				// $0A2A  [$1D8B36]  FC		| 
	LDA $1E80+Y			// $0A2B  [$1D8B37]  F6 80 1E	| ARAM (ROM table?)
	STA $06C1+X			// $0A2E  [$1D8B3A]  D5 C1 06	| ARAM
	INY				// $0A31  [$1D8B3D]  FC		| 
	LDA $1E80+Y			// $0A32  [$1D8B3E]  F6 80 1E	| ARAM (ROM table?)
	STA $06C2+X			// $0A35  [$1D8B41]  D5 C2 06	| ARAM
	INY				// $0A38  [$1D8B44]  FC		| 
	LDA $1E80+Y			// $0A39  [$1D8B45]  F6 80 1E	| ARAM (ROM table?)
	STA $02C0+X			// $0A3C  [$1D8B48]  D5 C0 02	| ARAM
	INY				// $0A3F  [$1D8B4B]  FC		| 
	LDA $1E80+Y			// $0A40  [$1D8B4C]  F6 80 1E	| ARAM (ROM table?)
	STA $02C1+X			// $0A43  [$1D8B4F]  D5 C1 02	| ARAM
	LDA $50+X			// $0A46  [$1D8B52]  F4 50	| ARAM
	ORA #$20			// $0A48  [$1D8B54]  08 20	| 
	STA $50+X			// $0A4A  [$1D8B56]  D4 50	| ARAM
	RET				// $0A4C  [$1D8B58]  6F		| 


code_0A4D:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	CALL code_1364			// $0A4D  [$1D8B59]  3F 64 13	| 
	STA $0321+X			// $0A50  [$1D8B5C]  D5 21 03	| ARAM
	LDA #$00			// $0A53  [$1D8B5F]  E8 00	| 
	STA $0320+X			// $0A55  [$1D8B61]  D5 20 03	| ARAM
	JMP code_084C			// $0A58  [$1D8B64]  5F 4C 08	| 


code_0A5B:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	CALL code_1364			// $0A5B  [$1D8B67]  3F 64 13	| 
	PHA				// $0A5E  [$1D8B6A]  2D		| 
	CALL code_1364			// $0A5F  [$1D8B6B]  3F 64 13	| 
	PLY				// $0A62  [$1D8B6E]  EE		| 
	CALL code_135A			// $0A63  [$1D8B6F]  3F 5A 13	| dsp write
	JMP code_084C			// $0A66  [$1D8B72]  5F 4C 08	| 


code_0A69:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	CALL code_1364			// $0A69  [$1D8B75]  3F 64 13	| 
	STA $0380+X			// $0A6C  [$1D8B78]  D5 80 03	| ARAM
	PHA				// $0A6F  [$1D8B7B]  2D		| 
	CALL code_1364			// $0A70  [$1D8B7C]  3F 64 13	| 
	STA $03E0+X			// $0A73  [$1D8B7F]  D5 E0 03	| ARAM
	SETC				// $0A76  [$1D8B82]  80		| 
	SBC $03A1+X			// $0A77  [$1D8B83]  B5 A1 03	| ARAM
	PLX				// $0A7A  [$1D8B86]  CE		| 
	CALL code_1798			// $0A7B  [$1D8B87]  3F 98 17	| 
	STA $03C0+X			// $0A7E  [$1D8B8A]  D5 C0 03	| ARAM
	TYA				// $0A81  [$1D8B8D]  DD		| 
	STA $03C1+X			// $0A82  [$1D8B8E]  D5 C1 03	| ARAM
	JMP code_084C			// $0A85  [$1D8B91]  5F 4C 08	| 


code_0A88:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	CALL code_1364			// $0A88  [$1D8B94]  3F 64 13	| 
	STA $0301+X			// $0A8B  [$1D8B97]  D5 01 03	| ARAM
	PHA				// $0A8E  [$1D8B9A]  2D		| 
	CALL code_1364			// $0A8F  [$1D8B9B]  3F 64 13	| 
	STA $0360+X			// $0A92  [$1D8B9E]  D5 60 03	| ARAM
	SETC				// $0A95  [$1D8BA1]  80		| 
	SBC $0321+X			// $0A96  [$1D8BA2]  B5 21 03	| ARAM
	PLX				// $0A99  [$1D8BA5]  CE		| 
	CALL code_1798			// $0A9A  [$1D8BA6]  3F 98 17	| 
	STA $0340+X			// $0A9D  [$1D8BA9]  D5 40 03	| ARAM
	TYA				// $0AA0  [$1D8BAC]  DD		| 
	STA $0341+X			// $0AA1  [$1D8BAD]  D5 41 03	| ARAM
	JMP code_084C			// $0AA4  [$1D8BB0]  5F 4C 08	| 


code_0AA7:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	CALL code_1364			// $0AA7  [$1D8BB3]  3F 64 13	| 
	PHA				// $0AAA  [$1D8BB6]  2D		| 
	CALL code_1364			// $0AAB  [$1D8BB7]  3F 64 13	| 
	STA $05A2+X			// $0AAE  [$1D8BBA]  D5 A2 05	| ARAM
	PLA				// $0AB1  [$1D8BBD]  AE		| 
	STA $05A1+X			// $0AB2  [$1D8BBE]  D5 A1 05	| ARAM
	JMP code_084C			// $0AB5  [$1D8BC1]  5F 4C 08	| 

code_0AB8:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	LDA $0261+X			// $0AB8  [$1D8BC4]  F5 61 02	| ARAM
	BEQ code_0AA7			// $0ABB  [$1D8BC7]  F0 EA	| 
	CALL code_1364			// $0ABD  [$1D8BC9]  3F 64 13	| 
	CALL code_1364			// $0AC0  [$1D8BCC]  3F 64 13	| 
	JMP code_084C			// $0AC3  [$1D8BCF]  5F 4C 08	| 

code_0AC6:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	LDA $0261+X			// $0AC6  [$1D8BD2]  F5 61 02	| ARAM
	BNE code_0AA7			// $0AC9  [$1D8BD5]  D0 DC	| 
	CALL code_1364			// $0ACB  [$1D8BD7]  3F 64 13	| 
	CALL code_1364			// $0ACE  [$1D8BDA]  3F 64 13	| 
	JMP code_084C			// $0AD1  [$1D8BDD]  5F 4C 08	| 

code_0AD4:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	CALL code_1364			// $0AD4  [$1D8BE0]  3F 64 13	| 
	STA $0261+X			// $0AD7  [$1D8BE3]  D5 61 02	| ARAM
	JMP code_084C			// $0ADA  [$1D8BE6]  5F 4C 08	| 

code_0ADD:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	LDA $0261+X			// $0ADD  [$1D8BE9]  F5 61 02	| ARAM
	INC				// $0AE0  [$1D8BEC]  BC		| 
	STA $0261+X			// $0AE1  [$1D8BED]  D5 61 02	| ARAM
	JMP code_084C			// $0AE4  [$1D8BF0]  5F 4C 08	| 

code_0AE7:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	LDA $0261+X			// $0AE7  [$1D8BF3]  F5 61 02	| ARAM
	DEC				// $0AEA  [$1D8BF6]  9C		| 
	STA $0261+X			// $0AEB  [$1D8BF7]  D5 61 02	| ARAM
	JMP code_084C			// $0AEE  [$1D8BFA]  5F 4C 08	| 


code_0AF1:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	LDA $05A1+X			// $0AF1  [$1D8BFD]  F5 A1 05	| ARAM
	STA $05C1+X			// $0AF4  [$1D8C00]  D5 C1 05	| ARAM
	LDA $05A2+X			// $0AF7  [$1D8C03]  F5 A2 05	| ARAM
	STA $05C2+X			// $0AFA  [$1D8C06]  D5 C2 05	| ARAM
	JMP code_084C			// $0AFD  [$1D8C09]  5F 4C 08	| 


code_0B00:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	LDA #$01			// $0B00  [$1D8C0C]  E8 01	| 
	STA $02E0+X			// $0B02  [$1D8C0E]  D5 E0 02	| ARAM
	LDA $05A1+X			// $0B05  [$1D8C11]  F5 A1 05	| ARAM
	STA $05E1+X			// $0B08  [$1D8C14]  D5 E1 05	| ARAM
	LDA $05A2+X			// $0B0B  [$1D8C17]  F5 A2 05	| ARAM
	STA $05E2+X			// $0B0E  [$1D8C1A]  D5 E2 05	| ARAM
	JMP code_084C			// $0B11  [$1D8C1D]  5F 4C 08	| 


code_0B14:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	LDA $02E0+X			// $0B14  [$1D8C20]  F5 E0 02	| ARAM
	BNE code_0B25			// $0B17  [$1D8C23]  D0 0C	| 
	LDA $0601+X			// $0B19  [$1D8C25]  F5 01 06	| ARAM
	STA $05A1+X			// $0B1C  [$1D8C28]  D5 A1 05	| ARAM
	LDA $0602+X			// $0B1F  [$1D8C2B]  F5 02 06	| ARAM
	STA $05A2+X			// $0B22  [$1D8C2E]  D5 A2 05	| ARAM
code_0B25:				//				| 
	JMP code_084C			// $0B25  [$1D8C31]  5F 4C 08	| 


code_0B28:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	LDA $05A1+X			// $0B28  [$1D8C34]  F5 A1 05	| ARAM
	STA $0601+X			// $0B2B  [$1D8C37]  D5 01 06	| ARAM
	LDA $05A2+X			// $0B2E  [$1D8C3A]  F5 A2 05	| ARAM
	STA $0602+X			// $0B31  [$1D8C3D]  D5 02 06	| ARAM
	LDA $02E0+X			// $0B34  [$1D8C40]  F5 E0 02	| ARAM
	DEC				// $0B37  [$1D8C43]  9C		| 
	STA $02E0+X			// $0B38  [$1D8C44]  D5 E0 02	| ARAM
	LDA $05E1+X			// $0B3B  [$1D8C47]  F5 E1 05	| ARAM
	STA $05A1+X			// $0B3E  [$1D8C4A]  D5 A1 05	| ARAM
	LDA $05E2+X			// $0B41  [$1D8C4D]  F5 E2 05	| ARAM
	STA $05A2+X			// $0B44  [$1D8C50]  D5 A2 05	| ARAM
	JMP code_084C			// $0B47  [$1D8C53]  5F 4C 08	| 


code_0B4A:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	CALL code_1364			// $0B4A  [$1D8C56]  3F 64 13	| 
	PHA				// $0B4D  [$1D8C59]  2D		| 
	CALL code_1364			// $0B4E  [$1D8C5A]  3F 64 13	| 
	PHA				// $0B51  [$1D8C5D]  2D		| 
	LDA $05A1+X			// $0B52  [$1D8C5E]  F5 A1 05	| ARAM
	STA $0621+X			// $0B55  [$1D8C61]  D5 21 06	| ARAM
	LDA $05A2+X			// $0B58  [$1D8C64]  F5 A2 05	| ARAM
	STA $0622+X			// $0B5B  [$1D8C67]  D5 22 06	| ARAM
	PLA				// $0B5E  [$1D8C6A]  AE		| 
	STA $05A2+X			// $0B5F  [$1D8C6B]  D5 A2 05	| ARAM
	PLA				// $0B62  [$1D8C6E]  AE		| 
	STA $05A1+X			// $0B63  [$1D8C6F]  D5 A1 05	| ARAM
	JMP code_084C			// $0B66  [$1D8C72]  5F 4C 08	| 


code_0B69:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	LDA $0621+X			// $0B69  [$1D8C75]  F5 21 06	| ARAM
	STA $05A1+X			// $0B6C  [$1D8C78]  D5 A1 05	| ARAM
	LDA $0622+X			// $0B6F  [$1D8C7B]  F5 22 06	| ARAM
	STA $05A2+X			// $0B72  [$1D8C7E]  D5 A2 05	| ARAM
	JMP code_084C			// $0B75  [$1D8C81]  5F 4C 08	| 


code_0B78:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	CALL code_1364			// $0B78  [$1D8C84]  3F 64 13	| 
	LDX $28				// $0B7B  [$1D8C87]  F8 28	| ARAM
	STA $0209+X			// $0B7D  [$1D8C89]  D5 09 02	| ARAM
	LDA #$00			// $0B80  [$1D8C8C]  E8 00	| 
	STA $0208+X			// $0B82  [$1D8C8E]  D5 08 02	| ARAM
	LDX $26				// $0B85  [$1D8C91]  F8 26	| ARAM
	JMP code_084C			// $0B87  [$1D8C93]  5F 4C 08	| 


code_0B8A:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	CALL code_1364			// $0B8A  [$1D8C96]  3F 64 13	| 
	LDX $28				// $0B8D  [$1D8C99]  F8 28	| ARAM
	STA $020A+X			// $0B8F  [$1D8C9B]  D5 0A 02	| ARAM
	LDX $26				// $0B92  [$1D8C9E]  F8 26	| ARAM
	PHA				// $0B94  [$1D8CA0]  2D		| 
	CALL code_1364			// $0B95  [$1D8CA1]  3F 64 13	| 
	LDX $28				// $0B98  [$1D8CA4]  F8 28	| ARAM
	STA $020B+X			// $0B9A  [$1D8CA6]  D5 0B 02	| ARAM
	SETC				// $0B9D  [$1D8CA9]  80		| 
	SBC $0209+X			// $0B9E  [$1D8CAA]  B5 09 02	| ARAM
	PLX				// $0BA1  [$1D8CAD]  CE		| 
	CALL code_1798			// $0BA2  [$1D8CAE]  3F 98 17	| 
	LDX $28				// $0BA5  [$1D8CB1]  F8 28	| ARAM
	STA $020C+X			// $0BA7  [$1D8CB3]  D5 0C 02	| ARAM
	TYA				// $0BAA  [$1D8CB6]  DD		| 
	STA $020D+X			// $0BAB  [$1D8CB7]  D5 0D 02	| ARAM
	LDX $26				// $0BAE  [$1D8CBA]  F8 26	| 
	JMP code_084C			// $0BB0  [$1D8CBC]  5F 4C 08	| 


code_0BB3:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	LDA $4F+X			// $0BB3  [$1D8CBF]  F4 4F	| ARAM
	AND #$BF			// $0BB5  [$1D8CC1]  28 BF	| 
	STA $4F+X			// $0BB7  [$1D8CC3]  D4 4F	| ARAM
	JMP code_084C			// $0BB9  [$1D8CC5]  5F 4C 08	| 


code_0BBC:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	LDA $4F+X			// $0BBC  [$1D8CC8]  F4 4F	| ARAM
	ORA #$40			// $0BBE  [$1D8CCA]  08 40	| 
	STA $4F+X			// $0BC0  [$1D8CCC]  D4 4F	| ARAM
	JMP code_084C			// $0BC2  [$1D8CCE]  5F 4C 08	| 


code_0BC5:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	LDA $05C1+X			// $0BC5  [$1D8CD1]  F5 C1 05	| ARAM
	STA $05A1+X			// $0BC8  [$1D8CD4]  D5 A1 05	| ARAM
	LDA $05C2+X			// $0BCB  [$1D8CD7]  F5 C2 05	| ARAM
	STA $05A2+X			// $0BCE  [$1D8CDA]  D5 A2 05	| ARAM
	JMP code_084C			// $0BD1  [$1D8CDD]  5F 4C 08	| 


code_0BD4:				//------------------------------| 
	LDA #$00			// $0BD4  [$1D8CE0]  E8 00	| 
	STA $4F+X			// $0BD6  [$1D8CE2]  D4 4F	| ARAM
	STA $50+X			// $0BD8  [$1D8CE4]  D4 50	| ARAM
	LDA $0F				// $0BDA  [$1D8CE6]  E4 0F	| ARAM
	BNE code_0BEE			// $0BDC  [$1D8CE8]  D0 10	| 
	CLR1 $14.0			// $0BDE  [$1D8CEA]  12 14	| ARAM
	LDX $27				// $0BE0  [$1D8CEC]  F8 27	| ARAM
	LDA $4F+X			// $0BE2  [$1D8CEE]  F4 4F	| ARAM
	BPL code_0BF0			// $0BE4  [$1D8CF0]  10 0A	| 
	LDA $50+X			// $0BE6  [$1D8CF2]  F4 50	| ARAM
	ORA #$B8			// $0BE8  [$1D8CF4]  08 B8	| 
	STA $50+X			// $0BEA  [$1D8CF6]  D4 50	| ARAM
	BRA code_0BF0			// $0BEC  [$1D8CF8]  2F 02	| 
code_0BEE:				//				| 
	CLR1 $14.1			// $0BEE  [$1D8CFA]  32 14	| ARAM
code_0BF0:				//				| 
	ORA $31=$04			// $0BF0  [$1D8CFC]  09 04 31	| ARAM
	LDX $26				// $0BF3  [$1D8CFF]  F8 26	| ARAM
	RET				// $0BF5  [$1D8D01]  6F		| 


code_0BF6:				//------------------------------| 
	LDA $10				// $0BF6  [$1D8D02]  E4 10	| ARAM
	ASL				// $0BF8  [$1D8D04]  1C		| 
	ASL				// $0BF9  [$1D8D05]  1C		| 
	TAY				// $0BFA  [$1D8D06]  FD		| 
	LDA data_1D20+Y			// $0BFB  [$1D8D07]  F6 20 1D	| ARAM actually table from ROM [1D9DEC]
	PHY				// $0BFE  [$1D8D0A]  6D		| 
	STA $0280+X			// $0BFF  [$1D8D0B]  D5 80 02	| ARAM
	STA $46				// $0C02  [$1D8D0E]  C4 46	| ARAM
	CALL code_0A1D			// $0C04  [$1D8D10]  3F 1D 0A	| 
	PLY				// $0C07  [$1D8D13]  EE		| 
	LDA data_1D20+1+Y		// $0C08  [$1D8D14]  F6 21 1D	| ARAM actually table from ROM [1D9DEC]
	PHY				// $0C0B  [$1D8D17]  6D		| 
	CALL code_09F5			// $0C0C  [$1D8D18]  3F F5 09	| 
	PLY				// $0C0F  [$1D8D1B]  EE		| 
	LDA data_1D20+2+Y		// $0C10  [$1D8D1C]  F6 22 1D	| ARAM actually table from ROM [1D9DEC]
	BEQ code_0C1B			// $0C13  [$1D8D1F]  F0 06	| 
	LDA $50+X			// $0C15  [$1D8D21]  F4 50	| ARAM
	ORA #$04			// $0C17  [$1D8D23]  08 04	| 
	BRA code_0C1F			// $0C19  [$1D8D25]  2F 04	| 
code_0C1B:				//				| 
	LDA $50+X			// $0C1B  [$1D8D27]  F4 50	| ARAM
	AND #$FB			// $0C1D  [$1D8D29]  28 FB	| 
code_0C1F:				//				| 
	STA $50+X			// $0C1F  [$1D8D2B]  D4 50	| ARAM
	LDA data_1D20+3+Y		// $0C21  [$1D8D2D]  F6 23 1D	| ARAM actually table from ROM [1D9DEC]
	BRA code_0C28			// $0C24  [$1D8D30]  2F 02	| 

code_0C26:				//------------------------------| 
	LDA $10				// $0C26  [$1D8D32]  E4 10	| ARAM

code_0C28:				//				| 
	CLRC				// $0C28  [$1D8D34]  60		| 
	LDX $28				// $0C29  [$1D8D35]  F8 28	| ARAM
	ADC $020F+X			// $0C2B  [$1D8D37]  95 0F 02	| ARAM
	LDX $26				// $0C2E  [$1D8D3A]  F8 26	| ARAM
	CLRC				// $0C30  [$1D8D3C]  60		| 
	ADC $02A1+X			// $0C31  [$1D8D3D]  95 A1 02	| ARAM
	STA $0281+X			// $0C34  [$1D8D40]  D5 81 02	| ARAM
	STA $0421+X			// $0C37  [$1D8D43]  D5 21 04	| ARAM
	LDA $02A0+X			// $0C3A  [$1D8D46]  F5 A0 02	| ARAM
	STA $0420+X			// $0C3D  [$1D8D49]  D5 20 04	| ARAM
	LDA $0241+X			// $0C40  [$1D8D4C]  F5 41 02	| ARAM
	BNE code_0C5D			// $0C43  [$1D8D4F]  D0 18	| 
	LDA $0502+X			// $0C45  [$1D8D51]  F5 02 05	| ARAM
	LSR				// $0C48  [$1D8D54]  5C		| 
	LDA #$00			// $0C49  [$1D8D55]  E8 00	| 
	ROR				// $0C4B  [$1D8D57]  7C		| 
	STA $04A1+X			// $0C4C  [$1D8D58]  D5 A1 04	| ARAM
	LDA #$00			// $0C4F  [$1D8D5B]  E8 00	| 
	STA $04A2+X			// $0C51  [$1D8D5D]  D5 A2 04	| ARAM
	STA $0501+X			// $0C54  [$1D8D60]  D5 01 05	| ARAM
	STA $0541+X			// $0C57  [$1D8D63]  D5 41 05	| ARAM
	STA $0542+X			// $0C5A  [$1D8D66]  D5 42 05	| ARAM
code_0C5D:				//				| 
	LDX $28				// $0C5D  [$1D8D69]  F8 28	| ARAM
	LDA $020E+X			// $0C5F  [$1D8D6B]  F5 0E 02	| ARAM
	ORA $04				// $0C62  [$1D8D6E]  04 04	| ARAM
	STA $020E+X			// $0C64  [$1D8D70]  D5 0E 02	| ARAM
	LDX $26				// $0C67  [$1D8D73]  F8 26	| ARAM
	LDA $0461+X			// $0C69  [$1D8D75]  F5 61 04	| ARAM
	BEQ code_0C76			// $0C6C  [$1D8D78]  F0 08	| 
	STA $0400+X			// $0C6E  [$1D8D7A]  D5 00 04	| ARAM
	LDA $0460+X			// $0C71  [$1D8D7D]  F5 60 04	| ARAM
	BRA code_0C9A			// $0C74  [$1D8D80]  2F 24	| 
code_0C76:				//				| 
	LDA $0480+X			// $0C76  [$1D8D82]  F5 80 04	| ARAM
	BEQ code_0C9D			// $0C79  [$1D8D85]  F0 22	| 
	STA $0400+X			// $0C7B  [$1D8D87]  D5 00 04	| ARAM
	LDA $0481+X			// $0C7E  [$1D8D8A]  F5 81 04	| ARAM
	STA $0401+X			// $0C81  [$1D8D8D]  D5 01 04	| ARAM
	LDA $0481+X			// $0C84  [$1D8D90]  F5 81 04	| ARAM
	BNE code_0C93			// $0C87  [$1D8D93]  D0 0A	| 
	LDA $0421+X			// $0C89  [$1D8D95]  F5 21 04	| ARAM
	SETC				// $0C8C  [$1D8D98]  80		| 
	SBC $0482+X			// $0C8D  [$1D8D99]  B5 82 04	| ARAM
	STA $0421+X			// $0C90  [$1D8D9C]  D5 21 04	| ARAM
code_0C93:				//				| 
	LDA $0482+X			// $0C93  [$1D8D9F]  F5 82 04	| 
	CLRC				// $0C96  [$1D8DA2]  60		| 
	ADC $0421+X			// $0C97  [$1D8DA3]  95 21 04	| ARAM
code_0C9A:				//				| 
	CALL code_1752			// $0C9A  [$1D8DA6]  3F 52 17	| 
code_0C9D:				//				| 
	CALL code_178D			// $0C9D  [$1D8DA9]  3F 8D 17	| 
	CALL code_0CA6			// $0CA0  [$1D8DAC]  3F A6 0C	| 
	JMP code_0D41			// $0CA3  [$1D8DAF]  5F 41 0D	| 


code_0CA6:				//------------------------------| 
	LDY #$00			// $0CA6  [$1D8DB2]  8D 00	| 
	LDA $22				// $0CA8  [$1D8DB4]  E4 22	| ARAM
	SETC				// $0CAA  [$1D8DB6]  80		| 
	SBC #$28			// $0CAB  [$1D8DB7]  A8 28	| 
	BCS code_0CB8			// $0CAD  [$1D8DB9]  B0 09	| 
	LDA $22				// $0CAF  [$1D8DBB]  E4 22	| ARAM
	SETC				// $0CB1  [$1D8DBD]  80		| 
	SBC #$07			// $0CB2  [$1D8DBE]  A8 07	| 
	BCS code_0CBC			// $0CB4  [$1D8DC0]  B0 06	| 
	DEY				// $0CB6  [$1D8DC2]  DC		| 
	ASL				// $0CB7  [$1D8DC3]  1C		| 
code_0CB8:				//				| 
	ADDW $21			// $0CB8  [$1D8DC4]  7A 21	| ARAM
	STAW $21			// $0CBA  [$1D8DC6]  DA 21	| ARAM
code_0CBC:				//				| 
	LDA $22				// $0CBC  [$1D8DC8]  E4 22	| ARAM
	ASL				// $0CBE  [$1D8DCA]  1C		| 
	LDY #$00			// $0CBF  [$1D8DCB]  8D 00	| 
	LDX #$18			// $0CC1  [$1D8DCD]  CD 18	| 
	DIV				// $0CC3  [$1D8DCF]  9E		| 
	TAX				// $0CC4  [$1D8DD0]  5D		| 
	LDA data_1841+1+Y		// $0CC5  [$1D8DD1]  F6 42 18	| ARAM prolly table
	STA $49				// $0CC8  [$1D8DD4]  C4 49	| ARAM
	LDA data_1841+Y			// $0CCA  [$1D8DD6]  F6 41 18	| ARAM prolly table
	STA $48				// $0CCD  [$1D8DD9]  C4 48	| ARAM
	LDA data_1841+3+Y		// $0CCF  [$1D8DDB]  F6 44 18	| ARAM prolly table
	PHA				// $0CD2  [$1D8DDE]  2D		| 
	LDA data_1841+2+Y		// $0CD3  [$1D8DDF]  F6 43 18	| ARAM prolly table
	PLY				// $0CD6  [$1D8DE2]  EE		| 
	SUBW $48			// $0CD7  [$1D8DE3]  9A 48	| ARAM
	LDY $21				// $0CD9  [$1D8DE5]  EB 21	| ARAM
	MUL				// $0CDB  [$1D8DE7]  CF		| 
	TYA				// $0CDC  [$1D8DE8]  DD		| 
	LDY #$00			// $0CDD  [$1D8DE9]  8D 00	| 
	ADDW $48			// $0CDF  [$1D8DEB]  7A 48	| ARAM
	STY $49				// $0CE1  [$1D8DED]  CB 49	| ARAM
	ASL				// $0CE3  [$1D8DEF]  1C		| 
	ROL $49				// $0CE4  [$1D8DF0]  2B 49	| ARAM
	STA $48				// $0CE6  [$1D8DF2]  C4 48	| ARAM
	BRA code_0CEE			// $0CE8  [$1D8DF4]  2F 04	| 

code_0CEA:				//				| 
	LSR $49				// $0CEA  [$1D8DF6]  4B 49	| ARAM
	ROR				// $0CEC  [$1D8DF8]  7C		| 
	INX				// $0CED  [$1D8DF9]  3D		| 
code_0CEE:				//				| 
	CPX #$07			// $0CEE  [$1D8DFA]  C8 07	| 
	BNE code_0CEA			// $0CF0  [$1D8DFC]  D0 F8	| 
	STA $48				// $0CF2  [$1D8DFE]  C4 48	| ARAM
	LDX $26				// $0CF4  [$1D8E00]  F8 26	| ARAM
	LDA $02C1+X			// $0CF6  [$1D8E02]  F5 C1 02	| ARAM
	LDY $49				// $0CF9  [$1D8E05]  EB 49	| ARAM
	MUL				// $0CFB  [$1D8E07]  CF		| 
	STAW $4A			// $0CFC  [$1D8E08]  DA 4A	| ARAM
	LDA $02C1+X			// $0CFE  [$1D8E0A]  F5 C1 02	| ARAM
	LDY $48				// $0D01  [$1D8E0D]  EB 48	| ARAM
	MUL				// $0D03  [$1D8E0F]  CF		| 
	PHY				// $0D04  [$1D8E10]  6D		| 
	LDA $02C0+X			// $0D05  [$1D8E11]  F5 C0 02	| ARAM
	LDY $48				// $0D08  [$1D8E14]  EB 48	| ARAM
	MUL				// $0D0A  [$1D8E16]  CF		| 
	ADDW $4A			// $0D0B  [$1D8E17]  7A 4A	| ARAM
	STAW $4A			// $0D0D  [$1D8E19]  DA 4A	| ARAM
	LDA $02C0+X			// $0D0F  [$1D8E1B]  F5 C0 02	| ARAM
	LDY $49				// $0D12  [$1D8E1E]  EB 49	| ARAM
	MUL				// $0D14  [$1D8E20]  CF		| 
	TAY				// $0D15  [$1D8E21]  FD		| 
	PLA				// $0D16  [$1D8E22]  AE		| 
	ADDW $4A			// $0D17  [$1D8E23]  7A 4A	| ARAM
	STAW $4A			// $0D19  [$1D8E25]  DA 4A	| ARAM
	STA $0681+X			// $0D1B  [$1D8E27]  D5 81 06	| ARAM
	TYA				// $0D1E  [$1D8E2A]  DD		| 
	STA $0682+X			// $0D1F  [$1D8E2B]  D5 82 06	| ARAM
	LDA $50+X			// $0D22  [$1D8E2E]  F4 50	| ARAM
	ORA #$08			// $0D24  [$1D8E30]  08 08	| 
	STA $50+X			// $0D26  [$1D8E32]  D4 50	| ARAM
	RET				// $0D28  [$1D8E34]  6F		| 


code_0D29:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	CALL code_1364			// $0D29  [$1D8E35]  3F 64 13	| 
	STA $0240+X			// $0D2C  [$1D8E38]  D5 40 02	| ARAM
	LDA #$00			// $0D2F  [$1D8E3B]  E8 00	| 
	STA $0241+X			// $0D31  [$1D8E3D]  D5 41 02	| ARAM
	STA $0300+X			// $0D34  [$1D8E40]  D5 00 03	| ARAM
	CALL code_1364			// $0D37  [$1D8E43]  3F 64 13	| 
	LDA $50+X			// $0D3A  [$1D8E46]  F4 50	| ARAM
	ORA #$40			// $0D3C  [$1D8E48]  08 40	| 
	STA $50+X			// $0D3E  [$1D8E4A]  D4 50	| ARAM
	RET				// $0D40  [$1D8E4C]  6F		| 


code_0D41:				//------------------------------| 
	LDA $0241+X			// $0D41  [$1D8E4D]  F5 41 02	| ARAM
	BNE code_0D4C			// $0D44  [$1D8E50]  D0 06	| 
	LDA $50+X			// $0D46  [$1D8E52]  F4 50	| ARAM
	ORA #$80			// $0D48  [$1D8E54]  08 80	| 
	STA $50+X			// $0D4A  [$1D8E56]  D4 50	| ARAM
code_0D4C:				//				| 
	CALL code_1364			// $0D4C  [$1D8E58]  3F 64 13	| 
	STA $46				// $0D4F  [$1D8E5B]  C4 46	| ARAM
	STA $0240+X			// $0D51  [$1D8E5D]  D5 40 02	| ARAM
	CALL code_1364			// $0D54  [$1D8E60]  3F 64 13	| 
	AND #$F0			// $0D57  [$1D8E63]  28 F0	| 
	XCN				// $0D59  [$1D8E65]  9F		| 
	TAY				// $0D5A  [$1D8E66]  FD		| 
	LDA data_187B+Y			// $0D5B  [$1D8E67]  F6 7B 18	| ARAM (table?)
	INC				// $0D5E  [$1D8E6A]  BC		| 
	LDY $46				// $0D5F  [$1D8E6B]  EB 46	| ARAM
	MUL				// $0D61  [$1D8E6D]  CF		| 
	LDX #$80			// $0D62  [$1D8E6E]  CD 80	| 
	DIV				// $0D64  [$1D8E70]  9E		| 
	LDX $26				// $0D65  [$1D8E71]  F8 26	| ARAM
	STA $0241+X			// $0D67  [$1D8E73]  D5 41 02	| ARAM
	LDA $10				// $0D6A  [$1D8E76]  E4 10	| ARAM
	AND #$0F			// $0D6C  [$1D8E78]  28 0F	| 
	TAY				// $0D6E  [$1D8E7A]  FD		| 
	LDA data_18A0+Y			// $0D6F  [$1D8E7B]  F6 A0 18	| ARAM (table?)
	STA $0300+X			// $0D72  [$1D8E7E]  D5 00 03	| ARAM
	RET				// $0D75  [$1D8E81]  6F		| 


code_0D76:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	CALL code_1364			// $0D76  [$1D8E82]  3F 64 13	| 
	STA $02A1+X			// $0D79  [$1D8E85]  D5 A1 02	| ARAM
	JMP code_084C			// $0D7C  [$1D8E88]  5F 4C 08	| 


code_0D7F:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	CALL code_1364			// $0D7F  [$1D8E8B]  3F 64 13	| 
	STA $04E1+X			// $0D82  [$1D8E8E]  D5 E1 04	| ARAM
	CALL code_1364			// $0D85  [$1D8E91]  3F 64 13	| 
	STA $04C2+X			// $0D88  [$1D8E94]  D5 C2 04	| ARAM
	CALL code_1364			// $0D8B  [$1D8E97]  3F 64 13	| 
	BRA code_0D92			// $0D8E  [$1D8E9A]  2F 02	| 
code_0D90:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	LDA #$00			// $0D90  [$1D8E9C]  E8 00	| 
code_0D92:				//				| 
	STA $04C1+X			// $0D92  [$1D8E9E]  D5 C1 04	| ARAM
	STA $0522+X			// $0D95  [$1D8EA1]  D5 22 05	| ARAM
	LDA #$00			// $0D98  [$1D8EA4]  E8 00	| 
	STA $0502+X			// $0D9A  [$1D8EA6]  D5 02 05	| ARAM
	JMP code_084C			// $0D9D  [$1D8EA9]  5F 4C 08	| 


code_0DA0:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	CALL code_1364			// $0DA0  [$1D8EAC]  3F 64 13	| 
	STA $0502+X			// $0DA3  [$1D8EAF]  D5 02 05	| ARAM
	PHA				// $0DA6  [$1D8EB2]  2D		| 
	LDY #$00			// $0DA7  [$1D8EB3]  8D 00	| 
	LDA $04C1+X			// $0DA9  [$1D8EB5]  F5 C1 04	| ARAM
	PLX				// $0DAC  [$1D8EB8]  CE		| 
	DIV				// $0DAD  [$1D8EB9]  9E		| 
	LDX $26				// $0DAE  [$1D8EBA]  F8 26	| ARAM
	STA $0521+X			// $0DB0  [$1D8EBC]  D5 21 05	| ARAM
	JMP code_084C			// $0DB3  [$1D8EBF]  5F 4C 08	| 


code_0DB6:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	LDA $0641+X			// $0DB6  [$1D8EC2]  F5 41 06	| ARAM
	STA $05A1+X			// $0DB9  [$1D8EC5]  D5 A1 05	| ARAM
	LDA $0642+X			// $0DBC  [$1D8EC8]  F5 42 06	| ARAM
	STA $05A2+X			// $0DBF  [$1D8ECB]  D5 A2 05	| ARAM
	LDA $4F+X			// $0DC2  [$1D8ECE]  F4 4F	| ARAM
	AND #$DF			// $0DC4  [$1D8ED0]  28 DF	| 
	STA $4F+X			// $0DC6  [$1D8ED2]  D4 4F	| 
	JMP code_084C			// $0DC8  [$1D8ED4]  5F 4C 08	| 


code_0DCB:				//------------------------------| 
	LDA $05A1+X			// $0DCB  [$1D8ED7]  F5 A1 05	| ARAM
	STA $0641+X			// $0DCE  [$1D8EDA]  D5 41 06	| ARAM
	LDA $05A2+X			// $0DD1  [$1D8EDD]  F5 A2 05	| ARAM
	STA $0642+X			// $0DD4  [$1D8EE0]  D5 42 06	| ARAM
	LDX $28				// $0DD7  [$1D8EE3]  F8 28	| ARAM
	LDA $0222+X			// $0DD9  [$1D8EE5]  F5 22 02	| ARAM
	STA $48				// $0DDC  [$1D8EE8]  C4 48	| ARAM
	LDA $0223+X			// $0DDE  [$1D8EEA]  F5 23 02	| ARAM
	STA $49				// $0DE1  [$1D8EED]  C4 49	| ARAM
	LDX $26				// $0DE3  [$1D8EEF]  F8 26	| ARAM
	LDA $10				// $0DE5  [$1D8EF1]  E4 10	| ARAM
	ASL				// $0DE7  [$1D8EF3]  1C		| 
	TAY				// $0DE8  [$1D8EF4]  FD		| 
	LDA ($48)+Y			// $0DE9  [$1D8EF5]  F7 48	| INDIRECT ARAM
	INY				// $0DEB  [$1D8EF7]  FC		| 
	STA $05A1+X			// $0DEC  [$1D8EF8]  D5 A1 05	| ARAM
	LDA ($48)+Y			// $0DEF  [$1D8EFB]  F7 48	| INDIRECT ARAM
	STA $05A2+X			// $0DF1  [$1D8EFD]  D5 A2 05	| ARAM
	LDA $4F+X			// $0DF4  [$1D8F00]  F4 4F	| ARAM
	ORA #$20			// $0DF6  [$1D8F02]  08 20	| 
	STA $4F+X			// $0DF8  [$1D8F04]  D4 4F	| ARAM
	JMP code_084C			// $0DFA  [$1D8F06]  5F 4C 08	| 


code_0DFD:				//------------------------------| might be main port polling routine
	LDX $F4				// $0DFD  [$1D8F09]  F8 F4	| 
	STX $1D				// $0DFF  [$1D8F0B]  D8 1D	| ARAM
	BEQ code_0E34			// $0E01  [$1D8F0D]  F0 31	| 
	LDA $F5				// $0E03  [$1D8F0F]  E4 F5	| 
	STA $1E				// $0E05  [$1D8F11]  C4 1E	| ARAM
	CPX #$01			// $0E07  [$1D8F13]  C8 01	| 
	BNE code_0E10			// $0E09  [$1D8F15]  D0 05	| 
	CALL code_0E3D			// $0E0B  [$1D8F17]  3F 3D 0E	| 
	BRA code_0E34			// $0E0E  [$1D8F1A]  2F 24	| 
code_0E10:				//				| 
	CPX #$02			// $0E10  [$1D8F1C]  C8 02	| 
	BNE code_0E1C			// $0E12  [$1D8F1E]  D0 08	| 
	CALL code_0F74			// $0E14  [$1D8F20]  3F 74 0F	| 
	CALL code_0EC1			// $0E17  [$1D8F23]  3F C1 0E	| 
	BRA code_0E34			// $0E1A  [$1D8F26]  2F 18	| 
code_0E1C:				//				| 
	CPX #$03			// $0E1C  [$1D8F28]  C8 03	| 
	BNE code_0E2D			// $0E1E  [$1D8F2A]  D0 0D	| 
	CALL code_0F74			// $0E20  [$1D8F2C]  3F 74 0F	| 
	PHX				// $0E23  [$1D8F2F]  4D		| 
	CALL code_1281			// $0E24  [$1D8F30]  3F 81 12	| 
	PLX				// $0E27  [$1D8F33]  CE		| 
	CALL code_0FD3			// $0E28  [$1D8F34]  3F D3 0F	| 
	BRA code_0E34			// $0E2B  [$1D8F37]  2F 07	| 
code_0E2D:				//				| 
	CPX #$04			// $0E2D  [$1D8F39]  C8 04	| 
	BNE code_0E34			// $0E2F  [$1D8F3B]  D0 03	| 
	CALL code_0EDC			// $0E31  [$1D8F3D]  3F DC 0E	| 
code_0E34:				//				| 
	LDA $14				// $0E34  [$1D8F40]  E4 14	| ARAM
	STA $F7				// $0E36  [$1D8F42]  C4 F7	| 
	LDA $1D				// $0E38  [$1D8F44]  E4 1D	| ARAM
	STA $F4				// $0E3A  [$1D8F46]  C4 F4	| 
	RET				// $0E3C  [$1D8F48]  6F		| 

code_0E3D:				//------------------------------| 
	CALL code_1394			// $0E3D  [$1D8F49]  3F 94 13	| 
	CALL code_1324			// $0E40  [$1D8F4C]  3F 24 13	| 
code_0E43:				//				| 
	LDA $4F+X			// $0E43  [$1D8F4F]  F4 4F	| ARAM
	BPL code_0E4A			// $0E45  [$1D8F51]  10 03	| 
	CALL code_0BD4			// $0E47  [$1D8F53]  3F D4 0B	| 
code_0E4A:				//				| 
	CALL code_1336			// $0E4A  [$1D8F56]  3F 36 13	| 
	CMP $02=#$08			// $0E4D  [$1D8F59]  78 08 02	| ARAM
	BNE code_0E43			// $0E50  [$1D8F5C]  D0 F1	| 
	LDA #$01			// $0E52  [$1D8F5E]  E8 01	| 
	STA $0D				// $0E54  [$1D8F60]  C4 0D	| ARAM
	SET1 $14.0			// $0E56  [$1D8F62]  02 14	| ARAM
	CALL code_1281			// $0E58  [$1D8F64]  3F 81 12	| 
	LDA $1E				// $0E5B  [$1D8F67]  E4 1E	| ARAM
	DEC				// $0E5D  [$1D8F69]  9C		| 
	ASL				// $0E5E  [$1D8F6A]  1C		| 
	TAX				// $0E5F  [$1D8F6B]  5D		| 
	LDA $3100+X			// $0E60  [$1D8F6C]  F5 00 31	| ARAM
	STA $0B				// $0E63  [$1D8F6F]  C4 0B	| ARAM
	LDA $3101+X			// $0E65  [$1D8F71]  F5 01 31	| ARAM
	STA $0C				// $0E68  [$1D8F74]  C4 0C	| ARAM
code_0E6A:				//------------------------------| 
	LDX $28				// $0E6A  [$1D8F76]  F8 28	| ARAM
	LDY #$00			// $0E6C  [$1D8F78]  8D 00	| 
	LDA ($0B)+Y			// $0E6E  [$1D8F7A]  F7 0B	| INDIRECT ARAM
	INCW $0B			// $0E70  [$1D8F7C]  3A 0B	| 
	STA $0202+X			// $0E72  [$1D8F7E]  D5 02 02	| ARAM
	LDA #$00			// $0E75  [$1D8F81]  E8 00	| 
	STA $0201+X			// $0E77  [$1D8F83]  D5 01 02	| ARAM
	CALL code_1324			// $0E7A  [$1D8F86]  3F 24 13	| 
code_0E7D:				//				| 
	LDY #$00			// $0E7D  [$1D8F89]  8D 00	| 
	LDA ($0B)+Y			// $0E7F  [$1D8F8B]  F7 0B	| INDIRECT ARAM
	INCW $0B			// $0E81  [$1D8F8D]  3A 0B	| ARAM
	CMP #$00			// $0E83  [$1D8F8F]  68 00	| 
	BEQ code_0E92			// $0E85  [$1D8F91]  F0 0B	| 
	LDA $4F+X			// $0E87  [$1D8F93]  F4 4F	| ARAM
	ORA #$80			// $0E89  [$1D8F95]  08 80	| 
	STA $4F+X			// $0E8B  [$1D8F97]  D4 4F	| ARAM
	ORA $31=$04			// $0E8D  [$1D8F99]  09 04 31	| ARAM
	BRA code_0E98			// $0E90  [$1D8F9C]  2F 06	| 
code_0E92:				//				| 
	LDA $4F+X			// $0E92  [$1D8F9E]  F4 4F	| ARAM
	AND #$7F			// $0E94  [$1D8FA0]  28 7F	| 
	STA $4F+X			// $0E96  [$1D8FA2]  D4 4F	| ARAM
code_0E98:				//				| 
	CALL code_1336			// $0E98  [$1D8FA4]  3F 36 13	| 
	CMP $02=#$08			// $0E9B  [$1D8FA7]  78 08 02	| ARAM
	BNE code_0E7D			// $0E9E  [$1D8FAA]  D0 DD	| 
	CALL code_1324			// $0EA0  [$1D8FAC]  3F 24 13	| 
code_0EA3:				//				| 
	LDY #$00			// $0EA3  [$1D8FAF]  8D 00	| 
	LDA ($0B)+Y			// $0EA5  [$1D8FB1]  F7 0B	| INDIRECT ARAM
	INCW $0B			// $0EA7  [$1D8FB3]  3A 0B	| ARAM
	STA $05A1+X			// $0EA9  [$1D8FB5]  D5 A1 05	| ARAM
	LDA ($0B)+Y			// $0EAC  [$1D8FB8]  F7 0B	| INDIRECT ARAM
	INCW $0B			// $0EAE  [$1D8FBA]  3A 0B	| ARAM
	STA $05A2+X			// $0EB0  [$1D8FBC]  D5 A2 05	| ARAM
	LDA #$01			// $0EB3  [$1D8FBF]  E8 01	| 
	STA $0240+X			// $0EB5  [$1D8FC1]  D5 40 02	| ARAM
	CALL code_1336			// $0EB8  [$1D8FC4]  3F 36 13	| 
	CMP $02=#$08			// $0EBB  [$1D8FC7]  78 08 02	| ARAM
	BNE code_0EA3			// $0EBE  [$1D8FCA]  D0 E3	| 
	RET				// $0EC0  [$1D8FCC]  6F		| 


code_0EC1:				//------------------------------| 
	LDA #$01			// $0EC1  [$1D8FCD]  E8 01	| 
	STA $0E				// $0EC3  [$1D8FCF]  C4 0E	| ARAM
	CLR1 $14.2			// $0EC5  [$1D8FD1]  52 14	| ARAM
	SET1 $14.1			// $0EC7  [$1D8FD3]  22 14	| ARAM
	PHX				// $0EC9  [$1D8FD5]  4D		| 
	CALL code_12A0			// $0ECA  [$1D8FD6]  3F A0 12	| 
	PLX				// $0ECD  [$1D8FD9]  CE		| 
	CALL code_0FD3			// $0ECE  [$1D8FDA]  3F D3 0F	| 
	LDA #$00			// $0ED1  [$1D8FDD]  E8 00	| 
	STA $0B				// $0ED3  [$1D8FDF]  C4 0B	| ARAM
	LDA #$20			// $0ED5  [$1D8FE1]  E8 20	| ARAM
	STA $0C				// $0ED7  [$1D8FE3]  C4 0C	| ARAM
	JMP code_0E6A			// $0ED9  [$1D8FE5]  5F 6A 0E	| 


code_0EDC:				//------------------------------| 
	LDA $1E				// $0EDC  [$1D8FE8]  E4 1E	| ARAM
	DEC				// $0EDE  [$1D8FEA]  9C		| 
	ASL				// $0EDF  [$1D8FEB]  1C		| 
	TAX				// $0EE0  [$1D8FEC]  5D		| 
	JMP (ptrs_0EE4+X)		// $0EE1  [$1D8FED]  1F E4 0E	| ARAM

ptrs_0EE4:				//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^| 
	dw code_0F00			// $0EE4  [$1D8FF0]  00 0F	| 
	dw code_0EFC			// $0EE6  [$1D8FF2]  FC 0E	| 
	dw code_0EF8			// $0EE8  [$1D8FF4]  F8 0E	| 
	dw code_0F1D			// $0EEA  [$1D8FF6]  1D 0F	| 
	dw code_0F2B			// $0EEC  [$1D8FF8]  2B 0F	| 
	dw code_0F35			// $0EEE  [$1D8FFA]  35 0F	| 
	dw code_0F54			// $0EF0  [$1D8FFC]  54 0F	| 
	dw code_0F62			// $0EF2  [$1D8FFE]  62 0F	| 
	dw code_0F6C			// $0EF4  [$1D9000]  6C 0F	| 
	dw code_0F70			// $0EF6  [$1D9002]  70 0F	| 

code_0EF8:				//				| 
	LDA #$7F			// $0EF8  [$1D9004]  E8 7F	| 
	BRA code_0F02			// $0EFA  [$1D9006]  2F 06	| 
code_0EFC:				//				| 
	LDA #$40			// $0EFC  [$1D9008]  E8 40	| 
	BRA code_0F02			// $0EFE  [$1D900A]  2F 02	| 
code_0F00:				//				| 
	LDA #$10			// $0F00  [$1D900C]  E8 10	| 
code_0F02:				//				| 
	STA $021A			// $0F02  [$1D900E]  C5 1A 02	| ARAM
	PHA				// $0F05  [$1D9011]  2D		| 
	LDA #$00			// $0F06  [$1D9012]  E8 00	| 
code_0F08:				//				| 
	STA $021B			// $0F08  [$1D9014]  C5 1B 02	| ARAM
	SETC				// $0F0B  [$1D9017]  80		| 
	SBC $0219			// $0F0C  [$1D9018]  A5 19 02	| ARAM
	PLX				// $0F0F  [$1D901B]  CE		| 
	CALL code_1798			// $0F10  [$1D901C]  3F 98 17	| 
	STA $021C			// $0F13  [$1D901F]  C5 1C 02	| ARAM
	TYA				// $0F16  [$1D9022]  DD		| 
	STA $021D			// $0F17  [$1D9023]  C5 1D 02	| ARAM
	SET1 $14.2			// $0F1A  [$1D9026]  42 14	| ARAM
	RET				// $0F1C  [$1D9028]  6F		| 

code_0F1D:				//				| 
	LDA #$05			// $0F1D  [$1D9029]  E8 05	| 
	STA $021A			// $0F1F  [$1D902B]  C5 1A 02	| ARAM
	PHA				// $0F22  [$1D902E]  2D		| 
	LDA $0219			// $0F23  [$1D902F]  E5 19 02	| ARAM
	STA $1F				// $0F26  [$1D9032]  C4 1F	| ARAM
	LSR				// $0F28  [$1D9034]  5C		| 
	BRA code_0F08			// $0F29  [$1D9035]  2F DD	| 

code_0F2B:				//				| 
	LDA #$05			// $0F2B  [$1D9037]  E8 05	| 
	STA $021A			// $0F2D  [$1D9039]  C5 1A 02	| ARAM
	PHA				// $0F30  [$1D903C]  2D		| 
	LDA $1F				// $0F31  [$1D903D]  E4 1F	| ARAM
	BRA code_0F08			// $0F33  [$1D903F]  2F D3	| 

code_0F35:				//				| 
	LDA #$10			// $0F35  [$1D9041]  E8 10	| 
	STA $0214			// $0F37  [$1D9043]  C5 14 02	| ARAM
	PHA				// $0F3A  [$1D9046]  2D		| 
	LDA $0212			// $0F3B  [$1D9047]  E5 12 02	| ARAM
	STA $20				// $0F3E  [$1D904A]  C4 20	| ARAM
	ASL				// $0F40  [$1D904C]  1C		| 
code_0F41:				//				| 
	STA $0215			// $0F41  [$1D904D]  C5 15 02	| ARAM
	SETC				// $0F44  [$1D9050]  80		| 
	SBC $0212			// $0F45  [$1D9051]  A5 12 02	| ARAM
	PLX				// $0F48  [$1D9054]  CE		| 
	CALL code_1798			// $0F49  [$1D9055]  3F 98 17	| 
	STA $0216			// $0F4C  [$1D9058]  C5 16 02	| ARAM
	TYA				// $0F4F  [$1D905B]  DD		| 
	STA $0217			// $0F50  [$1D905C]  C5 17 02	| ARAM
	RET				// $0F53  [$1D905F]  6F		| 

code_0F54:				//				| 
	LDA #$10			// $0F54  [$1D9060]  E8 10	| 
	STA $0214			// $0F56  [$1D9062]  C5 14 02	| ARAM
	PHA				// $0F59  [$1D9065]  2D		| 
	LDA $0212			// $0F5A  [$1D9066]  E5 12 02	| ARAM
	STA $20				// $0F5D  [$1D9069]  C4 20	| ARAM
	LSR				// $0F5F  [$1D906B]  5C		| 
	BRA code_0F41			// $0F60  [$1D906C]  2F DF	| 

code_0F62:				//				| 
	LDA #$10			// $0F62  [$1D906E]  E8 10	| 
	STA $0214			// $0F64  [$1D9070]  C5 14 02	| ARAM
	PHA				// $0F67  [$1D9073]  2D		| 
	LDA $20				// $0F68  [$1D9074]  E4 20	| ARAM
	BRA code_0F41			// $0F6A  [$1D9076]  2F D5	| 

code_0F6C:				//				| 
	STA $29=#$00			// $0F6C  [$1D9078]  8F 00 29	| ARAM
	RET				// $0F6F  [$1D907B]  6F		| 

code_0F70:				//				| 
	STA $29=#$01			// $0F70  [$1D907C]  8F 01 29	| 
	RET				// $0F73  [$1D907F]  6F		| 


code_0F74:				//------------------------------| 
	PHX				// $0F74  [$1D9080]  4D		| 
	CALL code_1394			// $0F75  [$1D9081]  3F 94 13	| 
	LDY #$02			// $0F78  [$1D9084]  8D 02	| 
code_0F7A:				//				| 
	PHY				// $0F7A  [$1D9086]  6D		| 
	CALL code_1324			// $0F7B  [$1D9087]  3F 24 13	| 
code_0F7E:				//				| 
	LDA #$00			// $0F7E  [$1D908A]  E8 00	| 
	STA $4F+X			// $0F80  [$1D908C]  D4 4F	| ARAM
	STA $50+X			// $0F82  [$1D908E]  D4 50	| ARAM
	STA $14				// $0F84  [$1D9090]  C4 14	| ARAM
	CALL code_1336			// $0F86  [$1D9092]  3F 36 13	| 
	CMP $02=#$08			// $0F89  [$1D9095]  78 08 02	| ARAM
	BNE code_0F7E			// $0F8C  [$1D9098]  D0 F0	| 
	CALL code_13A2			// $0F8E  [$1D909A]  3F A2 13	| 
	PLY				// $0F91  [$1D909D]  EE		| 
	DEY				// $0F92  [$1D909E]  DC		| 
	BNE code_0F7A			// $0F93  [$1D909F]  D0 E5	| 
	LDA #$00			// $0F95  [$1D90A1]  E8 00	| 
	STA $2C				// $0F97  [$1D90A3]  C4 2C	| ARAM
	STA $43				// $0F99  [$1D90A5]  C4 43	| ARAM
	STA $2B				// $0F9B  [$1D90A7]  C4 2B	| ARAM
	LDA #$FF			// $0F9D  [$1D90A9]  E8 FF	| key off all channels
	LDY #$5C			// $0F9F  [$1D90AB]  8D 5C	| DSP REG
	CALL code_135A			// $0FA1  [$1D90AD]  3F 5A 13	| 
	LDA #$00			// $0FA4  [$1D90B0]  E8 00	| clear pitch modulation & noise
	LDY #$2D			// $0FA6  [$1D90B2]  8D 2D	| DSP REG
	CALL code_135A			// $0FA8  [$1D90B4]  3F 5A 13	| 
	LDY #$3D			// $0FAB  [$1D90B7]  8D 3D	| DSP REG
	CALL code_135A			// $0FAD  [$1D90B9]  3F 5A 13	| 
	LDA #$01			// $0FB0  [$1D90BC]  E8 01	| 
	CALL code_13B0			// $0FB2  [$1D90BE]  3F B0 13	| 
	CALL code_141D			// $0FB5  [$1D90C1]  3F 1D 14	| 
	LDA #$00			// $0FB8  [$1D90C4]  E8 00	| 
	STA $31				// $0FBA  [$1D90C6]  C4 31	| ARAM
	LDY #$5C			// $0FBC  [$1D90C8]  8D 5C	| DSP REG
	CALL code_135A			// $0FBE  [$1D90CA]  3F 5A 13	| 
	STA $F1=#$00			// $0FC1  [$1D90CD]  8F 00 F1	| clear control reg
	LDA #$10			// $0FC4  [$1D90D0]  E8 10	| 
	STA $FA				// $0FC6  [$1D90D2]  C4 FA	| set timer 0
	LDA #$80			// $0FC8  [$1D90D4]  E8 80	| 
	STA $FB				// $0FCA  [$1D90D6]  C4 FB	| set timer 1
	STA $F1=#$03			// $0FCC  [$1D90D8]  8F 03 F1	| enable timers 0 and 1
	LDA $FD				// $0FCF  [$1D90DB]  E4 FD	| 
	PLX				// $0FD1  [$1D90DD]  CE		| 
	RET				// $0FD2  [$1D90DE]  6F		| 


code_0FD3:				//------------------------------| 
	CMP $1D=#$02			// $0FD3  [$1D90DF]  78 02 1D	| ARAM
	BEQ code_0FE0			// $0FD6  [$1D90E2]  F0 08	| 
	STA $48=#$00			// $0FD8  [$1D90E4]  8F 00 48	| ARAM
	STA $49=#$31			// $0FDB  [$1D90E7]  8F 31 49	| ARAM (pointer!)
	BRA code_0FE6			// $0FDE  [$1D90EA]  2F 06	| 

code_0FE0:				//				| 
	STA $48=#$00			// $0FE0  [$1D90EC]  8F 00 48	| ARAM
	STA $49=#$20			// $0FE3  [$1D90EF]  8F 20 49	| ARAM (pointer!)
code_0FE6:				//				| 
	LDA $F6				// $0FE6  [$1D90F2]  E4 F6	| 
	LDY $28				// $0FE8  [$1D90F4]  EB 28	| ARAM
	STA $0222+Y			// $0FEA  [$1D90F6]  D6 22 02	| ARAM
	STX $F4				// $0FED  [$1D90F9]  D8 F4	| 
code_0FEF:				//				| 
	CPX $F4				// $0FEF  [$1D90FB]  3E F4	| 
	BEQ code_0FEF			// $0FF1  [$1D90FD]  F0 FC	| 
	LDX $F4				// $0FF3  [$1D90FF]  F8 F4	| 
	LDA $F6				// $0FF5  [$1D9101]  E4 F6	| 
	STA $0223+Y			// $0FF7  [$1D9103]  D6 23 02	| ARAM
	STX $F4				// $0FFA  [$1D9106]  D8 F4	| 
code_0FFC:				//				| 
	CPX $F4				// $0FFC  [$1D9108]  3E F4	| 
	BEQ code_0FFC			// $0FFE  [$1D910A]  F0 FC	| 
	LDX $F4				// $1000  [$1D910C]  F8 F4	| 
	LDY #$00			// $1002  [$1D910E]  8D 00	| 
code_1004:				//				| 
	LDA $F6				// $1004  [$1D9110]  E4 F6	| 
	STA ($48)+Y			// $1006  [$1D9112]  D7 48	| INDIRECT ARAM
	INCW $48			// $1008  [$1D9114]  3A 48	| ARAM
	STX $F4				// $100A  [$1D9116]  D8 F4	| 
code_100C:				//				| 
	CPX $F4				// $100C  [$1D9118]  3E F4	| 
	BEQ code_100C			// $100E  [$1D911A]  F0 FC	| 
	LDX $F4				// $1010  [$1D911C]  F8 F4	| 
	BNE code_1004			// $1012  [$1D911E]  D0 F0	| 
	LDA $F5				// $1014  [$1D9120]  E4 F5	| 
	BEQ code_1024			// $1016  [$1D9122]  F0 0C	| 
	BPL code_105C			// $1018  [$1D9124]  10 42	| 
	STX $F4				// $101A  [$1D9126]  D8 F4	| 
code_101C:				//				| 
	CPX $F4				// $101C  [$1D9128]  3E F4	| 
	BEQ code_101C			// $101E  [$1D912A]  F0 FC	| 
	LDX $F4				// $1020  [$1D912C]  F8 F4	| 
	BRA code_1086			// $1022  [$1D912E]  2F 62	| 

code_1024:				//				| 
	LDA $F5				// $1024  [$1D9130]  E4 F5	| 
	BNE code_105C			// $1026  [$1D9132]  D0 34	| 
	LDAW $F6			// $1028  [$1D9134]  BA F6	| 
	STAW $4A			// $102A  [$1D9136]  DA 4A	| ARAM
	STX $F4				// $102C  [$1D9138]  D8 F4	| 
code_102E:				//				| 
	CPX $F4				// $102E  [$1D913A]  3E F4	| 
	BEQ code_102E			// $1030  [$1D913C]  F0 FC	| 
	LDAW $F6			// $1032  [$1D913E]  BA F6	| 
	STAW $48			// $1034  [$1D9140]  DA 48	| ARAM
	LDX $F4				// $1036  [$1D9142]  F8 F4	| 
	STX $F4				// $1038  [$1D9144]  D8 F4	| 
code_103A:				//				| 
	CPX $F4				// $103A  [$1D9146]  3E F4	| 
	BEQ code_103A			// $103C  [$1D9148]  F0 FC	| 
	LDAW $F6			// $103E  [$1D914A]  BA F6	| 
	STAW $46			// $1040  [$1D914C]  DA 46	| ARAM
	LDX $F4				// $1042  [$1D914E]  F8 F4	| 
	STX $F4				// $1044  [$1D9150]  D8 F4	| 
code_1046:				//				| 
	CPX $F4				// $1046  [$1D9152]  3E F4	| 
	BEQ code_1046			// $1048  [$1D9154]  F0 FC	| 
	LDX $F4				// $104A  [$1D9156]  F8 F4	| 
	LDY #$00			// $104C  [$1D9158]  8D 00	| 
code_104E:				//				| 
	LDA ($4A)+Y			// $104E  [$1D915A]  F7 4A	| INDIRECT ARAM
	STA ($48)+Y			// $1050  [$1D915C]  D7 48	| INDIRECT ARAM
	INCW $4A			// $1052  [$1D915E]  3A 4A	| ARAM
	INCW $48			// $1054  [$1D9160]  3A 48	| ARAM
	DECW $46			// $1056  [$1D9162]  1A 46	| ARAM
	BNE code_104E			// $1058  [$1D9164]  D0 F4	| 
	BRA code_1024			// $105A  [$1D9166]  2F C8	| 

code_105C:				//				| 
	LDAW $F6			// $105C  [$1D9168]  BA F6	| 
	STAW $48			// $105E  [$1D916A]  DA 48	| ARAM
	STX $F4				// $1060  [$1D916C]  D8 F4	| 
code_1062:				//				| 
	CPX $F4				// $1062  [$1D916E]  3E F4	| 
	BEQ code_1062			// $1064  [$1D9170]  F0 FC	| 
	LDX $F4				// $1066  [$1D9172]  F8 F4	| 
	LDY #$00			// $1068  [$1D9174]  8D 00	| 
code_106A:				//				| 
	LDA $F5				// $106A  [$1D9176]  E4 F5	| 
	STA ($48)+Y			// $106C  [$1D9178]  D7 48	| INDIRECT ARAM
	INCW $48			// $106E  [$1D917A]  3A 48	| ARAM
	LDA $F6				// $1070  [$1D917C]  E4 F6	| 
	STA ($48)+Y			// $1072  [$1D917E]  D7 48	| INDIRECT ARAM
	INCW $48			// $1074  [$1D9180]  3A 48	| ARAM
	LDA $F7				// $1076  [$1D9182]  E4 F7	| 
	STA ($48)+Y			// $1078  [$1D9184]  D7 48	| INDIRECT ARAM
	INCW $48			// $107A  [$1D9186]  3A 48	| ARAM
	STX $F4				// $107C  [$1D9188]  D8 F4	| 
code_107E:				//				| 
	CPX $F4				// $107E  [$1D918A]  3E F4	| 
	BEQ code_107E			// $1080  [$1D918C]  F0 FC	| 
	LDX $F4				// $1082  [$1D918E]  F8 F4	| 
	BNE code_106A			// $1084  [$1D9190]  D0 E4	| 

code_1086:				//				| 
	LDY $28				// $1086  [$1D9192]  EB 28	| ARAM
	LDA $0224+Y			// $1088  [$1D9194]  F6 24 02	| ARAM
	STA $48				// $108B  [$1D9197]  C4 48	| ARAM
	LDA $0225+Y			// $108D  [$1D9199]  F6 25 02	| ARAM
	STA $49				// $1090  [$1D919C]  C4 49	| ARAM
	LDY #$00			// $1092  [$1D919E]  8D 00	| 
	STY $F5				// $1094  [$1D91A0]  CB F5	| 
code_1096:				//				| 
	LDA $F6				// $1096  [$1D91A2]  E4 F6	| 
	STA ($48)+Y			// $1098  [$1D91A4]  D7 48	| INDIRECT ARAM
	INCW $48			// $109A  [$1D91A6]  3A 48	| ARAM
	LDA $F7				// $109C  [$1D91A8]  E4 F7	| 
	STA ($48)+Y			// $109E  [$1D91AA]  D7 48	| INDIRECT ARAM
	INCW $48			// $10A0  [$1D91AC]  3A 48	| ARAM
	STX $F4				// $10A2  [$1D91AE]  D8 E4	| 
code_10A4:				//				| 
	CPX $F4				// $10A4  [$1D91B0]  3E F4	| 
	BEQ code_10A4			// $10A6  [$1D91B2]  F0 FC	| 
	LDX $F4				// $10A8  [$1D91B4]  F8 F4	| 
	BNE code_1096			// $10AA  [$1D91B6]  D0 EA	| 
	LDY $28				// $10AC  [$1D91B8]  EB 28	| ARAM
	LDA $0226+Y			// $10AE  [$1D91BA]  F6 26 02	| ARAM
	STA $48				// $10B1  [$1D91BD]  C4 48	| ARAM
	LDA $0227+Y			// $10B3  [$1D91BF]  F6 27 02	| ARAM
	STA $49				// $10B6  [$1D91C2]  C4 49	| ARAM
	LDY #$00			// $10B8  [$1D91C4]  8D 00	| 
	LDA #$00			// $10BA  [$1D91C6]  E8 00	| 
code_10BC:				//				| 
	STA ($48)+Y			// $10BC  [$1D91C8]  D7 48	| INDIRECT ARAM
	INY				// $10BE  [$1D91CA]  FC		| 
	CPY #$60			// $10BF  [$1D91CB]  AD 60	| 
	BNE code_10BC			// $10C1  [$1D91CD]  D0 F9	| 
	LDY #$00			// $10C3  [$1D91CF]  8D 00	| 
code_10C5:				//				| 
	LDA $F5				// $10C5  [$1D91D1]  E4 F5	| 
	STA ($48)+Y			// $10C7  [$1D91D3]  D7 48	| INDIRECT ARAM
	INCW $48			// $10C9  [$1D91D5]  3A 48	| ARAM
	LDA $F6				// $10CB  [$1D91D7]  E4 F6	| 
	STA ($48)+Y			// $10CD  [$1D91D9]  D7 48	| INDIRECT ARAM
	INCW $48			// $10CF  [$1D91DB]  3A 48	| ARAM
	LDA $F7				// $10D1  [$1D91DD]  E4 F7	| 
	STA ($48)+Y			// $10D3  [$1D91DF]  D7 48	| INDIRECT ARAM
	INCW $48			// $10D5  [$1D91E1]  3A 48	| ARAM
	STX $F4				// $10D7  [$1D91E3]  D8 F4	| 
code_10D9:				//				| 
	CPX $F4				// $10D9  [$1D91E5]  3E F4	| 
	BEQ code_10D9			// $10DB  [$1D91E7]  F0 FC	| 
	LDX $F4				// $10DD  [$1D91E9]  F8 F4	| 
	BNE code_10C5			// $10DF  [$1D91EB]  D0 E4	| 
	LDA #$00			// $10E1  [$1D91ED]  E8 00	| 
	DECW $48			// $10E3  [$1D91EF]  1A 48	| ARAM
	STA ($48)+Y			// $10E5  [$1D91F1]  D7 48	| INDIRECT ARAM
	DECW $48			// $10E7  [$1D91F3]  1A 48	| ARAM
	STA ($48)+Y			// $10E9  [$1D91F5]  D7 48	| INDIRECT ARAM
	DECW $48			// $10EB  [$1D91F7]  1A 48	| ARAM
	STA ($48)+Y			// $10ED  [$1D91F9]  D7 48	| INDIRECT ARAM
	STX $F4				// $10EF  [$1D91FB]  D8 F4	| 
	RET				// $10F1  [$1D91FD]  6F		| 


code_10F2:				//------------------------------| 
	CALL code_1394			// $10F2  [$1D91FE]  3F 94 13	| 
	STA $4C=#$00			// $10F5  [$1D9201]  8F 00 4C	| ARAM
	STA $4D=#$00			// $10F8  [$1D9204]  8F 00 4D	| ARAM
	LDA #$00			// $10FB  [$1D9207]  E8 00	| 
	LDX #$00			// $10FD  [$1D9209]  CD 00	| 
code_10FF:				//				| 
	STA $15+X			// $10FF  [$1D920B]  D4 15	| ARAM
	INX				// $1101  [$1D920D]  3D		| 
	CPX #$08			// $1102  [$1D920E]  C8 08	| 
	BNE code_10FF			// $1104  [$1D9210]  D0 F9	| 
	STA $45=#$02			// $1106  [$1D9212]  8F 02 45	| ARAM
code_1109:				//------------------------------| 
	CALL code_1324			// $1109  [$1D9215]  3F 24 13	| 
code_110C:				//------------------------------| 
	LDY $02				// $110C  [$1D9218]  EB 02	| ARAM
	LDA $0015+Y			// $110E  [$1D921A]  F6 15 00	| ARAM
	BNE code_1117			// $1111  [$1D921D]  D0 04	| 
	LDA $4F+X			// $1113  [$1D921F]  F4 4F	| ARAM
	BMI code_111A			// $1115  [$1D9221]  30 03	| 
code_1117:				//				| 
	JMP code_11F8			// $1117  [$1D9223]  5F F8 11	| 
code_111A:				//				| 
	LDA #$01			// $111A  [$1D9226]  E8 01	| 
	STA $0015+Y			// $111C  [$1D9228]  D6 15 00	| ARAM
	LDA $50+X			// $111F  [$1D922B]  F4 50	| ARAM
	STA $10				// $1121  [$1D922D]  C4 10	| ARAM
	LDA $0F				// $1123  [$1D922F]  E4 0F	| ARAM
	BEQ code_112F			// $1125  [$1D9231]  F0 08	| 
	LDX $27				// $1127  [$1D9233]  F8 27	| ARAM
	LDA $4F+X			// $1129  [$1D9235]  F4 4F	| ARAM
	BMI code_115D			// $112B  [$1D9237]  30 30	| 
	LDX $26				// $112D  [$1D9239]  F8 26	| ARAM
code_112F:				//				| 
	LDA $10				// $112F  [$1D923B]  E4 10	| ARAM
	BBC $10.5=code_115D		// $1131  [$1D923D]  B3 10 29	| ARAM
	AND #$DF			// $1134  [$1D9240]  28 DF	| 
	STA $10				// $1136  [$1D9242]  C4 10	| ARAM
	STA $50+X			// $1138  [$1D9244]  D4 50	| ARAM
	LDA #$04			// $113A  [$1D9246]  E8 04	| DSP REG (source #)
	ORA $03				// $113C  [$1D9248]  04 03	| ARAM (channel? aka high nibble)
	TAY				// $113E  [$1D924A]  FD		| 
	LDA $06A1+X			// $113F  [$1D924B]  F5 A1 06	| ARAM
	CALL code_135A			// $1142  [$1D924E]  3F 5A 13	| 
	INY				// $1145  [$1D9251]  FC		| now write ADSR 1
	LDA $06A2+X			// $1146  [$1D9252]  F5 A2 06	| ARAM
	CALL code_135A			// $1149  [$1D9255]  3F 5A 13	| 
	INY				// $114C  [$1D9258]  FC		| now write ADSR 2
	LDA $06C1+X			// $114D  [$1D9259]  F5 C1 06	| ARAM
	CALL code_135A			// $1150  [$1D925C]  3F 5A 13	| 
	INY				// $1153  [$1D925F]  FC		| now write GAIN
	LDA $06C2+X			// $1154  [$1D9260]  F5 C2 06	| ARAM
	CALL code_135A			// $1157  [$1D9263]  3F 5A 13	| 
	ORA $4C=$04			// $115A  [$1D9266]  09 04 4C	| ARAM
code_115D:				//				| 
	LDX $26				// $115D  [$1D9269]  F8 26	| ARAM
	BBC $10.4=code_1195		// $115F  [$1D926B]  93 10 33	| ARAM
	LDA $10				// $1162  [$1D926E]  E4 10	| ARAM
	AND #$EF			// $1164  [$1D9270]  28 EF	| 
	STA $10				// $1166  [$1D9272]  C4 10	| ARAM
	STA $50+X			// $1168  [$1D9274]  D4 50	| ARAM
	LDA $10				// $116A  [$1D9276]  E4 10	| ARAM
	AND #$02			// $116C  [$1D9278]  28 02	| 
	ASL				// $116E  [$1D927A]  1C		| 
	ASL				// $116F  [$1D927B]  1C		| 
	XCN				// $1170  [$1D927C]  9F		| 
	STA $47				// $1171  [$1D927D]  C4 47	| ARAM
	LDA $0661+X			// $1173  [$1D927F]  F5 61 06	| ARAM
	AND #$7F			// $1176  [$1D9282]  28 7F	| 
	ORA $47				// $1178  [$1D9284]  04 47	| ARAM
	LDY #$00			// $117A  [$1D9286]  8D 00	| DSP REG
	CALL code_1354			// $117C  [$1D9288]  3F 54 13	| 
	LDA $10				// $117F  [$1D928B]  E4 10	| ARAM
	AND #$01			// $1181  [$1D928D]  28 01	| 
	ASL				// $1183  [$1D928F]  1C		| 
	ASL				// $1184  [$1D9290]  1C		| 
	ASL				// $1185  [$1D9291]  1C		| 
	XCN				// $1186  [$1D9292]  9F		| 
	STA $47				// $1187  [$1D9293]  C4 47	| ARAM
	LDA $0662+X			// $1189  [$1D9295]  F5 62 06	| ARAM
	AND #$7F			// $118C  [$1D9298]  28 7F	| 
	ORA $47				// $118E  [$1D929A]  04 47	| 
	LDY #$01			// $1190  [$1D929C]  8D 01	| DSP REG
	CALL code_1354			// $1192  [$1D929E]  3F 54 13	| 
code_1195:				//				| 
	BBC $10.3=code_11B0		// $1195  [$1D92A1]  73 10 18	| ARAM
	LDA $10				// $1198  [$1D92A4]  E4 10	| ARAM
	AND #$F7			// $119A  [$1D92A6]  28 F7	| 
	STA $10				// $119C  [$1D92A8]  C4 10	| ARAM
	STA $50+X			// $119E  [$1D92AA]  D4 50	| ARAM
	LDA $0681+X			// $11A0  [$1D92AC]  F5 81 06	| ARAM
	LDY #$02			// $11A3  [$1D92AF]  8D 02	| DSP REG
	CALL code_1354			// $11A5  [$1D92B1]  3F 54 13	| 
	LDA $0682+X			// $11A8  [$1D92B4]  F5 82 06	| ARAM
	LDY #$03			// $11AB  [$1D92B7]  8D 03	| DSP REG
	CALL code_1354			// $11AD  [$1D92B9]  3F 54 13	| 
code_11B0:				//				| 
	BBC $10.7=code_11D0		// $11B0  [$1D92BC]  F3 10 1D	| ARAM
	LDA $0681+X			// $11B3  [$1D92BF]  F5 81 06	| ARAM
	LDY #$02			// $11B6  [$1D92C2]  8D 02	| DSP REG
	CALL code_1354			// $11B8  [$1D92C4]  3F 54 13	| 
	LDA $0682+X			// $11BB  [$1D92C7]  F5 82 06	| ARAM
	LDY #$03			// $11BE  [$1D92CA]  8D 03	| DSP REG
	CALL code_1354			// $11C0  [$1D92CC]  3F 54 13	| 
	ORA $4C=$04			// $11C3  [$1D92CF]  09 04 4C	| ARAM
	LDA $10				// $11C6  [$1D92D2]  E4 10	| ARAM
	AND #$7F			// $11C8  [$1D92D4]  28 7F	| 
	STA $10				// $11CA  [$1D92D6]  C4 10	| ARAM
	STA $50+X			// $11CC  [$1D92D8]  D4 50	| ARAM
	BRA code_11DE			// $11CE  [$1D92DA]  2F 0E	| 
code_11D0:				//				| 
	BBC $10.6=code_11DE		// $11D0  [$1D92DC]  D3 10 0B	| ARAM
	ORA $4D=$04			// $11D3  [$1D92DF]  09 04 4D	| ARAM
	LDA $10				// $11D6  [$1D92E2]  E4 10	| ARAM
	AND #$BF			// $11D8  [$1D92E4]  28 BF	| 
	STA $10				// $11DA  [$1D92E6]  C4 10	| ARAM
	STA $50+X			// $11DC  [$1D92E8]  D4 50	| ARAM
code_11DE:				//				| 
	BBC $10.2=code_11E6		// $11DE  [$1D92EA]  53 10 05	| ARAM
	ORA $2B=$04			// $11E1  [$1D92ED]  09 04 2B	| ARAM
	BRA code_11E9			// $11E4  [$1D92F0]  2F 03	| 
code_11E6:				//				| 
	AND $2B=$44			// $11E6  [$1D92F2]  29 44 2B	| ARAM
code_11E9:				//				| 
	LDA $4F+X			// $11E9  [$1D92F5]  F4 4F	| ARAM
	STA $10				// $11EB  [$1D92F7]  C4 10	| ARAM
	BBC $10.4=code_11F5		// $11ED  [$1D92F9]  93 10 05	| ARAM
	ORA $43=$04			// $11F0  [$1D92FC]  09 04 43	| ARAM
	BRA code_11F8			// $11F3  [$1D92FF]  2F 03	| 
code_11F5:				//				| 
	AND $43=$44			// $11F5  [$1D9301]  29 44 43	| ARAM
code_11F8:				//------------------------------| 
	CALL code_1336			// $11F8  [$1D9304]  3F 36 13	| 
	CMP $02=#$08			// $11FB  [$1D9307]  78 08 02	| ARAM
	BEQ code_1203			// $11FE  [$1D930A]  F0 03	| 
	JMP code_110C			// $1200  [$1D930C]  5F 0C 11	| 
code_1203:				//				| 
	DEC $45				// $1203  [$1D930F]  8B 45	| ARAM
	BEQ code_120D			// $1205  [$1D9311]  F0 06	| 
	CALL code_13A2			// $1207  [$1D9313]  3F A2 13	| 
	JMP code_1109			// $120A  [$1D9316]  5F 09 11	| 
code_120D:				//				| 
	LDA $31				// $120D  [$1D9319]  E4 31	| ARAM
	ORA $4D				// $120F  [$1D931B]  04 4D	| ARAM
	STA $4D				// $1211  [$1D931D]  C4 4D	| ARAM
	LDA #$00			// $1213  [$1D931F]  E8 00	| 
	STA $31				// $1215  [$1D9321]  C4 31	| ARAM
	LDA $2A				// $1217  [$1D9323]  E4 2A	| ARAM
	AND #$E0			// $1219  [$1D9325]  28 E0	| 
	ORA $3E				// $121B  [$1D9327]  04 3E	| ARAM
	STA $2A				// $121D  [$1D9329]  C4 2A	| ARAM
	LDY #$0A			// $121F  [$1D932B]  8D 0A	| 
code_1221:				//				| 
	CPY #$05			// $1221  [$1D932D]  AD 05	| 
	BEQ code_122C			// $1223  [$1D932F]  F0 07	| 
	BCS code_122F			// $1225  [$1D9331]  B0 08	| 
	CMP $2E=$2D			// $1227  [$1D9333]  69 2D 2E	| ARAM
	BNE code_123D			// $122A  [$1D9336]  D0 11	| 
code_122C:				//				| 
	BBS $2E.7=code_123D		// $122C  [$1D9338]  E3 2E 0E	| ARAM
code_122F:				//				| 
	LDA data_124A-1+Y		// $122F  [$1D933B]  F6 49 12	| 
	STA $00F2			// $1232  [$1D933E]  C5 F2 00	| 
	LDA data_1254-1+Y		// $1235  [$1D9341]  F6 53 12	| 
	TAX				// $1238  [$1D9344]  5D		| 
	LDA (X)				// $1239  [$1D9345]  E6		| 
	STA $00F3			// $123A  [$1D9346]  C5 F3 00	| 
code_123D:				//				| 
	DBNZ Y=code_1221		// $123D  [$1D9349]  FE E2	| 
	STY $4C				// $123F  [$1D934B]  CB 4C	| ARAM
	STY $4D				// $1241  [$1D934D]  CB 4D	| ARAM
	STY $31				// $1243  [$1D934F]  CB 31	| ARAM
	LDA $14				// $1245  [$1D9351]  E4 14	| ARAM
	STA $F7				// $1247  [$1D9353]  C4 F7	| 
	RET				// $1249  [$1D9355]  6F		| 

data_124A:				//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^| these are DSP regs
	db $2C,$3C,$0D,$4D		// $124A  [$1D9356]		| 
	db $6C,$4C,$5C,$3D		// $124E  [$1D935A]		| 
	db $2D,$5C			// $1252  [$1D935E]		| 
data_1254:				//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^| addresses to read from for above regs
	db $33,$35,$2F,$2B		// $1254  [$1D9360]		| 
	db $2A,$4C,$31,$43		// $1258  [$1D9364]		| 
	db $2C,$4D			// $125C  [$1D9368]		| 


code_125E:				//------------------------------| 
	LDA $0F				// $125E  [$1D936A]  E4 0F	| ARAM
	BNE code_1266			// $1260  [$1D936C]  D0 04	| 
	STA $0D=#$00			// $1262  [$1D936E]  8F 00 0D	| ARAM
	RET				// $1265  [$1D9371]  6F		| 
code_1266:				//				| 
	STA $0E=#$00			// $1266  [$1D9372]  8F 00 0E	| ARAM
	RET				// $1269  [$1D9375]  6F		| 


code_126A:				//------------------------------| 
	LDX #$00			// $126A  [$1D9376]  CD 00	| 
	LDY #$00			// $126C  [$1D9378]  8D 00	| 
code_126E:				//				| 
	LDA $1E80+Y			// $126E  [$1D937A]  F6 80 1E	| ARAM or ROM table?
	CMP $46				// $1271  [$1D937D]  64 46	| ARAM
	BEQ code_127D			// $1273  [$1D937F]  F0 08	| 
	TYA				// $1275  [$1D9381]  DD		| 
	CLRC				// $1276  [$1D9382]  60		| 
	ADC #$06			// $1277  [$1D9383]  88 06	| 
	TAY				// $1279  [$1D9385]  FD		| 
	INX				// $127A  [$1D9386]  3D		| 
	BRA code_126E			// $127B  [$1D9387]  2F F1	| 
code_127D:				//				| 
	TXA				// $127D  [$1D9389]  7D		| 
	LDX $26				// $127E  [$1D938A]  F8 26	| ARAM
	RET				// $1280  [$1D938C]  6F		| 


code_1281:				//------------------------------| 
	CALL code_1394			// $1281  [$1D938D]  3F 94 13	| 
	CALL code_12BF			// $1284  [$1D9390]  3F BF 12	| 
	LDX $28				// $1287  [$1D9393]  F8 28	| ARAM
	LDA #$00			// $1289  [$1D9395]  E8 00	| 
	STA $0224+X			// $128B  [$1D9397]  D5 24 02	| ARAM
	LDA #$1E			// $128E  [$1D939A]  E8 1E	| 
	STA $0225+X			// $1290  [$1D939C]  D5 25 02	| ARAM
	LDA #$80			// $1293  [$1D939F]  E8 80	| 
	STA $0226+X			// $1295  [$1D93A1]  D5 26 02	| ARAM
	LDA #$1E			// $1298  [$1D93A4]  E8 1E	| 
	STA $0227+X			// $129A  [$1D93A6]  D5 27 02	| ARAM
	LDX $26				// $129D  [$1D93A9]  F8 26	| ARAM
	RET				// $129F  [$1D93AB]  6F		| 

code_12A0:				//------------------------------| 
	CALL code_13A2			// $12A0  [$1D93AC]  3F A2 13	| 
	CALL code_12BF			// $12A3  [$1D93AF]  3F BF 12	| 
	LDX $28				// $12A6  [$1D93B2]  F8 28	| ARAM
	LDA #$40			// $12A8  [$1D93B4]  E8 40	| 
	STA $0224+X			// $12AA  [$1D93B6]  D5 24 02	| ARAM
	LDA #$1E			// $12AD  [$1D93B9]  E8 1E	| 
	STA $0225+X			// $12AF  [$1D93BB]  D5 25 02	| ARAM
	LDA #$E0			// $12B2  [$1D93BE]  E8 E0	| 
	STA $0226+X			// $12B4  [$1D93C0]  D5 26 02	| ARAM
	LDA #$1E			// $12B7  [$1D93C3]  E8 1E	| 
	STA $0227+X			// $12B9  [$1D93C5]  D5 27 02	| 
	LDX $26				// $12BC  [$1D93C8]  F8 26	| ARAM
	RET				// $12BE  [$1D93CA]  6F		| 


code_12BF:				//------------------------------| 
	PHA				// $12BF  [$1D93CB]  2D		| 
	PHX				// $12C0  [$1D93CC]  4D		| 
	PHY				// $12C1  [$1D93CD]  6D		| 
	CALL code_1324			// $12C2  [$1D93CE]  3F 24 13	| 
code_12C5:				//				| 
	LDA #$7F			// $12C5  [$1D93D1]  E8 7F	| 
	STA $0321+X			// $12C7  [$1D93D3]  D5 21 03	| ARAM
	LDA #$10			// $12CA  [$1D93D6]  E8 10	| 
	STA $0682+X			// $12CC  [$1D93D8]  D5 82 06	| ARAM
	LDA #$0A			// $12CF  [$1D93DB]  E8 0A	| 
	CALL code_09F5			// $12D1  [$1D93DD]  3F F5 09	| 
	LDA #$FF			// $12D4  [$1D93E0]  E8 FF	| 
	STA $0321+X			// $12D6  [$1D93E2]  D5 21 03	| ARAM
	LDA #$00			// $12D9  [$1D93E5]  E8 00	| 
	STA $0280+X			// $12DB  [$1D93E7]  D5 80 02	| ARAM
	STA $02A0+X			// $12DE  [$1D93EA]  D5 A0 02	| ARAM
	STA $02A1+X			// $12E1  [$1D93ED]  D5 A1 02	| ARAM
	STA $0480+X			// $12E4  [$1D93F0]  D5 80 04	| ARAM
	STA $0400+X			// $12E7  [$1D93F3]  D5 00 04	| ARAM
	STA $0461+X			// $12EA  [$1D93F6]  D5 61 04	| ARAM
	STA $0380+X			// $12ED  [$1D93F9]  D5 80 03	| ARAM
	STA $04C1+X			// $12F0  [$1D93FC]  D5 C1 04	| ARAM
	STA $0561+X			// $12F3  [$1D93FF]  D5 61 05	| ARAM
	STA $0301+X			// $12F6  [$1D9402]  D5 01 03	| ARAM
	STA $4F+X			// $12F9  [$1D9405]  D4 4F	| ARAM
	STA $50+X			// $12FB  [$1D9407]  D4 50	| ARAM
	CALL code_1336			// $12FD  [$1D9409]  3F 36 13	| 
	CMP $02=#$08			// $1300  [$1D940C]  78 08 02	| ARAM
	BNE code_12C5			// $1303  [$1D940F]  D0 C0	| 
	LDX $28				// $1305  [$1D9411]  F8 28	| ARAM
	LDA #$00			// $1307  [$1D9413]  E8 00	| 
	STA $020A+X			// $1309  [$1D9415]  D5 0A 02	| ARAM
	STA $0204+X			// $130C  [$1D9418]  D5 04 02	| ARAM
	STA $020F+X			// $130F  [$1D941B]  D5 0F 02	| ARAM
	STA $3F				// $1312  [$1D941E]  C4 3F	| ARAM
	STA $3A				// $1314  [$1D9420]  C4 3A	| ARAM
	LDA #$FF			// $1316  [$1D9422]  E8 FF	| 
	STA $0209+X			// $1318  [$1D9424]  D5 09 02	| ARAM
	LDA #$20			// $131B  [$1D9427]  E8 20	| 
	STA $0202+X			// $131D  [$1D9429]  D5 02 02	| ARAM
	PLY				// $1320  [$1D942C]  EE		| 
	PLX				// $1321  [$1D942D]  CE		| 
	PLA				// $1322  [$1D942E]  AE		| 
	RET				// $1323  [$1D942F]  6F		| 


code_1324:				//------------------------------| 
	LDX $28				// $1324  [$1D9430]  F8 28	| ARAM
	STX $26				// $1326  [$1D9432]  D8 26	| ARAM
	STA $02=#$00			// $1328  [$1D9434]  8F 00 02	| ARAM
	STA $03=#$00			// $132B  [$1D9437]  8F 00 03	| ARAM
	STA $04=#$01			// $132E  [$1D943A]  8F 01 04	| ARAM
	LDA #$FE			// $1331  [$1D943D]  E8 FE	| 
	STA $44				// $1333  [$1D943F]  C4 44	| ARAM
	RET				// $1335  [$1D9441]  6F		| 


code_1336:				//------------------------------| 
	LDX $27				// $1336  [$1D9442]  F8 27	| ARAM
	INX				// $1338  [$1D9444]  3D		| 
	INX				// $1339  [$1D9445]  3D		| 
	STX $27				// $133A  [$1D9446]  D8 27	| ARAM
	LDX $26				// $133C  [$1D9448]  F8 26	| ARAM
	INX				// $133E  [$1D944A]  3D		| 
	INX				// $133F  [$1D944B]  3D		| 
	STX $26				// $1340  [$1D944C]  D8 26	| ARAM
	INC $02				// $1342  [$1D944E]  AB 02	| ARAM
	LDA $03				// $1344  [$1D9450]  E4 03	| ARAM
	CLRC				// $1346  [$1D9452]  60		| 
	ADC #$10			// $1347  [$1D9453]  88 10	| 
	STA $03				// $1349  [$1D9455]  C4 03	| ARAM
	ASL $04				// $134B  [$1D9457]  0B 04	| ARAM
	LDA $04				// $134D  [$1D9459]  E4 04	| ARAM
	EOR #$FF			// $134F  [$1D945B]  48 FF	| 
	STA $44				// $1351  [$1D945D]  C4 44	| ARAM
	RET				// $1353  [$1D945F]  6F		| 


code_1354:				//------------------------------| DPS write to specific voice reg
	PHA				// $1354  [$1D9460]  2D		| A contains value
	TYA				// $1355  [$1D9461]  DD		| Y contains low nibble of DSP reg
	ORA $03				// $1356  [$1D9462]  04 03	| ARAM ($03 contains high nibble)
	TAY				// $1358  [$1D9464]  FD		| 
	PLA				// $1359  [$1D9465]  AE		| 
code_135A:				//==============================| DSP write
	STY $F2				// $135A  [$1D9466]  CB F2	| Y contains DSP reg
	STA $F3				// $135C  [$1D9468]  C4 F3	| A contains value
	RET				// $135E  [$1D946A]  6F		| 

code_135F:				//==============================| DSP read
	STY $F2				// $135F  [$1D946B]  CB F2	| Y contains DSP reg
	LDA $F3				// $1361  [$1D946D]  E4 F3	| A will contain value
	RET				// $1363  [$1D946F]  6F		| 


code_1364:				//------------------------------| 
	LDA $05A1+X			// $1364  [$1D9470]  F5 A1 05	| ARAM
	STA $48				// $1367  [$1D9473]  C4 48	| ARAM
	LDA $05A2+X			// $1369  [$1D9475]  F5 A2 05	| ARAM
	STA $49				// $136C  [$1D9478]  C4 49	| ARAM
	LDY #$00			// $136E  [$1D947A]  8D 00	| 
	LDA ($48)+Y			// $1370  [$1D947C]  F7 48	| INDIRECT ARAM
	STA $10				// $1372  [$1D947E]  C4 10	| ARAM
	INCW $48			// $1374  [$1D9480]  3A 48	| ARAM
	LDA $48				// $1376  [$1D9482]  E4 48	| ARAM
	STA $05A1+X			// $1378  [$1D9484]  D5 A1 05	| ARAM
	LDA $49				// $137B  [$1D9487]  E4 49	| ARAM
	STA $05A2+X			// $137D  [$1D9489]  D5 A2 05	| ARAM
	LDA $10				// $1380  [$1D948C]  E4 10	| ARAM
	RET				// $1382  [$1D948E]  6F		| 


null_1383:				//???????????????????????????????| 
	LDA $05A1+X			// $1383  [$1D948F]  F5 A1 05	| ARAM
	STA $48				// $1386  [$1D9492]  C4 48	| ARAM
	LDA $05A2+X			// $1388  [$1D9494]  F5 A2 05	| ARAM
	STA $49				// $138B  [$1D9497]  C4 49	| ARAM
	LDY #$00			// $138D  [$1D9499]  8D 00	| 
	LDA ($48)+Y			// $138F  [$1D949B]  F7 48	| INDIRECT ARAM
	STA $10				// $1391  [$1D949D]  C4 10	| ARAM
	RET				// $1393  [$1D949F]  6F		| 


code_1394:				//------------------------------| 
	STA $0F=#$00			// $1394  [$1D94A0]  8F 00 0F	| ARAM
	LDX #$10			// $1397  [$1D94A3]  CD 10	| 
	STX $27				// $1399  [$1D94A5]  D8 27	| ARAM
	LDX #$00			// $139B  [$1D94A7]  CD 00	| 
	STX $26				// $139D  [$1D94A9]  D8 26	| ARAM
	STX $28				// $139F  [$1D94AB]  D8 28	| ARAM
	RET				// $13A1  [$1D94AD]  6F		| 


code_13A2:				//------------------------------| 
	STA $0F=#$01			// $13A2  [$1D94AE]  8F 01 0F	| ARAM
	LDX #$00			// $13A5  [$1D94B1]  CD 00	| 
	STX $27				// $13A7  [$1D94B3]  D8 27	| ARAM
	LDX #$10			// $13A9  [$1D94B5]  CD 10	| 
	STX $26				// $13AB  [$1D94B7]  D8 26	| ARAM
	STX $28				// $13AD  [$1D94B9]  D8 28	| ARAM
	RET				// $13AF  [$1D94BB]  6F		| 


code_13B0:				//------------------------------| 
	STA $2D				// $13B0  [$1D94BC]  C4 2D	| ARAM
	LDY #$7D			// $13B2  [$1D94BE]  8D 7D	| DSP REG
	CALL code_135F			// $13B4  [$1D94C0]  3F 5F 13	| 
	CMP $2D				// $13B7  [$1D94C3]  64 2D	| ARAM
	BEQ code_13FE			// $13B9  [$1D94C5]  F0 43	| 
	AND #$0F			// $13BB  [$1D94C7]  28 0F	| 
	EOR #$FF			// $13BD  [$1D94C9]  48 FF	| 
	BBC $2E.7=code_13C5		// $13BF  [$1D94CB]  F3 2E 03	| ARAM
	CLRC				// $13C2  [$1D94CE]  60		| 
	ADC $2E				// $13C3  [$1D94CF]  84 2E	| ARAM
code_13C5:				//				| 
	STA $2E				// $13C5  [$1D94D1]  C4 2E	| ARAM
	LDA $FE				// $13C7  [$1D94D3]  E4 FE	| 
	LDY #$04			// $13C9  [$1D94D5]  8D 04	| 
code_13CB:				//				| 
	LDA data_1419-1+Y		// $13CB  [$1D94D7]  F6 18 14	| 
	STA $F2				// $13CE  [$1D94DA]  C4 F2	| 
	LDA #$00			// $13D0  [$1D94DC]  E8 00	| 
	STA $F3				// $13D2  [$1D94DE]  C4 F3	| 
	DBNZ Y=code_13CB		// $13D4  [$1D94E0]  FE F5	| 
	LDY #$6C			// $13D6  [$1D94E2]  8D 6C	| DSP REG
	CALL code_135F			// $13D8  [$1D94E4]  3F 5F 13	| 
	ORA #$20			// $13DB  [$1D94E7]  08 20	| 
	STA $2A				// $13DD  [$1D94E9]  C4 2A	| ARAM
	LDY #$6C			// $13DF  [$1D94EB]  8D 6C	| DSP REG
	CALL code_135A			// $13E1  [$1D94ED]  3F 5A 13	| 
	LDA $2D				// $13E4  [$1D94F0]  E4 2D	| ARAM
	CALL code_1410			// $13E6  [$1D94F2]  3F 10 14	| 
	STA $49				// $13E9  [$1D94F5]  C4 49	| ARAM
	LDA #$00			// $13EB  [$1D94F7]  E8 00	| 
	STA $48				// $13ED  [$1D94F9]  C4 48	| ARAM
	TAY				// $13EF  [$1D94FB]  FD		| 
code_13F0:				//				| 
	STA ($48)+Y			// $13F0  [$1D94FC]  D7 48	| INDIRECT ARAM
	INY				// $13F2  [$1D94FE]  FC		| 
	BNE code_13F7			// $13F3  [$1D94FF]  D0 02	| 
	INC $49				// $13F5  [$1D9501]  AB 49	| ARAM
code_13F7:				//				| 
	CMP $49=#$FF			// $13F7  [$1D9503]  78 FF 49	| ARAM
	BNE code_13F0			// $13FA  [$1D9506]  D0 F4	| 
	LDA $2D				// $13FC  [$1D9508]  E4 2D	| ARAM
code_13FE:				//				| 
	CALL code_1410			// $13FE  [$1D950A]  3F 10 14	| 
	LDY #$6D			// $1401  [$1D950D]  8D 6D	| DSP REG
	CALL code_135A			// $1403  [$1D950F]  3F 5A 13	| 
	STA $71=#$00			// $1406  [$1D9512]  8F 00 71	| ARAM
	LDA $2D				// $1409  [$1D9515]  E4 2D	| ARAM
	LDY #$7D			// $140B  [$1D9517]  8D 7D	| DSP REG
	JMP code_135A			// $140D  [$1D9519]  5F 5A 13	| 

code_1410:				//------------------------------| 
	ASL				// $1410  [$1D951C]  1C		| 
	ASL				// $1411  [$1D951D]  1C		| 
	ASL				// $1412  [$1D951E]  1C		| 
	EOR #$FF			// $1413  [$1D951F]  48 FF	| 
	SETC				// $1415  [$1D9521]  80		| 
	ADC #$FF			// $1416  [$1D9522]  88 FF	| 
	RET				// $1418  [$1D9524]  6F		| 

data_1419:				//------------------------------| these are DSP regs
	db $2C,$3C,$0D,$4D		// $1419  [$1D9525]		| 

code_141D:				//------------------------------| 
	LDA #$00			// $141D  [$1D9529]  E8 00	| 
	LDY #$2C			// $141F  [$1D952B]  8D 2C	| 
	CALL code_135A			// $1421  [$1D952D]  3F 5A 13	| 
	LDY #$3C			// $1424  [$1D9530]  8D 3C	| 
	CALL code_135A			// $1426  [$1D9532]  3F 5A 13	| 
	SET1 $2A.5			// $1429  [$1D9535]  A2 2A	| ARAM
	RET				// $142B  [$1D9537]  6F		| 


null_142C:				//???????????????????????????????| 
	LDA #$00			// $142C  [$1D9538]  E8 00	| 
	LDY #$2C			// $142E  [$1D953A]  8D 2C	| DSP REG
	CALL code_135A			// $1430  [$1D953C]  3F 5A 13	| dsp write
	LDY #$3C			// $1433  [$1D953F]  8D 3C	| DSP REG
	CALL code_135A			// $1435  [$1D9541]  3F 5A 13	| dsp write
	LDY #$6C			// $1438  [$1D9544]  8D 6C	| DSP REG
	CALL code_135F			// $143A  [$1D9546]  3F 5F 13	| dsp read
	ORA #$20			// $143D  [$1D9549]  08 20	| 
	CALL code_135A			// $143F  [$1D954B]  3F 5A 13	| dsp write
	RET				// $1442  [$1D954E]  6F		| 


code_1443:				//------------------------------| 
	CLR1 $4E.7			// $1443  [$1D954F]  F2 4E	| ARAM
	LDA $0561+X			// $1445  [$1D9551]  F5 61 05	| ARAM
	BEQ code_1455			// $1448  [$1D9554]  F0 0B	| 
	LDA $0581+X			// $144A  [$1D9556]  F5 81 05	| ARAM
	CMP $0542+X			// $144D  [$1D9559]  75 42 05	| ARAM
	BNE code_1455			// $1450  [$1D955C]  D0 03	| 
	CALL code_17D9			// $1452  [$1D955E]  3F D9 17	| 
code_1455:				//				| 
	LDA $03A1+X			// $1455  [$1D9561]  F5 A1 03	| ARAM
	TAY				// $1458  [$1D9564]  FD		| 
	LDA $03A0+X			// $1459  [$1D9565]  F5 A0 03	| ARAM
	STAW $21			// $145C  [$1D9568]  DA 21	| ARAM
	LDA $0380+X			// $145E  [$1D956A]  F5 80 03	| ARAM
	BEQ code_146D			// $1461  [$1D956D]  F0 0A	| 
	LDA $03C1+X			// $1463  [$1D956F]  F5 C1 03	| ARAM
	TAY				// $1466  [$1D9572]  FD		| 
	LDA $03C0+X			// $1467  [$1D9573]  F5 C0 03	| ARAM
	CALL code_17B4			// $146A  [$1D9576]  3F B4 17	| 
code_146D:				//				| 
	BBC $4E.7=code_1473		// $146D  [$1D9579]  F3 4E 03	| ARAM
	CALL code_16F4			// $1470  [$1D957C]  3F F4 16	| 
code_1473:				//				| 
	CLR1 $4E.7			// $1473  [$1D957F]  F2 4E	| ARAM
	CALL code_178D			// $1475  [$1D9581]  3F 8D 17	| 
	LDA $0400+X			// $1478  [$1D9584]  F5 00 04	| ARAM
	BEQ code_148C			// $147B  [$1D9587]  F0 0F	| 
	LDA $0401+X			// $147D  [$1D9589]  F5 01 04	| ARAM
	BNE code_148C			// $1480  [$1D958C]  D0 0A	| 
	LDA $0441+X			// $1482  [$1D958E]  F5 41 04	| ARAM
	TAY				// $1485  [$1D9591]  FD		| 
	LDA $0440+X			// $1486  [$1D9592]  F5 40 04	| ARAM
	CALL code_17B4			// $1489  [$1D9595]  3F B4 17	| 
code_148C:				//				| 
	LDA $04C1+X			// $148C  [$1D9598]  F5 C1 04	| ARAM
	BEQ code_1499			// $148F  [$1D959B]  F0 08	| 
	LDA $04E1+X			// $1491  [$1D959D]  F5 E1 04	| ARAM
	CMP $04A2+X			// $1494  [$1D95A0]  75 A2 04	| ARAM
	BEQ code_149C			// $1497  [$1D95A3]  F0 03	| 
code_1499:				//				| 
	JMP code_1551			// $1499  [$1D95A5]  5F 51 15	| 
code_149C:				//				| 
	LDX $28				// $149C  [$1D95A8]  F8 28	| ARAM
	LDA $0203+X			// $149E  [$1D95AA]  F5 03 02	| ARAM
	TAY				// $14A1  [$1D95AD]  FD		| 
	LDX $26				// $14A2  [$1D95AE]  F8 26	| ARAM
	LDA $04C2+X			// $14A4  [$1D95B0]  F5 C2 04	| ARAM
	MUL				// $14A7  [$1D95B3]  CF		| 
	TYA				// $14A8  [$1D95B4]  DD		| 
	CLRC				// $14A9  [$1D95B5]  60		| 
	ADC $04A1+X			// $14AA  [$1D95B6]  95 A1 04	| ARAM
	JMP code_152B			// $14AD  [$1D95B9]  5F 2B 15	| 

code_14B0:				//------------------------------| 
	CLR1 $4E.7			// $14B0  [$1D95BC]  F2 4E	| ARAM
	LDA $0400+X			// $14B2  [$1D95BE]  F5 00 04	| ARAM
	BEQ code_14EE			// $14B5  [$1D95C1]  F0 37	| 
	LDA $0401+X			// $14B7  [$1D95C3]  F5 01 04	| ARAM
	BEQ code_14C5			// $14BA  [$1D95C6]  F0 09	| 
	LDA $0401+X			// $14BC  [$1D95C8]  F5 01 04	| ARAM
	DEC				// $14BF  [$1D95CB]  9C		| 
	STA $0401+X			// $14C0  [$1D95CC]  D5 01 04	| ARAM
	BRA code_14EE			// $14C3  [$1D95CF]  2F 29	| 
code_14C5:				//				| 
	SET1 $4E.7			// $14C5  [$1D95D1]  E2 4E	| ARAM
	LDA $0400+X			// $14C7  [$1D95D3]  F5 00 04	| ARAM
	DEC				// $14CA  [$1D95D6]  9C		| 
	STA $0400+X			// $14CB  [$1D95D7]  D5 00 04	| ARAM
	BNE code_14DB			// $14CE  [$1D95DA]  D0 0B	| 
	LDA $02A0+X			// $14D0  [$1D95DC]  F5 A0 02	| ARAM
	STA $0420+X			// $14D3  [$1D95DF]  D5 20 04	| ARAM
	LDA $0460+X			// $14D6  [$1D95E2]  F5 60 04	| ARAM
	BRA code_14EB			// $14D9  [$1D95E5]  2F 10	| 
code_14DB:				//				| 
	CLRC				// $14DB  [$1D95E7]  60		| 
	LDA $0420+X			// $14DC  [$1D95E8]  F5 20 04	| ARAM
	ADC $0440+X			// $14DF  [$1D95EB]  95 40 04	| ARAM
	STA $0420+X			// $14E2  [$1D95EE]  D5 20 04	| ARAM
	LDA $0421+X			// $14E5  [$1D95F1]  F5 21 04	| ARAM
	ADC $0441+X			// $14E8  [$1D95F4]  95 41 04	| ARAM
code_14EB:				//				| 
	STA $0421+X			// $14EB  [$1D95F7]  D5 21 04	| ARAM
code_14EE:				//				| 
	CALL code_178D			// $14EE  [$1D95FA]  3F 8D 17	| 
	LDA $04C1+X			// $14F1  [$1D95FD]  F5 C1 04	| ARAM
	BEQ code_1551			// $14F4  [$1D9600]  F0 5B	| 
	LDA $04E1+X			// $14F6  [$1D9602]  F5 E1 04	| ARAM
	CMP $04A2+X			// $14F9  [$1D9605]  75 A2 04	| ARAM
	BNE code_154A			// $14FC  [$1D9608]  D0 4C	| 
	LDA $0501+X			// $14FE  [$1D960A]  F5 01 05	| ARAM
	CMP $0502+X			// $1501  [$1D960D]  75 02 05	| ARAM
	BNE code_150B			// $1504  [$1D9610]  D0 05	| 
	LDA $0522+X			// $1506  [$1D9612]  F5 22 05	| ARAM
	BRA code_151E			// $1509  [$1D9615]  2F 13	| 
code_150B:				//				| 
	TAY				// $150B  [$1D9617]  FD		| 
	LDA $0501+X			// $150C  [$1D9618]  F5 01 05	| ARAM
	INC				// $150F  [$1D961B]  BC		| 
	STA $0501+X			// $1510  [$1D961C]  D5 01 05	| ARAM
	CPY #$00			// $1513  [$1D961F]  AD 00	| 
	BEQ code_151A			// $1515  [$1D9621]  F0 03	| 
	LDA $04C1+X			// $1517  [$1D9623]  F5 C1 04	| ARAM
code_151A:				//				| 
	CLRC				// $151A  [$1D9626]  60		| 
	ADC $0521+X			// $151B  [$1D9627]  95 21 05	| ARAM
code_151E:				//				| 
	STA $04C1+X			// $151E  [$1D962A]  D5 C1 04	| ARAM
	LDA $04A1+X			// $1521  [$1D962D]  F5 A1 04	| ARAM
	CLRC				// $1524  [$1D9630]  60		| 
	ADC $04C2+X			// $1525  [$1D9631]  95 C2 04	| ARAM
	STA $04A1+X			// $1528  [$1D9634]  D5 A1 04	| ARAM
code_152B:				//				| 
	STA $23				// $152B  [$1D9637]  C4 23	| ARAM
	ASL				// $152D  [$1D9639]  1C		| 
	ASL				// $152E  [$1D963A]  1C		| 
	BCC code_1533			// $152F  [$1D963B]  90 02	| 
	EOR #$FF			// $1531  [$1D963D]  48 FF	| 
code_1533:				//				| 
	TAY				// $1533  [$1D963F]  FD		| 
	LDA $04C1+X			// $1534  [$1D9640]  F5 C1 04	| ARAM
	CMP #$F1			// $1537  [$1D9643]  68 F1	| 
	BCC code_1540			// $1539  [$1D9645]  90 05	| 
	AND #$0F			// $153B  [$1D9647]  28 0F	| 
	MUL				// $153D  [$1D9649]  CF		| 
	BRA code_1544			// $153E  [$1D964A]  2F 04	| 
code_1540:				//				| 
	MUL				// $1540  [$1D964C]  CF		| 
	TYA				// $1541  [$1D964D]  DD		| 
	LDY #$00			// $1542  [$1D964E]  8D 00	| 
code_1544:				//				| 
	CALL code_17D1			// $1544  [$1D9650]  3F D1 17	|
code_1547:				//				|  
	JMP code_0CA6			// $1547  [$1D9653]  5F A6 0C	| 

code_154A:				//				| 
	LDA $04A2+X			// $154A  [$1D9656]  F5 A2 04	| ARAM
	INC				// $154D  [$1D9659]  BC		| 
	STA $04A2+X			// $154E  [$1D965A]  D5 A2 04	| ARAM
code_1551:				//------------------------------| 
	BBS $4E.7=code_1547		// $1551  [$1D965D]  E3 4E F3	| ARAM
	RET				// $1554  [$1D9660]  6F		| 

code_1555:				//------------------------------| 
	LDA $3F				// $1555  [$1D9661]  E4 3F	| ARAM
	BEQ code_156B			// $1557  [$1D9663]  F0 12	| 
	LDAW $41			// $1559  [$1D9665]  BA 41	| ARAM
	ADDW $3D			// $155B  [$1D9667]  7A 3D	| ARAM
	STA $3D				// $155D  [$1D9669]  C4 3D	| ARAM
	TYA				// $155F  [$1D966B]  DD		| 
	AND #$1F			// $1560  [$1D966C]  28 1F	| 
	STA $3E				// $1562  [$1D966E]  C4 3E	| ARAM
	DBNZ $3F=code_156B		// $1564  [$1D9670]  6E 3F 04	| ARAM
	LDAW $3F			// $1567  [$1D9673]  BA 3F	| ARAM
	STAW $3D			// $1569  [$1D9675]  DA 3D	| ARAM
code_156B:				//				| 
	LDA $3A				// $156B  [$1D9677]  E4 3A	| ARAM
	BEQ code_1584			// $156D  [$1D9679]  F0 15	| 
	LDAW $36			// $156F  [$1D967B]  BA 36	| ARAM
	ADDW $32			// $1571  [$1D967D]  7A 32	| ARAM
	STAW $32			// $1573  [$1D967F]  DA 32	| ARAM
	LDAW $38			// $1575  [$1D9681]  BA 38	| ARAM
	ADDW $34			// $1577  [$1D9683]  7A 34	| ARAM
	DBNZ $3A=code_1582		// $1579  [$1D9685]  6E 3A 06	| ARAM
	LDAW $3A			// $157C  [$1D9688]  BA 3A	| ARAM
	STAW $32			// $157E  [$1D968A]  DA 32	| ARAM
	LDY $3C				// $1580  [$1D968C]  EB 3C	| ARAM
code_1582:				//				| 
	STAW $34			// $1582  [$1D968E]  DA 34	| ARAM
code_1584:				//				| 
	RET				// $1584  [$1D9690]  6F		| 


code_1585:				//------------------------------| 
	LDX $28				// $1585  [$1D9691]  F8 28	| ARAM
	LDA $0204+X			// $1587  [$1D9693]  F5 04 02	| ARAM
	BEQ code_15BF			// $158A  [$1D9696]  F0 33	| 
	LDA $0206+X			// $158C  [$1D9698]  F5 06 02	| ARAM
	STA $46				// $158F  [$1D969B]  C4 46	| ARAM
	LDA $0207+X			// $1591  [$1D969D]  F5 07 02	| ARAM
	STA $47				// $1594  [$1D96A0]  C4 47	| ARAM
	LDA $0201+X			// $1596  [$1D96A2]  F5 01 02	| ARAM
	PHA				// $1599  [$1D96A5]  2D		| 
	LDA $0202+X			// $159A  [$1D96A6]  F5 02 02	| ARAM
	TAY				// $159D  [$1D96A9]  FD		| 
	PLA				// $159E  [$1D96AA]  AE		| 
	ADDW $46			// $159F  [$1D96AB]  7A 46	| ARAM
	STAW $46			// $15A1  [$1D96AD]  DA 46	| ARAM
	LDA $0204+X			// $15A3  [$1D96AF]  F5 04 02	| ARAM
	DEC				// $15A6  [$1D96B2]  9C		| 
	STA $0204+X			// $15A7  [$1D96B3]  D5 04 02	| ARAM
	BNE code_15B5			// $15AA  [$1D96B6]  D0 09	| 
	LDA #$00			// $15AC  [$1D96B8]  E8 00	| 
	STA $46				// $15AE  [$1D96BA]  C4 46	| ARAM
	LDA $0205+X			// $15B0  [$1D96BC]  F5 05 02	| ARAM
	STA $47				// $15B3  [$1D96BF]  C4 47	| ARAM
code_15B5:				//				| 
	LDA $46				// $15B5  [$1D96C1]  E4 46	| ARAM
	STA $0201+X			// $15B7  [$1D96C3]  D5 01 02	| ARAM
	LDA $47				// $15BA  [$1D96C6]  E4 47	| ARAM
	STA $0202+X			// $15BC  [$1D96C8]  D5 02 02	| ARAM
code_15BF:				//				| 
	LDA $020A+X			// $15BF  [$1D96CB]  F5 0A 02	| ARAM
	BEQ code_1602			// $15C2  [$1D96CE]  F0 3E	| 
	LDA $020C+X			// $15C4  [$1D96D0]  F5 0C 02	| ARAM
	STA $46				// $15C7  [$1D96D3]  C4 46	| ARAM
	LDA $020D+X			// $15C9  [$1D96D5]  F5 0D 02	| ARAM
	STA $47				// $15CC  [$1D96D8]  C4 47	| ARAM
	LDA $0208+X			// $15CE  [$1D96DA]  F5 08 02	| ARAM
	PHA				// $15D1  [$1D96DD]  2D		| 
	LDA $0209+X			// $15D2  [$1D96DE]  F5 09 02	| ARAM
	TAY				// $15D5  [$1D96E1]  FD		| 
	PLA				// $15D6  [$1D96E2]  AE		| 
	ADDW $46			// $15D7  [$1D96E3]  7A 46	| ARAM
	STAW $46			// $15D9  [$1D96E5]  DA 46	| ARAM
	LDA $020A+X			// $15DB  [$1D96E7]  F5 0A 02	| ARAM
	DEC				// $15DE  [$1D96EA]  9C		| 
	STA $020A+X			// $15DF  [$1D96EB]  D5 0A 02	| ARAM
	BNE code_15F3			// $15E2  [$1D96EE]  D0 0F	| 
	STA $14				// $15E4  [$1D96F0]  C4 14	| ARAM
	STA $46=#$00			// $15E6  [$1D96F2]  8F 00 46	| ARAM
	LDA $020B+X			// $15E9  [$1D96F5]  F5 0B 02	| ARAM
	STA $47				// $15EC  [$1D96F8]  C4 47	| ARAM
	BNE code_15F3			// $15EE  [$1D96FA]  D0 03	| 
	CALL code_0BD4			// $15F0  [$1D96FC]  3F D4 0B	| 
code_15F3:				//				| 
	LDA $46				// $15F3  [$1D96FF]  E4 46	| ARAM
	STA $0208+X			// $15F5  [$1D9701]  D5 08 02	| ARAM
	LDA $47				// $15F8  [$1D9704]  E4 47	| ARAM
	STA $0209+X			// $15FA  [$1D9706]  D5 09 02	| ARAM
	LDA #$FF			// $15FD  [$1D9709]  E8 FF	| 
	STA $020E+X			// $15FF  [$1D970B]  D5 0E 02	| ARAM
code_1602:				//				| 
	CALL code_1324			// $1602  [$1D970E]  3F 24 13	| 
code_1605:				//				| 
	CALL code_1611			// $1605  [$1D9711]  3F 11 16	| 
	CALL code_1336			// $1608  [$1D9714]  3F 36 13	| 
	CMP $02=#$08			// $160B  [$1D9717]  78 08 02	| ARAM
	BNE code_1605			// $160E  [$1D971A]  D0 F5	| 
	RET				// $1610  [$1D971C]  6F		| 

code_1611:				//------------------------------| 
	LDX $28				// $1611  [$1D971D]  F8 28	| ARAM
	LDA $0209+X			// $1613  [$1D971F]  F5 09 02	| ARAM
	LDX $26				// $1616  [$1D9722]  F8 26	| ARAM
	CMP #$00			// $1618  [$1D9724]  68 00	| 
	BNE code_1625			// $161A  [$1D9726]  D0 09	| 
	LDA #$00			// $161C  [$1D9728]  E8 00	| 
	STA $4F+X			// $161E  [$1D972A]  D4 4F	| ARAM
	STA $50+X			// $1620  [$1D972C]  D4 50	| ARAM
	JMP code_173F			// $1622  [$1D972E]  5F 3F 17	| 

code_1625:				//				| 
	LDA $0301+X			// $1625  [$1D9731]  F5 01 03	| ARAM
	BEQ code_165D			// $1628  [$1D9734]  F0 33	| 
	LDX $28				// $162A  [$1D9736]  F8 28	| ARAM
	LDA $020E+X			// $162C  [$1D9738]  F5 0E 02	| ARAM
	ORA $04				// $162F  [$1D973B]  04 04	| ARAM
	STA $020E+X			// $1631  [$1D973D]  D5 0E 02	| ARAM
	LDX $26				// $1634  [$1D9740]  F8 26	| ARAM
	LDA $0301+X			// $1636  [$1D9742]  F5 01 03	| ARAM
	DEC				// $1639  [$1D9745]  9C		| 
	STA $0301+X			// $163A  [$1D9746]  D5 01 03	| ARAM
	BNE code_1649			// $163D  [$1D9749]  D0 0A	| 
	LDA #$00			// $163F  [$1D974B]  E8 00	| 
	STA $0320+X			// $1641  [$1D974D]  D5 20 03	| ARAM
	LDA $0360+X			// $1644  [$1D9750]  F5 60 03	| ARAM
	BRA code_165A			// $1647  [$1D9753]  2F 11	| 
code_1649:				//				| 
	LDA $0340+X			// $1649  [$1D9755]  F5 40 03	| ARAM
	CLRC				// $164C  [$1D9758]  60		| 
	ADC $0320+X			// $164D  [$1D9759]  95 20 03	| ARAM
	STA $0320+X			// $1650  [$1D975C]  D5 20 03	| ARAM
	LDA $0321+X			// $1653  [$1D975F]  F5 21 03	| ARAM
	CLRC				// $1656  [$1D9762]  60		| 
	ADC $0341+X			// $1657  [$1D9763]  95 41 03	| ARAM
code_165A:				//				| 
	STA $0321+X			// $165A  [$1D9766]  D5 21 03	| ARAM
code_165D:				//				| 
	LDA $0561+X			// $165D  [$1D9769]  F5 61 05	| ARAM
	STA $46				// $1660  [$1D976C]  C4 46	| ARAM
	BEQ code_1698			// $1662  [$1D976E]  F0 34	| 
	LDA $0581+X			// $1664  [$1D9770]  F5 81 05	| ARAM
	CMP $0542+X			// $1667  [$1D9773]  75 42 05	| ARAM
	BNE code_1691			// $166A  [$1D9776]  D0 25	| 
	LDX $28				// $166C  [$1D9778]  F8 28	| ARAM
	LDA $020E+X			// $166E  [$1D977A]  F5 0E 02	| ARAM
	ORA $04				// $1671  [$1D977D]  04 04	| ARAM
	STA $020E+X			// $1673  [$1D977F]  D5 0E 02	| ARAM
	LDX $26				// $1676  [$1D9782]  F8 26	| ARAM
	LDA $0541+X			// $1678  [$1D9784]  F5 41 05	| ARAM
	BPL code_1685			// $167B  [$1D9787]  10 08	| 
	INC $46				// $167D  [$1D9789]  AB 46	| ARAM
	BNE code_1685			// $167F  [$1D978B]  D0 04	| 
	LDA #$80			// $1681  [$1D978D]  E8 80	| 
	BRA code_1689			// $1683  [$1D978F]  2F 04	| 
code_1685:				//				| 
	CLRC				// $1685  [$1D9791]  60		| 
	ADC $0562+X			// $1686  [$1D9792]  95 62 05	| ARAM
code_1689:				//				| 
	STA $0541+X			// $1689  [$1D9795]  D5 41 05	| ARAM
	CALL code_17EC			// $168C  [$1D9798]  3F EC 17	| 
	BRA code_169D			// $168F  [$1D979B]  2F 0C	| 
code_1691:				//				| 
	LDA $0542+X			// $1691  [$1D979D]  F5 42 05	| ARAM
	INC				// $1694  [$1D97A0]  BC		| 
	STA $0542+X			// $1695  [$1D97A1]  D5 42 05	| ARAM
code_1698:				//				| 
	LDA #$FF			// $1698  [$1D97A4]  E8 FF	| 
	CALL code_17F9			// $169A  [$1D97A6]  3F F9 17	| 
code_169D:				//				| 
	LDA $0380+X			// $169D  [$1D97A9]  F5 80 03	| ARAM
	BEQ code_16D4			// $16A0  [$1D97AC]  F0 32	| 
	LDX $28				// $16A2  [$1D97AE]  F8 28	| ARAM
	LDA $020E+X			// $16A4  [$1D97B0]  F5 0E 02	| ARAM
	ORA $04				// $16A7  [$1D97B3]  04 04	| 
	STA $020E+X			// $16A9  [$1D97B5]  D5 0E 02	| ARAM
	LDX $26				// $16AC  [$1D97B8]  F8 26	| ARAM
	LDA $0380+X			// $16AE  [$1D97BA]  F5 80 03	| ARAM
	DEC				// $16B1  [$1D97BD]  9C		| 
	STA $0380+X			// $16B2  [$1D97BE]  D5 80 03	| ARAM
	BNE code_16C1			// $16B5  [$1D97C1]  D0 0A	| 
	LDA #$00			// $16B7  [$1D97C3]  E8 00	| 
	STA $03A0+X			// $16B9  [$1D97C5]  D5 A0 03	| ARAM
	LDA $03E0+X			// $16BC  [$1D97C8]  F5 E0 03	| ARAM
	BRA code_16D1			// $16BF  [$1D97CB]  2F 10	| 
code_16C1:				//				| 
	LDA $03C0+X			// $16C1  [$1D97CD]  F5 C0 03	| ARAM
	CLRC				// $16C4  [$1D97D0]  60		| 
	ADC $03A0+X			// $16C5  [$1D97D1]  95 A0 03	| ARAM
	STA $03A0+X			// $16C8  [$1D97D4]  D5 A0 03	| ARAM
	LDA $03A1+X			// $16CB  [$1D97D7]  F5 A1 03	| ARAM
	ADC $03C1+X			// $16CE  [$1D97DA]  95 C1 03	| ARAM
code_16D1:				//				| 
	STA $03A1+X			// $16D1  [$1D97DD]  D5 A1 03	| ARAM
code_16D4:				//				| 
	LDX $28				// $16D4  [$1D97E0]  F8 28	| ARAM
	LDA $020E+X			// $16D6  [$1D97E2]  F5 0E 02	| ARAM
	LDX $26				// $16D9  [$1D97E5]  F8 26	| ARAM
	AND $04				// $16DB  [$1D97E7]  24 04	| ARAM
	BEQ code_173F			// $16DD  [$1D97E9]  F0 60	| 
	LDA $29				// $16DF  [$1D97EB]  E4 29	| ARAM
	BNE code_16EE			// $16E1  [$1D97ED]  D0 0B	| 
	LDA $03A1+X			// $16E3  [$1D97EF]  F5 A1 03	| ARAM
	TAY				// $16E6  [$1D97F2]  FD		| 
	LDA $03A0+X			// $16E7  [$1D97F3]  F5 A0 03	| ARAM
	STAW $21			// $16EA  [$1D97F6]  DA 21	| ARAM
	BRA code_16F4			// $16EC  [$1D97F8]  2F 06	| 
code_16EE:				//				| 
	STA $22=#$0A			// $16EE  [$1D97FA]  8F 0A 22	| ARAM
	STA $21=#$00			// $16F1  [$1D97FD]  8F 00 21	| ARAM
code_16F4:				//------------------------------| 
	STA $46=#$00			// $16F4  [$1D9800]  8F 00 46	| ARAM
code_16F7:				//				| 
	LDY $22				// $16F7  [$1D9803]  EB 22	| ARAM
	LDA data_188B+1+Y		// $16F9  [$1D9805]  F6 8C 18	| ARAM (ROM table)
	SETC				// $16FC  [$1D9808]  80		| 
	SBC data_188B+Y			// $16FD  [$1D9809]  B6 8B 18	| ARAM (ROM table)
	LDY $21				// $1700  [$1D980C]  EB 21	| ARAM
	MUL				// $1702  [$1D980E]  CF		| 
	TYA				// $1703  [$1D980F]  DD		| 
	LDY $22				// $1704  [$1D9810]  EB 22	| ARAM
	CLRC				// $1706  [$1D9812]  60		| 
	ADC data_188B+Y			// $1707  [$1D9813]  96 8B 18	| ARAM (ROM table)
	TAY				// $170A  [$1D9816]  FD		| 
	LDA $0361+X			// $170B  [$1D9817]  F5 61 03	| ARAM
	MUL				// $170E  [$1D981A]  CF		| 
	LDA $03E1+X			// $170F  [$1D981B]  F5 E1 03	| ARAM
	ASL				// $1712  [$1D981E]  1C		| 
	BBC $46.0=code_1717		// $1713  [$1D981F]  13 46 01	| ARAM
	ASL				// $1716  [$1D9822]  1C		| 
code_1717:				//				| 
	TYA				// $1717  [$1D9823]  DD		| 
	BCC code_171D			// $1718  [$1D9824]  90 03	| 
	EOR #$FF			// $171A  [$1D9826]  48 FF	| 
	INC				// $171C  [$1D9828]  BC		| 
code_171D:				//				| 
	PHA				// $171D  [$1D9829]  2D		| 
	LDA $46				// $171E  [$1D982A]  E4 46	| ARAM
	BNE code_1728			// $1720  [$1D982C]  D0 06	| 
	PLA				// $1722  [$1D982E]  AE		| 
	STA $0661+X			// $1723  [$1D982F]  D5 61 06	| 
	BRA code_172C			// $1726  [$1D9832]  2F 04	| 
code_1728:				//				| 
	PLA				// $1728  [$1D9834]  AE		| 
	STA $0662+X			// $1729  [$1D9835]  D5 62 06	| ARAM
code_172C:				//				| 
	LDY #$14			// $172C  [$1D9838]  8D 14	| 
	LDA #$00			// $172E  [$1D983A]  E8 00	| 
	SUBW $21			// $1730  [$1D983C]  9A 21	| ARAM
	STAW $21			// $1732  [$1D983E]  DA 21	| ARAM
	INC $46				// $1734  [$1D9840]  AB 46	| ARAM
	BBC $46.1=code_16F7		// $1736  [$1D9842]  33 46 BE	| ARAM
	LDA $50+X			// $1739  [$1D9845]  F4 50	| ARAM
	ORA #$10			// $173B  [$1D9847]  08 10	| 
	STA $50+X			// $173D  [$1D9849]  D4 50	| ARAM
code_173F:				//------------------------------| 
	RET				// $173F  [$1D984B]  6F		| 


null_1740:				//???????????????????????????????| 
	LDA $0400+X			// $1740  [$1D984C]  F5 00 04	| ARAM
	BNE addr_176B			// $1743  [$1D984F]  D0 26	| 
	CALL null_1383			// $1745  [$1D9851]  3F 83 13	| 
	CMP #$C8			// $1748  [$1D9854]  68 C8	| 
	BNE addr_176B			// $174A  [$1D9856]  D0 1F	| 
	CALL code_1364			// $174C  [$1D9858]  3F 64 13	| 
	CALL code_176C			// $174F  [$1D985B]  3F 6C 17	| 

code_1752:				//------------------------------| 
	AND #$7F			// $1752  [$1D985E]  28 7F	| 
	STA $0460+X			// $1754  [$1D9860]  D5 60 04	| ARAM
	SETC				// $1757  [$1D9863]  80		| 
	SBC $0421+X			// $1758  [$1D9864]  B5 21 04	| ARAM
	PHA				// $175B  [$1D9867]  2D		| 
	LDA $0400+X			// $175C  [$1D9868]  F5 00 04	| ARAM
	TAX				// $175F  [$1D986B]  5D		| 
	PLA				// $1760  [$1D986C]  AE		| 
	CALL code_1798			// $1761  [$1D986D]  3F 98 17	| 
	STA $0440+X			// $1764  [$1D9870]  D5 40 04	| ARAM
	TYA				// $1767  [$1D9873]  DD		| 
	STA $0441+X			// $1768  [$1D9874]  D5 41 04	| ARAM
addr_176B:				//				| 
	RET				// $176B  [$1D9877]  6F		| 


code_176C:				//------------------------------| 
	CALL code_1364			// $176C  [$1D9878]  3F 64 13	| 
	STA $0401+X			// $176F  [$1D987B]  D5 01 04	| ARAM
	CALL code_1364			// $1772  [$1D987E]  3F 64 13	| 
	STA $0461+X			// $1775  [$1D9881]  D5 61 04	| ARAM
	CALL code_1364			// $1778  [$1D9884]  3F 64 13	| 
	CLRC				// $177B  [$1D9887]  60		| 
	LDX $28				// $177C  [$1D9888]  F8 28	| ARAM
	ADC $020F+X			// $177E  [$1D988A]  95 0F 02	| ARAM
	LDX $26				// $1781  [$1D988D]  F8 26	| ARAM
	CLRC				// $1783  [$1D988F]  60		| 
	ADC $02A1+X			// $1784  [$1D9890]  95 A1 02	| ARAM
	AND #$7F			// $1787  [$1D9893]  28 7F	| 
	STA $0460+X			// $1789  [$1D9895]  D5 60 04	| ARAM
	RET				// $178C  [$1D9898]  6F		| 


code_178D:				//------------------------------| 
	LDA $0421+X			// $178D  [$1D9899]  F5 21 04	| ARAM
	STA $22				// $1790  [$1D989C]  C4 22	| ARAM
	LDA $0420+X			// $1792  [$1D989E]  F5 20 04	| ARAM
	STA $21				// $1795  [$1D98A1]  C4 21	| ARAM
	RET				// $1797  [$1D98A3]  6F		| 


code_1798:				//------------------------------| 
	NOTC				// $1798  [$1D98A4]  ED		| 
	ROR $23				// $1799  [$1D98A5]  6B 23	| ARAM
	BPL code_17A0			// $179B  [$1D98A7]  10 03	| 
	EOR #$FF			// $179D  [$1D98A9]  48 FF	| 
	INC				// $179F  [$1D98AB]  BC		| 
code_17A0:				//				| 
	LDY #$00			// $17A0  [$1D98AC]  8D 00	| 
	DIV				// $17A2  [$1D98AE]  9E		| 
	PHA				// $17A3  [$1D98AF]  2D		| 
	LDA #$00			// $17A4  [$1D98B0]  E8 00	| 
	DIV				// $17A6  [$1D98B2]  9E		| 
	PLY				// $17A7  [$1D98B3]  EE		| 
	LDX $26				// $17A8  [$1D98B4]  F8 26	| ARAM
code_17AA:				//				| 
	BBC $23.7=code_17B3		// $17AA  [$1D98B6]  F3 23 06	| ARAM
	STAW $46			// $17AD  [$1D98B9]  DA 46	| ARAM
	LDAW $00			// $17AF  [$1D98BB]  BA 00	| ARAM
	SUBW $46			// $17B1  [$1D98BD]  9A 46	| ARAM
code_17B3:				//				| 
	RET				// $17B3  [$1D98BF]  6F		| 


code_17B4:				//------------------------------| 
	SET1 $4E.7			// $17B4  [$1D98C0]  E2 4E	| ARAM
	STY $23				// $17B6  [$1D98C2]  CB 23	| ARAM
	CALL code_17AA			// $17B8  [$1D98C4]  3F AA 17	| 
	PHY				// $17BB  [$1D98C7]  6D		| 
	TAY				// $17BC  [$1D98C8]  FD		| 
	LDX $28				// $17BD  [$1D98C9]  F8 28	| ARAM
	LDA $0203+X			// $17BF  [$1D98CB]  F5 03 02	| ARAM
	MUL				// $17C2  [$1D98CE]  CF		| 
	STY $46				// $17C3  [$1D98CF]  CB 46	| 
	STA $47=#$00			// $17C5  [$1D98D1]  8F 00 47	| ARAM
	LDA $0203+X			// $17C8  [$1D98D4]  F5 03 02	| ARAM
	PLY				// $17CB  [$1D98D7]  EE		| 
	MUL				// $17CC  [$1D98D8]  CF		| 
	ADDW $46			// $17CD  [$1D98D9]  7A 46	| ARAM
	LDX $26				// $17CF  [$1D98DB]  F8 26	| ARAM
code_17D1:				//------------------------------| 
	CALL code_17AA			// $17D1  [$1D98DD]  3F AA 17	| 
	ADDW $21			// $17D4  [$1D98E0]  7A 21	| ARAM
	STAW $21			// $17D6  [$1D98E2]  DA 21	| ARAM
	RET				// $17D8  [$1D98E4]  6F		| 


code_17D9:				//------------------------------| 
	SET1 $4E.7			// $17D9  [$1D98E5]  E2 4E	| ARAM
	LDX $28				// $17DB  [$1D98E7]  F8 28	| ARAM
	LDA $0203+X			// $17DD  [$1D98E9]  F5 03 02	| ARAM
	LDX $26				// $17E0  [$1D98EC]  F8 26	| ARAM
	TAY				// $17E2  [$1D98EE]  FD		| 
	LDA $0562+X			// $17E3  [$1D98EF]  F5 62 05	| ARAM
	MUL				// $17E6  [$1D98F2]  CF		| 
	TYA				// $17E7  [$1D98F3]  DD		| 
	CLRC				// $17E8  [$1D98F4]  60		| 
	ADC $0541+X			// $17E9  [$1D98F5]  95 41 05	| ARAM
code_17EC:				//------------------------------| 
	ASL				// $17EC  [$1D98F8]  1C		| 
	BCC code_17F1			// $17ED  [$1D98F9]  90 02	| 
	EOR #$FF			// $17EF  [$1D98FB]  48 FF	| 
code_17F1:				//				| 
	TAY				// $17F1  [$1D98FD]  FD		| 
	LDA $0561+X			// $17F2  [$1D98FE]  F5 61 05	| ARAM
	MUL				// $17F5  [$1D9901]  CF		| 
	TYA				// $17F6  [$1D9902]  DD		| 
	EOR #$FF			// $17F7  [$1D9903]  48 FF	| 
code_17F9:				//------------------------------| 
	TAY				// $17F9  [$1D9905]  FD		| 
	LDX $28				// $17FA  [$1D9906]  F8 28	| ARAM
	LDA $0209+X			// $17FC  [$1D9908]  F5 09 02	| ARAM
	LDX $26				// $17FF  [$1D990B]  F8 26	| 
	MUL				// $1801  [$1D990D]  CF		| 
	LDA $0300+X			// $1802  [$1D990E]  F5 00 03	| ARAM
	MUL				// $1805  [$1D9911]  CF		| 
	LDA $0321+X			// $1806  [$1D9912]  F5 21 03	| ARAM
	MUL				// $1809  [$1D9915]  CF		| 
	TYA				// $180A  [$1D9916]  DD		| 
	STA $0361+X			// $180B  [$1D9917]  D5 61 03	| ARAM
	RET				// $180E  [$1D991A]  6F		| 


code_180F:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	CALL code_1364			// $180F  [$1D991B]  3F 64 13	| 
	STA $0581+X			// $1812  [$1D991E]  D5 81 05	| ARAM
	CALL code_1364			// $1815  [$1D9921]  3F 64 13	| 
	STA $0562+X			// $1818  [$1D9924]  D5 62 05	| ARAM
	CALL code_1364			// $181B  [$1D9927]  3F 64 13	| 
	BRA code_1822			// $181E  [$1D992A]  2F 02	| 
code_1820:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	LDA #$00			// $1820  [$1D992C]  E8 00	| 
code_1822:				//				| 
	STA $0561+X			// $1822  [$1D992E]  D5 61 05	| ARAM
	LDA #$00			// $1825  [$1D9931]  E8 00	| 
	JMP code_084C			// $1827  [$1D9933]  5F 4C 08	| 


code_182A:				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| 
	CALL code_1364			// $182A  [$1D9936]  3F 64 13	| 
	ORA #$80			// $182D  [$1D9939]  08 80	| 
	STA $06A2+X			// $182F  [$1D993B]  D5 A2 06	| ARAM
	CALL code_1364			// $1832  [$1D993E]  3F 64 13	| 
	STA $06C1+X			// $1835  [$1D9941]  D5 C1 06	| ARAM
	LDA $50+X			// $1838  [$1D9944]  F4 50	| ARAM
	ORA #$20			// $183A  [$1D9946]  08 20	| 
	STA $50+X			// $183C  [$1D9948]  D4 50	| 
	JMP code_084C			// $183E  [$1D994A]  5F 4C 08	| 


data_1841:				//------------------------------| 
	dw $085F,$08DE
	dw $0965,$09F4
	dw $0A8C,$0B2C
	dw $0BD6,$0C8B
	dw $0D4A,$0E14
	dw $0EEA,$0FCD
	dw $10BE


data_185B:				//------------------------------| 
	db $7F,$00,$00,$00
	db $00,$00,$00,$00
	db $58,$BF,$DB,$F0
	db $FE,$07,$0C,$0C
	db $0C,$21,$2B,$2B
	db $13,$FE,$F3,$F9
	db $34,$33,$00,$D9
	db $E5,$01,$FC,$EB


data_187B:				//------------------------------| 
	db $08,$11,$19,$22
	db $2A,$33,$3B,$44
	db $4C,$55,$5D,$66
	db $6E,$79,$7E,$7F


data_188B:				//------------------------------| 
	db $00,$02,$06,$0E
	db $1A,$2A,$3C,$52
	db $68,$82,$A2,$BC
	db $CE,$DC,$E6,$EE
	db $F4,$F8,$FA,$FD
	db $FF


data_18A0:				//------------------------------| 
	db $07,$0F,$17,$1F
	db $27,$2F,$37,$3F
	db $47,$4F,$57,$5F
	db $67,$6F,$77,$7F


data_18B0:				//------------------------------| 
	db $0F,$1F,$2F,$3F
	db $4F,$5F,$6F,$7F
	db $8F,$9F,$AF,$BF
	db $CF,$DF,$EF,$FF


ptrs_18C0:				//==============================| 
	dw code_0AA7
	dw code_0AB8
	dw code_0AC6
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_0AD4
	dw code_0ADD
	dw code_0AE7
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_08BF
	dw code_08BF
	dw code_08BF
	dw code_08BF
	dw code_08BF
	dw code_08BF
	dw code_08BF
	dw code_08BF
	dw code_08BF
	dw code_08BF
	dw code_08BF
	dw code_08BF
	dw code_08BF
	dw code_08BF
	dw code_08BF
	dw code_08BF
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_182A
	dw code_0915
	dw code_0915
	dw code_0915
	dw code_0915
	dw code_0915
	dw code_0915
	dw code_0915
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_095C
	dw code_0965
	dw code_08BC
	dw code_096E
	dw code_09B0
	dw code_09C6
	dw code_08BC
	dw code_09CF
	dw code_09D5
	dw code_09D8
	dw code_08BC
	dw code_09E3
	dw code_09E6
	dw code_09E9
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_09EC
	dw code_0A06
	dw code_0A69
	dw code_0A88
	dw code_0A0F
	dw code_0926
	dw code_0A4D
	dw code_0A5B
	dw code_0D7F
	dw code_0D90
	dw code_0DA0
	dw code_0BB3
	dw code_180F
	dw code_1820
	dw code_08BC
	dw code_08BC
	dw code_0AF1
	dw code_0B00
	dw code_0B14
	dw code_0B28
	dw code_0B4A
	dw code_0B69
	dw code_0B78
	dw code_0B8A
	dw code_0BD4
	dw code_08DF
	dw code_08CD
	dw code_0D41
	dw code_0D76
	dw code_0D29
	dw code_0BBC
	dw code_0BC5

ptrs_1A20:				//==============================| 
	dw code_0AA7
	dw code_0AB8
	dw code_0AC6
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_0AD4
	dw code_0ADD
	dw code_0AE7
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_08BF
	dw code_08BF
	dw code_08BF
	dw code_08BF
	dw code_08BF
	dw code_08BF
	dw code_08BF
	dw code_08BF
	dw code_08BF
	dw code_08BF
	dw code_08BF
	dw code_08BF
	dw code_08BF
	dw code_08BF
	dw code_08BF
	dw code_08BF
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_182A
	dw code_0915
	dw code_0915
	dw code_0915
	dw code_0915
	dw code_0915
	dw code_0915
	dw code_0915
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_095C
	dw code_0965
	dw code_08BC
	dw code_096E
	dw code_09B0
	dw code_09C6
	dw code_08BC
	dw code_09CF
	dw code_09D5
	dw code_09D8
	dw code_08BC
	dw code_09E3
	dw code_09E6
	dw code_09E9
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_09EC
	dw code_0A06
	dw code_0A69
	dw code_0A88
	dw code_0A0F
	dw code_0926
	dw code_0A4D
	dw code_0A5B
	dw code_0D7F
	dw code_0D90
	dw code_0DA0
	dw code_0BB3
	dw code_180F
	dw code_1820
	dw code_08BC
	dw code_08BC
	dw code_0AF1
	dw code_0B00
	dw code_0B14
	dw code_0B28
	dw code_0B4A
	dw code_0B69
	dw code_0B78
	dw code_0B8A
	dw code_0BD4
	dw code_08DF
	dw code_08CD
	dw code_0D41
	dw code_0D76
	dw code_0D29
	dw code_0BBC
	dw code_0BC5

ptrs_1B80:				//==============================| 
	dw code_0AA7
	dw code_0AB8
	dw code_0AC6
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_0AD4
	dw code_0ADD
	dw code_0AE7
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_0935
	dw code_08BF
	dw code_08BF
	dw code_08BF
	dw code_08BF
	dw code_08BF
	dw code_08BF
	dw code_08BF
	dw code_08BF
	dw code_08BF
	dw code_08BF
	dw code_08BF
	dw code_08BF
	dw code_08BF
	dw code_08BF
	dw code_08BF
	dw code_08BF
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_182A
	dw code_0915
	dw code_0915
	dw code_0915
	dw code_0915
	dw code_0915
	dw code_0915
	dw code_0915
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_095C
	dw code_0965
	dw code_08BC
	dw code_096E
	dw code_09B0
	dw code_09C6
	dw code_08BC
	dw code_09CF
	dw code_09D5
	dw code_09D8
	dw code_08BC
	dw code_09E3
	dw code_09E6
	dw code_09E9
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_08BC
	dw code_09EC
	dw code_0A06
	dw code_0A69
	dw code_0A88
	dw code_0A0F
	dw code_0926
	dw code_0A4D
	dw code_0A5B
	dw code_0D7F
	dw code_0D90
	dw code_0DA0
	dw code_0BB3
	dw code_180F
	dw code_1820
	dw code_08BC
	dw code_08BC
	dw code_0AF1
	dw code_0B00
	dw code_0B14
	dw code_0B28
	dw code_0B4A
	dw code_0B69
	dw code_0B78
	dw code_0B8A
	dw code_0BD4
	dw code_08DF
	dw code_08CD
	dw code_0D41
	dw code_0D76
	dw code_0D29
	dw code_0BBC
	dw code_0DB6



spc_code_end:				//==============================| 

pullbase()

	dw spc_engine_end-data_1D20,data_1D20

pushbase($1D20)


data_1D20:				//------------------------------| not sure what this is
	dw $0A02,$3000
	dw $0A05,$3000
	dw $0A07,$3000
	dw $0A01,$3000
	dw $0A06,$3000
	dw $0A07,$3000
	dw $0403,$3300
	dw $0803,$2F00
	dw $0C03,$2A00
	dw $1003,$2700
	dw $0A04,$3000

spc_engine_end:				//==============================| end of data	RAM address to jump to
	dw $0000,spc_engine

pullbase()
architecture wdc65816