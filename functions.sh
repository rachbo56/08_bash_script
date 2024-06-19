#ok
function print_good () {
    echo -e "\x1B[01;32m[  OK  ]\x1B[0m $1"
}


#fail
function print_error () {
    echo -e "\x1B[01;31m[ FAIL ]\x1B[0m $1"
}

#info
function print_info () {
    echo -e "\x1B[01;34m[ INFO ]\x1B[0m $1"
}

