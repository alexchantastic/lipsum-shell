#!/bin/sh

word_pool=('ad' 'adipiscing' 'aliqua' 'aliquip' 'amet' 'anim' 'aute' 'cillum' 'commodo'
         'consectetur' 'consequat' 'culpa' 'cupidatat' 'deserunt' 'do' 'dolor' 'dolore'
         'duis' 'ea' 'eiusmod' 'elit' 'enim' 'esse' 'est' 'et' 'eu' 'ex' 'excepteur'
         'exercitation' 'fugiat' 'id' 'in' 'incididunt' 'ipsum' 'irure' 'labore' 'laboris'
         'laborum' 'lorem' 'magna' 'minim' 'mollit' 'nisi' 'non' 'nostrud' 'nulla'
         'occaecat' 'officia' 'pariatur' 'proident' 'qui' 'quis' 'reprehenderit' 'sed'
         'sint' 'sit' 'sunt' 'tempor' 'ullamco' 'ut' 'velit' 'veniam' 'voluptate')

generate_characters() {
  local word words characters

  while [ ${#characters} -lt $1 ]
  do
    word=$(generate_words 1)
    words+=($word)
    characters=${words[@]}
  done

  echo ${characters:0:$1}
}

generate_words() {
  local i size rand word words

  size=${#word_pool[*]}

  for ((i=0; i<$1; i++))
  do
    rand=$(( RANDOM % $size ))
    word=${word_pool[$rand]}
    words+=($word)
  done

  echo ${words[@]}
}

generate_characters 10
