#!/usr/bin/ruby

fn = ARGV[0] || exit

input = IO.readlines(fn).join

tokens = input.scan(/(.+?)(<%.+?%>)/m).flatten

# puts tokens.inspect

# Grab the last token
if tokens.any?
  tokens << input.sub(/.+%>/m,'')
end

header =<<EOF
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

EOF

footer =<<EOF
  return 1;
}
EOF

puts header

stream = "cout"

puts(tokens.flatten.map do |token|
  if token.match /^<%=/
    "\n#{stream} << " + token.sub(/^<%=/,'').sub(/%>$/,'') + ";"
  elsif token.match /^<%/
    "\n" + token.sub(/^<%\s?/,'').sub(/%>$/,'')
  else
    "\n#{stream} << \"" + token.gsub(/\n/,"\\n") + "\";"
  end
end.join(""))

puts footer