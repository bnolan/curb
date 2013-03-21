#include <iostream>
#include <string>
#include <list>

using namespace std;

class Post {
public:
     Post(){
        title = "Blah blah blah";
    }

    string title;
};

class User {
public:
     User(){
        name = "captainbenis";
    }
    
    string name;
};

string now(){
    return string("2000-01-01");
}

int main(){
    User *user = new User;
    list<Post *> posts;

    posts.push_back(new Post);
    posts.push_back(new Post);
    posts.push_back(new Post);
    posts.push_back(new Post);


    cout << "<html>\n  <head>\n    <style>\n      body{font-family: verdana}\n    </style>\n  </head>\n<body>\n  <h1>Hello ";
    cout <<  user->name ;
    cout << "</h1>\n\n  ";

    list<Post *>::const_iterator iterator; 
  
    cout << "\n  <ul>\n  ";

    for (iterator = posts.begin(); iterator != posts.end(); ++iterator){ 
        cout << "\n    ";

        Post *post = *iterator; 
    
        cout << "\n    <li>";
        cout <<  post->title.substr(0,10) + "..." ;
        cout << "</li>\n  ";
    } 

    cout << "\n  </ul>\n  \n  <p>\n    Page created at ";
    cout <<  now() ;
    cout << ".\n  </p>\n</body>\n</html>";

    return 1;
}
