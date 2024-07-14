	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -80
.main_label_entry:
# %op0 = alloca float
	addi.d $t0, $fp, -28
	st.d $t0, $fp, -24
# %op1 = alloca float
	addi.d $t0, $fp, -44
	st.d $t0, $fp, -40
# %op2 = alloca float
	addi.d $t0, $fp, -60
	st.d $t0, $fp, -56
# store float 0x3ff19999a0000000, float* %op0
	ld.d $t0, $fp, -24
	lu12i.w $t8, 260300
	ori $t8, $t8, 3277
	movgr2fr.w $ft0, $t8
	fst.s $ft0, $t0, 0
# store float 0x3ff8000000000000, float* %op1
	ld.d $t0, $fp, -40
	lu12i.w $t8, 261120
	ori $t8, $t8, 0
	movgr2fr.w $ft0, $t8
	fst.s $ft0, $t0, 0
# store float 0x3ff3333340000000, float* %op2
	ld.d $t0, $fp, -56
	lu12i.w $t8, 260505
	ori $t8, $t8, 2458
	movgr2fr.w $ft0, $t8
	fst.s $ft0, $t0, 0
# %op3 = load float, float* %op0
	ld.d $t0, $fp, -24
	fld.s $ft0, $t0, 0
	fst.s $ft0, $fp, -64
# %op4 = load float, float* %op1
	ld.d $t0, $fp, -40
	fld.s $ft0, $t0, 0
	fst.s $ft0, $fp, -68
# %op5 = fmul float %op3, %op4
	fld.s $ft0, $fp, -64
	fld.s $ft1, $fp, -68
	fmul.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -72
# %op6 = load float, float* %op2
	ld.d $t0, $fp, -56
	fld.s $ft0, $t0, 0
	fst.s $ft0, $fp, -76
# %op7 = fadd float %op5, %op6
	fld.s $ft0, $fp, -72
	fld.s $ft1, $fp, -76
	fadd.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -80
# call void @outputFloat(float %op7)
	fld.s $fa0, $fp, -80
	bl outputFloat
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
