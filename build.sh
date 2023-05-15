#!/bin/bash
cd "$(dirname "$0")"
docker build -t nrun:latest .
cd - > /dev/null


