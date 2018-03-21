#!/bin/bash
mkdir -p output

echo "Generate slides"
docker run --rm -v $(pwd):/documents/ --name asciidoc-to-deckjs binout/docker-asciidoctor-deckjs asciidoctor -T /asciidoctor-backends/haml/deckjs -D /documents/output slides.adoc

echo "Copy resources"
sed 's/"\/\/cdnjs/"https:\/\/cdnjs/'  output/slides.html > output/index.html ; cp -R images output

if [ ! -d "deck.js" ]; then
  echo "Retrieve deck.js"
  mkdir -p output/deck.js ; curl -LkSs https://github.com/imakewebthings/deck.js/archive/1.1.0.tar.gz | tar xfz - -C output/deck.js --strip-components=1
fi
