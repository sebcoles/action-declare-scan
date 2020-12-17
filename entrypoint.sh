#!/bin/bash
/declare/Veracode.OSS.Declare scan -f $1 -i $2 2>&1 | tee declare.log
if grep -q FATAL declare.log; then
  exit 1
fi