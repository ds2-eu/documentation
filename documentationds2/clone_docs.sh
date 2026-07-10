#!/bin/bash

echo "cloning documentation: "
cat docs.yaml

#mkdir docs
rm -rf docs/modules
cat docs.yaml | while read line; do
modulename=$(echo $line | awk '{print $1}')
REPO=$(echo $line | awk '{print $2}')
REPOURL=github.com/ds2-eu/$REPO
git clone https://"$USER":"$PASS"@"$REPOURL"
mkdir -p docs/modules/images
mkdir -p docs/guides
cp $REPO/docs/README.md docs/modules/$modulename.md
if [ $modulename == "IDT" ]; then
	cp $REPO/docs/ds2connector.md docs/guides
fi
cp  $REPO/docs/images/* docs/modules/images/
rm -rf $REPO
done

# build site
sudo docker run --rm -it -v ${PWD}:/docs squidfunk/mkdocs-material build

# push site
git clone https://"$USER":"$PASS"@github.com/ds2-eu/documentation
sudo rm -rf documentation/docs
sudo mkdir documentation/docs
sudo cp -r site/* documentation/docs/
cd documentation 
git config user.name "Noel Tomas"
git config user.email "noel.tomas@informationcatalyst.com"
git add .
git commit -m "Updated Documentation"
git push

