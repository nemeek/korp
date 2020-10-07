#!/bin/bash
# ${string,,} toLower
# ${string^^} toUpper
# ${string,,[AEIUO]}
# ${string^^[aeiou]}
corpus_data="/var/snap/docker/common/var-lib-docker/volumes/korp_corpora/_data/corpora"
registry="/var/snap/docker/common/var-lib-docker/volumes/korp_corpora/_data/registry"
input_data="/var/snap/docker/common/var-lib-docker/volumes/korp_corpora/_data/WolfartAhenakew"
date=$3 # "YYYY-MM-DD"
descriptive_name=$2 # "Descriptive Name"
lang_code="crk"
l_corpus_name=$1 # Short name of vrt corpus file
u_corpus_name=${l_corpus_name^^}
mkdir -vp $corpus_data/$l_corpus_name
sent_nr=$(cat $input_data/$l_corpus_name.vrt|grep '<sentence'|wc -l)
cat > $corpus_data/$l_corpus_name/.info << EOF
Sentences: $sent_nr
Updated: $date 
EOF
echo " ....... created $corpus_data/$l_corpus_name/.info"
/usr/local/bin/cwb-encode -s -p - -d $corpus_data/$l_corpus_name -R $registry/$l_corpus_name -c utf8 -f $input_data/$l_corpus_name.vrt -P word -P lemma -P msd -P dep -P gloss -S sentence:0+id -S paragraph -S text:0+id+lang+title+author -S corpus:0+id
echo " ....... $l_corpus_name converted into the CWB binary format"
/usr/local/bin/cwb-makeall -r $registry -D $u_corpus_name
echo " ....... created lexicon and index for p-attributes for $l_corpus_name"
/usr/local/bin/cwb-huffcode -r $registry -A $u_corpus_name
echo " ....... compressed the token sequence of positional attributes for $l_corpus_name"
rm -fv $corpus_data/$l_corpus_name/*.corpus
/usr/local/bin/cwb-compress-rdx -r $registry -A $u_corpus_name
echo " ....... compressed the index of positional attributes for $l_corpus_name"
rm -fv $corpus_data/$l_corpus_name/*.rev
rm -fv $corpus_data/$l_corpus_name/*.rdx
if [ -f $registry/$l_corpus_name ];
then
   echo "File $registry/$l_corpus_name exists"
   name_placeholder='NAME ""' # Sets placeholder - don't edit
   name_string='NAME "'$descriptive_name'"'
   lang_placeholder='language = "??"' # Sets placeholder - don't edit
   lang_string='language = "'$lang_code'"'
   sed -i "s/${name_placeholder}/${name_string}/; s/${lang_placeholder}/${lang_string}/;" $registry/$l_corpus_name
else
   echo "File $registry/$l_corpus_name does not exists"
fi
