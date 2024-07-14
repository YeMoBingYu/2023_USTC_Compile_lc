# Global variables
	.text
	.section .bss, "aw", @nobits
	.globl x
	.type x, @object
	.size x, 4
x:
	.space 4
	.globl y
	.type y, @object
	.size y, 4
y:
	.space 4
	.text
	.globl gcd
	.type gcd, @function
gcd:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -112
	st.w $a0, $fp, -20
	st.w $a1, $fp, -24
.gcd_label_entry:
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
# %op4 = load i32, i32* %op3
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -56
# %op5 = icmp eq i32 %op4, 0
	ld.w $t0, $fp, -56
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	add.w $t2, $t2, $t3
	xori $t2, $t2, 1
	st.b $t2, $fp, -57
# %op6 = zext i1 %op5 to i32
	ld.b $t0, $fp, -57
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -64
# %op7 = icmp ne i32 %op6, 0
	ld.w $t0, $fp, -64
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	add.w $t2, $t2, $t3
	st.b $t2, $fp, -65
# br i1 %op7, label %label8, label %label11
	ld.b $t0, $fp, -65
	beqz $t0, .gcd_label11
	bnez $t0, .gcd_label8
.gcd_label8:
# %op9 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -72
# ret i32 %op9
	ld.w $a0, $fp, -72
	addi.d $sp, $sp, 112
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.gcd_label10:
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 112
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.gcd_label11:
# %op12 = load i32, i32* %op3
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -76
# %op13 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -80
# %op14 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -84
# %op15 = load i32, i32* %op3
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -88
# %op16 = sdiv i32 %op14, %op15
	ld.w $t0, $fp, -84
	ld.w $t1, $fp, -88
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -92
# %op17 = load i32, i32* %op3
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -96
# %op18 = mul i32 %op16, %op17
	ld.w $t0, $fp, -92
	ld.w $t1, $fp, -96
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -100
# %op19 = sub i32 %op13, %op18
	ld.w $t0, $fp, -80
	ld.w $t1, $fp, -100
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -104
# %op20 = call i32 @gcd(i32 %op12, i32 %op19)
	ld.w $a0, $fp, -76
	ld.w $a1, $fp, -104
	bl gcd
	st.w $a0, $fp, -108
# ret i32 %op20
	ld.w $a0, $fp, -108
	addi.d $sp, $sp, 112
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	addi.d $sp, $sp, 112
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl funArray
	.type funArray, @function
funArray:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -208
	st.d $a0, $fp, -24
	st.d $a1, $fp, -32
.funArray_label_entry:
# %op2 = alloca i32*
	addi.d $t0, $fp, -48
	st.d $t0, $fp, -40
# store i32* %arg0, i32** %op2
	ld.d $t0, $fp, -40
	ld.d $t1, $fp, -24
	st.d $t1, $t0, 0
# %op3 = alloca i32*
	addi.d $t0, $fp, -64
	st.d $t0, $fp, -56
# store i32* %arg1, i32** %op3
	ld.d $t0, $fp, -56
	ld.d $t1, $fp, -32
	st.d $t1, $t0, 0
# %op4 = alloca i32
	addi.d $t0, $fp, -76
	st.d $t0, $fp, -72
# %op5 = alloca i32
	addi.d $t0, $fp, -92
	st.d $t0, $fp, -88
# %op6 = alloca i32
	addi.d $t0, $fp, -108
	st.d $t0, $fp, -104
# %op7 = icmp slt i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -109
# br i1 %op7, label %label8, label %label9
	ld.b $t0, $fp, -109
	beqz $t0, .funArray_label9
	bnez $t0, .funArray_label8
.funArray_label8:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 208
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.funArray_label9:
# %op10 = load i32*, i32** %op2
	ld.d $t0, $fp, -40
	ld.d $t1, $t0, 0
	st.d $t1, $fp, -120
# %op11 = getelementptr i32, i32* %op10, i32 0
	ld.d $t0, $fp, -120
	addi.w $t2, $zero, 0
	addi.d $t1, $zero, 4
	mul.d $t1, $t2, $t1
	add.d $t0, $t1, $t0
	st.d $t0, $fp, -128
# %op12 = load i32, i32* %op11
	ld.d $t0, $fp, -128
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -132
# store i32 %op12, i32* %op4
	ld.d $t0, $fp, -72
	ld.w $t1, $fp, -132
	st.w $t1, $t0, 0
# %op13 = icmp slt i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -133
# br i1 %op13, label %label14, label %label15
	ld.b $t0, $fp, -133
	beqz $t0, .funArray_label15
	bnez $t0, .funArray_label14
.funArray_label14:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 208
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.funArray_label15:
# %op16 = load i32*, i32** %op3
	ld.d $t0, $fp, -56
	ld.d $t1, $t0, 0
	st.d $t1, $fp, -144
# %op17 = getelementptr i32, i32* %op16, i32 0
	ld.d $t0, $fp, -144
	addi.w $t2, $zero, 0
	addi.d $t1, $zero, 4
	mul.d $t1, $t2, $t1
	add.d $t0, $t1, $t0
	st.d $t0, $fp, -152
# %op18 = load i32, i32* %op17
	ld.d $t0, $fp, -152
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -156
# store i32 %op18, i32* %op5
	ld.d $t0, $fp, -88
	ld.w $t1, $fp, -156
	st.w $t1, $t0, 0
# %op19 = load i32, i32* %op4
	ld.d $t0, $fp, -72
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -160
# %op20 = load i32, i32* %op5
	ld.d $t0, $fp, -88
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -164
# %op21 = icmp slt i32 %op19, %op20
	ld.w $t0, $fp, -160
	ld.w $t1, $fp, -164
	slt $t2, $t0, $t1
	st.b $t2, $fp, -165
# %op22 = zext i1 %op21 to i32
	ld.b $t0, $fp, -165
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -172
# %op23 = icmp ne i32 %op22, 0
	ld.w $t0, $fp, -172
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	add.w $t2, $t2, $t3
	st.b $t2, $fp, -173
# br i1 %op23, label %label24, label %label28
	ld.b $t0, $fp, -173
	beqz $t0, .funArray_label28
	bnez $t0, .funArray_label24
.funArray_label24:
# %op25 = load i32, i32* %op4
	ld.d $t0, $fp, -72
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -180
# store i32 %op25, i32* %op6
	ld.d $t0, $fp, -104
	ld.w $t1, $fp, -180
	st.w $t1, $t0, 0
# %op26 = load i32, i32* %op5
	ld.d $t0, $fp, -88
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -184
# store i32 %op26, i32* %op4
	ld.d $t0, $fp, -72
	ld.w $t1, $fp, -184
	st.w $t1, $t0, 0
# %op27 = load i32, i32* %op6
	ld.d $t0, $fp, -104
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -188
# store i32 %op27, i32* %op5
	ld.d $t0, $fp, -88
	ld.w $t1, $fp, -188
	st.w $t1, $t0, 0
# br label %label28
	b .funArray_label28
.funArray_label28:
# %op29 = load i32, i32* %op4
	ld.d $t0, $fp, -72
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -192
# %op30 = load i32, i32* %op5
	ld.d $t0, $fp, -88
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -196
# %op31 = call i32 @gcd(i32 %op29, i32 %op30)
	ld.w $a0, $fp, -192
	ld.w $a1, $fp, -196
	bl gcd
	st.w $a0, $fp, -200
# ret i32 %op31
	ld.w $a0, $fp, -200
	addi.d $sp, $sp, 208
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	addi.d $sp, $sp, 208
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -80
.main_label_entry:
# %op0 = icmp slt i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -17
# br i1 %op0, label %label1, label %label2
	ld.b $t0, $fp, -17
	beqz $t0, .main_label2
	bnez $t0, .main_label1
.main_label1:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.main_label2:
# %op3 = getelementptr [1 x i32], [1 x i32]* @x, i32 0, i32 0
	la.local $t0, x
	addi.w $t2, $zero, 0
	addi.d $t1, $zero, 4
	mul.d $t1, $t2, $t1
	add.d $t0, $t1, $t0
	st.d $t0, $fp, -32
# store i32 90, i32* %op3
	ld.d $t0, $fp, -32
	addi.w $t1, $zero, 90
	st.w $t1, $t0, 0
# %op4 = icmp slt i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -33
# br i1 %op4, label %label5, label %label6
	ld.b $t0, $fp, -33
	beqz $t0, .main_label6
	bnez $t0, .main_label5
.main_label5:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.main_label6:
# %op7 = getelementptr [1 x i32], [1 x i32]* @y, i32 0, i32 0
	la.local $t0, y
	addi.w $t2, $zero, 0
	addi.d $t1, $zero, 4
	mul.d $t1, $t2, $t1
	add.d $t0, $t1, $t0
	st.d $t0, $fp, -48
# store i32 18, i32* %op7
	ld.d $t0, $fp, -48
	addi.w $t1, $zero, 18
	st.w $t1, $t0, 0
# %op8 = getelementptr [1 x i32], [1 x i32]* @x, i32 0, i32 0
	la.local $t0, x
	addi.w $t2, $zero, 0
	addi.d $t1, $zero, 4
	mul.d $t1, $t2, $t1
	add.d $t0, $t1, $t0
	st.d $t0, $fp, -56
# %op9 = getelementptr [1 x i32], [1 x i32]* @y, i32 0, i32 0
	la.local $t0, y
	addi.w $t2, $zero, 0
	addi.d $t1, $zero, 4
	mul.d $t1, $t2, $t1
	add.d $t0, $t1, $t0
	st.d $t0, $fp, -64
# %op10 = call i32 @funArray(i32* %op8, i32* %op9)
	ld.d $a0, $fp, -56
	ld.d $a1, $fp, -64
	bl funArray
	st.w $a0, $fp, -68
# ret i32 %op10
	ld.w $a0, $fp, -68
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
