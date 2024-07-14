; ModuleID = 'cminus'
source_filename = "/home/bingyu/2023ustc-jianmu-compiler/tests/3-codegen/autogen/testcases_general/13-if_stmt.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define void @main() {
label_entry:
  %op0 = alloca i32
  store i32 2, i32* %op0
  %op1 = load i32, i32* %op0
  %op2 = icmp ne i32 %op1, 0
  br i1 %op2, label %label3, label %label4
label3:                                                ; preds = %label_entry
  store i32 3, i32* %op0
  br label %label4
label4:                                                ; preds = %label_entry, %label3
  store i32 4, i32* %op0
  ret void
}
