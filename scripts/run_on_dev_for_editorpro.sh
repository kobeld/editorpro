export GOPATH=/home/ubuntu/gopkg
export GOROOT=/usr/local/go
APPROOT="$GOPATH/src/github.com/kobeld/editorpro/"

echo "======= updating pandoc code ========"
cd $GOPATH/src/github.com/kobeld/gopandoc
git checkout master && git pull origin master
if [[ $? != 0 ]] ; then exit 1; fi

echo "======= updating editorpro code ========"
cd $APPROOT
git checkout master && git pull origin master
if [[ $? != 0 ]] ; then exit 1; fi

echo "======= installing editorpro ======="
cd $APPROOT
$GOROOT/bin/go install .
if [[ $? != 0 ]] ; then exit 1; fi

echo "======= killing editorpro ======="
sudo killall editorpro;
echo $?

echo "======= restarting editorpro ======="
cd $APPROOT
sudo nohup $GOPATH/bin/editorpro >> ~/editorpro.log 2>&1 &
