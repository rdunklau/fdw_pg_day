presentation.html: presentation.rst makefile
	./rst2s5 -l fr --stylesheet=/dev/null --theme-url=./theme/ --current-slide --visible-controls presentation.rst > presentation.html
