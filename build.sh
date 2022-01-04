#!/bin/sh

set -ev

# Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"
# Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::pdf_book')"
Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::html_document2')"
# Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::epub_book')"

sleep 3

git commit -am "New version of adam compiled"

git push

git add * || true

git commit -am "New version of adam compiled" || true

git push
