#!/bin/bash
#./node_modules/.bin/grunt &
supervisor -x ./bin/node -e 'node|js|tpl' bootStrap.js 2>>log/node-error.log | tee log/node.log 


