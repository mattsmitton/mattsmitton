if [ -z "$(git status --porcelain)" ]; then
  yarn build && \
  git checkout gh-pages && \
  git rm -rf . && \
  mv dist/* ./ && \
  git checkout master -- .gitignore && \
  echo 'smitton.io' >> CNAME && \
  git add . && \
  git commit -am 'rev' && \
  git push origin gh-pages  && \
  git checkout master
else
  echo "You have uncommited changes. Skipping deploy!"
fi
