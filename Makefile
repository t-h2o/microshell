site/index.html: diagram
	mkdir -p site/assets
	cp assets/*.svg site/assets/
	asciidoctor README.adoc -o site/index.html

diagram:
	asciidoctor -r asciidoctor-diagram assets/README.adoc -o assets/index.html
