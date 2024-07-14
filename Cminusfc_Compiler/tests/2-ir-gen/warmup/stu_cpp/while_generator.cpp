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
    auto retLoad = builder->create_load(retAlloca); //load retLoad

    DEBUG_OUTPUT

    //int a
    auto aAlloca = builder->create_alloca(Int32Type); // 在内存中分配a

    //int i
    auto iAlloca = builder->create_alloca(Int32Type); // 在内存中分配i

    //a=10
    builder->create_store(CONST_INT(10),aAlloca); // store 10 in a

    //i=0
    builder->create_store(CONST_INT(0),iAlloca); //store 0 in i

    //while(i<10)
    auto trueBB = BasicBlock::create(module,"in_while",mainFun); // in_while 分支
    auto falseBB = BasicBlock::create(module,"after_while",mainFun); // after_while 分支
    auto iLoad = builder->create_load(iAlloca); //load iLoad
    auto icmp = builder->create_icmp_lt(iLoad, CONST_INT(10)); // compare i<10
    auto br = builder->create_cond_br(icmp, trueBB, falseBB); //jump

    //i=i+1
    builder->set_insert_point(trueBB); // trueBB 分支
    iLoad = builder->create_load(iAlloca); //load iLoad
    auto add = builder->create_iadd(iLoad,CONST_INT(1)); // i+1
    builder->create_store(add,iAlloca); //i=i+1

    //a=a+i
    auto aLoad = builder->create_load(aAlloca); //load aLoad
    iLoad = builder->create_load(iAlloca); //load iLoad
    add = builder->create_iadd(aLoad,iLoad); // a+i
    builder->create_store(add, aAlloca); //a=a+i

    //while(i<10)
    iLoad = builder->create_load(iAlloca); //load iLoad
    icmp = builder->create_icmp_lt(iLoad, CONST_INT(10)); // compare i<10
    br = builder->create_cond_br(icmp, trueBB, falseBB); //jump

    DEBUG_OUTPUT

    //return 0
    builder->set_insert_point(falseBB); // falseBB分支

    aLoad = builder->create_load(aAlloca); //load aLoad
    builder->create_store(aLoad, retAlloca); //store aLoad in retAlloca
    retLoad = builder->create_load(retAlloca); // load retAlloca
    builder->create_ret(retLoad); // return retLoad

    DEBUG_OUTPUT

    std::cout << module->print();
    delete module;
    return 0;
}
