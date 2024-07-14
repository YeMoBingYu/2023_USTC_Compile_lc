; ModuleID = 'cminus'
source_filename = "/home/bingyu/2023ustc-jianmu-compiler/tests/3-codegen/autogen/testcases_general/19-global_local_var.cminus"

@a = global i32 zeroinitializer
declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define void @GlobalAssign() {
label_entry:
  store i32 10, i32* @a
  ret void
}
define i32 @main() {
label_entry:
  %op0 = alloca i32
  call void @GlobalAssign()
  store i32 20, i32* %op0
  %op1 = load i32, i32* %op0
  ret i32 %op1
}
