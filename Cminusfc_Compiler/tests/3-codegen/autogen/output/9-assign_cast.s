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
# %op2 = icmp slt i32 1, 3
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 3
	slt $t2, $t0, $t1
	st.b $t2, $fp, -45
# %op3 = zext i1 %op2 to i32
	ld.b $t0, $fp, -45
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -52
# store i32 %op3, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -52
	st.w $t1, $t0, 0
# %op4 = sitofp i32 2 to float
	addi.w $t0, $zero, 2
	movgr2fr.w $ft0, $t0
	ffint.s.w $ft1, $ft0
	fst.s $ft1, $fp, -56
# %op5 = fadd float %op4, 0x4003333340000000
	fld.s $ft0, $fp, -56
	lu12i.w $t8, 262553
	ori $t8, $t8, 2458
	movgr2fr.w $ft1, $t8
	fadd.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -60
# %op6 = fptosi float %op5 to i32
	fld.s $ft0, $fp, -60
	ftintrz.w.s $ft1, $ft0
	movfr2gr.s $t0, $ft1
	st.w $t0, $fp, -64
# store i32 %op6, i32* %op1
	ld.d $t0, $fp, -40
	ld.w $t1, $fp, -64
	st.w $t1, $t0, 0
# %op7 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -68
# %op8 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -72
# %op9 = add i32 %op7, %op8
	ld.w $t0, $fp, -68
	ld.w $t1, $fp, -72
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -76
# ret i32 %op9
	ld.w $a0, $fp, -76
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
