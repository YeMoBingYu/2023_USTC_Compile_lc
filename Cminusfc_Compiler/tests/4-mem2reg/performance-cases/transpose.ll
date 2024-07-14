; ModuleID = 'cminus'
source_filename = "/home/bingyu/2023ustc-jianmu-compiler/tests/4-mem2reg/performance-cases/transpose.cminus"

@matrix = global [20000000 x i32] zeroinitializer
@ad = global [100000 x i32] zeroinitializer
@len = global i32 zeroinitializer
declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define void @readarray() {
label_entry:
  br label %label0
label0:                                                ; preds = %label_entry, %label11
  %op1 = phi i32 [ 0, %label_entry ], [ %op13, %label11 ]
  %op2 = load i32, i32* @len
  %op3 = icmp slt i32 %op1, %op2
  %op4 = zext i1 %op3 to i32
  %op5 = icmp ne i32 %op4, 0
  br i1 %op5, label %label6, label %label9
label6:                                                ; preds = %label0
  %op7 = call i32 @input()
  %op8 = icmp slt i32 %op1, 0
  br i1 %op8, label %label10, label %label11
label9:                                                ; preds = %label0
  ret void
label10:                                                ; preds = %label6
  call void @neg_idx_except()
  ret void
label11:                                                ; preds = %label6
  %op12 = getelementptr [100000 x i32], [100000 x i32]* @ad, i32 0, i32 %op1
  store i32 %op7, i32* %op12
  %op13 = add i32 %op1, 1
  br label %label0
}
define i32 @transpose(i32 %arg0, i32* %arg1, i32 %arg2) {
label_entry:
  %op3 = sdiv i32 %arg0, %arg2
  br label %label4
label4:                                                ; preds = %label_entry, %label24
  %op5 = phi i32 [ 0, %label_entry ], [ %op25, %label24 ]
  %op6 = phi i32 [ %op3, %label_entry ], [ %op6, %label24 ]
  %op7 = phi i32 [ %arg2, %label_entry ], [ %op7, %label24 ]
  %op8 = phi i32* [ %arg1, %label_entry ], [ %op8, %label24 ]
  %op9 = icmp slt i32 %op5, %op6
  %op10 = zext i1 %op9 to i32
  %op11 = icmp ne i32 %op10, 0
  br i1 %op11, label %label12, label %label13
label12:                                                ; preds = %label4
  br label %label15
label13:                                                ; preds = %label4
  %op14 = sub i32 0, 1
  ret i32 %op14
label15:                                                ; preds = %label12, %label28
  %op16 = phi i32 [ 0, %label12 ], [ %op29, %label28 ]
  %op17 = icmp slt i32 %op16, %op7
  %op18 = zext i1 %op17 to i32
  %op19 = icmp ne i32 %op18, 0
  br i1 %op19, label %label20, label %label24
label20:                                                ; preds = %label15
  %op21 = icmp slt i32 %op5, %op16
  %op22 = zext i1 %op21 to i32
  %op23 = icmp ne i32 %op22, 0
  br i1 %op23, label %label26, label %label30
label24:                                                ; preds = %label15
  %op25 = add i32 %op5, 1
  br label %label4
label26:                                                ; preds = %label20
  %op27 = add i32 %op16, 1
  br label %label28
label28:                                                ; preds = %label26, %label55
  %op29 = phi i32 [ %op27, %label26 ], [ %op57, %label55 ]
  br label %label15
label30:                                                ; preds = %label20
  %op31 = mul i32 %op5, %op7
  %op32 = add i32 %op31, %op16
  %op33 = icmp slt i32 %op32, 0
  br i1 %op33, label %label34, label %label35
label34:                                                ; preds = %label30
  call void @neg_idx_except()
  ret i32 0
label35:                                                ; preds = %label30
  %op36 = getelementptr i32, i32* %op8, i32 %op32
  %op37 = load i32, i32* %op36
  %op38 = mul i32 %op5, %op7
  %op39 = add i32 %op38, %op16
  %op40 = icmp slt i32 %op39, 0
  br i1 %op40, label %label41, label %label42
label41:                                                ; preds = %label35
  call void @neg_idx_except()
  ret i32 0
label42:                                                ; preds = %label35
  %op43 = getelementptr i32, i32* %op8, i32 %op39
  %op44 = load i32, i32* %op43
  %op45 = mul i32 %op16, %op6
  %op46 = add i32 %op45, %op5
  %op47 = icmp slt i32 %op46, 0
  br i1 %op47, label %label48, label %label49
label48:                                                ; preds = %label42
  call void @neg_idx_except()
  ret i32 0
label49:                                                ; preds = %label42
  %op50 = getelementptr i32, i32* %op8, i32 %op46
  store i32 %op44, i32* %op50
  %op51 = mul i32 %op5, %op7
  %op52 = add i32 %op51, %op16
  %op53 = icmp slt i32 %op52, 0
  br i1 %op53, label %label54, label %label55
label54:                                                ; preds = %label49
  call void @neg_idx_except()
  ret i32 0
label55:                                                ; preds = %label49
  %op56 = getelementptr i32, i32* %op8, i32 %op52
  store i32 %op37, i32* %op56
  %op57 = add i32 %op16, 1
  br label %label28
}
define i32 @main() {
label_entry:
  %op0 = call i32 @input()
  %op1 = call i32 @input()
  store i32 %op1, i32* @len
  call void @readarray()
  br label %label2
label2:                                                ; preds = %label_entry, %label12
  %op3 = phi i32 [ 0, %label_entry ], [ %op14, %label12 ]
  %op4 = phi i32 [ %op0, %label_entry ], [ %op4, %label12 ]
  %op5 = icmp slt i32 %op3, %op4
  %op6 = zext i1 %op5 to i32
  %op7 = icmp ne i32 %op6, 0
  br i1 %op7, label %label8, label %label10
label8:                                                ; preds = %label2
  %op9 = icmp slt i32 %op3, 0
  br i1 %op9, label %label11, label %label12
label10:                                                ; preds = %label2
  br label %label15
label11:                                                ; preds = %label8
  call void @neg_idx_except()
  ret i32 0
label12:                                                ; preds = %label8
  %op13 = getelementptr [20000000 x i32], [20000000 x i32]* @matrix, i32 0, i32 %op3
  store i32 %op3, i32* %op13
  %op14 = add i32 %op3, 1
  br label %label2
label15:                                                ; preds = %label10, %label26
  %op16 = phi i32 [ 0, %label10 ], [ %op30, %label26 ]
  %op17 = load i32, i32* @len
  %op18 = icmp slt i32 %op16, %op17
  %op19 = zext i1 %op18 to i32
  %op20 = icmp ne i32 %op19, 0
  br i1 %op20, label %label21, label %label24
label21:                                                ; preds = %label15
  %op22 = getelementptr [20000000 x i32], [20000000 x i32]* @matrix, i32 0, i32 0
  %op23 = icmp slt i32 %op16, 0
  br i1 %op23, label %label25, label %label26
label24:                                                ; preds = %label15
  br label %label31
label25:                                                ; preds = %label21
  call void @neg_idx_except()
  ret i32 0
label26:                                                ; preds = %label21
  %op27 = getelementptr [100000 x i32], [100000 x i32]* @ad, i32 0, i32 %op16
  %op28 = load i32, i32* %op27
  %op29 = call i32 @transpose(i32 %op4, i32* %op22, i32 %op28)
  %op30 = add i32 %op16, 1
  br label %label15
label31:                                                ; preds = %label24, %label46
  %op32 = phi i32 [ 0, %label24 ], [ %op50, %label46 ]
  %op33 = phi i32 [ 0, %label24 ], [ %op51, %label46 ]
  %op34 = load i32, i32* @len
  %op35 = icmp slt i32 %op33, %op34
  %op36 = zext i1 %op35 to i32
  %op37 = icmp ne i32 %op36, 0
  br i1 %op37, label %label38, label %label41
label38:                                                ; preds = %label31
  %op39 = mul i32 %op33, %op33
  %op40 = icmp slt i32 %op33, 0
  br i1 %op40, label %label45, label %label46
label41:                                                ; preds = %label31
  %op42 = icmp slt i32 %op32, 0
  %op43 = zext i1 %op42 to i32
  %op44 = icmp ne i32 %op43, 0
  br i1 %op44, label %label52, label %label54
label45:                                                ; preds = %label38
  call void @neg_idx_except()
  ret i32 0
label46:                                                ; preds = %label38
  %op47 = getelementptr [20000000 x i32], [20000000 x i32]* @matrix, i32 0, i32 %op33
  %op48 = load i32, i32* %op47
  %op49 = mul i32 %op39, %op48
  %op50 = add i32 %op32, %op49
  %op51 = add i32 %op33, 1
  br label %label31
label52:                                                ; preds = %label41
  %op53 = sub i32 0, %op32
  br label %label54
label54:                                                ; preds = %label41, %label52
  %op55 = phi i32 [ %op32, %label41 ], [ %op53, %label52 ]
  call void @output(i32 %op55)
  ret i32 0
}
