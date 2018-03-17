//海腹川背

architecture wdc65816
output "海腹川背.sfc", create


//convert snes address to pc address
expression real(q) = ((q & $7fff) | ((q & $7f0000) >> 1))

//convert pc address to snes address
expression snes(q) = (((q & $3f8000) << 1) | ((q & $7fff) | $8000) | $800000)

//lorom addressing
macro org(offset) {
	origin real({offset})
	base {offset}
}

//prints error if data passed a certain snes address
macro warnpc(offset) {
	if origin() > real({offset}) {
		evaluate x = snes(origin())
		print "ERROR: bank border crossed at {offset} ($", hex:{x}, ")\n"
		error ""
	}
}

//implements fill up to a certain snes address
macro pad(offset, byte) {
	if origin() < real({offset}) {
		evaluate x = origin()
		evaluate y = real({offset})
		fill ({y} - {x}), {byte}
	}
}

evaluate pcaddr = 0
evaluate oldpc = 0

//saves current snes address. only 1 level deep! need pullpc afterwards!
inline pushpc(new) {
	global evaluate pcaddr = origin()
	base {new}
	global evaluate oldpc = real({new})
}

//restores snes address. requires prior pushpc!
macro pullpc() {
	global evaluate x = {pcaddr}
	global evaluate y = {oldpc}
	base snes({x} + origin() - {y})
}

evaluate baseaddr = 0
evaluate oldbase = 0

//saves current base address. only 1 level deep! need pullbase afterwards!
inline pushbase(new) {
	global evaluate baseaddr = pc()
	base {new}
	global evaluate oldbase = real({new})
}

//restores base address. requires prior pushbase!
macro pullbase() {
	global evaluate x = {baseaddr}
	global evaluate y = {oldbase}
	base ({x} + pc() - {y})
}


include "bank_80.asm"
include "bank_81.asm"
include "bank_82.asm"
include "bank_83.asm"
include "bank_84.asm"
include "bank_85.asm"
include "bank_86.asm"
include "bank_87.asm"
include "bank_88.asm"
include "bank_89.asm"
include "bank_8A.asm"
include "bank_8B.asm"
include "bank_8C.asm"
include "bank_8D.asm"
include "bank_8E.asm"
include "bank_8F.asm"
include "bank_90.asm"
include "bank_91.asm"
include "bank_92.asm"
include "bank_93.asm"
include "bank_94.asm"
include "bank_95.asm"
include "bank_96.asm"
include "bank_97.asm"
include "bank_98.asm"
include "bank_99.asm"
include "bank_9A.asm"
include "bank_9B.asm"
include "bank_9C.asm"
include "bank_1D.asm"
//include "bank_1E.asm"	<- extension of bank_1D.asm
//include "bank_1F.asm"	<- extension of bank_1D.asm