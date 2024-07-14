#include "BasicBlock.hpp"
#include "Constant.hpp"
#include "Function.hpp"
#include "IRBuilder.hpp"
#include "Module.hpp"
#include "Type.hpp"

#include <iostream>
#include <memory>

#ifdef DEBUG  // 用于调试信息,大家可以在编译过程中通过" -DDEBUG"来开启这一选项
#define DEBUG_OUTPUT std::cout << __LINE__ << std::endl;  // 输出行号的简单示例
#else
#define DEBUG_OUTPUT
#endif

#define CONST_INT(num) \
    ConstantInt::get(num, module) // 得到常数值的表示,方便后面多次用到

int main()
{
    auto module = new Module();
    auto builder =new IRBuilder(nullptr,module);
    Type *Int32Type = module->get_int32_type();
    
    //main函数
    auto mainFun = Function::create(FunctionType::get(Int32Type,{}),
                                                    "main",module);
    auto bb = BasicBlock::create(module,"entry",mainFun); // BasicBlock的名字在生成中无所谓,但是可以方便阅读
    builder->set_insert_point(bb);

    auto retAlloca = builder->create_alloca(Int32Type); // 在内存中分配返回值
    builder->create_store(CONST_INT(0), retAlloca); // 返回值默认为0

    DEBUG_OUTPUT

    //int a[10];
    ArrayType *a = ArrayType::get(Int32Type, 10); // 定义a[10]的类型
    auto a_array_Alloca = builder->create_alloca(a); // 在内存中分配a[10]

    DEBUG_OUTPUT

    //a[0]=10;
    auto a0GEP = builder->create_gep(a_array_Alloca,{CONST_INT(0),CONST_INT(0)}); // 得到a[0]在内存中的指针
    builder->create_store(CONST_INT(10),a0GEP); // 在内存中赋值为10

    DEBUG_OUTPUT

    //a[1]=a[0]*2;
    auto a1GEP = builder->create_gep(a_array_Alloca,{CONST_INT(0),CONST_INT(1)}); // 得到a[1]在内存中的指针
    auto a0Load = builder->create_load(a0GEP); // load a[0] 
    builder->create_store(CONST_INT(10),a1GEP); // 在内存中赋值为10
    auto a0_mul_2 = builder->create_imul( a0Load, CONST_INT(2)); // 计算a[0]*2
    builder->create_store(a0_mul_2,a1GEP); // 将a[0]*2的结果存入a[1]

    DEBUG_OUTPUT

    //return a[1]
    
    auto a1Load = builder->create_load(a1GEP); // load a[1]
    builder->create_store(a1Load,retAlloca); // store a[1] to retAlloca
    auto retLoad = builder->create_load(retAlloca); // load retLoad
    builder->create_ret(retLoad); //return retLoad

    DEBUG_OUTPUT

    std::cout << module->print();
    delete module;
    return 0;
}
