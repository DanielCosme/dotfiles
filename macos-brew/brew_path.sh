#!/bin/bash

echo >> /Users/daniel/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv zsh)"' >> /Users/daniel/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv zsh)"
