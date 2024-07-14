sudo apt install openssh-server
sudo systemctl start ssh
sydo systemctl enable ssh
ps aux | grep sshd
sudo apt update
sudo apt upgrade
sudo apt install clang llvm
sudo apt install git
sudo apt install build-essential
gcc --version
sudo apt install cmake
cmake --version
sudo apt-get install flex bison
flex --version
bison --version
sudo apt install gdb
gdb --version
uname -a
mkdir Test
code Test
sudo snap install code
ls ~/.vscode-server/bin
cd ~/.vscode-server/bin/8b617bd08fd9e3fc94d14adb8d358b56e3f72314
wget -o vscode-server-linux-x64.tar.gz https://update.code.visualstudio.com/commit:8b617bd08fd9e3fc94d14adb8d358b56e3f72314/server-linux-x64/stable
ls ~/.vscode-server/bin
ls
cd ..
cd bingyu/.vscode-server/
ls
cd bin
ls
cd 8b617bd08fd9e3fc94d14adb8d358b56e3f72314/
ls
chmod vscode-server.tar.gz
chmod --help
chmod vscode-server.tar.gz
chmod vscode-server.tar.gz 777
chmod vscode-server.tar.gz 777 -c
chmod vscode-server.tar.gz -c 777
ls
tar -xvzf vscode-server-linux-x64.tar.gz
cd ./vscode-server
cd ..
cd ./.vscode-server
ls
clang -S -emit-llvm Test.c -o Test.ll
lli Test.ll
ls
clang -S -emit-llvm Test.c -o Test.ll
lli Test.ll && echo $?
cat Test.ll
git clone https://cscourse.ustc.edu.cn/vdir/Gitlab/PB21111686/2023_warm_up_b.git
cd 2023_warm_up_b
ls
touch readme.md
echo "# Hello World" >> readme.md
cat readme.md
git add readme.md
git status
git commit -m 'add readme'
git log
git push origin master
ls
git status
git log
git commit -m 'add readme'
git push origin master
git status
git log
git commit -m "add readme"
git config --global user.name "PB21111686"
git config --global user.email "sanshengyemo@mail.ustc.edu.cn"
git commit -m "add readme"
git push origin master
git remote add upstream https://cscourse.ustc.edu.cn/vdir/Gitlab/compiler_staff/2023_warm_up.git
git fetch upstream master
git merge upstream/master
cat warm_up.txt
git add warm_up.txt
git commit
git push origin master
cd /home/bingyu
cp Test.ll /home/bingyu/2023_warm_up_b/
cd /home/bingyu/2023_warm_up_b/
git add Test.ll
git commit -m 'add Test.ll'
git push origin master
exit
ps aux | grep sshd
cd ..
sudo apt install openssh-server
sudo systemctl start ssh
sudo systemctl enable ssh
ps aux | grep sshd
sudo apt install openssh-server
sudo systemctl start ssh
sudo systemctl enable ssh
ps aux | grep sshd
sudo systemctl enable ssh
sudo systemctl start ssh
ps aux | grep sshd
exit
aaa
ls
cd ..
exit
ifconfig
sudo apt install net-tools
ifconfig
exit
grep ps aux | grep sshd
ps aux | grep sshd
# 安装 ssh server
sudo apt install openssh-server
# 启动 ssh server
sudo systemctl start ssh
# 设置系统开机自启动
sudo systemctl enable ssh
chmod 700 root
cd ..
chmod 700 root
sudo chmod 700 root
ls
sudo chmod 700 root
ls -A
ls -l\
ls -l
exit
uname -a
mkdir test
code test
git fetch upstream master
git clone https://cscourse.ustc.edu.cn/vdir/Gitlab/compiler_staff/2023ustc-jianmu-compiler.git
cat warm_up.txt
mkdir build
cd build
cmake ..
make
ls lexer parser
./lexer
cd ${WORKSPACE}
./build/lexer tests/testcases_general/1-return.cminus
./build/parser ./tests/testcases_general/1-return.cminus
cd 2023ustc-jianmu-compiler
cd bulid
cd ./build
cmake ..
make
ls lexer parser
./lexer
cd ${WORKSPACE}
./build/lexer tests/testcases_general/1-return.cminus
./build/lexer
./build/lexer tests/testcases_general/1-return.cminus
cd ./2023ustc-jianmu-compiler
./build/lexer tests/testcases_general/1-return.cminus
./build/parser ./tests/testcases_general/1-return.cminus
cd ./build
cmake ..
make
./lexer
ls lexer parser
cd ..
./build/lexer tests/testcases_general/1-return.cminus
./build/parser ./tests/testcases_general/1-return.cminus
export PATH="$(realpath ./build):$PATH"
cd tests/1-parser
parser input/normal/local-decl.cminus > output_student/normal/local-decl.syntax_tree
cd ./output_student
mkdir normal
mkdir easy
mkdir hard
cd ..
parser input/normal/local-decl.cminus > output_student/normal/local-decl.syntax_tree
diff output_student/normal/local-decl.syntax_tree output_standard/normal/local-decl.syntax_tree
cd ..
git add /home/bingyu/2023ustc-jianmu-compiler/src/parser/lexical_analyzer.l
git commit -m "add lexical_analyzer"
git add /home/bingyu/2023ustc-jianmu-compiler/src/parser/syntax_analyzer.y
git commit -m "add syntax_analyzer"
git push
git push origin master
git log
git push origin master
git clone https://cscourse.ustc.edu.cn/vdir/Gitlab/PB21111686/2023ustc-jianmu-compiler.git
cd ./2023ustc-jianmu-compiler
mkdir build
cd build
cmake ..
make
ls lexer parser
./lexer
cd ..
./build/lexer tests/testcases_general/1-return.cminus
./build/parser ./tests/testcases_general/1-return.cminus
git add /home/bingyu/2023ustc-jianmu-compiler/src/parser/lexical_analyzer.l
git commit -m "add lexical_analyzer"
git add /home/bingyu/2023ustc-jianmu-compiler/src/parser/syntax_analyzer.y
git commit -m "add syntax_analyzer"
git push origin master
info flex
exit
nslookup mail.yahoo.com ns.ustc.edu.cn
nslookup www.baidu.com
nslookup -type=NS tsinghua.edu.cn
nslookup mail.yahoo.com ns.ustc.edu.cn
nslookup
nslookup www.aiit.or.kr bitsy.mit.edu
nslookup dns.google bitsy.mit.edu
nslookup www.aiit.or.kr  dns.google
nslookup -type=NS pku.edu.cn
nslookup -type=NS mit.edu.cn
nslookup -type=NS www.edu.cn
nslookup -type=NS www.mit.edu
nslookup -type=NS mit.edu
nslookup www.baidu.com bitsy.mit.edu
git clone https://cscourse.ustc.edu.cn/vdir/Gitlab/compiler_staff/2023ustc-jianmu-compiler.git
git fetch upstream master
git merge upstream/master
$ git remote add upstream https://cscourse.ustc.edu.cn/vdir/Gitlab/compiler_staff/2023ustc-jianmu-compiler.git
git remote add upstream https://cscourse.ustc.edu.cn/vdir/Gitlab/compiler_staff/2023ustc-jianmu-compiler.git
git pull upstream master
git merge upstream/master
cmake ..
sudo apt install zlib1g-dev
cmake ..
make
./gcd_array_generator > gcd_array_generator.ll
lli gcd_array_generator.ll
echo ?$
echo $?
lli gcd_array_generator.ll
echo $?
./assign_generator > assign_generator.ll
cmake ..
make
cmake ..
make
./stu_assign_generator > stu_assign_generator.ll
lli stu_assign_generator.ll
echo $?
cmake ..
make
cmake ..
make
./stu_fun_generator > stu_fun_generator.ll
lli stu_fun_generator.ll
echo $?
cmake
cmake ..
make
cmake while_generator.cpp
cmake /home/bingyu/2023ustc-jianmu-compiler/tests/2-ir-gen/warmup/stu_cpp/while_generator.cpp
cmake ..
make
./stu_if_generator > stu_if_generator.ll
lli build/stu_if_generator.ll
lli /home/bingyu/2023ustc-jianmu-compiler/build/stu_if_generator.ll
lli stu_if_generator.ll
./stu_while_generator > stu_while_generator.ll
lli stu_while_generator.ll
echo ?$
lli stu_while_generator.ll
echo $?
lli stu_if_generator.ll
./stu_if_generator > stu_if_generator.ll
cmake ..
make
cmake ..
make
cmake ..
make
cmake ..
make
./stu_if_generator > stu_if_generator.ll
lli stu_if_generator.ll
echo $?
git add .
git commit -m 'add all'
git commit 0a
git commit -a 'add'
git commit -m 'add'
git add /home/bingyu/2023ustc-jianmu-compiler/tests/2-ir-gen/warmup/stu_cpp/assign_generator.cpp
git commit -m 'add assign_generator.cpp'
git push origin master
git add /home/bingyu/2023ustc-jianmu-compiler/tests/2-ir-gen/warmup/stu_cpp/fun_generator.cpp
git commit -m 'add fun_generator.cpp'
git push origin master
git add /home/bingyu/2023ustc-jianmu-compiler/tests/2-ir-gen/warmup/stu_cpp/if_generator.cpp
git commit -m 'add if_generator.cpp'
git push origin master
git add /home/bingyu/2023ustc-jianmu-compiler/tests/2-ir-gen/warmup/stu_cpp/while_generator.cpp
git commit -m 'add while_generator.cpp'
git push origin master
git add /home/bingyu/2023ustc-jianmu-compiler/tests/2-ir-gen/warmup/stu_ll/assign_hand.ll
git commit -m 'add assign_generator.ll'
git push origin master
git add /home/bingyu/2023ustc-jianmu-compiler/tests/2-ir-gen/warmup/stu_ll/fun_hand.ll
git commit -m 'add fun_generator.ll'
git push origin master
git add /home/bingyu/2023ustc-jianmu-compiler/tests/2-ir-gen/warmup/stu_ll/if_hand.ll
git commit -m 'add if_generator.ll'
git push origin master
git add /home/bingyu/2023ustc-jianmu-compiler/tests/2-ir-gen/warmup/stu_ll/while_hand.ll
git commit -m 'add while_generator.ll'
git push origin master
exit
git merge --abort
git reflog
git log
git reflog
git pull upstream master
git fetch upstream master
git merge upstream/master
lli assign_hand.ll
cd ..
lli assign_hand.ll
echo $?
lli fun_hand.ll
echo $?
lli if.ll
lli if_hand.ll
echo $?
lli while_hand.ll
echo $?
cmake ..
make
cmake ..
make
cmake ..
make
cmake ..
make
cmake ..
make
cmake ..
make
cmake ..
make
cmake ..
make
git add /home/bingyu/2023ustc-jianmu-compiler/include/cminusfc/cminusf_builder.hpp
git add /home/bingyu/2023ustc-jianmu-compiler/src/cminusfc/cminusf_builder.cpp
git commit -m 'cminusf_builder.hpp'
git commit -m 'cminusf_builder.cpp'
git push origin master
git add /home/bingyu/2023ustc-jianmu-compiler/src/cminusfc/cminusf_builder.cpp
git commit -m 'cminusf_builder.cpp'
git push origin master
git add /home/bingyu/2023ustc-jianmu-compiler/src/cminusfc/cminusf_builder.cpp
git commit -m 'cminusf_builder.cpp'
git push origin master
cmake ..
make
cmake ..
make 
cmake ..
make
cmake ..
make 
cmake ..
make 
python3 ./eval_lab2.py
cat eval_result
git add /home/bingyu/2023ustc-jianmu-compiler/include/cminusfc/cminusf_builder.hpp
git add /home/bingyu/2023ustc-jianmu-compiler/src/cminusfc/cminusf_builder.cpp
git commit -m 'cminusf_builder.hpp'
git commit -m 'cminusf_builder.cpp'
git push origin master
python3 ./eval_lab2.py
cat eval_result
python3 ./eval_lab2.py
cat eval_result
python3 ./eval_lab2.py
cmake ..
make
cmake ..
make
cmake ..
make
python3 ./eval_lab2.py
cat eval_result
git add /home/bingyu/2023ustc-jianmu-compiler/src/cminusfc/cminusf_builder.cpp
git commit -m 'cminusf_builder.cpp'
git push origin master
git pull upstream master
git remote add upstream https://cscourse.ustc.edu.cn/vdir/Gitlab/compiler_staff/2023ustc-jianmu-compiler.git
git pull upstream master
git push origin master
git fetch upstream master
git merge upstream/master
make
make
./stu_assign_codegen
./stu_assign_codegen>assign.s
make
./stu_assign_codegen>assign.s
loongarch64-unknown-linux-gnu-gcc -static assign.s -o assign
make
./stu_assign_codegen>assign.s
loongarch64-unknown-linux-gnu-gcc -static assign.s -o assign
qemu-loongarch64 ./assign
echo $?
qemu-loongarch64 -g 1234 assign &
loongarch64-unknown-linux-gnu-gdb --quiet
make
./stu_assign_codegen>assign.s
loongarch64-unknown-linux-gnu-gcc -static assign.s -o assign
qemu-loongarch64 ./assign
echo $?
qemu-loongarch64 -g 1234 assign &
loongarch64-unknown-linux-gnu-gdb --quiet
make
./stu_assign_codegen>assign.s
loongarch64-unknown-linux-gnu-gcc -static assign.s -o assign
qemu-loongarch64 ./assign
echo $?
make

qemu-loongarch64 ./assign
echo $?
make
./stu_assign_codegen>assign.s
loongarch64-unknown-linux-gnu-gcc -static assign.s -o assign
qemu-loongarch64 ./assign
echo $?
make
./stu_function_codegen>function.s
loongarch64-unknown-linux-gnu-gcc -static function.s -o function
qemu-loongarch64 ./function
echo $?
make
./stu_function_codegen>function.s
loongarch64-unknown-linux-gnu-gcc -static function.s -o function
qemu-loongarch64 ./function
echo $?
qemu-loongarch64 -g 1234 function &
loongarch64-unknown-linux-gnu-gdb --quiet
./stu_function_codegen>function.s
loongarch64-unknown-linux-gnu-gcc -static function.s -o function
qemu-loongarch64 ./function
echo $?
make
./stu_global_codegen>global.s
loongarch64-unknown-linux-gnu-gcc -static global.s -o global
make
./stu_global_codegen>global.s
loongarch64-unknown-linux-gnu-gcc -static global.s -o global
qemu-loongarch64 ./global
echo $?
./stu_function_codegen>function.s
loongarch64-unknown-linux-gnu-gcc -static function.s -o function
qemu-loongarch64 ./function
echo $?
sudo tar xaf loongarch64-clfs-3.0-cross-tools-gcc-glibc.tar.xz -C /opt
sudo tar xaf qemu-6.2.50.loongarch64.tar.gz -C /opt
sudo tar xaf gdb.tar.gz -C /opt
loongarch64-unknown-linux-gnu-gcc -v
qemu-loongarch64 -version
loongarch64-unknown-linux-gnu-gdb -v
tar xaf test-env.tar.gz
make
./stu_float_codegen>float.s
loongarch64-unknown-linux-gnu-gcc -static float.s -o float
make
./stu_float_codegen>float.s
loongarch64-unknown-linux-gnu-gcc -static float.s -o float
qemu-loongarch64 ./float
echo $?
make
./stu_fcmp_codegen>fcmp.s
loongarch64-unknown-linux-gnu-gcc -static fcmp.s -o fcmp
make
./stu_fcmp_codegen>fcmp.s
loongarch64-unknown-linux-gnu-gcc -static fcmp.s -o fcmp
qemu-loongarch64 ./fcmp
echo $?
qemu-loongarch64 -g 1234 fcmp &
loongarch64-unknown-linux-gnu-gdb --quiet
make
./stu_fcmp_codegen>fcmp.s
qemu-loongarch64 -g 1234 fcmp &
loongarch64-unknown-linux-gnu-gcc -static fcmp.s -o fcmp
qemu-loongarch64 ./fcmp
echo $?
make
./stu_icmp_codegen>icmp.s
loongarch64-unknown-linux-gnu-gcc -static icmp.s -o icmp
qemu-loongarch64 ./icmp
echo $?
git add assign_codegen.cpp
cd ..
git add assign_codegen.cpp
git add /home/bingyu/2023ustc-jianmu-compiler/tests/3-codegen/warmup/stu_cpp/assign_codegen.cpp
git add /home/bingyu/2023ustc-jianmu-compiler/tests/3-codegen/warmup/stu_cpp/fcmp_codegen.cpp
git add /home/bingyu/2023ustc-jianmu-compiler/tests/3-codegen/warmup/stu_cpp/float_codegen.cpp
git add /home/bingyu/2023ustc-jianmu-compiler/tests/3-codegen/warmup/stu_cpp/function_codegen.cpp
git add /home/bingyu/2023ustc-jianmu-compiler/tests/3-codegen/warmup/stu_cpp/global_codegen.cpp
git add /home/bingyu/2023ustc-jianmu-compiler/tests/3-codegen/warmup/stu_cpp/icmp_codegen.cpp
git commit -m 'add assign_codegen'
git add /home/bingyu/2023ustc-jianmu-compiler/tests/3-codegen/warmup/stu_cpp/assign_codegen.cpp
git add /home/bingyu/2023ustc-jianmu-compiler/tests/3-codegen/warmup/stu_cpp/fcmp_codegen.cpp
git add /home/bingyu/2023ustc-jianmu-compiler/tests/3-codegen/warmup/stu_cpp/float_codegen.cpp
git add /home/bingyu/2023ustc-jianmu-compiler/tests/3-codegen/warmup/stu_cpp/function_codegen.cpp
git add /home/bingyu/2023ustc-jianmu-compiler/tests/3-codegen/warmup/stu_cpp/global_codegen.cpp
git add /home/bingyu/2023ustc-jianmu-compiler/tests/3-codegen/warmup/stu_cpp/icmp_codegen.cpp
git push origin master
make
sudo make install
cminusfc fcmp.cminus -S
cminusfc 0-io.cminus -S
cd ..
cminusfc 0-io.cminus -S
./eval_lab3.sh ./testcases test
./cleanup.sh
./eval_lab3.sh ./testcases debug
./cleanup.sh
./eval_lab3.sh ./testcases debug
cminusfc 0-io.cminus -S
cminusfc 8-store.cminus -S
./eval_lab3.sh ./testcases debug
cmake ..
make
sudo make install
cminusfc if.cminus -S
cd ..
cd .. 
cminusfc if.cminus -S
./eval_lab3.sh ./testcases test
./eval_lab3.sh ../../testcases_general debug
./eval_lab3.sh ../../testcases_general debug
./cleanup.sh
./eval_lab3.sh ./testcases debug
ls
cd ../../..\
cd ../../..
cd build/
ls
gdb cminusfc test.cminus -S
gdb cminusfc
make
./eval_lab3.sh ./testcases debug
cd .. 
cd build/
ls
cminusfc test.cminus -S
make
ls
cminusfc test.cminus -S
terminate called after throwing an instance of 'not_implemented_error'
gdb cminusfc
cminusfc test.cminus -S
make
sudo make install
cminusfc test.cminus -S
make
sudo make install
cminusfc test.cminus -S
./eval_lab3.sh ./testcases debug
loongarch64-unknown-linux-gnu-gcc -static 2-calculate.s -o calculate
qemu-loongarch64 ./calculate
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
loongarch64-unknown-linux-gnu-gcc -static 2-calculate.s -o calculate
loongarch64-unknown-linux-gnu-gcc -static calculate.s -o calculate
qemu-loongarch64 ./calculate
qemu-loongarch64 -g 1234 calculate &
loongarch64-unknown-linux-gnu-gdb --quiet
make
sudo make install
loongarch64-unknown-linux-gnu-gcc -static 2-calculate.s -o 2-calculate
qemu-loongarch64 -g 1234 2-calculate &
loongarch64-unknown-linux-gnu-gdb --quiet
loongarch64-unknown-linux-gnu-gcc -static 2-calculate.s -o 2-calculate
qemu-loongarch64 -g 1234 2-calculate &
loongarch64-unknown-linux-gnu-gdb --quiet
loongarch64-unknown-linux-gnu-gcc -static calculate.s -o 2-calculate
qemu-loongarch64 ./2-calculate
echo $?
loongarch64-unknown-linux-gnu-gcc -static calculate.s -o 2-calculate
qemu-loongarch64 ./2-calculate
echo $?
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
./eval_lab3.sh ./testcases debug
loongarch64-unknown-linux-gnu-gcc -static 2-calculate.s -o calculate
./eval_lab3.sh ./testcases debug
make
sudo install make
sudo make install
sudo install make
make
sudo install make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
qemu-loongarch64 -g 1234 array &
loongarch64-unknown-linux-gnu-gdb --quiet
loongarch64-unknown-linux-gnu-gcc -static array.s -o array
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
./eval_lab3.sh ../../testcases_general
./eval_lab3.sh /home/bingyu/2023ustc-jianmu-compiler/tests/testcases_general
./cleanup.sh
./eval_lab3.sh ./testcases_general
./eval_lab3.sh ./testcases_general debug
git add /home/bingyu/2023ustc-jianmu-compiler/src/codegen/CodeGen.cpp
git commit -m 'add codegen'
git push origin master
git add /home/bingyu/2023ustc-jianmu-compiler/src/codegen/CodeGen.cpp
git commit -m 'add codegen'
git push origin master
./eval_lab3.sh ./testcases_general debug
make
sudo make install
./eval_lab3.sh ./testcases test
git pull upstream master
git remote add upstream https://cscourse.ustc.edu.cn/vdir/Gitlab/compiler_staff/2023ustc-jianmu-compiler.git
git pull upstream master
git merge upstream/master
cmake ..
make
sudo make install
make
sudo make install
make
sudo make install
./eval_lab4.sh ./functional-cases debug
./test_perf.sh
./cleanup.sh
./eval_lab4.sh ./functional-cases debug
opt -passes=dot-cfg if.ll >/dev/null
opt -passes=dot-cfg 4-if.ll >/dev/null
./eval_lab4.sh ./functional-cases debug
./cleanup.sh
./eval_lab4.sh ./functional-cases debug
./eval_lab4.sh ./testcases_gengral debug
./eval_lab4.sh ./testcases_general debug
git add /home/bingyu/2023ustc-jianmu-compiler/src/passes/Dominators.cpp
git add /home/bingyu/2023ustc-jianmu-compiler/src/passes/Mem2Reg.cpp
git commit -m 'add Dominators'
git commit -m 'add Mem2Reg'
git add /home/bingyu/2023ustc-jianmu-compiler/src/passes/Dominators.cpp
git add /home/bingyu/2023ustc-jianmu-compiler/src/passes/Mem2Reg.cpp
git push origin master
cd
sudo apt install graphviz
./eval_lab3.sh ./testcases debug
./cleanup.sh
./eval_lab3.sh ./testcases debug
./cleanup.sh
opt -passes=dot-cfg if.ll >/dev/null
./eval_lab4.sh ./functional-cases debug
./test_perf.sh
./eval_lab4.sh ./functional-cases debug
./eval_lab4.sh ./functional-cases test
./eval_lab4.sh ./functional-cases debug
./eval_lab4.sh ./testcases_general debug
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
cminusfc -emit-llvm -mem2reg 5-while.cminus
./eval_lab4.sh ./functional-cases debug
./cleanup.sh
./eval_lab4.sh ./functional-cases debug
./eval_lab4.sh ./testcases_general debug
./eval_lab4.sh ./functional-cases debug
cminusfc -emit-llvm -mem2reg 8-store.cminus
opt -passes=dot-cfg 5-while.ll >/dev/null
dot .main.dot -Tpng > main.png
cd ..
cd 
opt -passes=dot-cfg 15-if_while.ll >/dev/null
opt -passes=dot-cfg 16-if_chain.ll >/dev/null
dot .main.dot -Tpng > main.png
opt -passes=dot-cfg 6-array.ll >/dev/null
dot .main.dot -Tpng > main.png
opt -passes=dot-cfg 4-if.ll >/dev/null
dot .main.dot -Tpng > main.png
opt -passes=dot-cfg 5-while.ll >/dev/null
opt -passes=dot-cfg 15-if_while.ll >/dev/null
dot .main.dot -Tpng > main.png
opt -passes=dot-cfg 17-while_chain.ll >/dev/null
dot .main.dot -Tpng > main.png
cminusfc -emit-llvm -mem2reg transpose.cminus
opt -passes=dot-cfg transpose.ll >/dev/null
dot .transpose.dot -Tpng > transpose.png
cminusfc -emit-llvm -mem2reg 17-while_chain.cminus
./eval_lab4.sh ./functional-cases test
./eval_lab4.sh ./testcases_general debug
./test_perf.sh
./eval_lab4.sh ./testcases_general debug
./test_perf.sh
cminusfc -emit-llvm -mem2reg 17-while_chain.cminus
./eval_lab4.sh ./testcases_general debug
./eval_lab4.sh ./functional-cases test
./eval_lab4.sh ./testcases_general test
./eval_lab4.sh ./testcases_general debug
opt -passes=dot-cfg 17-while_chain.ll >/dev/null
opt -passes=dot-cfg 17-while_chain.ll >/dev/null
dot .main.dot -Tpng > main.png
./cleanup.sh
./cleanup.sh
cminusfc -emit-llvm -mem2reg 5-while.cminus
cminusfc -S -mem2reg 5-while.cminus
cd ..
cd .. 
cd ..
git add /home/bingyu/2023ustc-jianmu-compiler/include/codegen/CodeGen.hpp
git add /home/bingyu/2023ustc-jianmu-compiler/src/codegen/CodeGen.cpp
git add /home/bingyu/2023ustc-jianmu-compiler/include/passes/Dominators.hpp
git add /home/bingyu/2023ustc-jianmu-compiler/src/passes/Dominators.cpp
git add /home/bingyu/2023ustc-jianmu-compiler/src/passes/Mem2Reg.cpp
git commit 'add CodeGen.hpp'
git commit 'add CodeGen'
git commit -m 'add CodeGen'
git pull origin master
git push origin master
git add /home/bingyu/2023ustc-jianmu-compiler/include/codegen/CodeGen.hpp
git add /home/bingyu/2023ustc-jianmu-compiler/src/codegen/CodeGen.cpp
git add /home/bingyu/2023ustc-jianmu-compiler/include/passes/Dominators.hpp
git add /home/bingyu/2023ustc-jianmu-compiler/src/passes/Dominators.cpp
git add /home/bingyu/2023ustc-jianmu-compiler/src/passes/Mem2Reg.cpp
git commit -m 'add lab4'
git commit -m 'add CODEGEN'
git push origin master
git add /home/bingyu/2023ustc-jianmu-compiler/include/passes/Dominators.hpp
git add /home/bingyu/2023ustc-jianmu-compiler/src/passes/Dominators.cpp
git add /home/bingyu/2023ustc-jianmu-compiler/src/passes/Mem2Reg.cpp
git commit -m 'add Dominators'
git push origin master
git add /home/bingyu/2023ustc-jianmu-compiler/src/passes/Mem2Reg.cpp
git commit -m 'add Mem2Reg'
git push origin master
git add /home/bingyu/2023ustc-jianmu-compiler/src/passes/Mem2Reg.cpp
git push origin master
git commit -m 'add Mem2Reg'
git push origin master
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
make
sudo make install
Date
date
echo hello
echo $PATH
which echo
which date
which ls
ls 
which cd
which gcc
pwd
cd bingyu
cd ..
ls
cd bingyu
pwd
cd /home
cd bingyu
cd /
ls
cd /home/bingyu
cd /
cd bingyu
cd ./home
cd ./bingyu
ls -h
man ls
which ls
which man
man ls
man mv
ls
echo $shell
echo $SHELL
mkdir study
ls
cd study
touch test.c
ls
move test.c
man move
man mov
rm test
rm test.c
ls
touch semeter
echo semeter
cat semeter
echo hello > semeter
cat semeter
echo \# > semeter
cat semeter
echo \#'!'/bin/sh > semeter
cat semeter
echo 
echo c >> semeter
cat semeter
echo c > semeter
cat semeter
echo \#'!'/bin/sh > semeter
echo curl\ --head\ --silent https://missing.csail.mit.edu >> semeter
cat semeter
./semeter
ls
sh semeter
cd study
sh ./semeter
man ls 
ls
man
man man
man -l
echo My\ Photos
cd ..
cd /
cd ./home
cd ./bingyu
ls
cd ..
ls
cd ..
ls
cd home
cd bingyu
pwd
cd ..
pwd
cd ./homer
cd home
cd bingyu
man ls
cd ..
ls -l home
cd home
ls
ls -l bingyu
cd bingyu
cd study
touch hello.ext
mv hello
mv hello.ext
rm hello.ext
cat hello > hello.txt
cat hello.ext
cat hello.txt
echo hello > hello.txt
rm hello.txt
echo hello hello.txt
echo my hh
echo hello > hello.txt
rm hello.txt
echo semeter
cat semeter
which bash
which csh
which sh
which ch
which csh
cd ..
ls
cat .bash_logout
cd study
touch test.sh
./test.sh
chomd +x ./test.sh
chmod +x ./test.sh
./test.sh
./test.sh 1 2 3
touch hello1.txt
tpuch hello2.txt
touch hello2.txt
echo hello > hello1.txt
cat hello1.txt > hello2.txt
who > hello1.txt
who >> hello1.txt
ls >> hello1.txt
man ls >> hello1.txt
touch users
echo "菜鸟教程：www.runoob.com" > users
echo "菜鸟教程：www.runoob.com" >> users
wc -l users
./test.sh
./test.sh 1 2 3 4
./test.sh 1 2 3 4 5 6 7 
cd ..
rm test
mkdir os
cd study
cmake .
make
test
ls
./test
make .
make
test
./test
make .
make 
./hello
gcc /home/bingyu/SysY_compiler/src/parser/lex.yy.c -o lexer
flex Sysy.l
bison -d SysY.y
bison -d syntax_analyzer.y
bison -d SysY.y
bison -Wcounterexamples SysY.y
bison -d SysY.y
bison -d syntax_analyzer.y
flex %option noyywrap
%{
#include <stdio.h>
#include <stdlib.h>
#include "syntax_tree.h"
#include "syntax_analyzer.h"
int lines=1;
int pos_start=1;
int pos_end=1;
void pass_node(char *text){
}
%}
identifer    [a-zA-Z_][a-zA-Z0-9_]*
decimalconst [1-9][0-9]*
octalconst   0[0-7]*
hexconst     0[xX][0-9a-fA-F]+
float        [0-9]+\.|[0-9]*\.[0-9]+
char      [^\*/]
linecomment \/\/.*
COMMENT   \/\*{char}*((\*)+{char}+|\/{char}*)*(\*)*\*\/
%%
else      {pos_start = pos_end; pos_end += 4; pass_node(yytext); return ELSE;}
if        {pos_start = pos_end; pos_end += 2; pass_node(yytext); return IF;}
int       {pos_start = pos_end; pos_end += 3; pass_node(yytext); return INT;}
return    {pos_start = pos_end; pos_end += 6; pass_node(yytext); return RETURN;}
void      {pos_start = pos_end; pos_end += 4; pass_node(yytext); return VOID;}
while     {pos_start = pos_end; pos_end += 5; pass_node(yytext); return WHILE;}
float     {pos_start = pos_end; pos_end += 5; pass_node(yytext); return FLOAT;}
const     {pos_start = pos_end; pos_end += 5; pass_node(yytext); return CONST;}
break     {pos_start = pos_end; pos_end += 5; pass_node(yytext); return BREAK;}
continue  {pos_start = pos_end; pos_end += 8; pass_node(yytext); return CONTINUE;}
\+ 	 {pos_start = pos_end; pos_end += 1; pass_node(yytext); return ADD;}
\-   {pos_start = pos_end; pos_end += 1; pass_node(yytext); return SUB;}
\*   {pos_start = pos_end; pos_end += 1; pass_node(yytext); return MUL;}
\%   {pos_start = pos_end; pos_end += 1; pass_node(yytext); return MOD;}
\/   {pos_start = pos_end; pos_end += 1; pass_node(yytext); return DIV;}
\<   {pos_start = pos_end; pos_end += 1; pass_node(yytext); return LT;}
\<\= {pos_start = pos_end; pos_end += 2; pass_node(yytext); return LTE;}
\>   {pos_start = pos_end; pos_end += 1; pass_node(yytext); return GT;}
\>\= {pos_start = pos_end; pos_end += 2; pass_node(yytext); return GTE;}
\=\= {pos_start = pos_end; pos_end += 2; pass_node(yytext); return EQ;}
\!\= {pos_start = pos_end; pos_end += 2; pass_node(yytext); return NEQ;}
\=   {pos_start = pos_end; pos_end += 1; pass_node(yytext); return ASSIGN;}
\;   {pos_start = pos_end; pos_end += 1; pass_node(yytext); return SEMICOLON;}
\,   {pos_start = pos_end; pos_end += 1; pass_node(yytext); return COMMA;}
\(   {pos_start = pos_end; pos_end += 1; pass_node(yytext); return LEFTPARENTHESIS;}
\)   {pos_start = pos_end; pos_end += 1; pass_node(yytext); return RIGHTPARENTHESIS;}
\[   {pos_start = pos_end; pos_end += 1; pass_node(yytext); return LEFTBRACKET;}
\]   {pos_start = pos_end; pos_end += 1; pass_node(yytext); return RIGHTBRACKET;}
\{   {pos_start = pos_end; pos_end += 1; pass_node(yytext); return LEFTBRACE;}
\}   {pos_start = pos_end; pos_end += 1; pass_node(yytext); return RIGHTBRACE;}
\!   {pos_start = pos_end; pos_end += 1; pass_node(yytext); return NOT;}
\&\& {pos_start = pos_end; pos_end += 2; pass_node(yytext); return AND;}
\|\| {pos_start = pos_end; pos_end += 2; pass_node(yytext); return OR;}
{identifer}    {pos_start = pos_end; pos_end += strlen(yytext); pass_node(yytext); return IDENT;}
{decimalconst} {pos_start = pos_end; pos_end += strlen(yytext); pass_node(yytext); return INTCONST;}
{octalconst}   {pos_start = pos_end; pos_end += strlen(yytext); pass_node(yytext); return INTCONST;}
{hexconst}     {pos_start = pos_end; pos_end += strlen(yytext); pass_node(yytext); return INTCONST;}
{float}        {pos_start = pos_end; pos_end += strlen(yytext); pass_node(yytext); return FLOATCONST;}
{COMMENT} {
}
{line_comment} {pos_start=1; pos_end=pos_start; line++;}
[ \t]     {pos_start = pos_end; pos_end += 1;}
\n        {pos_start = pos_end; pos_end = 1; lines++;}
\r        {pos_start = pos_end; pos_end = 1;}
. { pos_start = pos_end; pos_end += 1; return ERROR;}
%%
flex /home/bingyu/SysY_compiler/src/parser/syntax_analyzer.l
gcc lex.yy.c -o lexer
bison -d /home/bingyu/SysY_compiler/src/parser/syntax_analyzer.y
flex /home/bingyu/SysY_compiler/src/parser/syntax_analyzer.l
gcc lex.yy.c -o lexer
cmake version
cmake -version
sudo install cmake
bison -d SysY.y
bison -d test.y
bison -Wconflicts test.y
bison -Wcounterexamples test.y
bison -d test.y
bison -Wcounterexamples test.y
bison -d test.y
bison -Wcounterexamples test.y
bison -Wcex test.y
bison -d test.y
bison -Wcex test.y
bison -d test.y
bison -Wcex test.y
bison -d test.y
bison -Wcex test.y
bison -d test.y
bison -Wcex test.y
bison -d test.y
bison -Wcex test.y
bison -d test.y
bison -Wcex test.y
bison -d test.y
python3 ./eval_lab2.py
cat eval_result
cminusfc complex1.cminus -emit-llvm
cmake .. 
make 
sudo make install
bison -d /home/bingyu/SysY_compiler/src/parser/syntax_analyzer.y
bison -Wcounterexamples /home/bingyu/SysY_compiler/src/parser/syntax_analyzer.y
q
bison -d /home/bingyu/SysY_compiler/src/parser/syntax_analyzer.y
bison -d /home/bingyu/SysY_compiler/src/parser/SysY.y
bison -d /home/bingyu/SysY_compiler/src/parser/syntax_analyzer.y
bison -d /home/bingyu/SysY_compiler/src/parser/test.y
bison -d /home/bingyu/SysY_compiler/src/parser/SysY.y
bison -d /home/bingyu/SysY_compiler/src/parser/test.y
bison -Wcounterexamples /home/bingyu/SysY_compiler/src/parser/test.y
bison -d /home/bingyu/SysY_compiler/src/parser/SysY.y
bison -d /home/bingyu/SysY_compiler/src/parser/test.y
bison -Wcounterexamples /home/bingyu/SysY_compiler/src/parser/test.y
bison -d /home/bingyu/SysY_compiler/src/parser/test.y
bison -d /home/bingyu/SysY_compiler/src/parser/syntax_analyzer.y
bison -d /home/bingyu/SysY_compiler/src/parser/test.y
bison -d /home/bingyu/SysY_compiler/src/parser/syntax_analyzer.y
bison -Wcounterexamples /home/bingyu/SysY_compiler/src/parser/syntax_analyzer.y
bison -d /home/bingyu/SysY_compiler/src/parser/test.y
bison -d /home/bingyu/SysY_compiler/src/parser/syntax_analyzer.y
bison -d /home/bingyu/SysY_compiler/src/parser/test.y
bison -d /home/bingyu/SysY_compiler/src/parser/syntax_analyzer.y
cminusfc test.cminus -emit-llvm

cminusfc complex2.cminus -emit-llvm
sudo make install
clang -emit-llvm -S -o - test.c
clang -S -emit-llvm test.c
cminusfc 20-gcd_array.cminus -emit-llvm
df -i
df -h
pm2 flush
df -h
cd .
cd ..
du -h /home/bingyu/2023ustc-jianmu-compiler
du /home/bingyu/2023ustc-jianmu-compiler -sh
du ~ -sh
df -h
rm ./1-parser
rm -rf ./1-parser
rm -rf ./2-ir-gen
rm -rf ./4-codegen
rm -rf ./3-codegen
rm -rf ./4-mem2reg
df -h
rm -rf ./study
cd ..
rm -rf ./study
df -h
du /home/bingyu/SysY_compiler/include/cminusfc/cminusf_builder.hpp -sh
cp /home/bingyu/SysY_compiler/include/cminusfc/cminusf_builder.hpp
df -h
ps
ls
ps
df -h
./eval_lab4.sh
./eval_lab4.sh test
./eval_lab4.sh /home/bingyu/2023ustc-jianmu-compiler/tests/4-mem2reg/testcases_general test
df -h
cd ../
cd /
cd ./
cd ../
./eval_lab1.sh 
/eval_lab1.sh easy
./eval_lab1.sh easy
clang -S -emit-llvm test.c
df -h
clang -S -emit-llvm test.c
df -h
clang -S -emit-llvm test.c
df -h
./test.sh
cd ..
cd ./3-codegen
./test.sh
cd ./autogen
./test.sh
cat << aaaa
d
dd
q

./eval_lab3.sh
man basename
/home/bingyu/2023ustc-jianmu-compiler/tests/3-codegen/autogen/test.sh
chmod +x /home/bingyu/2023ustc-jianmu-compiler/tests/3-codegen/autogen/test.sh
/home/bingyu/2023ustc-jianmu-compiler/tests/3-codegen/autogen/test.sh
realpath --help
cd ..
cd ../
cd ../..
cd /20
cd ./2023ustc-jianmu-compiler
cd ./tests
cd ./1-parser
cd ./..
cd ./1-parser
cd eval_lab1.sh
cd ../

cd ./1-parser
realpath ../../../
./eval_lab2.py
rm eval_result
./eval_lab3.sh
./eval_lab3.sh debug
./eval_lab3.sh ./testcases debug
cminusfc -emit-llvm /home/bingyu/2023ustc-jianmu-compiler/tests/3-codegen/autogen/testcases/0-io.cminus -o 1.ll
rm 1.ll
rm log.txt
cd ../..
cd ./4-mem2reg
rm log.txt
cd ..
rm complex1.ll
cp rmove.sh
mkdir rmove.sh
ls .
./rmove.sh
chmod +x ./rmove.sh
./rmove.sh
q
./rmove.sh
q
rm ./test.py
clang -S -emit-llvm test.c
df -h
./eval_lab3.sh
./eval_lab3.sh 2023ustc-jianmu-compiler/tests/3-codegen/autogen/testcases_general debug
./eval_lab3.sh /home/bingyu/2023ustc-jianmu-compiler/tests/3-codegen/autogen/testcases_general debug
cd ../../../../
cd ..
ls
cd ./bingyu
ls
cd ..
ls 
cd ./bin
ls
cd ..
cd ./lib
ls
cd ..
cd ./..
cd ./home
cd ./bingyu
cd ./20203
cd ./2023
clang -emit-llvm ./test.c
clang -S -emit-llvm test.c
df -h
clang -S -emit-llvm test.c
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           