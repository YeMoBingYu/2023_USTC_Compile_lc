; ModuleID = 'cminus'
source_filename = "/home/bingyu/2023ustc-jianmu-compiler/tests/3-codegen/autogen/testcases_general/14-while_stmt.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define void @main() {
label_entry:
  %op0 = alloca i32
  store i32 10, i32* %op0
  br label %label1
label1:                                                ; preds = %label_entry, %label4
  %op2 = load i32, i32* %op0
  %op3 = icmp ne i32 %op2, 0
  br i1 %op3, label %label4, label %label7
label4:                                                ; preds = %label1
  %op5 = load i32, i32* %op0
  %op6 = sub i32 %op5, 1
  store i32 %op6, i32* %op0
  br label %label1
label7:                                                ; preds = %label1
  ret void
}
