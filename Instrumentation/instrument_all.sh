#!/bin/bash

FILES=$( find ./target/classes/org/elasticsearch -name *.class )

for f in $FILES;
do

echo $f

# Make a copy of the .class file, instrument from the copy to the original, then delete the backup
cp $f $f.bak
java -cp ./Instrumentation:./Instrumentation/asm-all-5.0.3.jar Instrumenter $f.bak $f
rm $f.bak

done

exit 0