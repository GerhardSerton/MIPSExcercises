# Pieter Gerhard Serton
# Question 2
# Registers:
#			$v0 - syscall parameter and return
#			$a0 - syscall parameter
#			$a1 - syscall parameter
#			$t0 - User Input
#			$t1 - constructed int
#			$t2 - Byte of input
#			$t3 - 10
#			$t4 - 10
#			$t5 - 48
	
	.text
main:
		#Print opening line
		la $a0, firstline
		li $v0, 4
		syscall
		
		#Store String from user
		li $v0, 8
		la $a0, userinput
		li $a1, 64
		syscall
		li $t1, 0
		li $t3, 10
		li $t5, 48
		la $t0, userinput
		
stillchars:

		#Remove 1st character
		addi $t0, $t0, 1
		lb $t2, 0($t0)
		beq $t2, $t3, print
		mul $t1, $t1, $t4
		add $t1, $t1, $t2
		sub $t1, $t1, $t5
		
		

		li $t4, 10
		
		j stillchars
		
		
		
print:
		#Print closing line
		la $a0, lastline
		li $v0, 4
		syscall
		
		#Print answer
		addi $t1, $t1, 5
		move $a0, $t1
		li $v0, 1
		syscall
		
		
		#End program
		li $v0, 10
		syscall
		
	.data
firstline:		.asciiz "Enter a string: \n"
newline:		.asciiz "\n"
lastline:		.asciiz "The value +5 is: \n"
userinput:		.space 64
editedstring:	.space 64