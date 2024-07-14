	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -80
.main_label_entry:
# br label %label0
	addi.w $t0, $zero, 0
	st.w $t0, $fp, -20
	addi.w $t0, $zero, 10
	st.w $t0, $fp, -24
	addi.w $t0, $zero, 0
	st.w $t0, $fp, -28
	b .main_label0
.main_label0:
# %op1 = phi i32 [ 0, %label_entry ], [ %op15, %label14 ]
# %op2 = phi i32 [ 10, %label_entry ], [ %op6, %label14 ]
# %op3 = phi i32 [ 0, %label_entry ], [ %op16, %label14 ]
# %op4 = icmp ne i32 %op2, 0
	ld.w $t0, $fp, -24
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	add.w $t2, $t2, $t3
	st.b $t2, $fp, -29
# br i1 %op4, label %label5, label %label10
	ld.b $t0, $fp, -29
	beqz $t0, .main_label10
	bnez $t0, .main_label5
.main_label5:
# %op6 = sub i32 %op2, 1
	ld.w $t0, $fp, -24
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -36
# %op7 = icmp slt i32 %op6, 5
	ld.w $t0, $fp, -36
	addi.w $t1, $zero, 5
	slt $t2, $t0, $t1
	st.b $t2, $fp, -37
# %op8 = zext i1 %op7 to i32
	ld.b $t0, $fp, -37
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -44
# %op9 = icmp ne i32 %op8, 0
	ld.w $t0, $fp, -44
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	add.w $t2, $t2, $t3
	st.b $t2, $fp, -45
# br i1 %op9, label %label12, label %label17
	ld.b $t0, $fp, -45
	beqz $t0, .main_label17
	bnez $t0, .main_label12
.main_label10:
# %op11 = add i32 %op1, %op3
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -28
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -52
# ret i32 %op11
	ld.w $a0, $fp, -52
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.main_label12:
# %op13 = add i32 %op1, %op6
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -36
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -56
# br label %label14
	ld.w $t0, $fp, -56
	st.w $t0, $fp, -60
	ld.w $t0, $fp, -28
	st.w $t0, $fp, -64
	b .main_label14
.main_label14:
# %op15 = phi i32 [ %op13, %label12 ], [ %op1, %label17 ]
# %op16 = phi i32 [ %op3, %label12 ], [ %op18, %label17 ]
# br label %label0
	ld.w $t0, $fp, -60
	st.w $t0, $fp, -20
	ld.w $t0, $fp, -36
	st.w $t0, $fp, -24
	ld.w $t0, $fp, -64
	st.w $t0, $fp, -28
	b .main_label0
.main_label17:
# %op18 = add i32 %op3, %op6
	ld.w $t0, $fp, -28
	ld.w $t1, $fp, -36
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -68
# br label %label14
	ld.w $t0, $fp, -20
	st.w $t0, $fp, -60
	ld.w $t0, $fp, -68
	st.w $t0, $fp, -64
	b .main_label14
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
