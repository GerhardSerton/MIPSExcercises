# Pieter Gerhard Serton
# Reading and displaying numbers from the user
# Registers:
#			$t0 - 1st number
#			$t1 - 2nd number
#			$t2 - 3rd number
#			$t3 - 4th number
#			$t4 - 5th number
#			$t5 - String holder
#			$v0 - syscall parameter and return
#			$a0 - syscall parameter
#			$a1 - syscall parameter

		.text
main:
		#Print opening line
		la $a0, openingline
		li $v0, 4
		syscall
		
		#Store 1st number
		li	$v0, 8
		la $a0, string1
		li $a1, 64
		syscall
		#move $t0, $v0
		
		#2nd number store
		li $v0, 8
		la $a0, string2
		li $a1, 64
		syscall
		#move $t1, $v0
		
		#3rd number store
		li $v0, 8
		la $a0, string3
		li $a1, 64
		syscall
		#move $t2, $v0
		
		#4th number store
		li $v0, 8
		la $a0, string4
		li $a1, 64
		syscall
		#move $t3, $v0
		
		#5th number store
		li $v0, 8
		la $a0, string5
		li $a1, 64
		syscall
		#move $t4, $v0
		
		#Print closing line
		la $a0, closingline
		li $v0, 4
		syscall
		
		#1st number print
		la $a0, string1
		li $v0, 4
		syscall
		
		#2nd number print
		la $a0, string2
		li $v0, 4
		syscall
		
		#3rd number print
		la $a0, string3
		li $v0, 4
		syscall
		
		#4th number print
		la $a0, string4
		li $v0, 4
		syscall
		
		#5th number print
		la $a0, string5
		li $v0, 4
		syscall
		
		#close program
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
		
		#end
		
		