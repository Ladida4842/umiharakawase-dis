music_point:
dl	song_01, song_02, song_03, song_04
dl	song_05, song_06, song_07, song_08
dl	song_09, song_0A


function song_01 {
	dw song.size
	db $FE,$1F
	insert song, "song_01.bin"
	db $00,$00,$00,$08
	macro samples() {
		db $02,$05,$06,$07,$03,$04,$08,$0C,$0D,$0E,$10,$09,$13,$0B,$19,$00
	}
}

function song_02 {
	dw song.size
	db $FE,$1F
	insert song, "song_02.bin"
	db $00,$00,$00,$08
	macro samples() {
		db $02,$05,$01,$06,$07,$03,$08,$0C,$13,$10,$0F,$12,$19,$00,$00,$00
	}
}

function song_03 {
	dw song.size
	db $FE,$1F
	insert song, "song_03.bin"
	db $00,$00,$00,$08
	macro samples() {
		db $08,$0C,$0E,$10,$09,$19,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	}
}

function song_04 {
	dw song.size
	db $FE,$1F
	insert song, "song_04.bin"
	db $00,$00,$00,$08
	macro samples() {
		db $02,$05,$06,$07,$03,$04,$08,$0C,$10,$09,$13,$19,$00,$00,$00,$00
	}
}

function song_05 {
	dw song.size
	db $FE,$1F
	insert song, "song_05.bin"
	db $00,$00,$00,$08
	macro samples() {
		db $02,$05,$01,$06,$07,$03,$08,$0C,$0E,$0F,$12,$19,$00,$00,$00,$00
	}
}

function song_06 {
	dw song.size
	db $FE,$1F
	insert song, "song_06.bin"
	db $00,$00,$00,$08
	macro samples() {
		db $02,$05,$06,$07,$03,$08,$0F,$0A,$0C,$0D,$10,$11,$19,$00,$00,$00
	}
}

function song_07 {
	dw song.size
	db $FE,$1F
	insert song, "song_07.bin"
	db $00,$00,$00,$08
	macro samples() {
		db $02,$05,$01,$06,$07,$03,$08,$09,$0A,$0C,$0D,$10,$19,$00,$00,$00
	}
}

function song_08 {
	dw song.size
	db $FE,$1F
	insert song, "song_08.bin"
	db $00,$00,$00,$08
	macro samples() {
		db $02,$05,$06,$07,$03,$08,$0A,$0C,$11,$09,$12,$19,$00,$00,$00,$00
	}
}

function song_09 {
	dw song.size
	db $00,$00
	insert song, "song_09.bin"
	db $00,$00,$00,$08
	macro samples() {
		db $08,$19,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	}
}

function song_0A {
	dw song.size
	db $00,$00
	insert song, "song_0A.bin"
	db $00,$00,$00,$08
	macro samples() {
		db $08,$19,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	}
}


song_samples:
	song_01.samples()
	song_02.samples()
	song_03.samples()
	song_04.samples()
	song_05.samples()
	song_06.samples()
	song_07.samples()
	song_08.samples()
	song_09.samples()
	song_0A.samples()