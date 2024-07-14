	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -176
.main_label_entry:
# %op0 = alloca [10 x i32]
	addi.d $t0, $fp, -64
	st.d $t0, $fp, -24
# %op1 = alloca i32
	addi.d $t0, $fp, -76
	st.d $t0, $fp, -72
# store i32 0, i32* %op1
	ld.d $t0, $fp, -72
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# %op2 = icmp slt i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -77
# br i1 %op2, label %label3, label %label4
	ld.b $t0, $fp, -77
	beqz $t0, .main_label4
	bnez $t0, .main_label3
.main_label3:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 176
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.main_label4:
# %op5 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 0
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 0
	addi.d $t1, $zero, 4
	mul.d $t1, $t2, $t1
	add.d $t0, $t1, $t0
	st.d $t0, $fp, -88
# store i32 11, i32* %op5
	ld.d $t0, $fp, -88
	addi.w $t1, $zero, 11
	st.w $t1, $t0, 0
# %op6 = icmp slt i32 4, 0
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -89
# br i1 %op6, label %label7, label %label8
	ld.b $t0, $fp, -89
	beqz $t0, .main_label8
	bnez $t0, .main_label7
.main_label7:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 176
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.main_label8:
# %op9 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 4
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 4
	addi.d $t1, $zero, 4
	mul.d $t1, $t2, $t1
	add.d $t0, $t1, $t0
	st.d $t0, $fp, -104
# store i32 22, i32* %op9
	ld.d $t0, $fp, -104
	addi.w $t1, $zero, 22
	st.w $t1, $t0, 0
# %op10 = icmp slt i32 9, 0
	addi.w $t0, $zero, 9
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -105
# br i1 %op10, label %label11, label %label12
	ld.b $t0, $fp, -105
	beqz $t0, .main_label12
	bnez $t0, .main_label11
.main_label11:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 176
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.main_label12:
# %op13 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 9
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 9
	addi.d $t1, $zero, 4
	mul.d $t1, $t2, $t1
	add.d $t0, $t1, $t0
	st.d $t0, $fp, -120
# store i32 33, i32* %op13
	ld.d $t0, $fp, -120
	addi.w $t1, $zero, 33
	st.w $t1, $t0, 0
# %op14 = icmp slt i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -121
# br i1 %op14, label %label15, label %label16
	ld.b $t0, $fp, -121
	beqz $t0, .main_label16
	bnez $t0, .main_label15
.main_label15:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 176
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.main_label16:
# %op17 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 0
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 0
	addi.d $t1, $zero, 4
	mul.d $t1, $t2, $t1
	add.d $t0, $t1, $t0
	st.d $t0, $fp, -136
# %op18 = load i32, i32* %op17
	ld.d $t0, $fp, -136
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -140
# call void @output(i32 %op18)
	ld.w $a0, $fp, -140
	bl output
# %op19 = icmp slt i32 4, 0
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -141
# br i1 %op19, label %label20, label %label21
	ld.b $t0, $fp, -141
	beqz $t0, .main_label21
	bnez $t0, .main_label20
.main_label20:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 176
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.main_label21:
# %op22 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 4
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 4
	addi.d $t1, $zero, 4
	mul.d $t1, $t2, $t1
	add.d $t0, $t1, $t0
	st.d $t0, $fp, -152
# %op23 = load i32, i32* %op22
	ld.d $t0, $fp, -152
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -156
# call void @output(i32 %op23)
	ld.w $a0, $fp, -156
	bl output
# %op24 = icmp slt i32 9, 0
	addi.w $t0, $zero, 9
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -157
# br i1 %op24, label %label25, label %label26
	ld.b $t0, $fp, -157
	beqz $t0, .main_label26
	bnez $t0, .main_label25
.main_label25:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 176
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.main_label26:
# %op27 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 9
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 9
	addi.d $t1, $zero, 4
	mul.d $t1, $t2, $t1
	add.d $t0, $t1, $t0
	st.d $t0, $fp, -168
# %op28 = load i32, i32* %op27
	ld.d $t0, $fp, -168
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -172
# call void @output(i32 %op28)
	ld.w $a0, $fp, -172
	bl output
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 176
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	addi.d $sp, $sp, 176
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
