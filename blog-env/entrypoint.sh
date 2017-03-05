#!/bin/bash

if [ -d hexo-blog ]; then
    cd hexo-blog
    npm install
fi

exec bash
