; ModuleID = 'cminus'
source_filename = "/home/bingyu/2023ustc-jianmu-compiler/tests/3-codegen/autogen/testcases/11-floatcall.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define float @mod(float %arg0, float %arg1) {
label_entry:
  %op2 = alloca float
  store float %arg0, float* %op2
  %op3 = alloca float
  store float %arg1, float* %op3
  %op4 = alloca i32
  %op5 = load float, float* %op2
  %op6 = load float, float* %op3
  %op7 = fdiv float %op5, %op6
  %op8 = fptosi float %op7 to i32
  store i32 %op8, i32* %op4
  %op9 = load float, float* %op2
  %op10 = load i32, i32* %op4
  %op11 = load float, float* %op3
  %op12 = sitofp i32 %op10 to float
  %op13 = fmul float %op12, %op11
  %op14 = fsub float %op9, %op13
  ret float %op14
}
define i32 @main() {
label_entry:
  %op0 = alloca float
  %op1 = alloca float
  store float 0x4026666660000000, float* %op0
  store float 0x40019999a0000000, float* %op1
  %op2 = load float, float* %op0
  %op3 = load float, float* %op1
  %op4 = call float @mod(float %op2, float %op3)
  call void @outputFloat(float %op4)
  ret i32 0
}
