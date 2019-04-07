# Pieter Gerhard Serton
# Simple spreadsheet
# Registers:
#			$v0 - syscall parameter and return
#			$a0 - syscall parameter
#			$a1 - syscall parameter
#			$s0 - = value
#			$t0 - 1st byte
#			$t1 - 1st number
#			$t2 - 2nd number
#			$t3 - 3rd number
#			$t4 - 4th number
#			$t5 - 5th number
#			$s1 - 49
#			$s2 - 50
#			$s3 - 51
#			$s4 - 52
#			$s5 - 53

main:
	
		#Print opening line
		la $a0, openingline
		li $v0, 4
		syscall
		li $s0, 61
		li $s1, 48
		li $s2, 49
		li $s3, 50
		li $s4, 51
		li $s5, 52
store1:
		#Store 1st number
		li	$v0, 8
		la $a0, string1
		li $a1, 64
		syscall
		lb $t0, 0($a0)
		la $t1, string1
		bne $t0, $s0, store2
		addi $a0, $a0, 1
		lb $t0, 0($a0)

c12:	
		bne $t0, $s2, c13
		la $t1, string2
		j store2

c13:
		bne $t0, $s3, c14
		la $t1, string3
		j store2
c14:
		bne $t0, $s4, c15
		la $t1, string4
		j store2

c15:
		bne $t0, $s5, store2
		la $t1, string5
		j store2
		
store2:
		#2nd number store
		li $v0, 8
		la $a0, string2
		li $a1, 64
		syscall
		lb $t0, 0($a0)
		la $t2, string2
		bne $t0, $s0, store3
		addi $a0, $a0, 1
		lb $t0, 0($a0)

c21:
		bne $t0, $s1, c23
		la $t2, string1
		j store3
c23:
		bne $t0, $s3, c24
		la $t2, string3
		j store3
c24:
		bne $t0, $s4, c25
		la $t2, string4
		j store3
c25:
		bne $t0, $s5, store3
		la $t2, string5
		j store3
		
		
store3:
		#3rd number store
		li $v0, 8
		la $a0, string3
		li $a1, 64
		syscall
		lb $t0, 0($a0)
		la $t3, string3
		bne $t0, $s0, store4
		addi $a0, $a0, 1
		lb $t0, 0($a0)
	
c31:
		bne $t0, $s1, c32
		la $t3, string1
		la $a0, string1
		lb $t0, 0($a0)
		bne $t0, $s0, store4
		j jb3
c32:
		bne $t0, $s2, c34
		la $t3, string2
		la $a0, string2
		lb $t0, 0($a0)
		bne $t0, $s0, store4
		j jb3
c34:
		bne $t0, $s4, c35
		la $t3, string4
		la $a0, string4
		lb $t0, 0($a0)
		bne $t0, $s0, store4
		j jb3
c35:
		bne $t0, $s5, store4
		la $t3, string5
		la $a0, string5
		lb $t0, 0($a0)
		bne $t0, $s0, store4
		j jb3
jb3:
		addi $a0, $a0, 1
		lb $t0, 0($a0)
		j c31
		
	
store4:
		#4th number store
		li $v0, 8
		la $a0, string4
		li $a1, 64
		syscall
		lb $t0, 0($a0)
		la $t4, string4
		bne $t0, $s0, store5
		addi $a0, $a0, 1
		lb $t0, 0($a0)
		
c41:
		bne $t0, $s1, c42
		la $t4, string1
		la $a0, string1
		lb $t0, 0($a0)
		bne $t0, $s0, store5
		j jb4
c42:
		bne $t0, $s2, c43
		la $t4, string2
		la $a0, string2
		lb $t0, 0($a0)
		bne $t0, $s0, store5
		j jb4
c43:
		bne $t0, $s3, c45
		la $t4, string3
		la $a0, string3
		lb $t0, 0($a0)
		bne $t0, $s0, store5
		j jb4
c45:
		bne $t0, $s5, store5
		la $t4, string5
		la $a0, string5
		lb $t0, 0($a0)
		bne $t0, $s0, store5
		j jb4
jb4:
		addi $a0, $a0, 1
		lb $t0, 0($a0)
		j c41

store5:
		#5th number store
		li $v0, 8
		la $a0, string5
		li $a1, 64
		syscall
		lb $t0, 0($a0)
		la $t5, string5
		bne $t0, $s0, printing
		addi $a0, $a0, 1
		lb $t0, 0($a0)
		
c51:
		bne $t0, $s1, c52
		la $t5, string1
		la $a0, string1
		lb $t0, 0($a0)
		bne $t0, $s0, printing
		j jb5
c52:
		bne $t0, $s2, c53
		la $t5, string2
		la $a0, string2
		lb $t0, 0($a0)
		bne $t0, $s0, printing
		j jb5
c53:
		bne $t0, $s3, c54
		la $t5, string3
		la $a0, string3
		lb $t0, 0($a0)
		bne $t0, $s0, printing
		j jb5
c54:
		bne $t0, $s4, printing
		la $t5, string4
		la $a0, string4
		lb $t0, 0($a0)
		bne $t0, $s0, printing
		j jb5
		
jb5:
		addi $a0, $a0, 1
		lb $t0, 0($a0)
		j c51

printing:
		
		#Print closing line
		la $a0, closingline
		li $v0, 4
		syscall
		
		#Print answers
		
		li $v0 4
		move $a0, $t1
		syscall
		
		li $v0 4
		move $a0, $t2
		syscall
		
		li $v0 4
		move $a0, $t3
		syscall
		
		li $v0 4
		move $a0, $t4
		syscall
		
		li $v0 4
		move $a0, $t5
		syscall
		
		

		
		#End program
		li $v0, 10
		syscall
		
		
		
		
		
		
		
		
	.data
newline:		.asciiz "\n"
openingline:	.asciiz "Enter a series of 5 formulae:\n"
closingline:	.asciiz "The values are:\n"
string1: .space 64
string2: .space 64
string3: .space 64
string4: .space 64
string5: .space 64