# builds images
for dir in ./apps/*/
do
    (cd $dir && ./bin/inc.sh)
done

git add .
git commit

# git push origin master
