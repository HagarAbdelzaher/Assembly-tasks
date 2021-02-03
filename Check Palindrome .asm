#versio 2.0
#Author: Hagar Nabil Anwar 
#ID: 20180325
#date: 31/12/2020

.data
string : .asciiz "racecar"
palindrome : .asciiz "palindrome"
notPalindrome: .asciiz "not palindrome" 
.text
.globl main
main:
	la $a0 , string
	jal check_palindrome
	
	move $a0 , $v0 
	beq $a0 , 1 , print	
	la $a0 , notPalindrome
	li $v0 , 4
	syscall

	li $v0 , 10		#end 
	syscall

check_palindrome:
#string argument  is in $a0
	sub $sp , $sp , 8	#allocate memory in stack 
	sw   $ra , 0($sp)
	sw   $a0 , 4($sp)

	jal getLength
	move $t0 , $v0		#save length in $t0
	
	lw $a0 , 4($sp)		#load string argument and save it in t1
	move $t1 , $a0

	li $t2 , 1 #cnt = 1
	li $v0 , 1 #return value in $v0
	div $t3 , $t0 , 2 # get half the string length
	addi $t3 , $t3 , 1 

loop_palindrome:
	bge $t2 , $t3 , exit2
	lb $t4 , 0($a0)

	sub $t5 , $t0 , $t2	#subtract counter from length of the string
	add $t6 , $t5 , $t1	#add index from the end of the string to start index
	lb $t7 , 0($t6)		#get current correspondinf to the current character

	beq $t4 , $t7 , continue #check if two corresponding characters are equal
	li $v0 , 0		#if not return 0 
	j exit2

continue:			#if 2 chars are equal
	addi  $a0 , $a0 , 1	#increment string pointer
	addi  $t2 , $t2 , 1	#increment counter
	j loop_palindrome

exit2:
	lw $ra , 0($sp)
	addi $sp , $sp , 8
	jr $ra

getLength:
 li $v0 , 0
 
 loop:
 lb $t0, 0($a0) 	#load current character
 beq $t0 ,  $0 , exit1	#if null , exit
 
 addi $a0 , $a0 , 1	#increment string pointer
 addi $v0 , $v0 , 1	#increment length value to be returned
 j loop
 exit1:
 jr $ra
 
print:
la $a0 , palindrome
	li $v0 , 4
	syscall
li $v0 , 10
syscall





