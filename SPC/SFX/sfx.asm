sfx_data:	
	dl sfx_data_data

sfx_data_data:
	dw sfx_end-sfx_point
	db $FE,$30

sfx_point:
dw	$0000

pushbase($3100)

dw	sfx_01, sfx_02, sfx_03, sfx_04
dw	sfx_05, sfx_06, sfx_07, sfx_08
dw	sfx_09, sfx_0A, sfx_0B, sfx_0C
dw	sfx_0D, sfx_0E, sfx_0F, sfx_10
dw	sfx_11, sfx_12, sfx_13, sfx_14
dw	sfx_15, sfx_16, sfx_17, sfx_18
dw	sfx_19, sfx_1A


function sfx_01 {
	db $19
	db $00,$00,$00,$00,$00,$00,$00,$01
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,data
	insert data, "sfx_01.bin"
}

function sfx_02 {
	db $19
	db $00,$00,$00,$00,$00,$00,$00,$01
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,data
	insert data, "sfx_02.bin"
}

function sfx_03 {
	db $19
	db $00,$00,$00,$00,$00,$00,$00,$01
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,data
	insert data, "sfx_03.bin"
}

function sfx_04 {
	db $19
	db $00,$00,$00,$00,$00,$00,$00,$01
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,data
	insert data, "sfx_04.bin"
}

function sfx_05 {
	db $25
	db $00,$00,$00,$00,$00,$00,$01,$01
	dw $0000,$0000,$0000,$0000,$0000,$0000,data,data+$10
	insert data, "sfx_05.bin"
}

function sfx_06 {
	db $19
	db $00,$00,$00,$00,$00,$00,$00,$01
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,data
	insert data, "sfx_06.bin"
}

function sfx_07 {
	db $1F
	db $00,$00,$00,$00,$00,$00,$00,$01
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,data
	insert data, "sfx_07.bin"
}

function sfx_08 {
	db $1D
	db $00,$00,$00,$00,$00,$00,$01,$01
	dw $0000,$0000,$0000,$0000,$0000,$0000,data,data+$1F
	insert data, "sfx_08.bin"
}

function sfx_09 {
	db $19
	db $00,$00,$00,$00,$00,$00,$00,$01
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,data
	insert data, "sfx_09.bin"
}

function sfx_0A {
	db $14
	db $00,$00,$00,$00,$00,$00,$00,$01
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,data
	insert data, "sfx_0A.bin"
}

function sfx_0B {
	db $19
	db $00,$00,$00,$00,$00,$00,$00,$01
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,data
	insert data, "sfx_0B.bin"
}

function sfx_0C {
	db $19
	db $00,$00,$00,$00,$00,$00,$00,$01
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,data
	insert data, "sfx_0C.bin"
}

function sfx_0D {
	db $1D
	db $00,$00,$00,$00,$00,$00,$01,$01
	dw $0000,$0000,$0000,$0000,$0000,$0000,data,data+$34
	insert data, "sfx_0D.bin"
}

function sfx_0E {
	db $19
	db $00,$00,$00,$00,$00,$00,$00,$01
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,data
	insert data, "sfx_0E.bin"
}

function sfx_0F {
	db $1F
	db $00,$00,$00,$00,$00,$00,$00,$01
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,data
	insert data, "sfx_0F.bin"
}

function sfx_10 {
	db $19
	db $00,$00,$00,$00,$00,$00,$00,$01
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,data
	insert data, "sfx_10.bin"
}

function sfx_11 {
	db $19
	db $00,$00,$00,$00,$00,$00,$00,$01
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,data
	insert data, "sfx_11.bin"
}

function sfx_12 {
	db $19
	db $00,$00,$00,$00,$00,$00,$01,$01
	dw $0000,$0000,$0000,$0000,$0000,$0000,data,data+$0E
	insert data, "sfx_12.bin"
}

function sfx_13 {
	db $1B
	db $00,$00,$00,$00,$00,$00,$01,$01
	dw $0000,$0000,$0000,$0000,$0000,$0000,data,data+$0C
	insert data, "sfx_13.bin"
}

function sfx_14 {
	db $19
	db $00,$00,$00,$00,$00,$00,$00,$01
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,data
	insert data, "sfx_14.bin"
}

function sfx_15 {
	db $1B
	db $00,$00,$00,$00,$00,$00,$01,$01
	dw $0000,$0000,$0000,$0000,$0000,$0000,data,data+$0C
	insert data, "sfx_15.bin"
}

function sfx_16 {
	db $1D
	db $00,$00,$00,$00,$00,$00,$00,$01
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,data
	insert data, "sfx_16.bin"
}

function sfx_17 {
	db $21
	db $00,$00,$00,$00,$00,$00,$00,$01
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,data
	insert data, "sfx_17.bin"
}

function sfx_18 {
	db $19
	db $00,$00,$00,$00,$00,$00,$00,$01
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,data
	insert data, "sfx_18.bin"
}

function sfx_19 {
	db $1D
	db $00,$00,$00,$00,$00,$00,$01,$01
	dw $0000,$0000,$0000,$0000,$0000,$0000,data,data+$26
	insert data, "sfx_19.bin"
}

function sfx_1A {
	db $1D
	db $00,$00,$00,$00,$00,$00,$01,$01
	dw $0000,$0000,$0000,$0000,$0000,$0000,data,data
	insert data, "sfx_1A.bin"
}

pullbase()

sfx_end:
db $00,$00,$00,$08


sfx_samples:
	db $14,$16,$1C,$1B,$0A,$19,$15,$17,$18,$01,$1A,$00,$00,$00,$00,$00