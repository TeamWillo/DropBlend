#!/bin/sh


echo "something" > ~/Dropbox/example1.txt
mv ~/Dropbox/example1.txt ~/Dropbox/example2.txt
echo "okay" >> ~/Dropbox/example2.txt
cp ~/Dropbox/example2.txt ~/Dropbox/example3.txt
rm ~/Dropbox/example2.txt
