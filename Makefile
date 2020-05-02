NOTES=$(wildcard 2*.md)
HTML=$(patsubst %.md, %.html, $(NOTES))
SPSOURCES=$(wildcard *.md)
SPHTML=$(patsubst %.md, %.html, $(SPSOURCES))
PANDOC=pandoc --standalone -A inc.after -B inc.before --template=template.htm --css=style.css --quiet
all: $(HTML) index.html

index.md: $(NOTES) bari
	python3 bari

index.html: index.md Makefile template.htm inc.after inc.before $(NOTES)
	$(PANDOC) $< -o $@

# if you want author add: --metadata author=Yourname
%.html: %.md Makefile template.htm inc.after inc.before
	python3 bari process $< | $(PANDOC) -f markdown \
	--metadata title="$(shell head -n 1 $<)" \
	--metadata date="$(shell echo $< | head -c 10)" \
	-o $@

.PHONY:
clean:
	rm -f index.md
	rm -f $(HTML)
