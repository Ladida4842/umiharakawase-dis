sample_point:
dl	$000000
dl	sample_01.loc, sample_02.loc, sample_03.loc, sample_04.loc
dl	sample_05.loc, sample_06.loc, sample_07.loc, sample_08.loc
dl	sample_09.loc, sample_0A.loc, sample_0B.loc, sample_0C.loc
dl	sample_0D.loc, sample_0E.loc, sample_0F.loc, sample_10.loc
dl	sample_11.loc, sample_12.loc, sample_13.loc, sample_14.loc
dl	sample_15.loc, sample_16.loc, sample_17.loc, sample_18.loc
dl	sample_19.loc, sample_1A.loc, sample_1B.loc, sample_1C.loc

sample_offsets:
dl	$000000
dl	sample_01.off, sample_02.off, sample_03.off, sample_04.off
dl	sample_05.off, sample_06.off, sample_07.off, sample_08.off
dl	sample_09.off, sample_0A.off, sample_0B.off, sample_0C.off
dl	sample_0D.off, sample_0E.off, sample_0F.off, sample_10.off
dl	sample_11.off, sample_12.off, sample_13.off, sample_14.off
dl	sample_15.off, sample_16.off, sample_17.off, sample_18.off
dl	sample_19.off, sample_1A.off, sample_1B.off, sample_1C.off


function sample_01 {
	db $04,$00,$00,$00
	off:;	dw $0010,$03B8
	loc:;	dw sample.size
		dw $0010
	insert sample, "sample_01.brr"
	db $00,$00,$00,$08
	macro tuning() {
		db $00,$FF,$E0,$B8,$03,$D0
	}
}

function sample_02 {
	db $04,$00,$00,$00
	off:;	dw $0010,$08DA
	loc:;	dw sample.size
		dw $0010
	insert sample, "sample_02.brr"
	db $00,$00,$00,$08
	macro tuning() {
		db $00,$FF,$E0,$B8,$03,$D0
	}
}

function sample_03 {
	db $04,$00,$00,$00
	off:;	dw $0010,$07C3
	loc:;	dw sample.size
		dw $0010
	insert sample, "sample_03.brr"
	db $00,$00,$00,$08
	macro tuning() {
		db $00,$FF,$E0,$B8,$03,$D0
	}
}

function sample_04 {
	db $04,$00,$00,$00
	off:;	dw $0010,$0595
	loc:;	dw sample.size
		dw $0010
	insert sample, "sample_04.brr"
	db $00,$00,$00,$08
	macro tuning() {
		db $00,$FF,$E0,$B8,$03,$D0
	}
}

function sample_05 {
	db $04,$00,$00,$00
	off:;	dw $0010,$03AF
	loc:;	dw sample.size
		dw $0010
	insert sample, "sample_05.brr"
	db $00,$00,$00,$08
	macro tuning() {
		db $00,$FF,$E0,$B8,$03,$D0
	}
}

function sample_06 {
	db $04,$00,$00,$00
	off:;	dw $0010,$03B8
	loc:;	dw sample.size
		dw $0010
	insert sample, "sample_06.brr"
	db $00,$00,$00,$08
	macro tuning() {
		db $00,$FF,$E0,$B8,$03,$D0
	}
}

function sample_07 {
	db $04,$00,$00,$00
	off:;	dw $0010,$065B
	loc:;	dw sample.size
		dw $0010
	insert sample, "sample_07.brr"
	db $00,$00,$00,$08
	macro tuning() {
		db $00,$FF,$ED,$B8,$03,$D0
	}
}

function sample_08 {
	db $04,$00,$00,$00
	off:;	dw $0010,$0367
	loc:;	dw sample.size
		dw $0010
	insert sample, "sample_08.brr"
	db $00,$00,$00,$08
	macro tuning() {
		db $00,$FF,$E0,$B8,$09,$00
	}
}

function sample_09 {
	db $04,$00,$00,$00
	off:;	dw $0010,$0019
	loc:;	dw sample.size
		dw $0010
	insert sample, "sample_09.brr"
	db $00,$00,$00,$08
	macro tuning() {
		db $00,$FF,$E0,$B8,$02,$40
	}
}

function sample_0A {
	db $04,$00,$00,$00
	off:;	dw $0010,$0166
	loc:;	dw sample.size
		dw $0010
	insert sample, "sample_0A.brr"
	db $00,$00,$00,$08
	macro tuning() {
		db $00,$FF,$F6,$B8,$02,$00
	}
}

function sample_0B {
	db $04,$00,$00,$00
	off:;	dw $0010,$039D
	loc:;	dw sample.size
		dw $0010
	insert sample, "sample_0B.brr"
	db $00,$00,$00,$08
	macro tuning() {
		db $00,$FF,$E0,$B8,$02,$40
	}
}

function sample_0C {
	db $04,$00,$00,$00
	off:;	dw $0010,$06F4
	loc:;	dw sample.size
		dw $0010
	insert sample, "sample_0C.brr"
	db $00,$00,$00,$08
	macro tuning() {
		db $00,$FF,$F1,$B8,$02,$40
	}
}

function sample_0D {
	db $04,$00,$00,$00
	off:;	dw $0010,$039D
	loc:;	dw sample.size
		dw $0010
	insert sample, "sample_0D.brr"
	db $00,$00,$00,$08
	macro tuning() {
		db $00,$FF,$F2,$B8,$04,$00
	}
}

function sample_0E {
	db $04,$00,$00,$00
	off:;	dw $0010,$03C1
	loc:;	dw sample.size
		dw $0010
	insert sample, "sample_0E.brr"
	db $00,$00,$00,$08
	macro tuning() {
		db $00,$FF,$F1,$B8,$02,$00
	}
}

function sample_0F {
	db $04,$00,$00,$00
	off:;	dw $0010,$03CA
	loc:;	dw sample.size
		dw $0010
	insert sample, "sample_0F.brr"
	db $00,$00,$00,$08
	macro tuning() {
		db $00,$FF,$E0,$B8,$02,$40
	}
}

function sample_10 {
	db $04,$00,$00,$00
	off:;	dw $0010,$04F3
	loc:;	dw sample.size
		dw $0010
	insert sample, "sample_10.brr"
	db $00,$00,$00,$08
	macro tuning() {
		db $00,$FF,$E0,$B8,$02,$20
	}
}

function sample_11 {
	db $04,$00,$00,$00
	off:;	dw $0010,$0103
	loc:;	dw sample.size
		dw $0010
	insert sample, "sample_11.brr"
	db $00,$00,$00,$08
	macro tuning() {
		db $00,$FF,$E0,$B8,$01,$00
	}
}

function sample_12 {
	db $04,$00,$00,$00
	off:;	dw $0010,$0463
	loc:;	dw sample.size
		dw $0010
	insert sample, "sample_12.brr"
	db $00,$00,$00,$08
	macro tuning() {
		db $00,$FF,$EE,$B8,$04,$00
	}
}

function sample_13 {
	db $04,$00,$00,$00
	off:;	dw $0010,$03AF
	loc:;	dw sample.size
		dw $0010
	insert sample, "sample_13.brr"
	db $00,$00,$00,$08
	macro tuning() {
		db $00,$FF,$EE,$B8,$02,$B0
	}
}

function sample_14 {
	db $04,$00,$00,$00
	off:;	dw $0010,$0475
	loc:;	dw sample.size
		dw $0010
	insert sample, "sample_14.brr"
	db $00,$00,$00,$08
	macro tuning() {
		db $00,$FF,$E0,$B8,$03,$D0
	}
}

function sample_15 {
	db $04,$00,$00,$00
	off:;	dw $0010,$089B
	loc:;	dw sample.size
		dw $0010
	insert sample, "sample_15.brr"
	db $00,$00,$00,$08
	macro tuning() {
		db $00,$FF,$E0,$B8,$03,$10
	}
}

function sample_16 {
	db $04,$00,$00,$00
	off:;	dw $0010,$0B59
	loc:;	dw sample.size
		dw $0010
	insert sample, "sample_16.brr"
	db $00,$00,$00,$08
	macro tuning() {
		db $00,$FF,$E0,$B8,$03,$10
	}
}

function sample_17 {
	db $04,$00,$00,$00
	off:;	dw $0010,$0934
	loc:;	dw sample.size
		dw $0010
	insert sample, "sample_17.brr"
	db $00,$00,$00,$08
	macro tuning() {
		db $00,$FF,$E0,$B8,$03,$10
	}
}

function sample_18 {
	db $04,$00,$00,$00
	off:;	dw $0010,$0019
	loc:;	dw sample.size
		dw $0010
	insert sample, "sample_18.brr"
	db $00,$00,$00,$08
	macro tuning() {
		db $00,$FF,$E0,$B8,$00,$80
	}
}

function sample_19 {
	db $04,$00,$00,$00
	off:;	dw $0010,$0022
	loc:;	dw sample.size
		dw $0010
	insert sample, "sample_19.brr"
	db $00,$00,$00,$08
	macro tuning() {
		db $00,$FF,$E0,$B8,$03,$F0
	}
}

function sample_1A {
	db $04,$00,$00,$00
	off:;	dw $0010,$0019
	loc:;	dw sample.size
		dw $0010
	insert sample, "sample_1A.brr"
	db $00,$00,$00,$08
	macro tuning() {
		db $00,$FF,$E0,$B8,$04,$00
	}
}

function sample_1B {
	db $04,$00,$00,$00
	off:;	dw $0010,$0019
	loc:;	dw sample.size
		dw $0010
	insert sample, "sample_1B.brr"
	db $00,$00,$00,$08
	macro tuning() {
		db $00,$FF,$E0,$B8,$04,$00
	}
}

function sample_1C {
	db $04,$00,$00,$00
	off:;	dw $0010,$0019
	loc:;	dw sample.size
		dw $0010
	insert sample, "sample_1C.brr"
	db $00,$00,$00,$08
	macro tuning() {
		db $00,$FF,$E0,$B8,$09,$80
	}
}


sample_tuning:
	db $00,$00,$00,$00,$00,$00
	sample_01.tuning()
	sample_02.tuning()
	sample_03.tuning()
	sample_04.tuning()
	sample_05.tuning()
	sample_06.tuning()
	sample_07.tuning()
	sample_08.tuning()
	sample_09.tuning()
	sample_0A.tuning()
	sample_0B.tuning()
	sample_0C.tuning()
	sample_0D.tuning()
	sample_0E.tuning()
	sample_0F.tuning()
	sample_10.tuning()
	sample_11.tuning()
	sample_12.tuning()
	sample_13.tuning()
	sample_14.tuning()
	sample_15.tuning()
	sample_16.tuning()
	sample_17.tuning()
	sample_18.tuning()
	sample_19.tuning()
	sample_1A.tuning()
	sample_1B.tuning()
	sample_1C.tuning()