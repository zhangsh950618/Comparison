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
#include "y.tab.h"
#include <string.h>
#include<string>

extern void yyerror(const char *);  /* prints grammar violation message */

extern int sym_type(const char *);  /* returns type from symbol table */

#define sym_type(identifier) IDENTIFIER /* with no symbol table, fake it */

static void comment(void);
static int check_type(void);

string s = "";

%}

%%
"/*"                                    { comment(); }
"//".*                                    { /* consume //-comment */ }	
"auto"					{s+="a";printf("%s\n",yytext); return(AUTO); }
"break"					{s+="b";printf("%s\n",yytext); return(BREAK); }
"case"					{s+="c";printf("%s\n",yytext); return(CASE); }
"char"					{printf("%s\n",yytext); return(CHAR); }
"const"					{printf("%s\n",yytext); return(CONST); }
"continue"				{printf("%s\n",yytext); return(CONTINUE); }
"default"				{printf("%s\n",yytext); return(DEFAULT); }
"do"					{printf("%s\n",yytext); return(DO); }
"double"				{printf("%s\n",yytext); return(DOUBLE); }
"else"					{printf("%s\n",yytext); return(ELSE); }
"enum"					{printf("%s\n",yytext); return(ENUM); }
"extern"				{printf("%s\n",yytext); return(EXTERN); }
"float"					{printf("%s\n",yytext); return(FLOAT); }
"for"					{printf("%s\n",yytext); return(FOR); }
"goto"					{printf("%s\n",yytext); return(GOTO); }
"if"					{printf("%s\n",yytext); return(IF); }
"inline"				{printf("%s\n",yytext); return(INLINE); }
"int"					{printf("%s\n",yytext); return(INT); }
"long"					{printf("%s\n",yytext); return(LONG); }
"register"				{printf("%s\n",yytext); return(REGISTER); }
"restrict"				{printf("%s\n",yytext); return(RESTRICT); }
"return"				{printf("%s\n",yytext); return(RETURN); }
"short"					{printf("%s\n",yytext); return(SHORT); }
"signed"				{printf("%s\n",yytext); return(SIGNED); }
"sizeof"				{printf("%s\n",yytext); return(SIZEOF); }
"static"				{printf("%s\n",yytext); return(STATIC); }
"struct"				{printf("%s\n",yytext); return(STRUCT); }
"switch"				{printf("%s\n",yytext); return(SWITCH); }
"typedef"				{printf("%s\n",yytext); return(TYPEDEF); }
"union"					{printf("%s\n",yytext); return(UNION); }
"unsigned"				{printf("%s\n",yytext); return(UNSIGNED); }
"void"					{printf("%s\n",yytext); return(VOID); }
"volatile"				{printf("%s\n",yytext); return(VOLATILE); }
"while"					{printf("%s\n",yytext); return(WHILE); }
"_Alignas"                              {printf("%s\n",yytext); return ALIGNAS; }
"_Alignof"                              {printf("%s\n",yytext); return ALIGNOF; }
"_Atomic"                               {printf("%s\n",yytext); return ATOMIC; }
"_Bool"                                 {printf("%s\n",yytext); return BOOL; }
"_Complex"                              {printf("%s\n",yytext); return COMPLEX; }
"_Generic"                              {printf("%s\n",yytext); return GENERIC; }
"_Imaginary"                            {printf("%s\n",yytext); return IMAGINARY; }
"_Noreturn"                             {printf("%s\n",yytext); return NORETURN; }
"_Static_assert"                        {printf("%s\n",yytext); return STATIC_ASSERT; }
"_Thread_local"                         {printf("%s\n",yytext); return THREAD_LOCAL; }
"__func__"                              {printf("%s\n",yytext); return FUNC_NAME; }

{L}{A}*					{printf("var\n"); return check_type(); }/*变量*/

{HP}{H}+{IS}?				{printf("%s\n",yytext); return I_CONSTANT; }
{NZ}{D}*{IS}?				{printf("%s\n",yytext); return I_CONSTANT; }
"0"{O}*{IS}?				{printf("%s\n",yytext); return I_CONSTANT; }
{CP}?"'"([^'\\\n]|{ES})+"'"		{printf("%s\n",yytext); return I_CONSTANT	; }

{D}+{E}{FS}?				{printf("%s\n",yytext); return F_CONSTANT; }
{D}*"."{D}+{E}?{FS}?			{printf("%s\n",yytext); return F_CONSTANT; }
{D}+"."{E}?{FS}?			{printf("%s\n",yytext); return F_CONSTANT; }
{HP}{H}+{P}{FS}?			{printf("%s\n",yytext); return F_CONSTANT; }
{HP}{H}*"."{H}+{P}{FS}?			{printf("%s\n",yytext); return F_CONSTANT; }
{HP}{H}+"."{P}{FS}?			{printf("%s\n",yytext); return F_CONSTANT; }
({SP}?\"([^"\\\n]|{ES})*\")+	{printf("%s\n",yytext); return STRING_LITERAL; }/*删除 括号内部   {ws}* 去除了无没用的空行*/
"..."					{printf("%s\n",yytext); return ELLIPSIS; }
">>="					{printf("%s\n",yytext); return RIGHT_ASSIGN; }
"<<="					{printf("%s\n",yytext); return LEFT_ASSIGN; }
"+="					{printf("%s\n",yytext); return ADD_ASSIGN; }
"-="					{printf("%s\n",yytext); return SUB_ASSIGN; }
"*="					{printf("%s\n",yytext); return MUL_ASSIGN; }
"/="					{printf("%s\n",yytext); return DIV_ASSIGN; }
"%="					{printf("%s\n",yytext); return MOD_ASSIGN; }
"&="					{printf("%s\n",yytext); return AND_ASSIGN; }
"^="					{printf("%s\n",yytext); return XOR_ASSIGN; }
"|="					{printf("%s\n",yytext); return OR_ASSIGN; }
">>"					{printf("%s\n",yytext); return RIGHT_OP; }
"<<"					{printf("%s\n",yytext); return LEFT_OP; }
"++"					{printf("%s\n",yytext); return INC_OP; }
"--"					{printf("%s\n",yytext); return DEC_OP; }
"->"					{printf("%s\n",yytext); return PTR_OP; }
"&&"					{printf("%s\n",yytext); return AND_OP; }
"||"					{printf("%s\n",yytext); return OR_OP; }
"<="					{printf("%s\n",yytext); return LE_OP; }
">="					{printf("%s\n",yytext); return GE_OP; }
"=="					{printf("%s\n",yytext); return EQ_OP; }
"!="					{printf("%s\n",yytext); return NE_OP; }
";"					{printf("%s\n",yytext); return ';'; }
("{"|"<%")				{printf("%s\n",yytext); return '{'; }
("}"|"%>")				{printf("%s\n",yytext); return '}'; }
","					{printf("%s\n",yytext); return ','; }
":"					{printf("%s\n",yytext); return ':'; }
"="					{printf("%s\n",yytext); return '='; }
"("					{printf("%s\n",yytext); return '('; }
")"					{printf("%s\n",yytext); return ')'; }
("["|"<:")				{printf("%s\n",yytext); return '['; }
("]"|":>")				{printf("%s\n",yytext); return ']'; }
"."					{printf("%s\n",yytext); return '.'; }
"&"					{printf("%s\n",yytext); return '&'; }
"!"					{printf("%s\n",yytext); return '!'; }
"~"					{printf("%s\n",yytext); return '~'; }
"-"					{printf("%s\n",yytext); return '-'; }
"+"					{printf("%s\n",yytext); return '+'; }
"*"					{printf("%s\n",yytext); return '*'; }
"/"					{printf("%s\n",yytext); return '/'; }
"%"					{printf("%s\n",yytext); return '%'; }
"<"					{printf("%s\n",yytext); return '<'; }
">"					{printf("%s\n",yytext); return '>'; }
"^"					{printf("%s\n",yytext); return '^'; }
"|"					{printf("%s\n",yytext); return '|'; }
"?"					{printf("%s\n",yytext); return '?'; }

{WS}					{ /* whitespace separates tokens */ }
.					{ /* discard bad characters */ }

%%

int yywrap(void)        /* called at end of input */
{
	printf("%s\n",s);
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
    yyerror("unterminated comment");
}

static int check_type(void)
{
    switch (sym_type(yytext))
    {
    case TYPEDEF_NAME:{                /* previously defined */
	//printf("类型名称:%s\n",yytext);
        	return TYPEDEF_NAME;
	}
    case ENUMERATION_CONSTANT:{        /* previously defined */
	//printf("已经定义过的变量%s\n",yytext);
        return ENUMERATION_CONSTANT;	
	}
    default: {                         /* includes undefined */
//	printf("自定义变量 %s\n",yytext);
        return IDENTIFIER;
	}
    }
}
