	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -48
.main_label_entry:
# br label %label0
	addi.w $t0, $zero, 10
	st.w $t0, $fp, -20
	b .main_label0
.main_label0:
# %op1 = phi i32 [ 10, %label_entry ], [ %op9, %label13 ]
# %op2 = icmp ne i32 %op1, 0
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	add.w $t2, $t2, $t3
	st.b $t2, $fp, -21
# br i1 %op2, label %label3, label %label5
	ld.b $t0, $fp, -21
	beqz $t0, .main_label5
	bnez $t0, .main_label3
.main_label3:
# %op4 = sub i32 %op1, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -28
# br label %label7
	ld.w $t0, $fp, -28
	st.w $t0, $fp, -36
	ld.w $t0, $fp, -28
	st.w $t0, $fp, -40
	b .main_label7
.main_label5:
# %op6 = add i32 %op1, %op8
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -36
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -32
# ret i32 %op6
	ld.w $a0, $fp, -32
	addi.d $sp, $sp, 48
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.main_label7:
# %op8 = phi i32 [ %op4, %label3 ], [ %op12, %label11 ]
# %op9 = phi i32 [ %op4, %label3 ], [ %op9, %label11 ]
# %op10 = icmp ne i32 %op8, 0
	ld.w $t0, $fp, -36
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	add.w $t2, $t2, $t3
	st.b $t2, $fp, -41
# br i1 %op10, label %label11, label %label13
	ld.b $t0, $fp, -41
	beqz $t0, .main_label13
	bnez $t0, .main_label11
.main_label11:
# %op12 = sub i32 %op8, 1
	ld.w $t0, $fp, -36
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -48
# br label %label7
	ld.w $t0, $fp, -48
	st.w $t0, $fp, -36
	ld.w $t0, $fp, -40
	st.w $t0, $fp, -40
	b .main_label7
.main_label13:
# br label %label0
	ld.w $t0, $fp, -40
	st.w $t0, $fp, -20
	b .main_label0
	addi.d $sp, $sp, 48
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
