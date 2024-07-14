# HW7
## PB21111686_赵卓
### 9.1
- $(a).$
  $loop_1={B_2,B_3,B_4,B_5}$
  $loop_2={B_3,B_4}$
  $loop_3={B_2,B_3,B_5}$
  $loop_4={B_2,B_5}$
- $(b).$
  $(3),(4),(6),(8),(9)中的a均可以修改为1$
  $而b不可以实施复写传播$
- $(c).$
  $loop_1=a+b,c-a$
  $loop_2=null$
  $loop_3=a+b,c-a$
  $loop_4=a+b,c-a$
- $(d).$
  $loop_1=b,c$
  $loop_2=e$
  $loop_3=b,c,e$
  $loop_4=b,c,d,e$
- $(e).$
  $loop_1=null$
  $loop_2=a+b$
  $loop_3=null$
  $loop_4=null$
### 9.2
```C
//优化后代码如下：
dp = 0
t1 = 0
n1 = 8 * n
L：
t2 = A[t1]
t4 = B[t1]
t5 = t2 * t4
dp = dp + t5
t1 = t1 + 8
if t1 < n1 goto L
```

### 9.3
- $(a).$
  - $gen,kill如下：$
    <table>
    <tr align="center"><th></th><th>gen</th><th>kill</th></tr>
    <tr align="center"><th>B1</th><td>(1),(2)</td><td>(10),
    (11)</td></tr>
    <tr align="center"><th>B2</th><td>(3),(4)</td><td>
    (5),(6)</td></tr>
    <tr align="center"><th>B3</th><td>(5)</td><td>(4),(6)</td></tr>
    <tr align="center"><th>B4</th><td>(6),(7)</td><td>(4),(5),(9)</td></tr>
    <tr align="center"><th>B5</th><td>(8),(
    9)</td><td>(2),(7),(11)</td></tr>
    <tr align="center"><th>B6</th><td>(10),
    (11)</td><td>(1),(2),(8)</td></tr>
    </table>
  - $IN,OUT迭代如下：$
    <table>
    <tr align="center"><th></th><th>IN_1</th><th>OUT_1</th><th>IN_2</th><th>OUT_2</th><th>IN_3</th><th>OUT_3</th></tr>
    <tr align="center"><th>B1</th><td>null</td><td>(1),(2)</td><td>null</td><td>(1),(2)</td><td>null</td><td>(1),(2)</td></tr>
    <tr align="center"><th>B2</th><td>(1),(2)</td><td>(1),(2),(3),(4)</td><td>(1),(2),(3),(4),(5),(8),(9)</td><td>(1),(2),(3),(4),(8),(9)</td><td>(1),(2),(3),(4),(5),(8),(9)</td><td>(1),(2),(3),(4),(8),(9)</td></tr>
    <tr align="center"><th>B3</th><td>(1),(2),(3),(4)</td><td>(1),(2),(3),(5)</td><td>(1),(2),(3),(4),(6),(7),(8),(9)</td><td>(1),(2),(3),(5),(7),(8),(9)</td><td>(1),(2),(3),(4),(6),(7),(8),(9)</td><td>(1),(2),(3),(5),(7),(8),(9)</td></tr>
    <tr align="center"><th>B4</th><td>(1),(2),(3),(5)</td><td>(1),(2),(3),(6),(7)</td><td>(1),(2),(3),(5),(7),(8),(9)</td><td>(1),(2),(3),(6),(7),(8)</td><td>(1),(2),(3),(5),(7),(8),(9)</td><td>(1),(2),(3),(6),(7),(8)</td></tr>
    <tr align="center"><th>B5</th><td>(1),(2),(3),(4),(5)</td><td>(1),(3),(4),(5),(8),(9)</td><td>(1),(2),(3),(4),(5),(7),(8),(9)</td><td>(1),(3),(4),(5),(8),(9)</td><td>(1),(2),(3),(4),(5),(7),(8),(9)</td><td>(1),(3),(4),(5),(8),(9)</td></tr>
    <tr align="center"><th>B6</th><td>(1),(3),(4),(5),(8),(9)</td><td>(3),(4),(5),(9),(10),(11)</td><td>(1),(3),(4),(5),(8),(9)</td><td>(3),(4),(5),(9),(10),(11)</td><td>(1),(3),(4),(5),(8),(9)</td><td>(3),(4),(5),(9),(10),(11)</td></tr>
    </table>

- $(b).$ 
   - $e\_gen,e\_kill如下：$
      <table>
      <tr align="center"><th></th><th>e_gen</th><th>e_kill</th></tr>
      <tr align="center"><th>B1</th><td>1,2</td><td>a+b,c-a,a-d,b+d,b*d</td></tr>
      <tr align="center"><th>B2</th><td>a+b,c-a</td><td>
      b+d,b*d,a-d</td></tr>
      <tr align="center"><th>B3</th><td>null</td><td>b+d,b*d,a-d</td></tr>
      <tr align="center"><th>B4</th><td>a+b</td><td>b+d,b*d,a-d,e+1</td></tr>
      <tr align="center"><th>B5</th><td>c-a</td><td>a+b,b*d,b+d,e+1</td></tr>
      <tr align="center"><th>B6</th><td>a-d</td><td>a+b,c-a,b+d,b*d</td></tr>
      </table>
    - $IN,OUT迭代如下：$
      <table>
      <tr align="center"><th></th><th>IN_1</th><th>OUT_1</th><th>IN_2</th><th>OUT_2</th></tr>
      <tr align="center"><th>B1</th><td>null</td><td>1,2</td><td>null</td><td>1,2</td></tr>
      <tr align="center"><th>B2</th><td>1,2</td><td>1,2,a+b,c-a</td><td>1,2</td><td>1,2,a+b,c-a</td></tr>
      <tr align="center"><th>B3</th><td>1,2,a+b,c-a</td><td>1,2,a+b,c-a</td><td>1,2,a+b,c-a</td><td>1,2,a+b,c-a</td></tr>
      <tr align="center"><th>B4</th><td>1,2,a+b,c-a</td><td>1,2,a+b,c-a</td><td>1,2,a+b,c-a</td><td>1,2,a+b,c-a</td></tr>
      <tr align="center"><th>B5</th><td>1,2,a+b,c-a</td><td>1,2,a+b,c-a</td><td>1,2,c-a</td><td>1,2,c-a</td></tr>
      <tr align="center"><th>B6</th><td>1,2,c-a</td><td>1,2,a-d</td><td>1,2,c-a</td><td>1,2,a-d</td></tr>
      </table>
- $(c).$
   - $def,use如下：$
      <table>
      <tr align="center"><th></th><th>use</th><th>def</th></tr>
      <tr align="center"><th>B1</th><td>null</td><td>a,b</td></tr>
      <tr align="center"><th>B2</th><td>a,b</td><td>c,d</td></tr>
      <tr align="center"><th>B3</th><td>b,d</td><td>null</td></tr>
      <tr align="center"><th>B4</th><td>a,b,e</td><td>d</td></tr>
      <tr align="center"><th>B5</th><td>a,b,c</td><td>e</td></tr>
      <tr align="center"><th>B6</th><td>b,d</td><td>a</td></tr>
      </table>
    - $IN,OUT迭代如下：$
      <table>
      <tr align="center"><th></th><th>IN_1</th><th>OUT_1</th><th>IN_2</th><th>OUT_2</th><th>IN_3</th><th>OUT_3</th></tr>
      <tr align="center"><th>B1</th><td>e</td><td>a,b,e</td><td>e</td><td>a,b,e</td><td>e</td><td>a,b,e</td></tr>
      <tr align="center"><th>B2</th><td>a,b,e</td><td>a,b,c,d,e</td><td>a,b,e</td><td>a,b,c,d,e</td><td>a,b,e</td><td>a,b,c,d,e</td></tr>
      <tr align="center"><th>B3</th><td>a,b,c,d,e</td><td>a,b,c,d,e</td><td>a,b,c,d,e</td><td>a,b,c,d,e</td><td>a,b,c,d,e</td><td>a,b,c,d,e</td></tr>
      <tr align="center"><th>B4</th><td>a,b,e</td><td>null</td><td>a,b,c,e</td><td>a,b,c,d,e</td><td>a,b,c,e</td><td>a,b,c,d,e</td></tr>
      <tr align="center"><th>B5</th><td>a,b,c,d</td><td>b,d</td><td>a,b,c,d</td><td>a,b,d,e</td><td>a,b,c,d</td><td>a,b,d,e</td></tr>
      <tr align="center"><th>B6</th><td>b,d</td><td>null</td><td>b,d</td><td>null</td><td>b,d</td><td>null</td></tr>
      </table>

### 9.15
- $(a).$
  $支配关系迭代如下：$
  <table>
  <tr align="center"><th></th><th>IN_1</th><th>OUT_1(dom)</th><th>IN_2</th><th>OUT_2(dom)</th></tr>
  <tr align="center"><th>1</th><td>null</td><td>1</td><td>null</td><td>1</td></tr>
  <tr align="center"><th>2</th><td>1</td><td>1,2</td><td>1</td><td>1,2</td></tr>
  <tr align="center"><th>3</th><td>1,2</td><td>1,2,3</td><td>1,2</td><td>1,2,3</td></tr>
  <tr align="center"><th>4</th><td>1,2,3</td><td>1,2,3,4</td><td>1,2,3</td><td>1,2,3,4</td></tr>
  <tr align="center"><th>5</th><td>1,2,3,4</td><td>1,2,3,4,5</td><td>1,2,3,4</td><td>1,2,3,4,5</td></tr>
  <tr align="center"><th>6</th><td>1,2,3,4</td><td>1,2,3,4,6</td><td>1,2,3,4</td><td>1,2,3,4,6</td></tr>
  <tr align="center"><th>7</th><td>1,2,3,4</td><td>1,2,3,4,7</td><td>1,2,3,4</td><td>1,2,3,4,7</td></tr>
  <tr align="center"><th>8</th><td>1,2,3,4,7</td><td>1,2,3,4,7,8</td><td>1,2,3,4</td><td>1,2,3,4,7,8</td></tr>
  <tr align="center"><th>9</th><td>1,2,3,4,7,8</td><td>1,2,3,4,7,8,9</td><td>1,2,3,4,7,8</td><td>1,2,3,4,7,8,9</td></tr>
  <tr align="center"><th>10</th><td>1,2,3,4,7,8</td><td>1,2,3,4,7,8,10</td><td>1,2,3,4,7,8</td><td>1,2,3,4,7,8,10</td></tr>
  </table>
- $(f).$
  $深度优先生成树如下：$
  ```mermaid
  graph TB;
  1((1)) --> 2((2)) 
  2 --> 3((3))
  3 --> 5((5))
  3 --> 4((4))
  5 --> 6((6))
  4 -.-> 3
  5 -.-> 2
  2 -.-> 5
  ```
  $由此可得如下结果：$
  <table>
  <tr align="center"><th>回边</th><th>自然循环</th></tr>
  <tr align="center"><td>4->3</td><td>3,4</td></tr>
  <tr align="center"><td>5->2</td><td>2,3,4,5</td></tr>
  </table>