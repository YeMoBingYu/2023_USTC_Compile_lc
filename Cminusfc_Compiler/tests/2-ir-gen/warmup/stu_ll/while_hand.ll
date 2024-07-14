; .ll文件中注释以';'开头
; ModuleID = 'assign.c'
source_filename = "assign.c"
; target的开始
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; main函数的定义
; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0{
; 第一个基本块的开始
    %a_ptr = alloca i32 ; int a
    %i_ptr = alloca i32 ; int i
    store i32 10, i32* %a_ptr ; a=10
    store i32 0, i32* %i_ptr ; i=0
    %i0 = load i32, i32* %i_ptr ; load i
    %cmp1 = icmp slt i32 %i0, 10 ; while(i<10) compare
    br i1 %cmp1, label %in_while, label %after_while ; while(i<10) jump
; 第一个基本块的结束

; 第二个基本块的开始
in_while:
    %i = load i32, i32* %i_ptr ; load i
    %new_i = add i32 %i, 1 ; i=i+1
    store i32 %new_i, i32* %i_ptr ; store i

    %a = load i32, i32* %a_ptr ; load a
    %new_a = add i32 %a, %new_i ; a=a+i
    store i32 %new_a, i32* %a_ptr ; store a

    %cmp2 = icmp slt i32 %new_i, 10 ; while(i<10) compare
    br i1 %cmp2, label %in_while, label %after_while ; while(i<10) loop   
; 第二个基本块的结束

; 第三个基本块的开始
after_while:
    %a_ret = load i32, i32* %a_ptr ; load a
    ret i32 %a_ret ; return a
; 第三个基本块的结束

}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}