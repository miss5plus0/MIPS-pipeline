# Test File for 13 Instruction, include:
# ADDU/SUBU/ORI/SLL/SRL/SRA/LW/SW/BEQ/J/LUI/JAL/JR
################################################################
### Make sure following Settings :
# Settings -> Memory Configuration -> Compact, Data at address 0

.text
	ori $2, $0, 0x1234
	ori $3, $0, 0x5678
	lui $3, 0x8004
	addu $4, $2, $3
	sll $2, $2, 1
	sra $3, $3, 2
	subu $5, $3, $4
	srl $6, $5, 3
	sw $4, 0($0)
	sw $5, 4($0)
	sw $6, 8($0)
	lw $7, 0($0)
	beq $4, $7, _lb2
	_lb1:
	lw $8, 4($0)
	_lb2:
	lw $8, 8($0)
	j _lb3
	lw $8, 12($0)
	_lb3:
	jal F_Test_JAL
	sw $2, 12($0)
	
F_Test_JAL:
	subu $2, $6, $2
	jr $ra
