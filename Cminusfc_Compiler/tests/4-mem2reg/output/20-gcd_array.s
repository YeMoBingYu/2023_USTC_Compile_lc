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
	addi.d $sp, $sp, -64
	st.w $a0, $fp, -20
	st.w $a1, $fp, -24
.gcd_label_entry:
# %op2 = icmp eq i32 %arg1, 0
	ld.w $t0, $fp, -24
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	add.w $t2, $t2, $t3
	xori $t2, $t2, 1
	st.b $t2, $fp, -25
# %op3 = zext i1 %op2 to i32
	ld.b $t0, $fp, -25
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -32
# %op4 = icmp ne i32 %op3, 0
	ld.w $t0, $fp, -32
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	add.w $t2, $t2, $t3
	st.b $t2, $fp, -33
# br i1 %op4, label %label5, label %label7
	ld.b $t0, $fp, -33
	beqz $t0, .gcd_label7
	bnez $t0, .gcd_label5
.gcd_label5:
# ret i32 %arg0
	ld.w $a0, $fp, -20
	addi.d $sp, $sp, 64
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.gcd_label6:
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 64
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.gcd_label7:
# %op8 = sdiv i32 %arg0, %arg1
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -24
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -40
# %op9 = mul i32 %op8, %arg1
	ld.w $t0, $fp, -40
	ld.w $t1, $fp, -24
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -44
# %op10 = sub i32 %arg0, %op9
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -44
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -48
# %op11 = call i32 @gcd(i32 %arg1, i32 %op10)
	ld.w $a0, $fp, -24
	ld.w $a1, $fp, -48
	bl gcd
	st.w $a0, $fp, -52
# ret i32 %op11
	ld.w $a0, $fp, -52
	addi.d $sp, $sp, 64
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	addi.d $sp, $sp, 64
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl funArray
	.type funArray, @function
funArray:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -96
	st.d $a0, $fp, -24
	st.d $a1, $fp, -32
.funArray_label_entry:
# %op2 = icmp slt i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -33
# br i1 %op2, label %label3, label %label4
	ld.b $t0, $fp, -33
	beqz $t0, .funArray_label4
	bnez $t0, .funArray_label3
.funArray_label3:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 96
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.funArray_label4:
# %op5 = getelementptr i32, i32* %arg0, i32 0
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 0
	addi.d $t1, $zero, 4
	mul.d $t1, $t2, $t1
	add.d $t0, $t1, $t0
	st.d $t0, $fp, -48
# %op6 = load i32, i32* %op5
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -52
# %op7 = icmp slt i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -53
# br i1 %op7, label %label8, label %label9
	ld.b $t0, $fp, -53
	beqz $t0, .funArray_label9
	bnez $t0, .funArray_label8
.funArray_label8:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 96
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.funArray_label9:
# %op10 = getelementptr i32, i32* %arg1, i32 0
	ld.d $t0, $fp, -32
	addi.w $t2, $zero, 0
	addi.d $t1, $zero, 4
	mul.d $t1, $t2, $t1
	add.d $t0, $t1, $t0
	st.d $t0, $fp, -64
# %op11 = load i32, i32* %op10
	ld.d $t0, $fp, -64
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -68
# %op12 = icmp slt i32 %op6, %op11
	ld.w $t0, $fp, -52
	ld.w $t1, $fp, -68
	slt $t2, $t0, $t1
	st.b $t2, $fp, -69
# %op13 = zext i1 %op12 to i32
	ld.b $t0, $fp, -69
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -76
# %op14 = icmp ne i32 %op13, 0
	ld.w $t0, $fp, -76
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	add.w $t2, $t2, $t3
	st.b $t2, $fp, -77
# br i1 %op14, label %label15, label %label16
	ld.w $t0, $fp, -68
	st.w $t0, $fp, -84
	ld.w $t0, $fp, -52
	st.w $t0, $fp, -88
	ld.b $t0, $fp, -77
	beqz $t0, .funArray_label16
	bnez $t0, .funArray_label15
.funArray_label15:
# br label %label16
	ld.w $t0, $fp, -52
	st.w $t0, $fp, -84
	ld.w $t0, $fp, -68
	st.w $t0, $fp, -88
	b .funArray_label16
.funArray_label16:
# %op17 = phi i32 [ %op11, %label9 ], [ %op6, %label15 ]
# %op18 = phi i32 [ %op6, %label9 ], [ %op11, %label15 ]
# %op19 = call i32 @gcd(i32 %op18, i32 %op17)
	ld.w $a0, $fp, -88
	ld.w $a1, $fp, -84
	bl gcd
	st.w $a0, $fp, -92
# ret i32 %op19
	ld.w $a0, $fp, -92
	addi.d $sp, $sp, 96
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	addi.d $sp, $sp, 96
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
