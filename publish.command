#!/bin/bash
# Script to convert all Word documents found under '_posts' into markdown and push to github
basedir=$(dirname "$0")
cd "${basedir}" || exit

echo "converting documents to markdown"
echo "---------------------------------------"

documentExt=".docx"
for fileName in _posts/[0-9]*"${documentExt}"
do
  if [[ -f $fileName ]]; then
    newFileName=${fileName%"${documentExt}"}.markdown
    pandoc --wrap=preserve --from docx --filter front-matter-filter.py --to gfm "${fileName}" --output "${newFileName}"
    echo "converted '${fileName}' to '${newFileName}'"
  fi
done

echo "---------------------------------------"
echo "publishing markdown documents to github"
git add _posts/*.markdown
user=$(git config user.name)
git commit -m "Blog post update by '${user}'"
git push

cd -- || exit

exit 0