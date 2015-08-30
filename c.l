%e  1019
%p  2807
%n  371
%k  284
%a  1213
%o  1117

O   [0-7]
D   [0-9] 
NZ  [1-9]
L   [a-zA-Z_]
A   [a-zA-Z_0-9]
H   [a-fA-F0-9]
HP  (0[xX])
E   ([Ee][+-]?{D}+)
P   ([Pp][+-]?{D}+)
FS  (f|F|l|L)
IS  (((u|U)(l|L|ll|LL)?)|((l|L|ll|LL)(u|U)?))
CP  (u|U|L)
SP  (u8|u|U|L)
ES  (\\(['"\?\\abfnrtv]|[0-7]{1,3}|x[a-fA-F0-9]+))
WS  [ \t\v\n\f]

%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"
char fingerprint[1000];
int length = 0;
/*只是对于正确的代码比对是不会出现语法错误的*/


//extern void yyerror(const char *);  /* prints grammar violation message */

//extern int sym_type(const char *);  /* returns type from symbol table */

#define sym_type(identifier) IDENTIFIER /* with no symbol table, fake it */

static void comment(void);
//static int check_type(void);

%}




%%
"/*"                                    { comment(); }/* 注释直接略过 不处理*/
"//".*                                  {  }

 /*是否需要比对宏定义,刚刚开始学的学生这部分基本一样，#include<stdio.h>相似度太高了*/
 /*"#".*				      {printf("宏定义\n");}*/
  


 /*
这些关键子会被当成和用户自定义的变量一样处理
一般不会使用的关键字
"_Alignas"                              {printf("%s\n"); return ALIGNAS; }
"_Alignof"                              {printf("%s\n"); return ALIGNOF; }
"_Atomic"                               {printf("%s\n"); return ATOMIC; }
"_Bool"                                 {printf("%s\n"); return BOOL; }
"_Complex"                              {printf("%s\n"); return COMPLEX; }
"_Generic"                              {printf("%s\n"); return GENERIC; }
"_Imaginary"                            {printf("%s\n"); return IMAGINARY; }
"_Noreturn"                             {printf("%s\n"); return NORETURN; }
"_Static_assert"                        {printf("%s\n"); return STATIC_ASSERT; }
"_Thread_local"                         {printf("%s\n"); return THREAD_LOCAL; }
"__func__"                              {printf("%s\n"); return FUNC_NAME; }
"volatile"				{printf("%s\n"); return(VOLATILE); }
"goto"					{printf("o"); return(GOTO); }
"extern"				{printf("l"); return(EXTERN); }
"register"				{printf("t"); return(REGISTER); }
"restrict"				{printf("u"); return(RESTRICT); }
"signed"				{printf("x"); return(SIGNED); }
"auto"					{printf("a"); return(AUTO); }

低频率

"long"					{printf("this is long");}
"short"
"long long"				{printf("this is long long");}*/


	
	/*关键字，分隔符，变量，常量，操作符,如果只分这几种类型，误判几率太大*/
 /*定义高频率关键字，如果定义所有关键字，不能唯一表示，会产生冲突，浪费 =-= 个人想法*/

  /*数据类型*/
"int"					{fingerprint[length++] = 'a';}
"float"					{fingerprint[length++] = 'b';}
"long"					{fingerprint[length++] = 'c';}
"double"				{fingerprint[length++] = 'd';}
"char"					{fingerprint[length++] = 'e';}
 /*c++*/
"string" 				{fingerprint[length++] = 'f';}
"true"					{fingerprint[length++] = 'g';}
"false"					{fingerprint[length++] = 'h';}


 /*控制语句*/
  /*循环*/
"for" 					{fingerprint[length++] = 'i';}
"while"					{fingerprint[length++] = 'j';}
"do"					{fingerprint[length++] = 'k';}
"break"					{fingerprint[length++] = 'l';}
"continue"				{fingerprint[length++] = 'm';}
 /*分支*/
"if"					{fingerprint[length++] = 'n';}
"else"					{fingerprint[length++] = 'o';}
"switch"				{fingerprint[length++] = 'p';}
"case"					{fingerprint[length++] = 'q';}
"return"				{fingerprint[length++] = 'r';}
 /*常用函数*/
"printf"				{fingerprint[length++] = 's';}
"scanf"					{fingerprint[length++] = 't';}
"cin"					{fingerprint[length++] = 'u';}
"cout"					{fingerprint[length++] = 'v';}
"sqrt"					{fingerprint[length++] = 'w';}
"memset"				{fingerprint[length++] = 'x';}
"sizeof"				{fingerprint[length++] = 'y';}
 /*常用修饰符*/
"static"				{fingerprint[length++] = 'z';}
"const"					{fingerprint[length++] = 'A';}
"struct"				{fingerprint[length++] = 'B';}
"typedef"				{fingerprint[length++] = 'C';}

 /*符号*/

">>="					{fingerprint[length++] = 'D';}
"<<="					{fingerprint[length++] = 'E';}
"+="					{fingerprint[length++] = 'F';}
"-="					{fingerprint[length++] = 'G';}
"*="					{fingerprint[length++] = 'H';}
"/="					{fingerprint[length++] = 'I';}
"%="					{fingerprint[length++] = 'J';}
"&="					{fingerprint[length++] = 'K';}
"^="					{fingerprint[length++] = 'L';}
"|="					{fingerprint[length++] = 'M';}
">>"					{fingerprint[length++] = 'N';}
"<<"					{fingerprint[length++] = 'O';}
"++"					{fingerprint[length++] = 'P';}
"--"					{fingerprint[length++] = 'Q';}
"->"					{fingerprint[length++] = 'R';}
"&&"					{fingerprint[length++] = 'S';}
"||"					{fingerprint[length++] = 'T';}
"<="					{fingerprint[length++] = 'U';}
">="					{fingerprint[length++] = 'V';}
"=="					{fingerprint[length++] = 'W';}				
"!="					{fingerprint[length++] = 'X';}
";"					{fingerprint[length++] = ';';}
("{"|"<%")				{fingerprint[length++] = '{';}
("}"|"%>")				{fingerprint[length++] = '}';}
","					{fingerprint[length++] = ',';}
":"					{fingerprint[length++] = ':';}
"="					{fingerprint[length++] = '=';}
"("					{fingerprint[length++] = '(';}
")"					{fingerprint[length++] = ')';}
("["|"<:")				{fingerprint[length++] = '[';}
("]"|":>")				{fingerprint[length++] = ']';}
"."					{fingerprint[length++] = '.';}
"&"					{fingerprint[length++] = '&';}
"!"					{fingerprint[length++] = '!';}
"~"					{fingerprint[length++] = '~';}
"-"					{fingerprint[length++] = '-';}
"+"					{fingerprint[length++] = '+';}
"*"					{fingerprint[length++] = '*';}
"/"					{fingerprint[length++] = '/';}
"%"					{fingerprint[length++] = '%';}
"^"					{fingerprint[length++] = '^';}
"|"					{fingerprint[length++] = '|';}
"?"					{fingerprint[length++] = '?';}


 /*变量*/
{L}{A}*					{fingerprint[length++] = 'Y';}
 /* 常量 */
  /* 整数 */ 
{HP}{H}+{IS}?				{fingerprint[length++] = '0';}
{NZ}{D}*{IS}?				{fingerprint[length++] = '0';}
"0"{O}*{IS}?				{fingerprint[length++] = '0';}
{CP}?"'"([^'\\\n]|{ES})+"'"		{fingerprint[length++] = '0';}
 /** 浮点 */
{D}+{E}{FS}?				{fingerprint[length++] = '1';}
{D}*"."{D}+{E}?{FS}?			{fingerprint[length++] = '1';}
{D}+"."{E}?{FS}?			{fingerprint[length++] = '1';}
{HP}{H}+{P}{FS}?			{fingerprint[length++] = '1';}
{HP}{H}*"."{H}+{P}{FS}?			{fingerprint[length++] = '1';}
{HP}{H}+"."{P}{FS}?			{fingerprint[length++] = '1';}

 /*字符串*/
({SP}?\"([^"\\\n]|{ES})*\")+	{fingerprint[length++] = '2';}/*删除 括号内部   {ws}* 去除了无没用的空行 不做处理*/



 /*不做处理忽略*/
{WS}					{ /* 空白 */ }
.					{ /* 存在问题的字符 */ }

%%


int main()
{
  yylex(); /* 进行Lex分析 */
  int i = 0;
  for(i = 0 ; i < length ;i++)
	printf("%c",fingerprint[i]);
printf("\n");
  return 0;
}
int yywrap(void)        /* called at end of input */
{
    return 1;           /* terminate now */
	
}

static void comment(void)
{
    int c;

    while ((c = input()) != 0)
        if (c == '*')
        {
            while ((c = input()) == '*')
                ;

            if (c == '/')
                return;

            if (c == 0)
                break;
        }
}
 
 //static int check_type(void)
// {
//    switch (sym_type(yytext))
//    {
//    case TYPEDEF_NAME:{                /* previously defined */
//	
//        	return TYPEDEF_NAME;
//	}
//    case ENUMERATION_CONSTANT:{        /* previously defined */
	
//        return ENUMERATION_CONSTANT;	
//	}
//default: {                         /* includes undefined */

//        return IDENTIFIER;
//	}
//    }
//} 
