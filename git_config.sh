#!/bin/bash

HelloScreen() {
    echo '==========================================================='
    echo ':: Add Git config...'
    echo '==========================================================='
}

GitConfig() {
    git config --global user.name "Drauwood"
    git config --global user.email "drauwood@gmail.com"
}

HelloScreen
GitConfig
