CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

if [[ -f student-submission/ListExamples.java ]]
then
    cp -r student-submission/ListExamples.java grading-area
    cp -r lib grading-area
    cp -r TestListExamples.java grading-area
else 
    echo "File not found!"
    exit 1
fi

cd grading-area
javac -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" *.java
java -cp ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples > results.txt
grep 'Tests run:' results.txt > score.txt
temp=$(cat "score.txt")
num=${temp:11:1}
if [[ temp.length == 0 ]]
then 
    echo "Full Score!"
else
    echo $((1-num))"/1"
fi
# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
