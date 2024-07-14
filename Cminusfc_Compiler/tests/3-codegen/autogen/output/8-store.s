	.text
	.globl store
	.type store, @function
store:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -112
	st.d $a0, $fp, -24
	st.w $a1, $fp, -28
	st.w $a2, $fp, -32
.store_label_entry:
# %op3 = alloca i32*
	addi.d $t0, $fp, -48
	st.d $t0, $fp, -40
# store i32* %arg0, i32** %op3
	ld.d $t0, $fp, -40
	ld.d $t1, $fp, -24
	st.d $t1, $t0, 0
# %op4 = alloca i32
	addi.d $t0, $fp, -60
	st.d $t0, $fp, -56
# store i32 %arg1, i32* %op4
	ld.d $t0, $fp, -56
	ld.w $t1, $fp, -28
	st.w $t1, $t0, 0
# %op5 = alloca i32
	addi.d $t0, $fp, -76
	st.d $t0, $fp, -72
# store i32 %arg2, i32* %op5
	ld.d $t0, $fp, -72
	ld.w $t1, $fp, -32
	st.w $t1, $t0, 0
# %op6 = load i32, i32* %op5
	ld.d $t0, $fp, -72
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -80
# %op7 = load i32, i32* %op4
	ld.d $t0, $fp, -56
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -84
# %op8 = icmp slt i32 %op7, 0
	ld.w $t0, $fp, -84
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -85
# br i1 %op8, label %label9, label %label10
	ld.b $t0, $fp, -85
	beqz $t0, .store_label10
	bnez $t0, .store_label9
.store_label9:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 112
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.store_label10:
# %op11 = load i32*, i32** %op3
	ld.d $t0, $fp, -40
	ld.d $t1, $t0, 0
	st.d $t1, $fp, -96
# %op12 = getelementptr i32, i32* %op11, i32 %op7
	ld.d $t0, $fp, -96
	ld.w $t2, $fp, -84
	addi.d $t1, $zero, 4
	mul.d $t1, $t2, $t1
	add.d $t0, $t1, $t0
	st.d $t0, $fp, -104
# store i32 %op6, i32* %op12
	ld.d $t0, $fp, -104
	ld.w $t1, $fp, -80
	st.w $t1, $t0, 0
# %op13 = load i32, i32* %op5
	ld.d $t0, $fp, -72
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -108
# ret i32 %op13
	ld.w $a0, $fp, -108
	addi.d $sp, $sp, 112
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	addi.d $sp, $sp, 112
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -208
.main_label_entry:
# %op0 = alloca [10 x i32]
	addi.d $t0, $fp, -64
	st.d $t0, $fp, -24
# %op1 = alloca i32
	addi.d $t0, $fp, -76
	st.d $t0, $fp, -72
# %op2 = alloca i32
	addi.d $t0, $fp, -92
	st.d $t0, $fp, -88
# store i32 0, i32* %op1
	ld.d $t0, $fp, -72
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# br label %label3
	b .main_label3
.main_label3:
# %op4 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -96
# %op5 = icmp slt i32 %op4, 10
	ld.w $t0, $fp, -96
	addi.w $t1, $zero, 10
	slt $t2, $t0, $t1
	st.b $t2, $fp, -97
# %op6 = zext i1 %op5 to i32
	ld.b $t0, $fp, -97
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -104
# %op7 = icmp ne i32 %op6, 0
	ld.w $t0, $fp, -104
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	add.w $t2, $t2, $t3
	st.b $t2, $fp, -105
# br i1 %op7, label %label8, label %label16
	ld.b $t0, $fp, -105
	beqz $t0, .main_label16
	bnez $t0, .main_label8
.main_label8:
# %op9 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 0
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 0
	addi.d $t1, $zero, 4
	mul.d $t1, $t2, $t1
	add.d $t0, $t1, $t0
	st.d $t0, $fp, -120
# %op10 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -124
# %op11 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -128
# %op12 = mul i32 %op11, 2
	ld.w $t0, $fp, -128
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -132
# %op13 = call i32 @store(i32* %op9, i32 %op10, i32 %op12)
	ld.d $a0, $fp, -120
	ld.w $a1, $fp, -124
	ld.w $a2, $fp, -132
	bl store
	st.w $a0, $fp, -136
# %op14 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -140
# %op15 = add i32 %op14, 1
	ld.w $t0, $fp, -140
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -144
# store i32 %op15, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t1, $fp, -144
	st.w $t1, $t0, 0
# br label %label3
	b .main_label3
.main_label16:
# store i32 0, i32* %op2
	ld.d $t0, $fp, -88
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# store i32 0, i32* %op1
	ld.d $t0, $fp, -72
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# br label %label17
	b .main_label17
.main_label17:
# %op18 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -148
# %op19 = icmp slt i32 %op18, 10
	ld.w $t0, $fp, -148
	addi.w $t1, $zero, 10
	slt $t2, $t0, $t1
	st.b $t2, $fp, -149
# %op20 = zext i1 %op19 to i32
	ld.b $t0, $fp, -149
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -156
# %op21 = icmp ne i32 %op20, 0
	ld.w $t0, $fp, -156
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	add.w $t2, $t2, $t3
	st.b $t2, $fp, -157
# br i1 %op21, label %label22, label %label26
	ld.b $t0, $fp, -157
	beqz $t0, .main_label26
	bnez $t0, .main_label22
.main_label22:
# %op23 = load i32, i32* %op2
	ld.d $t0, $fp, -88
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -164
# %op24 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -168
# %op25 = icmp slt i32 %op24, 0
	ld.w $t0, $fp, -168
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -169
# br i1 %op25, label %label28, label %label29
	ld.b $t0, $fp, -169
	beqz $t0, .main_label29
	bnez $t0, .main_label28
.main_label26:
# %op27 = load i32, i32* %op2
	ld.d $t0, $fp, -88
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -176
# call void @output(i32 %op27)
	ld.w $a0, $fp, -176
	bl output
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 208
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.main_label28:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 208
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.main_label29:
# %op30 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 %op24
	ld.d $t0, $fp, -24
	ld.w $t2, $fp, -168
	addi.d $t1, $zero, 4
	mul.d $t1, $t2, $t1
	add.d $t0, $t1, $t0
	st.d $t0, $fp, -184
# %op31 = load i32, i32* %op30
	ld.d $t0, $fp, -184
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -188
# %op32 = add i32 %op23, %op31
	ld.w $t0, $fp, -164
	ld.w $t1, $fp, -188
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -192
# store i32 %op32, i32* %op2
	ld.d $t0, $fp, -88
	ld.w $t1, $fp, -192
	st.w $t1, $t0, 0
# %op33 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -196
# %op34 = add i32 %op33, 1
	ld.w $t0, $fp, -196
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -200
# store i32 %op34, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t1, $fp, -200
	st.w $t1, $t0, 0
# br label %label17
	b .main_label17
	addi.d $sp, $sp, 208
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
