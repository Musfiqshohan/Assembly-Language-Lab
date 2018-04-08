#include<bits/stdc++.h>
using namespace std;

int  ara[1000];
int f(int low, int high, int x)
{
    if(low>high) return -1;
    int mid= (low+high)/2;

    if(ara[mid]==x)
        return mid;

    if(ara[mid]>x<)
        return f(low,mid-1,x);
    if(x>ara[mid])
        return f(mid+1,high,x);
}

int main()
{
    int n,x;
    cin>>n;

    for(int i=0;i<n;i++)
        cin>>ara[i];

    cin>>x;

    cout<<f(0,n-1, x)<<endl;

}
