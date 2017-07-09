echo "haha"

REPOSITORY_PATH=/Users/wchb/.m2/repository
echo 正在搜索...
find $REPOSITORY_PATH -name "*lastUpdated*" | xargs rm -frv
echo 搜索完,删除完!
