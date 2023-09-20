#include<iostream>
#include<vector>
using namespace std;

bool canIgo(vector<vector<int>>&maze, vector<vector<bool>>&status, int i, int j, int n)
{
    if(i>=0 && i<n && j>=0 && j<n && status[i][j] == false && maze[i][j] == 1)
        return true;
    else
        return false;
}

void solve(vector<vector<int>>& maze, vector<vector<bool>>& status, int i, int j, int n, vector<string>&ans, string& path)
{
    //base case
    if(i==n-1 && j==n-1)
    {
        ans.push_back(path);
        return;
    }

    if(canIgo(maze, status, i+1, j, n))             //down
    {
        status[i+1][j] = true;
        path += "D";
        solve(maze, status, i+1, j, n, ans, path);
        status[i+1][j] = false;
        path.pop_back();
    }
    if(canIgo(maze, status, i, j-1, n))             //left
    {
        status[i][j-1] = true;
        path += "L";
        solve(maze, status, i, j-1, n, ans, path);
        status[i][j-1] = false;
        path.pop_back();
    }
    if(canIgo(maze, status, i, j+1, n))             //right
    {
        status[i][j+1] = true;
        path += "R";
        solve(maze, status, i, j+1, n, ans, path);
        status[i][j+1] = false;
        path.pop_back();
    }
    if(canIgo(maze, status, i-1, j, n))
    {
        status[i-1][j] = true;
        path += "U";
        solve(maze, status, i-1, j, n, ans, path);
        status[i-1][j] = false;
        path.pop_back();
    }
}

int main()
{
    vector<vector<int>>maze{{1, 0, 0, 0}, {1, 1, 0, 0}, {1, 1, 0, 0}, {0, 1, 1, 1}};
    int n = 4;
    vector<vector<bool>>status(n, vector<bool>(n, false));
    string path = "";
    vector<string>ans;
    solve(maze, status, 0, 0, n, ans, path);
    for(auto i:ans)
        cout<<i<<" ";
    return 0;
}