for i in $(find . -name ".??*" | grep -ve "git\|mac\|osx"); do echo $i; diff $i ~/$i; done
