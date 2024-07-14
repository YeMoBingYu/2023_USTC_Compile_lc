	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -144
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
# store i32 11, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 11
	st.w $t1, $t0, 0
# store i32 22, i32* %op1
	ld.d $t0, $fp, -40
	addi.w $t1, $zero, 22
	st.w $t1, $t0, 0
# store i32 33, i32* %op2
	ld.d $t0, $fp, -56
	addi.w $t1, $zero, 33
	st.w $t1, $t0, 0
# %op3 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -64
# %op4 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -68
# %op5 = icmp sgt i32 %op3, %op4
	ld.w $t0, $fp, -64
	ld.w $t1, $fp, -68
	slt $t2, $t1, $t0
	st.b $t2, $fp, -69
# %op6 = zext i1 %op5 to i32
	ld.b $t0, $fp, -69
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -76
# %op7 = icmp ne i32 %op6, 0
	ld.w $t0, $fp, -76
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	add.w $t2, $t2, $t3
	st.b $t2, $fp, -77
# br i1 %op7, label %label8, label %label15
	ld.b $t0, $fp, -77
	beqz $t0, .main_label15
	bnez $t0, .main_label8
.main_label8:
# %op9 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -84
# %op10 = load i32, i32* %op2
	ld.d $t0, $fp, -56
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -88
# %op11 = icmp sgt i32 %op9, %op10
	ld.w $t0, $fp, -84
	ld.w $t1, $fp, -88
	slt $t2, $t1, $t0
	st.b $t2, $fp, -89
# %op12 = zext i1 %op11 to i32
	ld.b $t0, $fp, -89
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -96
# %op13 = icmp ne i32 %op12, 0
	ld.w $t0, $fp, -96
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	add.w $t2, $t2, $t3
	st.b $t2, $fp, -97
# br i1 %op13, label %label21, label %label24
	ld.b $t0, $fp, -97
	beqz $t0, .main_label24
	bnez $t0, .main_label21
.main_label14:
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 144
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.main_label15:
# %op16 = load i32, i32* %op2
	ld.d $t0, $fp, -56
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -104
# %op17 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -108
# %op18 = icmp slt i32 %op16, %op17
	ld.w $t0, $fp, -104
	ld.w $t1, $fp, -108
	slt $t2, $t0, $t1
	st.b $t2, $fp, -109
# %op19 = zext i1 %op18 to i32
	ld.b $t0, $fp, -109
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -116
# %op20 = icmp ne i32 %op19, 0
	ld.w $t0, $fp, -116
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	add.w $t2, $t2, $t3
	st.b $t2, $fp, -117
# br i1 %op20, label %label26, label %label29
	ld.b $t0, $fp, -117
	beqz $t0, .main_label29
	bnez $t0, .main_label26
.main_label21:
# %op22 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -124
# call void @output(i32 %op22)
	ld.w $a0, $fp, -124
	bl output
# br label %label23
	b .main_label23
.main_label23:
# br label %label14
	b .main_label14
.main_label24:
# %op25 = load i32, i32* %op2
	ld.d $t0, $fp, -56
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -128
# call void @output(i32 %op25)
	ld.w $a0, $fp, -128
	bl output
# br label %label23
	b .main_label23
.main_label26:
# %op27 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -132
# call void @output(i32 %op27)
	ld.w $a0, $fp, -132
	bl output
# br label %label28
	b .main_label28
.main_label28:
# br label %label14
	b .main_label14
.main_label29:
# %op30 = load i32, i32* %op2
	ld.d $t0, $fp, -56
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -136
# call void @output(i32 %op30)
	ld.w $a0, $fp, -136
	bl output
# br label %label28
	b .main_label28
	addi.d $sp, $sp, 144
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
