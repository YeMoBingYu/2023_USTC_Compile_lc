; ModuleID = 'cminus'
source_filename = "/home/bingyu/2023ustc-jianmu-compiler/tests/3-codegen/autogen/testcases_general/10-funcall.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define void @test(i32 %arg0) {
label_entry:
  %op1 = alloca i32
  store i32 %arg0, i32* %op1
  ret void
}
define void @main() {
label_entry:
  %op0 = alloca i32
  store i32 10, i32* %op0
  %op1 = load i32, i32* %op0
  call void @test(i32 %op1)
  ret void
}
