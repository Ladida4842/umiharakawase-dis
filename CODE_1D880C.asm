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
	CALL code_0DFD			; $07AA  [$1D88B6]  3F FD 0D	| 
	ここ！






code_0BD4				;-------------------------------| 







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

ptrs_0EE4:				;				| 
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
	ここ！
code_0FD3:				;-------------------------------| 
code_1281:				;-------------------------------| 
code_12A0:				;-------------------------------| 





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








code_135A:				;-------------------------------| DSP write
	MOV $F2, Y			; $135A  [$1D9466]  CB F2	| Y contains DSP reg
	MOV $F3, A			; $135C  [$1D9468]  C4 F3	| A contains value
	RET				; $135E  [$1D946A]  6F		| 

code_135F:				;-------------------------------| DSP read
	MOV $F2, Y			; $135F  [$1D946B]  CB F2	| Y contains DSP reg
	MOV A, $F3			; $1361  [$1D946D]  E4 F3	| A will contain value
	RET				; $1363  [$1D946F]  6F		| 







code_1394:				;-------------------------------| 
	MOV $0F, #$00			; $1394  [$1D94A0]  8F 00 0F	| ARAM
	MOV X, #$10			; $1397  [$1D94A3]  CD 10	| 
	MOV $27, X			; $1399  [$1D94A5]  D8 27	| ARAM
	MOV X, #$00			; $139B  [$1D94A7]  CD 00	| 
	MOV $26, X			; $139D  [$1D94A9]  D8 26	| ARAM
	MOV $28, X			; $139F  [$1D94AB]  D8 28	| ARAM
	RET				; $13A1  [$1D94AD]  6F		| 






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






code_1798:				;-------------------------------| 




base off
arch 65816