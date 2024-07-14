; ModuleID = 'cminus'
source_filename = "/home/bingyu/2023ustc-jianmu-compiler/tests/3-codegen/autogen/testcases/13-complex.cminus"

@n = global i32 zeroinitializer
@m = global i32 zeroinitializer
@w = global [5 x i32] zeroinitializer
@v = global [5 x i32] zeroinitializer
@dp = global [66 x i32] zeroinitializer
declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @max(i32 %arg0, i32 %arg1) {
label_entry:
  %op2 = alloca i32
  store i32 %arg0, i32* %op2
  %op3 = alloca i32
  store i32 %arg1, i32* %op3
  %op4 = load i32, i32* %op2
  %op5 = load i32, i32* %op3
  %op6 = icmp sgt i32 %op4, %op5
  %op7 = zext i1 %op6 to i32
  %op8 = icmp ne i32 %op7, 0
  br i1 %op8, label %label9, label %label12
label9:                                                ; preds = %label_entry
  %op10 = load i32, i32* %op2
  ret i32 %op10
label11:
  ret i32 0
label12:                                                ; preds = %label_entry
  %op13 = load i32, i32* %op3
  ret i32 %op13
}
define i32 @knapsack(i32 %arg0, i32 %arg1) {
label_entry:
  %op2 = alloca i32
  store i32 %arg0, i32* %op2
  %op3 = alloca i32
  store i32 %arg1, i32* %op3
  %op4 = alloca i32
  %op5 = load i32, i32* %op3
  %op6 = icmp sle i32 %op5, 0
  %op7 = zext i1 %op6 to i32
  %op8 = icmp ne i32 %op7, 0
  br i1 %op8, label %label9, label %label10
label9:                                                ; preds = %label_entry
  ret i32 0
label10:                                                ; preds = %label_entry
  %op11 = load i32, i32* %op2
  %op12 = icmp eq i32 %op11, 0
  %op13 = zext i1 %op12 to i32
  %op14 = icmp ne i32 %op13, 0
  br i1 %op14, label %label15, label %label16
label15:                                                ; preds = %label10
  ret i32 0
label16:                                                ; preds = %label10
  %op17 = load i32, i32* %op2
  %op18 = mul i32 %op17, 11
  %op19 = load i32, i32* %op3
  %op20 = add i32 %op18, %op19
  %op21 = icmp slt i32 %op20, 0
  br i1 %op21, label %label22, label %label23
label22:                                                ; preds = %label16
  call void @neg_idx_except()
  ret i32 0
label23:                                                ; preds = %label16
  %op24 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op20
  %op25 = load i32, i32* %op24
  %op26 = icmp sge i32 %op25, 0
  %op27 = zext i1 %op26 to i32
  %op28 = icmp ne i32 %op27, 0
  br i1 %op28, label %label29, label %label35
label29:                                                ; preds = %label23
  %op30 = load i32, i32* %op2
  %op31 = mul i32 %op30, 11
  %op32 = load i32, i32* %op3
  %op33 = add i32 %op31, %op32
  %op34 = icmp slt i32 %op33, 0
  br i1 %op34, label %label40, label %label41
label35:                                                ; preds = %label23
  %op36 = load i32, i32* %op3
  %op37 = load i32, i32* %op2
  %op38 = sub i32 %op37, 1
  %op39 = icmp slt i32 %op38, 0
  br i1 %op39, label %label44, label %label45
label40:                                                ; preds = %label29
  call void @neg_idx_except()
  ret i32 0
label41:                                                ; preds = %label29
  %op42 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op33
  %op43 = load i32, i32* %op42
  ret i32 %op43
label44:                                                ; preds = %label35
  call void @neg_idx_except()
  ret i32 0
label45:                                                ; preds = %label35
  %op46 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 %op38
  %op47 = load i32, i32* %op46
  %op48 = icmp slt i32 %op36, %op47
  %op49 = zext i1 %op48 to i32
  %op50 = icmp ne i32 %op49, 0
  br i1 %op50, label %label51, label %label63
label51:                                                ; preds = %label45
  %op52 = load i32, i32* %op2
  %op53 = sub i32 %op52, 1
  %op54 = load i32, i32* %op3
  %op55 = call i32 @knapsack(i32 %op53, i32 %op54)
  store i32 %op55, i32* %op4
  br label %label56
label56:                                                ; preds = %label51, %label84
  %op57 = load i32, i32* %op4
  %op58 = load i32, i32* %op2
  %op59 = mul i32 %op58, 11
  %op60 = load i32, i32* %op3
  %op61 = add i32 %op59, %op60
  %op62 = icmp slt i32 %op61, 0
  br i1 %op62, label %label89, label %label90
label63:                                                ; preds = %label45
  %op64 = load i32, i32* %op2
  %op65 = sub i32 %op64, 1
  %op66 = load i32, i32* %op3
  %op67 = call i32 @knapsack(i32 %op65, i32 %op66)
  %op68 = load i32, i32* %op2
  %op69 = sub i32 %op68, 1
  %op70 = load i32, i32* %op3
  %op71 = load i32, i32* %op2
  %op72 = sub i32 %op71, 1
  %op73 = icmp slt i32 %op72, 0
  br i1 %op73, label %label74, label %label75
label74:                                                ; preds = %label63
  call void @neg_idx_except()
  ret i32 0
label75:                                                ; preds = %label63
  %op76 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 %op72
  %op77 = load i32, i32* %op76
  %op78 = sub i32 %op70, %op77
  %op79 = call i32 @knapsack(i32 %op69, i32 %op78)
  %op80 = load i32, i32* %op2
  %op81 = sub i32 %op80, 1
  %op82 = icmp slt i32 %op81, 0
  br i1 %op82, label %label83, label %label84
label83:                                                ; preds = %label75
  call void @neg_idx_except()
  ret i32 0
label84:                                                ; preds = %label75
  %op85 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 %op81
  %op86 = load i32, i32* %op85
  %op87 = add i32 %op79, %op86
  %op88 = call i32 @max(i32 %op67, i32 %op87)
  store i32 %op88, i32* %op4
  br label %label56
label89:                                                ; preds = %label56
  call void @neg_idx_except()
  ret i32 0
label90:                                                ; preds = %label56
  %op91 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op61
  store i32 %op57, i32* %op91
  %op92 = load i32, i32* %op4
  ret i32 %op92
}
define i32 @main() {
label_entry:
  %op0 = alloca i32
  store i32 0, i32* %op0
  store i32 5, i32* @n
  store i32 10, i32* @m
  %op1 = icmp slt i32 0, 0
  br i1 %op1, label %label2, label %label3
label2:                                                ; preds = %label_entry
  call void @neg_idx_except()
  ret i32 0
label3:                                                ; preds = %label_entry
  %op4 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 0
  store i32 2, i32* %op4
  %op5 = icmp slt i32 1, 0
  br i1 %op5, label %label6, label %label7
label6:                                                ; preds = %label3
  call void @neg_idx_except()
  ret i32 0
label7:                                                ; preds = %label3
  %op8 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 1
  store i32 2, i32* %op8
  %op9 = icmp slt i32 2, 0
  br i1 %op9, label %label10, label %label11
label10:                                                ; preds = %label7
  call void @neg_idx_except()
  ret i32 0
label11:                                                ; preds = %label7
  %op12 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 2
  store i32 6, i32* %op12
  %op13 = icmp slt i32 3, 0
  br i1 %op13, label %label14, label %label15
label14:                                                ; preds = %label11
  call void @neg_idx_except()
  ret i32 0
label15:                                                ; preds = %label11
  %op16 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 3
  store i32 5, i32* %op16
  %op17 = icmp slt i32 4, 0
  br i1 %op17, label %label18, label %label19
label18:                                                ; preds = %label15
  call void @neg_idx_except()
  ret i32 0
label19:                                                ; preds = %label15
  %op20 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 4
  store i32 4, i32* %op20
  %op21 = icmp slt i32 0, 0
  br i1 %op21, label %label22, label %label23
label22:                                                ; preds = %label19
  call void @neg_idx_except()
  ret i32 0
label23:                                                ; preds = %label19
  %op24 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 0
  store i32 6, i32* %op24
  %op25 = icmp slt i32 1, 0
  br i1 %op25, label %label26, label %label27
label26:                                                ; preds = %label23
  call void @neg_idx_except()
  ret i32 0
label27:                                                ; preds = %label23
  %op28 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 1
  store i32 3, i32* %op28
  %op29 = icmp slt i32 2, 0
  br i1 %op29, label %label30, label %label31
label30:                                                ; preds = %label27
  call void @neg_idx_except()
  ret i32 0
label31:                                                ; preds = %label27
  %op32 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 2
  store i32 5, i32* %op32
  %op33 = icmp slt i32 3, 0
  br i1 %op33, label %label34, label %label35
label34:                                                ; preds = %label31
  call void @neg_idx_except()
  ret i32 0
label35:                                                ; preds = %label31
  %op36 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 3
  store i32 4, i32* %op36
  %op37 = icmp slt i32 4, 0
  br i1 %op37, label %label38, label %label39
label38:                                                ; preds = %label35
  call void @neg_idx_except()
  ret i32 0
label39:                                                ; preds = %label35
  %op40 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 4
  store i32 6, i32* %op40
  br label %label41
label41:                                                ; preds = %label39, %label55
  %op42 = load i32, i32* %op0
  %op43 = icmp slt i32 %op42, 66
  %op44 = zext i1 %op43 to i32
  %op45 = icmp ne i32 %op44, 0
  br i1 %op45, label %label46, label %label50
label46:                                                ; preds = %label41
  %op47 = sub i32 0, 1
  %op48 = load i32, i32* %op0
  %op49 = icmp slt i32 %op48, 0
  br i1 %op49, label %label54, label %label55
label50:                                                ; preds = %label41
  %op51 = load i32, i32* @n
  %op52 = load i32, i32* @m
  %op53 = call i32 @knapsack(i32 %op51, i32 %op52)
  call void @output(i32 %op53)
  ret i32 0
label54:                                                ; preds = %label46
  call void @neg_idx_except()
  ret i32 0
label55:                                                ; preds = %label46
  %op56 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op48
  store i32 %op47, i32* %op56
  %op57 = load i32, i32* %op0
  %op58 = add i32 %op57, 1
  store i32 %op58, i32* %op0
  br label %label41
}
