; ModuleID = 'cminus'
source_filename = "/home/bingyu/2023ustc-jianmu-compiler/tests/3-codegen/autogen/testcases_general/16-if_chain.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @main() {
label_entry:
  %op0 = alloca i32
  %op1 = alloca i32
  %op2 = alloca i32
  store i32 0, i32* %op2
  store i32 2, i32* %op0
  store i32 1, i32* %op1
  %op3 = load i32, i32* %op1
  %op4 = icmp ne i32 %op3, 0
  br i1 %op4, label %label5, label %label8
label5:                                                ; preds = %label_entry
  %op6 = load i32, i32* %op2
  %op7 = icmp ne i32 %op6, 0
  br i1 %op7, label %label10, label %label12
label8:                                                ; preds = %label_entry, %label11
  %op9 = load i32, i32* %op0
  ret i32 %op9
label10:                                                ; preds = %label5
  store i32 4, i32* %op0
  br label %label11
label11:                                                ; preds = %label10, %label12
  br label %label8
label12:                                                ; preds = %label5
  store i32 3, i32* %op0
  br label %label11
}
