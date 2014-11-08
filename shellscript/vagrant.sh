#!/bin/bash

echo 'After script'
echo 'Installing gems...'
 
echo "Checking user and some gems version..."
echo $USER
ruby -v
bundle -v
rails -v
gem list

cd /vagrant && bundle install

echo "Ran script successfully"