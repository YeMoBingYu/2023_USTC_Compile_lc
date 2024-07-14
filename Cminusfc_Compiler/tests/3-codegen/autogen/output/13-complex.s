# Global variables
	.text
	.section .bss, "aw", @nobits
	.globl n
	.type n, @object
	.size n, 4
n:
	.space 4
	.globl m
	.type m, @object
	.size m, 4
m:
	.space 4
	.globl w
	.type w, @object
	.size w, 20
w:
	.space 20
	.globl v
	.type v, @object
	.size v, 20
v:
	.space 20
	.globl dp
	.type dp, @object
	.size dp, 264
dp:
	.space 264
	.text
	.globl max
	.type max, @function
max:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -80
	st.w $a0, $fp, -20
	st.w $a1, $fp, -24
.max_label_entry:
# %op2 = alloca i32
	addi.d $t0, $fp, -36
	st.d $t0, $fp, -32
# store i32 %arg0, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $fp, -20
	st.w $t1, $t0, 0
# %op3 = alloca i32
	addi.d $t0, $fp, -52
	st.d $t0, $fp, -48
# store i32 %arg1, i32* %op3
	ld.d $t0, $fp, -48
	ld.w $t1, $fp, -24
	st.w $t1, $t0, 0
# %op4 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -56
# %op5 = load i32, i32* %op3
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -60
# %op6 = icmp sgt i32 %op4, %op5
	ld.w $t0, $fp, -56
	ld.w $t1, $fp, -60
	slt $t2, $t1, $t0
	st.b $t2, $fp, -61
# %op7 = zext i1 %op6 to i32
	ld.b $t0, $fp, -61
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -68
# %op8 = icmp ne i32 %op7, 0
	ld.w $t0, $fp, -68
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	add.w $t2, $t2, $t3
	st.b $t2, $fp, -69
# br i1 %op8, label %label9, label %label12
	ld.b $t0, $fp, -69
	beqz $t0, .max_label12
	bnez $t0, .max_label9
.max_label9:
# %op10 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -76
# ret i32 %op10
	ld.w $a0, $fp, -76
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.max_label11:
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.max_label12:
# %op13 = load i32, i32* %op3
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -80
# ret i32 %op13
	ld.w $a0, $fp, -80
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl knapsack
	.type knapsack, @function
knapsack:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -384
	st.w $a0, $fp, -20
	st.w $a1, $fp, -24
.knapsack_label_entry:
# %op2 = alloca i32
	addi.d $t0, $fp, -36
	st.d $t0, $fp, -32
# store i32 %arg0, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $fp, -20
	st.w $t1, $t0, 0
# %op3 = alloca i32
	addi.d $t0, $fp, -52
	st.d $t0, $fp, -48
# store i32 %arg1, i32* %op3
	ld.d $t0, $fp, -48
	ld.w $t1, $fp, -24
	st.w $t1, $t0, 0
# %op4 = alloca i32
	addi.d $t0, $fp, -68
	st.d $t0, $fp, -64
# %op5 = load i32, i32* %op3
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -72
# %op6 = icmp sle i32 %op5, 0
	ld.w $t0, $fp, -72
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
	xori $t2, $t2, 1
	st.b $t2, $fp, -73
# %op7 = zext i1 %op6 to i32
	ld.b $t0, $fp, -73
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -80
# %op8 = icmp ne i32 %op7, 0
	ld.w $t0, $fp, -80
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	add.w $t2, $t2, $t3
	st.b $t2, $fp, -81
# br i1 %op8, label %label9, label %label10
	ld.b $t0, $fp, -81
	beqz $t0, .knapsack_label10
	bnez $t0, .knapsack_label9
.knapsack_label9:
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 384
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.knapsack_label10:
# %op11 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -88
# %op12 = icmp eq i32 %op11, 0
	ld.w $t0, $fp, -88
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	add.w $t2, $t2, $t3
	xori $t2, $t2, 1
	st.b $t2, $fp, -89
# %op13 = zext i1 %op12 to i32
	ld.b $t0, $fp, -89
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -96
# %op14 = icmp ne i32 %op13, 0
	ld.w $t0, $fp, -96
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	add.w $t2, $t2, $t3
	st.b $t2, $fp, -97
# br i1 %op14, label %label15, label %label16
	ld.b $t0, $fp, -97
	beqz $t0, .knapsack_label16
	bnez $t0, .knapsack_label15
.knapsack_label15:
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 384
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.knapsack_label16:
# %op17 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -104
# %op18 = mul i32 %op17, 11
	ld.w $t0, $fp, -104
	addi.w $t1, $zero, 11
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -108
# %op19 = load i32, i32* %op3
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -112
# %op20 = add i32 %op18, %op19
	ld.w $t0, $fp, -108
	ld.w $t1, $fp, -112
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -116
# %op21 = icmp slt i32 %op20, 0
	ld.w $t0, $fp, -116
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -117
# br i1 %op21, label %label22, label %label23
	ld.b $t0, $fp, -117
	beqz $t0, .knapsack_label23
	bnez $t0, .knapsack_label22
.knapsack_label22:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 384
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.knapsack_label23:
# %op24 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op20
	la.local $t0, dp
	ld.w $t2, $fp, -116
	addi.d $t1, $zero, 4
	mul.d $t1, $t2, $t1
	add.d $t0, $t1, $t0
	st.d $t0, $fp, -128
# %op25 = load i32, i32* %op24
	ld.d $t0, $fp, -128
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -132
# %op26 = icmp sge i32 %op25, 0
	ld.w $t0, $fp, -132
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	xori $t2, $t2, 1
	st.b $t2, $fp, -133
# %op27 = zext i1 %op26 to i32
	ld.b $t0, $fp, -133
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -140
# %op28 = icmp ne i32 %op27, 0
	ld.w $t0, $fp, -140
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	add.w $t2, $t2, $t3
	st.b $t2, $fp, -141
# br i1 %op28, label %label29, label %label35
	ld.b $t0, $fp, -141
	beqz $t0, .knapsack_label35
	bnez $t0, .knapsack_label29
.knapsack_label29:
# %op30 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -148
# %op31 = mul i32 %op30, 11
	ld.w $t0, $fp, -148
	addi.w $t1, $zero, 11
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -152
# %op32 = load i32, i32* %op3
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -156
# %op33 = add i32 %op31, %op32
	ld.w $t0, $fp, -152
	ld.w $t1, $fp, -156
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -160
# %op34 = icmp slt i32 %op33, 0
	ld.w $t0, $fp, -160
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -161
# br i1 %op34, label %label40, label %label41
	ld.b $t0, $fp, -161
	beqz $t0, .knapsack_label41
	bnez $t0, .knapsack_label40
.knapsack_label35:
# %op36 = load i32, i32* %op3
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -168
# %op37 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -172
# %op38 = sub i32 %op37, 1
	ld.w $t0, $fp, -172
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -176
# %op39 = icmp slt i32 %op38, 0
	ld.w $t0, $fp, -176
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -177
# br i1 %op39, label %label44, label %label45
	ld.b $t0, $fp, -177
	beqz $t0, .knapsack_label45
	bnez $t0, .knapsack_label44
.knapsack_label40:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 384
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.knapsack_label41:
# %op42 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op33
	la.local $t0, dp
	ld.w $t2, $fp, -160
	addi.d $t1, $zero, 4
	mul.d $t1, $t2, $t1
	add.d $t0, $t1, $t0
	st.d $t0, $fp, -192
# %op43 = load i32, i32* %op42
	ld.d $t0, $fp, -192
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -196
# ret i32 %op43
	ld.w $a0, $fp, -196
	addi.d $sp, $sp, 384
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.knapsack_label44:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 384
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.knapsack_label45:
# %op46 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 %op38
	la.local $t0, w
	ld.w $t2, $fp, -176
	addi.d $t1, $zero, 4
	mul.d $t1, $t2, $t1
	add.d $t0, $t1, $t0
	st.d $t0, $fp, -208
# %op47 = load i32, i32* %op46
	ld.d $t0, $fp, -208
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -212
# %op48 = icmp slt i32 %op36, %op47
	ld.w $t0, $fp, -168
	ld.w $t1, $fp, -212
	slt $t2, $t0, $t1
	st.b $t2, $fp, -213
# %op49 = zext i1 %op48 to i32
	ld.b $t0, $fp, -213
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -220
# %op50 = icmp ne i32 %op49, 0
	ld.w $t0, $fp, -220
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	add.w $t2, $t2, $t3
	st.b $t2, $fp, -221
# br i1 %op50, label %label51, label %label63
	ld.b $t0, $fp, -221
	beqz $t0, .knapsack_label63
	bnez $t0, .knapsack_label51
.knapsack_label51:
# %op52 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -228
# %op53 = sub i32 %op52, 1
	ld.w $t0, $fp, -228
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -232
# %op54 = load i32, i32* %op3
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -236
# %op55 = call i32 @knapsack(i32 %op53, i32 %op54)
	ld.w $a0, $fp, -232
	ld.w $a1, $fp, -236
	bl knapsack
	st.w $a0, $fp, -240
# store i32 %op55, i32* %op4
	ld.d $t0, $fp, -64
	ld.w $t1, $fp, -240
	st.w $t1, $t0, 0
# br label %label56
	b .knapsack_label56
.knapsack_label56:
# %op57 = load i32, i32* %op4
	ld.d $t0, $fp, -64
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -244
# %op58 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -248
# %op59 = mul i32 %op58, 11
	ld.w $t0, $fp, -248
	addi.w $t1, $zero, 11
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -252
# %op60 = load i32, i32* %op3
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -256
# %op61 = add i32 %op59, %op60
	ld.w $t0, $fp, -252
	ld.w $t1, $fp, -256
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -260
# %op62 = icmp slt i32 %op61, 0
	ld.w $t0, $fp, -260
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -261
# br i1 %op62, label %label89, label %label90
	ld.b $t0, $fp, -261
	beqz $t0, .knapsack_label90
	bnez $t0, .knapsack_label89
.knapsack_label63:
# %op64 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -268
# %op65 = sub i32 %op64, 1
	ld.w $t0, $fp, -268
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -272
# %op66 = load i32, i32* %op3
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -276
# %op67 = call i32 @knapsack(i32 %op65, i32 %op66)
	ld.w $a0, $fp, -272
	ld.w $a1, $fp, -276
	bl knapsack
	st.w $a0, $fp, -280
# %op68 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -284
# %op69 = sub i32 %op68, 1
	ld.w $t0, $fp, -284
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -288
# %op70 = load i32, i32* %op3
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -292
# %op71 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -296
# %op72 = sub i32 %op71, 1
	ld.w $t0, $fp, -296
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -300
# %op73 = icmp slt i32 %op72, 0
	ld.w $t0, $fp, -300
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -301
# br i1 %op73, label %label74, label %label75
	ld.b $t0, $fp, -301
	beqz $t0, .knapsack_label75
	bnez $t0, .knapsack_label74
.knapsack_label74:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 384
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.knapsack_label75:
# %op76 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 %op72
	la.local $t0, w
	ld.w $t2, $fp, -300
	addi.d $t1, $zero, 4
	mul.d $t1, $t2, $t1
	add.d $t0, $t1, $t0
	st.d $t0, $fp, -312
# %op77 = load i32, i32* %op76
	ld.d $t0, $fp, -312
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -316
# %op78 = sub i32 %op70, %op77
	ld.w $t0, $fp, -292
	ld.w $t1, $fp, -316
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -320
# %op79 = call i32 @knapsack(i32 %op69, i32 %op78)
	ld.w $a0, $fp, -288
	ld.w $a1, $fp, -320
	bl knapsack
	st.w $a0, $fp, -324
# %op80 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -328
# %op81 = sub i32 %op80, 1
	ld.w $t0, $fp, -328
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -332
# %op82 = icmp slt i32 %op81, 0
	ld.w $t0, $fp, -332
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -333
# br i1 %op82, label %label83, label %label84
	ld.b $t0, $fp, -333
	beqz $t0, .knapsack_label84
	bnez $t0, .knapsack_label83
.knapsack_label83:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 384
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.knapsack_label84:
# %op85 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 %op81
	la.local $t0, v
	ld.w $t2, $fp, -332
	addi.d $t1, $zero, 4
	mul.d $t1, $t2, $t1
	add.d $t0, $t1, $t0
	st.d $t0, $fp, -344
# %op86 = load i32, i32* %op85
	ld.d $t0, $fp, -344
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -348
# %op87 = add i32 %op79, %op86
	ld.w $t0, $fp, -324
	ld.w $t1, $fp, -348
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -352
# %op88 = call i32 @max(i32 %op67, i32 %op87)
	ld.w $a0, $fp, -280
	ld.w $a1, $fp, -352
	bl max
	st.w $a0, $fp, -356
# store i32 %op88, i32* %op4
	ld.d $t0, $fp, -64
	ld.w $t1, $fp, -356
	st.w $t1, $t0, 0
# br label %label56
	b .knapsack_label56
.knapsack_label89:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 384
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.knapsack_label90:
# %op91 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op61
	la.local $t0, dp
	ld.w $t2, $fp, -260
	addi.d $t1, $zero, 4
	mul.d $t1, $t2, $t1
	add.d $t0, $t1, $t0
	st.d $t0, $fp, -368
# store i32 %op57, i32* %op91
	ld.d $t0, $fp, -368
	ld.w $t1, $fp, -244
	st.w $t1, $t0, 0
# %op92 = load i32, i32* %op4
	ld.d $t0, $fp, -64
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -372
# ret i32 %op92
	ld.w $a0, $fp, -372
	addi.d $sp, $sp, 384
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	addi.d $sp, $sp, 384
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -240
.main_label_entry:
# %op0 = alloca i32
	addi.d $t0, $fp, -28
	st.d $t0, $fp, -24
# store i32 0, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# store i32 5, i32* @n
	la.local $t0, n
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
# store i32 10, i32* @m
	la.local $t0, m
	addi.w $t1, $zero, 10
	st.w $t1, $t0, 0
# %op1 = icmp slt i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -29
# br i1 %op1, label %label2, label %label3
	ld.b $t0, $fp, -29
	beqz $t0, .main_label3
	bnez $t0, .main_label2
.main_label2:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 240
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.main_label3:
# %op4 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 0
	la.local $t0, w
	addi.w $t2, $zero, 0
	addi.d $t1, $zero, 4
	mul.d $t1, $t2, $t1
	add.d $t0, $t1, $t0
	st.d $t0, $fp, -40
# store i32 2, i32* %op4
	ld.d $t0, $fp, -40
	addi.w $t1, $zero, 2
	st.w $t1, $t0, 0
# %op5 = icmp slt i32 1, 0
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -41
# br i1 %op5, label %label6, label %label7
	ld.b $t0, $fp, -41
	beqz $t0, .main_label7
	bnez $t0, .main_label6
.main_label6:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 240
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.main_label7:
# %op8 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 1
	la.local $t0, w
	addi.w $t2, $zero, 1
	addi.d $t1, $zero, 4
	mul.d $t1, $t2, $t1
	add.d $t0, $t1, $t0
	st.d $t0, $fp, -56
# store i32 2, i32* %op8
	ld.d $t0, $fp, -56
	addi.w $t1, $zero, 2
	st.w $t1, $t0, 0
# %op9 = icmp slt i32 2, 0
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -57
# br i1 %op9, label %label10, label %label11
	ld.b $t0, $fp, -57
	beqz $t0, .main_label11
	bnez $t0, .main_label10
.main_label10:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 240
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.main_label11:
# %op12 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 2
	la.local $t0, w
	addi.w $t2, $zero, 2
	addi.d $t1, $zero, 4
	mul.d $t1, $t2, $t1
	add.d $t0, $t1, $t0
	st.d $t0, $fp, -72
# store i32 6, i32* %op12
	ld.d $t0, $fp, -72
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
# %op13 = icmp slt i32 3, 0
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -73
# br i1 %op13, label %label14, label %label15
	ld.b $t0, $fp, -73
	beqz $t0, .main_label15
	bnez $t0, .main_label14
.main_label14:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 240
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.main_label15:
# %op16 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 3
	la.local $t0, w
	addi.w $t2, $zero, 3
	addi.d $t1, $zero, 4
	mul.d $t1, $t2, $t1
	add.d $t0, $t1, $t0
	st.d $t0, $fp, -88
# store i32 5, i32* %op16
	ld.d $t0, $fp, -88
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
# %op17 = icmp slt i32 4, 0
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -89
# br i1 %op17, label %label18, label %label19
	ld.b $t0, $fp, -89
	beqz $t0, .main_label19
	bnez $t0, .main_label18
.main_label18:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 240
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.main_label19:
# %op20 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 4
	la.local $t0, w
	addi.w $t2, $zero, 4
	addi.d $t1, $zero, 4
	mul.d $t1, $t2, $t1
	add.d $t0, $t1, $t0
	st.d $t0, $fp, -104
# store i32 4, i32* %op20
	ld.d $t0, $fp, -104
	addi.w $t1, $zero, 4
	st.w $t1, $t0, 0
# %op21 = icmp slt i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -105
# br i1 %op21, label %label22, label %label23
	ld.b $t0, $fp, -105
	beqz $t0, .main_label23
	bnez $t0, .main_label22
.main_label22:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 240
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.main_label23:
# %op24 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 0
	la.local $t0, v
	addi.w $t2, $zero, 0
	addi.d $t1, $zero, 4
	mul.d $t1, $t2, $t1
	add.d $t0, $t1, $t0
	st.d $t0, $fp, -120
# store i32 6, i32* %op24
	ld.d $t0, $fp, -120
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
# %op25 = icmp slt i32 1, 0
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -121
# br i1 %op25, label %label26, label %label27
	ld.b $t0, $fp, -121
	beqz $t0, .main_label27
	bnez $t0, .main_label26
.main_label26:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 240
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.main_label27:
# %op28 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 1
	la.local $t0, v
	addi.w $t2, $zero, 1
	addi.d $t1, $zero, 4
	mul.d $t1, $t2, $t1
	add.d $t0, $t1, $t0
	st.d $t0, $fp, -136
# store i32 3, i32* %op28
	ld.d $t0, $fp, -136
	addi.w $t1, $zero, 3
	st.w $t1, $t0, 0
# %op29 = icmp slt i32 2, 0
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -137
# br i1 %op29, label %label30, label %label31
	ld.b $t0, $fp, -137
	beqz $t0, .main_label31
	bnez $t0, .main_label30
.main_label30:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 240
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.main_label31:
# %op32 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 2
	la.local $t0, v
	addi.w $t2, $zero, 2
	addi.d $t1, $zero, 4
	mul.d $t1, $t2, $t1
	add.d $t0, $t1, $t0
	st.d $t0, $fp, -152
# store i32 5, i32* %op32
	ld.d $t0, $fp, -152
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
# %op33 = icmp slt i32 3, 0
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -153
# br i1 %op33, label %label34, label %label35
	ld.b $t0, $fp, -153
	beqz $t0, .main_label35
	bnez $t0, .main_label34
.main_label34:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 240
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.main_label35:
# %op36 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 3
	la.local $t0, v
	addi.w $t2, $zero, 3
	addi.d $t1, $zero, 4
	mul.d $t1, $t2, $t1
	add.d $t0, $t1, $t0
	st.d $t0, $fp, -168
# store i32 4, i32* %op36
	ld.d $t0, $fp, -168
	addi.w $t1, $zero, 4
	st.w $t1, $t0, 0
# %op37 = icmp slt i32 4, 0
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -169
# br i1 %op37, label %label38, label %label39
	ld.b $t0, $fp, -169
	beqz $t0, .main_label39
	bnez $t0, .main_label38
.main_label38:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 240
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.main_label39:
# %op40 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 4
	la.local $t0, v
	addi.w $t2, $zero, 4
	addi.d $t1, $zero, 4
	mul.d $t1, $t2, $t1
	add.d $t0, $t1, $t0
	st.d $t0, $fp, -184
# store i32 6, i32* %op40
	ld.d $t0, $fp, -184
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
# br label %label41
	b .main_label41
.main_label41:
# %op42 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -188
# %op43 = icmp slt i32 %op42, 66
	ld.w $t0, $fp, -188
	addi.w $t1, $zero, 66
	slt $t2, $t0, $t1
	st.b $t2, $fp, -189
# %op44 = zext i1 %op43 to i32
	ld.b $t0, $fp, -189
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -196
# %op45 = icmp ne i32 %op44, 0
	ld.w $t0, $fp, -196
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	add.w $t2, $t2, $t3
	st.b $t2, $fp, -197
# br i1 %op45, label %label46, label %label50
	ld.b $t0, $fp, -197
	beqz $t0, .main_label50
	bnez $t0, .main_label46
.main_label46:
# %op47 = sub i32 0, 1
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -204
# %op48 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -208
# %op49 = icmp slt i32 %op48, 0
	ld.w $t0, $fp, -208
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -209
# br i1 %op49, label %label54, label %label55
	ld.b $t0, $fp, -209
	beqz $t0, .main_label55
	bnez $t0, .main_label54
.main_label50:
# %op51 = load i32, i32* @n
	la.local $t0, n
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -216
# %op52 = load i32, i32* @m
	la.local $t0, m
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -220
# %op53 = call i32 @knapsack(i32 %op51, i32 %op52)
	ld.w $a0, $fp, -216
	ld.w $a1, $fp, -220
	bl knapsack
	st.w $a0, $fp, -224
# call void @output(i32 %op53)
	ld.w $a0, $fp, -224
	bl output
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 240
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.main_label54:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 240
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.main_label55:
# %op56 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op48
	la.local $t0, dp
	ld.w $t2, $fp, -208
	addi.d $t1, $zero, 4
	mul.d $t1, $t2, $t1
	add.d $t0, $t1, $t0
	st.d $t0, $fp, -232
# store i32 %op47, i32* %op56
	ld.d $t0, $fp, -232
	ld.w $t1, $fp, -204
	st.w $t1, $t0, 0
# %op57 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -236
# %op58 = add i32 %op57, 1
	ld.w $t0, $fp, -236
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -240
# store i32 %op58, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -240
	st.w $t1, $t0, 0
# br label %label41
	b .main_label41
	addi.d $sp, $sp, 240
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
