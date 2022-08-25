#!/usr/bin/env zsh

if [[ "$(uname -s)" != "Darwin" ]]; then
  exit 0
fi

duti -s com.microsoft.VSCode public.plain-text all

duti -s com.microsoft.VSCode .css all
duti -s com.microsoft.VSCode .js all
duti -s com.microsoft.VSCode .json all
duti -s com.microsoft.VSCode .jsx all
duti -s com.microsoft.VSCode .md all
duti -s com.microsoft.VSCode .py all
duti -s com.microsoft.VSCode .rb all
duti -s com.microsoft.VSCode .sh all
duti -s com.microsoft.VSCode .ts all
duti -s com.microsoft.VSCode .tsx all
duti -s com.microsoft.VSCode .yaml all
duti -s com.microsoft.VSCode .yml all
duti -s com.microsoft.VSCode .zsh all
