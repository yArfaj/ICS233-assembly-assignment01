# name: Yunus Alarfaj
# id: 201861500

# name: Nawaf Alshrqi
# id: 201741350





.data 



lettersMsg: .asciiz "\nLetters = "
digitsMsg: .asciiz "\nDigits = "
charactersMsg: .asciiz "\nSpecial Characters =  "
linesMsg: .asciiz "\nLines  = "
errorMsg: .asciiz "Error: input.txt does NOT exist."
newLine: .asciiz "\n"

filename: .asciiz  "/Users/yalarfaj/Desktop/untitled-Folder/KFUPM/ICS 233/Assignments/Assignment01/Code/input.txt"
arr: .space 10000



#  $t0  => Letters
#  $t1  => digits
#  $t2  => Special Characters
#  $t3  => Lines

#  $t4  => temporary index




.text
# open file 
li $v0, 13
la $a0, filename
li $a1, 0
syscall


# save the file descriptor 
move $s0, $v0


# jump to 'error' if there is an error
 bltz $v0, error


# read from the file just opened
li $v0, 14
move $a0, $s0
la $a1, arr
la $a2, 10000
syscall


# if the end of the file is reached
# beqz $v0, printing

# la $t5, arr

read:



beq $t5, 10000, printing 


lb $t4, arr($t5)





beq $t4, 10, addLines
blt $t4, 5, repeat
blt $t4, '0', addCharacter
ble $t4, '9', addDigit
blt $t4, 'A', addCharacter
ble $t4, 'Z', addLetter
blt $t4, 'a', addCharacter
ble $t4, 'z', addLetter
bgt $t4, 'z', addCharacter







j repeat


# arithmetics

addLetter:
addi $t0, $t0, 1
j repeat

addDigit:
addi $t1, $t1, 1
j repeat

addCharacter:
addi $t2, $t2, 1
j repeat

addLines:
addi $t3, $t3, 1
j repeat


repeat: 
addi $t5, $t5, 1
j read


printing: 
# letters
la $a0, lettersMsg
li $v0, 4
syscall

move $a0, $t0
li $v0, 1
syscall 


# digits 
la $a0, digitsMsg
li $v0, 4
syscall

move $a0, $t1
li $v0, 1
syscall 


# characters
la $a0, charactersMsg
li $v0, 4
syscall

move $a0, $t2
li $v0, 1
syscall 


# lines
la $a0, linesMsg
li $v0, 4
syscall

move $a0, $t3
li $v0, 1
syscall 



j exit

error:
la $a0, errorMsg
li $v0, 4
syscall

exit: 

# close the file
li $v0, 16
move $a0, $s0
syscall


li $v0, 10
syscall





