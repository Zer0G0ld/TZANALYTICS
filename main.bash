#!/usr/bin/env bash

echo "Choice:

d = Delete row

e = Edit row

+l = add a new blank line

+lt = adds a new line with text

"

echo -n ">> "

read option

function delete_rows() {

  rows=$1

  file=$2

  sed -i "${rows}d" $file

}

function edit_row() {

  rows=$1

  content=$2

  file=$3

  sed -i "${rows} s/^.*$/${content}/" $file

}

function new_line() {

  file=$1

  echo "" >> $file

}

function new_line_with_sed() {

  content=$1

  file=$2

  sed -i "$ a ${content}" $file

}

case "$opcao" in

  d)

    echo -n "Enter the line you want to delete: "

    read row_number

    echo -n "Enter the name of the file you want to change: "

    read file_name

    delete_rows $row_number $file_name

    echo -n "Done! See how it turned out: "

    bat $file_name

    ;;

  e)

    echo -n "Enter the line you want to edit: "

    read row_number

    echo -n "Enter the new content: "

    read new_content

    echo -n "Enter the file name: "

    read file_name

    edit_row $row_number "new_content" $file_name

    echo -n "Done! See how it turned out: "

    bat $file_name

    ;;

  +l)

    echo -n " Enter the file name: "

    read file_name

    new_line $file_name

    echo -n "Done! See how it turned out: "

    bat $file_name

    ;;

  +lt)

    echo -n "Enter new line text: "

    read new_content

    echo -n "Enter the file name: "

    read file_name

    new_line_with_sed "$new_content" $file_name

    echo -n "Done! See you how it turned out: "

    bat $file_name

    ;;

  *)

    echo -n "I didn't give you that option!"

    ;;

esac
