#include<iostream>
#include<string.h>
using namespace std;
const int MAXN = 100;
string maze[MAXN][MAXN];
int main(){
        int i,j;
        string str1="12345665432";
        string str2="1234345632";
        int len1=str1.length();
        int len2=str2.length();
        cout << "len1=" << len1 << endl;
        cout << "len2=" << len2 << endl;
        for(i=0;i < len1;i++)
                for(j=0;j < len2;j++){
                        if(i ==0 || j == 0){
                                maze[i][j]="";
                                continue;
                        }
                        if(str1[i]==str2[j]){
                                cout << "same" << endl;
                                maze[i][j]=maze[i-1][j-1]+str1[i];
                        }
                        else{
                                if(maze[i-1][j].length()>maze[i][j-1].length())
                                        maze[i][j]=maze[i-1][j];
                                else
                                        maze[i][j]=maze[i][j-1];
                        }
                }
        cout << "has done" << endl;
        cout << maze[len1-1][len2-1] << endl;
        return 0;
}
