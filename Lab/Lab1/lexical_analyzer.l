%option noyywrap
%{
/*****************声明和选项设置  begin*****************/
#include <stdio.h>
#include <stdlib.h>

#include "syntax_tree.h"
#include "syntax_analyzer.h"

int lines;
int pos_start;
int pos_end;

void pass_node(char *text){
     yylval.node = new_syntax_tree_node(text);
}

/*****************声明和选项设置  end*****************/

%}

letter    [a-zA-Z]
digit     [0-9]
ID        {letter}+
INTEGER   {digit}+
FLOAT     {digit}+\.|{digit}*\.{digit}+

char      [^\*/]
string    {char}+
COMMENT   \/\*{char}*((\*)+{char}+|\/{char}*)*(\*)*\*\/

%%
 /* TODO: for students */
 /* two cases for you, pass_node will send flex's token to bison
 \+ 	{pos_start = pos_end; pos_end += 1; pass_node(yytext); return ADD;}
 . { pos_start = pos_end; pos_end++; return ERROR; }
 */


 /****请在此补全所有flex的模式与动作  end******/
 /* 关键字 */
else      {pos_start = pos_end; pos_end += 4; pass_node(yytext); return ELSE;}
if        {pos_start = pos_end; pos_end += 2; pass_node(yytext); return IF;}
int       {pos_start = pos_end; pos_end += 3; pass_node(yytext); return INT;}
return    {pos_start = pos_end; pos_end += 6; pass_node(yytext); return RET;}
void      {pos_start = pos_end; pos_end += 4; pass_node(yytext); return VOID;}
while     {pos_start = pos_end; pos_end += 5; pass_node(yytext); return WHILE;}
float     {pos_start = pos_end; pos_end += 5; pass_node(yytext); return FLT;}
 /* 专用符号(注意特殊符号的转义!!!!避免麻烦，全部转义.... */
\+ 	{pos_start = pos_end; pos_end += 1; pass_node(yytext); return ADD;}
\-   {pos_start = pos_end; pos_end += 1; pass_node(yytext); return SUB;}
\*   {pos_start = pos_end; pos_end += 1; pass_node(yytext); return MUL;}
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
\(   {pos_start = pos_end; pos_end += 1; pass_node(yytext); return LPARENTHESE;}
\)   {pos_start = pos_end; pos_end += 1; pass_node(yytext); return RPARENTHESE;}
\[   {pos_start = pos_end; pos_end += 1; pass_node(yytext); return LBRACKET;}
\]   {pos_start = pos_end; pos_end += 1; pass_node(yytext); return RBRACKET;}
\{   {pos_start = pos_end; pos_end += 1; pass_node(yytext); return LBRACE;}
\}   {pos_start = pos_end; pos_end += 1; pass_node(yytext); return RBRACE;}

 /* 标识符和整数 */
{ID}      {pos_start = pos_end; pos_end += strlen(yytext); pass_node(yytext); return ID;}
{INTEGER} {pos_start = pos_end; pos_end += strlen(yytext); pass_node(yytext); return INTEGER;}
{FLOAT}   {pos_start = pos_end; pos_end += strlen(yytext); pass_node(yytext); return FLOAT;}

 /* 注释，可以超过一行，不能嵌套 */
{COMMENT} {
     pos_start = pos_end;
     int i;
     for(i = 0; yytext[i] != '\0'; i++)
     {
          pos_end++;
          if(yytext[i] == '\n')
          {
               lines++;
               pos_end = 1;
          }
     }
     pass_node(yytext); 
}

 /* 杂七杂八 */
[ \t]     {pos_start = pos_end; pos_end += 1;/* return BLANK; */}
\n        {pos_start = pos_end; pos_end = 1; lines++;/* return EOL; */}
\r        {pos_start = pos_end; pos_end = 1;/* return EOL; */}
. { pos_start = pos_end; pos_end += 1; return ERROR;}

%%