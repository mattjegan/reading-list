#!/bin/bash
pattern="^- \[.*\] \[(.*)\].*$"
match=()
duplicate=()

# search for duplicate [Author - Book]
while IFS='' read -r line || [[ -n "$line" ]]; do

  if [[ $line =~ $pattern ]] ;
  then

    # add to duplicate array if it was found
    for j in "${match[@]}"; do
      if [[ $j = "${BASH_REMATCH[1]}" ]] ;
      then
        duplicate+=("$j")
      fi
    done

    match+=("${BASH_REMATCH[1]}")
  fi

done < "$1"

# print duplicates
for ((i = 0; i < ${#duplicate[@]}; i++))
do
    echo "${duplicate[$i]}"
done
