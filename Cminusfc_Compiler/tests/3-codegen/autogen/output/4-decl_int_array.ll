; ModuleID = 'cminus'
source_filename = "/home/bingyu/2023ustc-jianmu-compiler/tests/3-codegen/autogen/testcases_general/4-decl_int_array.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define void @main() {
label_entry:
  %op0 = alloca [10 x i32]
  ret void
}
