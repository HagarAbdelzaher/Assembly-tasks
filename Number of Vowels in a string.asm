#header
#Author:Hagar Muhammad Abdelzaher - ID: 20180324
#version 2.0
#date:31/12/2020

.data
vowels: .asciiz "aeoiuAEOIU"
askInput: .asciiz "please enter your string :  "
newline: .asciiz " \n "
userInput : .space 80
outputString : .asciiz "number of vowels in your string is " 


.text 
.globl main
main:
			#asking for the input
	la $a0 , askInput
	li $v0 , 4
	syscall
			#storing the input string 
	li $v0 , 8
	la $a0 , userInput
	li $a1 , 80
	syscall
			#initialize count of vowels
	li $s3 , 0	
			#var to iterate over string
	la $s0 , userInput	


loopOnString:
	lb $t0 , 0($s0) 	#loading string[i] 
	addi $s0 , $s0 , 1	#i++
	beqz $t0 , output	#if end of string , go to output

	la  $s1 , vowels	#else load vowels address
loopOnVowel:
	lb $t1 , 0($s1)		#loading vowels[i] 
	beqz $t1 , loopOnString	#if end of string go to string to chompare the next char
	addi $s1 , $s1 , 1	#j++
	bne $t1 , $t0 , loopOnVowel#if s[i]!=vowels[i] loop 
	addi $s3 , $s3 , 1	#if they're equal , increment vowels counter
j	 loopOnString		#go to string loop 


output :
	la $a0 , outputString
	li $v0 , 4
	syscall
	
	li $v0 , 1	#outputing count  value 
	move $a0 , $s3
	syscall
	
	li $v0 , 10			#end 
	syscall



