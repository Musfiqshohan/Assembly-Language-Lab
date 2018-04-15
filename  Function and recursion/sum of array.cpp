#include<bits/stdc++.h>
using namespace std;

int ara[1000];
int f(int low, int high)
{
    if(low==high) return ara[low];
    int mid=(low+high)/2;

    return f(low,mid)+ f(mid+1,high);

}

int main()
{
    int n;
    cin>>n;

    for(int i=0;i<n;i++)
        cin>>ara[i];

    cout<<f(0,n-1)<<endl;
}
