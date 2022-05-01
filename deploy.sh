#!/bin/bash
value=$(<version.properties)
lastPosition="$(cut -d'.' -f3 <<< $value)"

newVersion="$(cut -d'.' -f1 <<< $value).$(cut -d'.' -f2 <<< $value).$(($lastPosition + 1))"

echo "new version"
echo $newVersion

echo "old version"
echo $value

sed -i 's/'$value'/'$newVersion'/' version.properties

sudo jekyll build

docker build -t inline-blog:$newVersion .
docker tag inline-blog:$newVersion registry.inlinesoft.com.br/inlinesoft/inline-blog:$newVersion
docker push registry.inlinesoft.com.br/inlinesoft/inline-blog:$newVersion
