#!/bin/sh

word_pool=('ad' 'adipiscing' 'aliqua' 'aliquip' 'amet' 'anim' 'aute' 'cillum' 'commodo'
         'consectetur' 'consequat' 'culpa' 'cupidatat' 'deserunt' 'do' 'dolor' 'dolore'
         'duis' 'ea' 'eiusmod' 'elit' 'enim' 'esse' 'est' 'et' 'eu' 'ex' 'excepteur'
         'exercitation' 'fugiat' 'id' 'in' 'incididunt' 'ipsum' 'irure' 'labore' 'laboris'
         'laborum' 'lorem' 'magna' 'minim' 'mollit' 'nisi' 'non' 'nostrud' 'nulla'
         'occaecat' 'officia' 'pariatur' 'proident' 'qui' 'quis' 'reprehenderit' 'sed'
         'sint' 'sit' 'sunt' 'tempor' 'ullamco' 'ut' 'velit' 'veniam' 'voluptate')
         
# Generate a series of characters
#
# @param  int $count  Number of characters to generate
# @return string
generate_characters() {
  local count word words characters

  count=$1

  while [ ${#characters} -lt $count ]
  do
    word=$(generate_words 1)
    words+=($word)
    characters=${words[@]}
  done

  echo ${characters:0:$count}
}

# Generate a series of words
#
# @param  int $count  Number of words to generate
# @return string
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

# Generate a series of sentences
#
# @param  int $count  Number of sentences to generate
# @param  int $min    Minimum number of words per sentence
# @param  int $max    Maximum number of words per sentence
# @return string
generate_sentences() {
  local i count min max len placement sentence sentences

  count=$1
  min=$2
  max=$3

  for ((i=0; i<$count; i++))
  do
    len=$(( RANDOM % (${max} - ${min} + 1 ) + ${min} ))
    sentence=$(generate_words $len)
    sentence=$(capitalize "$sentence")

    # Randomly distribute commas throughout the sentences
    if [ $(( RANDOM % 2)) = 1 ]; then
      placement=$(( RANDOM % ($len - 1) + 1 ))
      sentence=$(sed 's/ /, /'$placement <<<$sentence)
    fi

    sentences+=($sentence.)
  done

  echo ${sentences[@]}
}

# Generate a series of paragraphs
#
# @param  int $count          Number of paragraphs to generate
# @param  int $min            Minimum number of sentences per paragraph
# @param  int $max            Maximum number of sentences per paragraph
# @param  int $sentence_min   Minimum number of words per sentence
# @param  int $sentence_max   Maximum number of words per sentence
# @return string
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

    # Add linebreak
    if [ ! $i = $(( $count - 1 )) ]; then
      echo ""
    fi
  done
}

# Capitalize the first letter in a string
#
# @param  string $string  String to capitalize
# @return string
capitalize() {
  local string

  string=$1

  echo $(tr '[:lower:]' '[:upper:]' <<< ${string:0:1})${string:1}
}

capitalize "$(generate_characters 10)"