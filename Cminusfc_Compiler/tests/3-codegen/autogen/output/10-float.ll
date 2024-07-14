; ModuleID = 'cminus'
source_filename = "/home/bingyu/2023ustc-jianmu-compiler/tests/3-codegen/autogen/testcases/10-float.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @main() {
label_entry:
  %op0 = alloca float
  %op1 = alloca float
  %op2 = alloca float
  store float 0x3ff19999a0000000, float* %op0
  store float 0x3ff8000000000000, float* %op1
  store float 0x3ff3333340000000, float* %op2
  %op3 = load float, float* %op0
  %op4 = load float, float* %op1
  %op5 = fmul float %op3, %op4
  %op6 = load float, float* %op2
  %op7 = fadd float %op5, %op6
  call void @outputFloat(float %op7)
  ret i32 0
}
