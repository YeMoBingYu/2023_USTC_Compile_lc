	.text
	.globl addone
	.type addone, @function
addone:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -32
	st.w $a0, $fp, -20
.addone_label_entry:
# %op1 = add i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -24
# ret i32 %op1
	ld.w $a0, $fp, -24
	addi.d $sp, $sp, 32
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	addi.d $sp, $sp, 32
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -32
.main_label_entry:
# %op0 = call i32 @addone(i32 1230)
	addi.w $a0, $zero, 1230
	bl addone
	st.w $a0, $fp, -20
# %op1 = call i32 @addone(i32 %op0)
	ld.w $a0, $fp, -20
	bl addone
	st.w $a0, $fp, -24
# %op2 = call i32 @addone(i32 %op1)
	ld.w $a0, $fp, -24
	bl addone
	st.w $a0, $fp, -28
# %op3 = call i32 @addone(i32 %op2)
	ld.w $a0, $fp, -28
	bl addone
	st.w $a0, $fp, -32
# ret i32 %op3
	ld.w $a0, $fp, -32
	addi.d $sp, $sp, 32
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	addi.d $sp, $sp, 32
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
