#include<bits/stdc++.h>
using namespace std;

int ara[100], res[100], taken[100];
int n;
void f(int idx)
{

    if(idx==n)
    {
        for(int i=0;i<n;i++)
            printf("%d ",res[i]);
        puts("");

        return;
    }

    for(int i=0;i<n;i++)
    {
        if(taken[i]==0)
        {
            taken[i]=1;
            res[idx]=ara[i];
            f(idx+1);
            taken[i]=0;
        }
    }


    return;

}

int main()
{

    cin>>n;

    for(int i=0;i<n;i++)
        cin>>ara[i];

    f(0);

}
