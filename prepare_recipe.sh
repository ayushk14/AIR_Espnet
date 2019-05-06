#!/bin/bash

#GIVE ALL SHELL SCRIPTS EXECUTABLE PERMISSION IN STARTING

export USER=$(whoami)

recipe_name="AIR_Espnet"

cp -a ~/espnet/egs/timit ~/espnet/egs/$recipe_name

rm ~/espnet/egs/$recipe_name/asr1/run.sh
cp -a Recipe_Files/run.sh ~/espnet/egs/$recipe_name/asr1/run.sh

rm ~/espnet/egs/$recipe_name/s5/local/timit_format_data.sh
cp -a Recipe_Files/timit_format_data.sh ~/espnet/egs/$recipe_name/s5/local/timit_format_data.sh

rm ~/espnet/egs/$recipe_name/asr1/steps/make_mfcc.sh
cp -a Recipe_Files/make_mfcc.sh ~/espnet/egs/$recipe_name/asr1/steps/make_mfcc.sh

cp -a Recipe_Files/local_custom ~/espnet/egs/$recipe_name/asr1/local_custom
cp -a Recipe_Files/Python_Files ~/espnet/egs/$recipe_name/asr1/Python_Files
cp -a Recipe_Files/steps_fa ~/espnet/egs/$recipe_name/asr1/steps_fa
cp -a Recipe_Files/utils_custom ~/espnet/egs/$recipe_name/asr1/utils_custom

data_dir=~/espnet/egs/$recipe_name/asr1/data/local/data
dict_dr=~/espnet/egs/$recipe_name/asr1/data/local/dict

mkdir -p $data_dir $dict_dir

cp -a Recipe_Files/uttids/train.uttids ~/espnet/egs/$recipe_name/asr1/data/local/data/train.uttids
cp -a Recipe_Files/uttids/test.uttids ~/espnet/egs/$recipe_name/asr1/data/local/data/test.uttids
cp -a Recipe_Files/uttids/dev.uttids ~/espnet/egs/$recipe_name/asr1/data/local/data/dev.uttids

echo "Receipe is updated with required files"
