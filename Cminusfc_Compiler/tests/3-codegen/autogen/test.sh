#!/bin/bash
project_dir=$(realpath ../../../)
realpath $project_dir/src/io

usage() {
	cat <<JIANMU
Usage: $0 [path-to-testcases] [type]
path-to-testcases: './testcases' or '../../testcases_general' or 'self made cases'
type: 'debug' or 'test', debug will output .ll file
JIANMU
	exit 0
}