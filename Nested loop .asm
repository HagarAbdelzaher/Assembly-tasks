#header
#Author:Hagar Muhammad Abdelzaher - ID: 20180324
#version 3.0
#date:2/1/2021

#Question
#Write, run and test a MIPS program to execute the following nested C loop. (1 mark)
#for(i = 0; i < a; i++)
# for(j = 0; j < i; j++)
# C[i] += j; 
.data
arr: .space 16
newLine: .asciiz "\n"
.text
.globl main
main:
addi $t1 , $zero , 0
#we assumed in this program that a equals 16
whileinput:
	beq $t1 , 16 , operations	
	li $v0 , 5	#take input number
	syscall 
	move $s0 , $v0
	sw $s0 , arr($t1)	#store number in the array
	addi $t1 , $t1 , 4
	j whileinput
	
operations:
	addi $t3 , $zero , -4		#i=0
   loop1:
      beq  $t3 , 16  , output	#if i= 16 , end
      addi $t3 , $t3 , 4	#i++
      li   $t4 , 0		#j=0	
      j loop2
   loop2:	
      beq $t4 , $t3 , loop1	#if j = i go to loop 1
      lw $s1 , arr($t3)		#extracr c[i]
      div $t5 , $t4 , 4		#calculate current (actual ) j 
      add $s1 , $s1 , $t5	#c[i]+=j
      sw  $s1 , arr($t3)	#c[i] = new c[i]
      addi $t4 ,$t4 , 4		#j++
      j loop2
output:
addi $t0 , $zero , 0
whileprint :
	beq $t0 ,16 , exit
	lw $t6 , arr($t0)	#outputing arrat char
	li $v0 , 1
	move $a0 , $t6 
	syscall
	li $v0 , 4
	la $a0 , newLine	#outputing new line
	syscall
	addi $t0 , $t0 , 4
	j whileprint
exit:
li $v0 , 10
syscall


















