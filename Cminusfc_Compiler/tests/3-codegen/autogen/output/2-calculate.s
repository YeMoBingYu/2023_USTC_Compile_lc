	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -80
.main_label_entry:
# %op0 = alloca i32
	addi.d $t0, $fp, -28
	st.d $t0, $fp, -24
# %op1 = alloca i32
	addi.d $t0, $fp, -44
	st.d $t0, $fp, -40
# %op2 = alloca i32
	addi.d $t0, $fp, -60
	st.d $t0, $fp, -56
# store i32 23, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 23
	st.w $t1, $t0, 0
# store i32 25, i32* %op1
	ld.d $t0, $fp, -40
	addi.w $t1, $zero, 25
	st.w $t1, $t0, 0
# store i32 4, i32* %op2
	ld.d $t0, $fp, -56
	addi.w $t1, $zero, 4
	st.w $t1, $t0, 0
# %op3 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -64
# %op4 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -68
# %op5 = load i32, i32* %op2
	ld.d $t0, $fp, -56
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -72
# %op6 = mul i32 %op4, %op5
	ld.w $t0, $fp, -68
	ld.w $t1, $fp, -72
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -76
# %op7 = add i32 %op3, %op6
	ld.w $t0, $fp, -64
	ld.w $t1, $fp, -76
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -80
# ret i32 %op7
	ld.w $a0, $fp, -80
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
