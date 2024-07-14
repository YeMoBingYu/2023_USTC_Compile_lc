	.text
	.globl addone
	.type addone, @function
addone:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -48
	st.w $a0, $fp, -20
.addone_label_entry:
# %op1 = alloca i32
	addi.d $t0, $fp, -36
	st.d $t0, $fp, -32
# store i32 %arg0, i32* %op1
	ld.d $t0, $fp, -32
	ld.w $t1, $fp, -20
	st.w $t1, $t0, 0
# %op2 = load i32, i32* %op1
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -40
# %op3 = add i32 %op2, 1
	ld.w $t0, $fp, -40
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -44
# ret i32 %op3
	ld.w $a0, $fp, -44
	addi.d $sp, $sp, 48
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	addi.d $sp, $sp, 48
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -48
.main_label_entry:
# %op0 = alloca i32
	addi.d $t0, $fp, -28
	st.d $t0, $fp, -24
# %op1 = call i32 @addone(i32 1230)
	addi.w $a0, $zero, 1230
	bl addone
	st.w $a0, $fp, -32
# %op2 = call i32 @addone(i32 %op1)
	ld.w $a0, $fp, -32
	bl addone
	st.w $a0, $fp, -36
# %op3 = call i32 @addone(i32 %op2)
	ld.w $a0, $fp, -36
	bl addone
	st.w $a0, $fp, -40
# %op4 = call i32 @addone(i32 %op3)
	ld.w $a0, $fp, -40
	bl addone
	st.w $a0, $fp, -44
# store i32 %op4, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -44
	st.w $t1, $t0, 0
# %op5 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -48
# ret i32 %op5
	ld.w $a0, $fp, -48
	addi.d $sp, $sp, 48
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	addi.d $sp, $sp, 48
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
