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
  local i count rand word words

  count=$1

  for ((i=0; i<$count; i++))
  do
    rand=$(( RANDOM % ${#word_pool[*]} ))
    word=${word_pool[$rand]}
    words+=($word)
  done

  echo ${words[@]}
}

generate_sentences() {
  local i count min max len placement sentence sentences

  count=$1
  min=$2
  max=$3

  for ((i=0; i<$count; i++))
  do
    len=$(( RANDOM % (${max} - ${min} + 1 ) + ${min} ))
    sentence=$(generate_words $len)

    if [ $(( RANDOM % 2)) = 1 ]; then
      placement=$(( RANDOM % ($len - 1) + 1 ))
      sentence=$(sed 's/ /, /'$placement <<<$sentence)
    fi

    sentences+=($sentence.)
  done

  echo ${sentences[@]}
}

generate_paragraphs() {
  local i count min max len sentence_min sentence_max paragraph

  count=$1
  min=$2
  max=$3
  sentence_min=$4
  sentence_max=$5

  for ((i=0; i<$count; i++))
  do
    len=$(( RANDOM % (${max} - ${min} + 1 ) + ${min} ))
    paragraph=$(generate_sentences $len $sentence_min $sentence_max)
    echo $paragraph

    if [ ! $i = $(( $count - 1 )) ]; then
      echo ""
    fi
  done
}

generate_paragraphs 5 6 10 4 8
