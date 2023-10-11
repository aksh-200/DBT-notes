#include<iostream>
using namespace std;
void stringlen(char s1[])
{ 
    int i = 0;
while(s1[i]!= '\0')
{
  i++;
}
cout<<"length is "<<i<<endl;
}


void strcopy(char s1[] , char s2[])
{
   int i = 0;
   while (s1[i]!='\0')
   {
    s2[i]=s1[i];
    i++;
   }
   s2[i]='\0';
   cout<<"copy string s2\n"<<s2;
}


void strconcat(char s1[] , char s2[], char s3[])
{
     int i = 0, j =0;
   while (s1[i]!='\0')
   {
    s3[j]=s1[i];
    i++;
    j++;
   } 

  i = 0;
   while (s2[i]!='\0')
   {
    s3[j]=s2[i];
    i++;
    j++;
   } 

   s3[j]='\0';
  cout<<"\n Concat string "<<s3;
}

int main()
{
 char str1[100] , str2[100],str3[100];
 cout<<"Enter string \n";
 gets(str1);
stringlen(str1);
 strcopy(str1,str2 );
 cout<<"\nEnter string \n";
 gets(str2);
 
 strconcat(str1 , str2 ,str3);

 
char* arr[5];


for (int i = 0;i<5;i++)
{
char* ptr1 = new char[10];
cout<<"enter pointer data \n";
cin>>ptr1;
arr[i] = ptr1;
cout<<endl;
}

for(int i = 0;i<5;i++)
{
    cout<<arr[i]<<endl;
}
}