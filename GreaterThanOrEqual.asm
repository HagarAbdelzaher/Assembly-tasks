#header
#Author:Hagar Muhammad Abdelzaher - ID: 20180324
#version 2.0
#date:31/12/2020


#Question
#1- Write, run and test a MIPS program to implement the following C code segment. (1 mark)
#if ((g <= h) && (g > 0))
#g = h;
#else
# h = g;

.data
input : .space 20
askInput: "please enter two numbers"
g : .asciiz "g = "
h : .asciiz " and h= "

.text 
.globl main
main:
	li $v0 , 4 	#prompt user for input
	la $a0 , askInput
	syscall
	
	li $v0 , 5	#user inputs first integer
	syscall
	move $s0 , $v0

	li $v0 , 5	#user inputs second integer
	syscall
	move $s1 , $v0


	sle $t0 , $s0 , $s1  #t0 holds 1 if (g<=h)
	sgt $t1 , $s0 , $0   #t1 holds 1 if g>0
	beq $t0 , $t1 , ifBranch #if both t1 and t2 are equal
	bne $t0 , $t1 , else

output:
	li $v0 , 4
	la $a0 , g	#outputing string g 
	syscall
	
	li $v0 , 1	#outputing g value 
	move $a0 , $s0
	syscall
	
	li $v0 , 4
	la $a0 , h	#outputing string g 
	syscall
	
	li $v0 , 1	#outputing g value 
	move $a0 , $s1
	syscall

	li $v0 , 10			#end 
	syscall

ifBranch :
	beq $t0 , $zero , else	#if they are equal zero $t0 and $t1 , then go to else
	move $s0 , $s1	
	j output 	#g=h


else:
	move $s0 , $s1	 
	j output 			#h=g



