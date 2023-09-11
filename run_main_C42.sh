#!/bin/sh

# Author: Charly Alizadeh

bold='\e[1m'
italic='\e[3m'
normal='\e[0m'
RED='\033[0;31m'
NC='\033[0m'
ftfile=""
flags=""

for i in */ ; do
	echo "${bold}$i${normal}"
	ftfile="${i}ft*.c"

	# Getting flags
	flags=$(grep "FLAGS=" $ftfile | cut -d'=' -f2)
	echo "   - ${bold}Flags:${normal} $flags"

	# Uncommenting the main
	if grep -wq "MAIN START" $ftfile && grep -q "MAIN END" $ftfile; then
		echo "   - ${bold}Removing comment around the main ${normal}"
		sed -i '/MAIN START/d' $ftfile
		sed -i '/MAIN END/d' $ftfile
		touch ${i}.main_decommented
	elif [ -f ${i}.main_decommented ]; then
		echo "   - ${bold}Main already decommented${normal}"
	else
		echo "   - ${bold}${RED}ERROR:${NC} Couldn't find \"MAIN START\" and/or \"MAIN END\" in ${ftfile}. Are you sure you add it to you file ?'${normal}"
		echo "\n\n"
		continue
	fi

	# Compiling
	cfiles=$i*.c
	echo "   - ${bold}Running:${normal}: cc -Wall -Wextra -Werror $flags ${i}output ${cfiles}"
	cc -Wall -Wextra -Werror $flags -o "${i}output" $cfiles | sed 's/^/        /'

	# Executing
	echo "   - ${bold}Running:${normal} ${i}output"
	"${i}output" | sed 's/^/        /'
	echo "\n\n"
done
