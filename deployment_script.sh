#!/bin/bash

mysql -u root -e 'drop database swimschool'
mysql -u root -e 'create database swimschool'
mysql -u root contovoris < api/sql/swimschool.sql

php -S localhost:8888

#react
#cd reactapp
#npm install
#npm run build
#mv dist ..

