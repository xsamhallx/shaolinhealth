#!/bin/bash
# Script to convert all Word documents found under '_posts' into markdown and push to github
basedir=$(dirname "$0")
cd "${basedir}" || exit

echo "converting documents to markdown"
documentExt=".docx"
for fileName in _posts/*"${documentExt}"
do
  if [[ -f $fileName ]]; then
    newFileName=${fileName%"${documentExt}"}.markdown
    pandoc --from docx --to gfm-bracketed_spans-raw_html-native_spans "${fileName}" --output "${newFileName}"
  fi
done

echo "publishing markdown documents to github"
git add _posts/*.markdown
user=$(git config user.name)
git commit -m "Blog post update by '${user}'"
git push

cd -- || exit

exit 0