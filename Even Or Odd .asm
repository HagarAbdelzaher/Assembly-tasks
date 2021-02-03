#header
#Author:Hagar Muhammad Abdelzaher - ID: 20180324
#version 2.0
#date:2/1/2020

#Question
#Translate the following C program to MIPS assembly. Use the same structure. Do not write a
#clever shorter program. (2 marks)
#int main() {
#...
#t1 = isOdd (10);
#printf ("%d", (t1 ? "odd" : "even");
#...
#}
#int isOdd (int n) {
#return !isEven (n);
#}
#int isEven (int n) {
#return ((n % 2) == 0));
#}




.data 
OddStr: .asciiz "Odd"
Evenstr: .asciiz "even"
askInput: .asciiz "please enter number \n "
.text 

.globl main
main:
	li $v0 , 4 	#prompt user for input
	la $a0 , askInput
	syscall
	li $v0 , 5	#take input number
	syscall 
	move $a1 , $v0

	jal isOdd	# call isOdd function
	beq $v1 , 1 , displayOdd 	#if return of the function is 1 , display that num is odd
	j displayEven			#else display its even
	li $v0 , 10			#end
	syscall


displayEven:
	li $v0 , 4 	#display even
	la $a0 , Evenstr
	syscall
	li $v0 , 10
	syscall

displayOdd:		#display odd
	li $v0 , 4
	la $a0 , OddStr
	syscall
	li $v0 , 10
	syscall
isOdd:
	addi $sp , $sp , -4	#allocate space  in the stack
	sw $ra , 0($sp)		#store the ra in stack
	jal isEven 		#call is even function
	seq  $v1 , $v1 , $zero	# isOdd returns 1 if it's not even
	lw $ra , 0($sp)		#load ra in stack again
	jr $ra
isEven:			
	li $t0 , 2		
	divu $a1 , $t0		#divide num by 2
	mfhi $v1		#remainder is stored in hi register , so move it to v1 
	seq  $v1 , $v1 , $zero	#if remainder equals zero , return 1
	jr $ra
