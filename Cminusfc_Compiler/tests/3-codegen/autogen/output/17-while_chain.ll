; ModuleID = 'cminus'
source_filename = "/home/bingyu/2023ustc-jianmu-compiler/tests/3-codegen/autogen/testcases_general/17-while_chain.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @main() {
label_entry:
  %op0 = alloca i32
  %op1 = alloca i32
  store i32 10, i32* %op0
  br label %label2
label2:                                                ; preds = %label_entry, %label19
  %op3 = load i32, i32* %op0
  %op4 = icmp ne i32 %op3, 0
  br i1 %op4, label %label5, label %label9
label5:                                                ; preds = %label2
  %op6 = load i32, i32* %op0
  %op7 = sub i32 %op6, 1
  store i32 %op7, i32* %op0
  %op8 = load i32, i32* %op0
  store i32 %op8, i32* %op1
  br label %label13
label9:                                                ; preds = %label2
  %op10 = load i32, i32* %op0
  %op11 = load i32, i32* %op1
  %op12 = add i32 %op10, %op11
  ret i32 %op12
label13:                                                ; preds = %label5, %label16
  %op14 = load i32, i32* %op1
  %op15 = icmp ne i32 %op14, 0
  br i1 %op15, label %label16, label %label19
label16:                                                ; preds = %label13
  %op17 = load i32, i32* %op1
  %op18 = sub i32 %op17, 1
  store i32 %op18, i32* %op1
  br label %label13
label19:                                                ; preds = %label13
  br label %label2
}
