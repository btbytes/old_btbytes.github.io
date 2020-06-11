<div class="post"><div class="post-title"><span id="25">°25 // <a href="2020-06-10-1-csv2html.nim.html">CSV2HTML in Nim
</a></span> <span class="post-date"><date>2020-06-10</date></span></div>

I implemented the [csv2html](https://btbytes.github.io/2020-06-05-2-csv2html.html) idea in [nim](https://nim-lang.org) -- [github repo](https://github.com/btbytes/csv2html.nim). Nim is a strongly typed, compiles-to-c/c++/js-to-metal language that has advanced programming features, yet looks very friendly (Python-ish syntax).

Here is the core of the `csv2html` program in `nim`:

```nim
import parsecsv
import argparse
import os
import system


include "row.nimf"
include "table.nimf"
include "html.nimf"

proc csv2html(csvfile: string, delimiter: string, quotechar: string, caption: string, title: string, header: bool, cssurl: string) = 
  var p: CsvParser
  var headerRow = ""
  p.open(csvfile)
  if header:
    p.readHeaderRow()
    headerRow = renderRow(p.headers, rowtype="th")
  var rows = newSeq[string](2)
  while p.readRow():
    rows.add(renderRow(p.row))
  p.close()
  echo renderHtml(renderTable(caption, headerRow, rows), title, cssurl)
  
  
  
when isMainModule:
  var p = newParser("CSV2HTML"):
    arg("csvfile")
    option("-d", "--delimiter", help="Field Delimiter. Default is ,.", default=",")
    option("-q", "--quotechar", help="Quote Character. Default is nothing")
    option("-t", "--title", help="Page Title. Will be printed in h1 tag")
    option("-c", "--caption", help="Table Caption")
    option("-s", "--css", help="Override CSS URL")
    flag("-f", "--header", help="Data has Header. First row will be rendered as `th`")
  if paramCount() < 1:
    echo p.help()
    quit(0)
  var args = p.parse()
  csv2html(args.csvfile, args.delimiter, args.quotechar, args.caption, ar
```

This looks very familiar to a Python programmer. 

It is said that the language you write programs in, influences how you think. While nim is very close to Python syntax wise there are some standard library features of nim, that made me implement a feature differently. 

In python, I wanted to keep to using just the standard library, and not pull in a templating language (I like Jinja2), to render the data into an HTML file. So, I ended up mixing the HTML template into the code. Which is fine for a small program like this. 

In nim, the [Source Code Filters](https://nim-lang.org/docs/filters.html)  library allows you to easily template things without having to reach for a "proper" templating language. 

You might have wondered about lines starting with `include` above. I'm "including" the source code filter templates. For example, this is the code that renderes the csv data into an html table:

```
#? stdtmpl(subChar='$', metaChar='#')
#proc renderTable*(caption: string, headerRow: string, rows: seq[string]) : string = 
#  result = ""
<table>
  #if caption != "":
    <caption>${caption}</caption>
  #end if
  ${headerRow}
  #for row in items(rows):
    $row
  #end for
</table>
#end proc
```


Its clear looking at the template, what's happening. At the top, we are defining `subChar=$`, which means the strings with `$` prefix will be replaced with the actual value. `metaChar=#` stands for the character that means something to the nim compiler. Essentially the lines starting with `#` will be treated as nim code.


The files `included`d will be compiled at compile time into corresponding nim code. This allows us to write templating code without having to worry about escaping etc.

The project is defined as a nim project using the [nimble](https://github.com/nim-lang/nimble) package manager definition file:

```
# csv2html package
version = "0.1.0"
author = "Pradeep Gowda"
description = "render csv files as html files"
license = "BSD3"

# deps
requires "nim >= 1.0.0", "argparse >= 0.10.0"

srcDir = "src"
bin = @["csv2html"]

```

You can see that I'm defining the `argparse` third party dependency in the nimble file. Argparse is very much influenced by Python's stdlib - `argparse`.

The project can be compiled into a binary file with: `nimble build` which will produce  `csv2html` binary.


The idea of using source code filters came to me via [this Nim forum thread](https://forum.nim-lang.org/t/6403) -- "AWK-style processing with Nim" mentioned by [@deech](https://twitter.com/deech/status/1268690739413819392?s=20)


<a href="index.html#python" class="tag python">python                        </a>  <a href="index.html#nim" class="tag nim">nim                        </a> 
</div>
<div class="post"><div class="post-title"><span id="24">°24 // <a href="2020-06-05-2-csv2html.html">csv2html
</a></span> <span class="post-date"><date>2020-06-05</date></span></div>

Today, I had to create a paste a table of values into a JIRA ticket and I had a csv file. There are different ways to "paste" a nicely formatted table into a JIRA WYSIWYG text area, I'm sure.. but none of them fast enough to type: `$csv2html source.csv destation.html`. So, I wrote one.

You can find it here [https://github.com/btbytes.csv2html](https://github.com/btbytes.csv2html). The help is self explanatory: 

```bash
$./csv2html.py -h
usage: csv2html.py [-h] [--delimiter DELIMITER] [--quotechar QUOTECHAR]
                   [--title TITLE] [--caption CAPTION] [--header]
                   csvfile

CSV to HTML converter.

positional arguments:
  csvfile

optional arguments:
  -h, --help            show this help message and exit
  --delimiter DELIMITER
                        Field delimiter. Default is , .
  --quotechar QUOTECHAR
                        Quote Character. Deault is nothing
  --title TITLE         Page title. Will be printed in h1 tag.
  --caption CAPTION     Table caption.
  --header              data has header. First row will be "th".
```

Ideally, I'd have liked to use the [pandoc-csv2table](https://github.com/baig/pandoc-csv2table) pandoc filter. But, installing this filter using `cabal` and `stack` turned out to be disappointing. So instead of figuring out how to compile and install these Haskell packages, I wrote this script. 

I can still do some improvements to this script, like:

a. adding an `-o --output` flag to write the output to a file instead of stdout. 
b. override the css


But, that's for another day.

<a href="index.html#python" class="tag python">python                        </a> 
</div>
<div class="post"><div class="post-title"><span id="23">°23 // <a href="2020-06-05-1-jsonfmt.html">jsonfmt
</a></span> <span class="post-date"><date>2020-06-05</date></span></div>

Sometimes you would like to format a JSON file, and you wish a command called `jsonfmt` like `gofmt` would be handy. If you have Python3 installed on your system, you already have such a tool installed, its just called with a different name.

Let's say you have this file - `two.json` [1].

```json
{"glossary":{"title":"example glossary","GlossDiv":{"GlossList":{"GlossEntry":{"GlossDef":{"GlossSeeAlso":["GML","XML"],"para":"A meta-markup language, used to create markup languages such as DocBook."},"Abbrev":"ISO 8879:1986","GlossSee":"markup","SortAs":"SGML","GlossTerm":"Standard Generalized Markup Language","Acronym":"SGML","ID":"SGML"}},"title":"S"}}}
```

Not very readable, is it? You can "pretty-print" it like this:


```json
$ python3 -m json.tool two.json
{
    "glossary": {
        "title": "example glossary",
        "GlossDiv": {
            "GlossList": {
                "GlossEntry": {
                    "GlossDef": {
                        "GlossSeeAlso": [
                            "GML",
                            "XML"
                        ],
                        "para": "A meta-markup language, used to create markup languages such as DocBook."
                    },
                    "Abbrev": "ISO 8879:1986",
                    "GlossSee": "markup",
                    "SortAs": "SGML",
                    "GlossTerm": "Standard Generalized Markup Language",
                    "Acronym": "SGML",
                    "ID": "SGML"
                }
            },
            "title": "S"
        }
    }
}
```


You can output the formatted JSON to a file like this:

```
$ python3 -m json.tool two.json three.json
```

Further, you can sort the keys with the `--sort-keys option`

```
$ python3 -m json.tool two.json --sort-keys

{
    "glossary": {
        "GlossDiv": {
            "GlossList": {
                "GlossEntry": {
                    "Abbrev": "ISO 8879:1986",
                    "Acronym": "SGML",
                    "GlossDef": {
                        "GlossSeeAlso": [
                            "GML",
                            "XML"
                        ],
                        "para": "A meta-markup language, used to create markup languages such as DocBook."
                    },
                    "GlossSee": "markup",
                    "GlossTerm": "Standard Generalized Markup Language",
                    "ID": "SGML",
                    "SortAs": "SGML"
                }
            },
            "title": "S"
        },
        "title": "example glossary"
    }
}
```

CAUTION: The one downside to this tool is, you can't do an "in-place" formatting. That is, if you try -- `$ python3 -m json.tool two.json two.json`, it will overwrite the original file. 

If you want further explore `json` related tools, look at my [json](https://www.btbytes.com/json.html) and [jq](https://www.btbytes.com/jq.html) pages.

[1]: https://json.org/example.html

<a href="index.html#python" class="tag python">python                        </a>  <a href="index.html#json" class="tag json">json                        </a> 
</div>
<div class="post"><div class="post-title"><span id="22">°22 // <a href="2020-05-22-1-thread-reaper.html">Thread Reaper
</a></span> <span class="post-date"><date>2020-05-22</date></span></div>

A simple utitlity to convert [Thread Reader](https://threadreaderapp.com/) pages into simpler HTML pages. You can find the code on [github/btbytes/theadreaper](https://github.com/btbytes/threadreaper)

Usage:

	./threadreaper URL ["TITLE"] > local_page.html
	./threadreaper https://threadreaderapp.com/thread/1202293011150852096.html "On Binbary Numbers" > foone_binary.html

This program also fixes an issue with embedded images that you would have if you were to simply download the Thread Reader HTML to disk.

<a href="index.html#golang" class="tag golang">golang                        </a> 
</div>
<div class="post"><div class="post-title"><span id="21">°21 // <a href="2020-05-20-1-threadreaderapp-bookmark.html">Thread reader app browser bookmark
</a></span> <span class="post-date"><date>2020-05-20</date></span></div>

[Thread reader](https://threadreaderapp.com/) is a website that allows you to read twitter threads as a single page, example -- [this thread on Acropolis of Athens](https://threadreaderapp.com/thread/1262700517714788354.html).

When I want to search for a twitter thread on their website or crete a new page of a twitter thread, I have to copy the top tweet of the thread, head over to <https://threadreaderapp.com/> and paste the URL in the search box.

This is something that should be automated, so I created a bookmark that you can drag to the bookmarks toolbar. When you see a twitter thread, hit the bookmark, to be taken to the thread's page on Thread reader.

Drag this bookmark to your browser's bookmark toolbar &raquo; <em><a href="javascript:q=location.href;void(t=open('https://threadreaderapp.com/search?q='+encodeURIComponent(q)));">Thread Reader</a></em>


<a href="index.html#javascript" class="tag javascript">javascript                        </a> 
</div>

## Archive
(Reverse chronologic)<dl id="archive-links"><dt class="archive-year" id="y2020">2020</dt>
<dd class="archive-item"><p><span id="20">°20. <a href="2020-05-19-1-shell-safe-api-key-password-generator.html">Shell Safe API key / Password Generator
</a></span>                        <date>2020-05-19</date></p></dd><dd class="archive-item"><p><span id="19">°19. <a href="2020-05-17-2-the-rabbits.html">Sustainable tech by The Rabbits
</a></span>                        <date>2020-05-17</date></p></dd><dd class="archive-item"><p><span id="18">°18. <a href="2020-05-17-1-python-lineprocessing.html">Python Line Processing Pattern
</a></span>                        <date>2020-05-17</date></p></dd><dd class="archive-item"><p><span id="17">°17. <a href="2020-05-15-2.html">Some Interesting Links
</a></span>                        <date>2020-05-15</date></p></dd><dd class="archive-item"><p><span id="16">°16. <a href="2020-05-15-1.html">About Grammarians and Philosophers
</a></span>                        <date>2020-05-15</date></p></dd><dd class="archive-item"><p><span id="15">°15. <a href="2020-05-14-4-notes.html">gistash, RFCs
</a></span>                        <date>2020-05-14</date></p></dd><dd class="archive-item"><p><span id="14">°14. <a href="2020-05-14-1-getting-out-of-goldilocks-zone.html">Getting Out of the Programming Goldilocks Zone
</a></span>                        <date>2020-05-14</date></p></dd><dd class="archive-item"><p><span id="13">°13. <a href="2020-05-13-2-notes.html">Some interesting things
</a></span>                        <date>2020-05-13</date></p></dd><dd class="archive-item"><p><span id="12">°12. <a href="2020-05-12-01-notes.html">A few interesting things
</a></span>                        <date>2020-05-12</date></p></dd><dd class="archive-item"><p><span id="11">°11. <a href="2020-05-08-01-go-third-party-packages.html">Notes to self: How to use Go Third Party Packages
</a></span>                        <date>2020-05-08</date></p></dd><dd class="archive-item"><p><span id="10">°10. <a href="2020-05-07-02-code-in-books.html">My code in books
</a></span>                        <date>2020-05-07</date></p></dd><dd class="archive-item"><p><span id="9">°9. <a href="2020-05-06-06-happy-python.html">My Happy Python Workflow
</a></span>                        <date>2020-05-06</date></p></dd><dd class="archive-item"><p><span id="8">°8. <a href="2020-05-06-04-codespaces.html">github codespaces
</a></span>                        <date>2020-05-06</date></p></dd><dd class="archive-item"><p><span id="7">°7. <a href="2020-05-05-02-bari.html">Just-what-you-need blogging with bari
</a></span>                        <date>2020-05-05</date></p></dd><dd class="archive-item"><p><span id="6">°6. <a href="2020-05-05-01-golang-hash-builds.html">Building Go Programs with Source File Hash baked in
</a></span>                        <date>2020-05-05</date></p></dd><dd class="archive-item"><p><span id="5">°5. <a href="2020-05-02-01-quip.html">Quip
</a></span>                        <date>2020-05-02</date></p></dd><dd class="archive-item"><p><span id="4">°4. <a href="2020-05-01-01-interest-calculation.html">A worked exmaple of - A persian folk method of figuring interest
</a></span>                        <date>2020-05-01</date></p></dd><dd class="archive-item"><p><span id="3">°3. <a href="2020-04-29-pipx.html">pipx is like brew for python applications
</a></span>                        <date>2020-04-29</date></p></dd><dd class="archive-item"><p><span id="2">°2. <a href="2020-04-29-courier.html">Courier is a nice monospace font
</a></span>                        <date>2020-04-29</date></p></dd><dd class="archive-item"><p><span id="1">°1. <a href="2020-04-29-conwayslaw.html">Conway's law
</a></span>                        <date>2020-04-29</date></p></dd></dl>
## Tags
(Chronologic)
<dl><dt><span id="computing" class="tagged">computing</span></dt><dd><p><a href="2020-04-29-conwayslaw.html">Conway's law</a>                    <date style="float:right;">2020-04-29</date></p></dd> <dt><span id="fonts" class="tagged">fonts</span></dt><dd><p><a href="2020-04-29-courier.html">Courier is a nice monospace font</a>                    <date style="float:right;">2020-04-29</date></p></dd> <dt><span id="golang" class="tagged">golang</span></dt><dd><p><a href="2020-05-05-01-golang-hash-builds.html">Building Go Programs with Source File Hash baked in</a>                    <date style="float:right;">2020-05-05</date></p></dd> <dd><p><a href="2020-05-08-01-go-third-party-packages.html">Notes to self: How to use Go Third Party Packages</a>                    <date style="float:right;">2020-05-08</date></p></dd> <dd><p><a href="2020-05-22-1-thread-reaper.html">Thread Reaper</a>                    <date style="float:right;">2020-05-22</date></p></dd> <dt><span id="grammar" class="tagged">grammar</span></dt><dd><p><a href="2020-05-15-1.html">About Grammarians and Philosophers</a>                    <date style="float:right;">2020-05-15</date></p></dd> <dt><span id="ideas" class="tagged">ideas</span></dt><dd><p><a href="2020-05-14-4-notes.html">gistash, RFCs</a>                    <date style="float:right;">2020-05-14</date></p></dd> <dt><span id="interesting" class="tagged">interesting</span></dt><dd><p><a href="2020-05-12-01-notes.html">A few interesting things</a>                    <date style="float:right;">2020-05-12</date></p></dd> <dd><p><a href="2020-05-13-2-notes.html">Some interesting things</a>                    <date style="float:right;">2020-05-13</date></p></dd> <dd><p><a href="2020-05-14-4-notes.html">gistash, RFCs</a>                    <date style="float:right;">2020-05-14</date></p></dd> <dd><p><a href="2020-05-15-2.html">Some Interesting Links</a>                    <date style="float:right;">2020-05-15</date></p></dd> <dt><span id="javascript" class="tagged">javascript</span></dt><dd><p><a href="2020-05-20-1-threadreaderapp-bookmark.html">Thread reader app browser bookmark</a>                    <date style="float:right;">2020-05-20</date></p></dd> <dt><span id="json" class="tagged">json</span></dt><dd><p><a href="2020-06-05-1-jsonfmt.html">jsonfmt</a>                    <date style="float:right;">2020-06-05</date></p></dd> <dt><span id="mathematics" class="tagged">mathematics</span></dt><dd><p><a href="2020-05-01-01-interest-calculation.html">A worked exmaple of - A persian folk method of figuring interest</a>                    <date style="float:right;">2020-05-01</date></p></dd> <dt><span id="nim" class="tagged">nim</span></dt><dd><p><a href="2020-06-10-1-csv2html.nim.html">CSV2HTML in Nim</a>                    <date style="float:right;">2020-06-10</date></p></dd> <dt><span id="patterns" class="tagged">patterns</span></dt><dd><p><a href="2020-05-15-2.html">Some Interesting Links</a>                    <date style="float:right;">2020-05-15</date></p></dd> <dt><span id="philosophy" class="tagged">philosophy</span></dt><dd><p><a href="2020-05-15-1.html">About Grammarians and Philosophers</a>                    <date style="float:right;">2020-05-15</date></p></dd> <dt><span id="programming" class="tagged">programming</span></dt><dd><p><a href="2020-05-06-04-codespaces.html">github codespaces</a>                    <date style="float:right;">2020-05-06</date></p></dd> <dd><p><a href="2020-05-07-02-code-in-books.html">My code in books</a>                    <date style="float:right;">2020-05-07</date></p></dd> <dd><p><a href="2020-05-14-1-getting-out-of-goldilocks-zone.html">Getting Out of the Programming Goldilocks Zone</a>                    <date style="float:right;">2020-05-14</date></p></dd> <dt><span id="python" class="tagged">python</span></dt><dd><p><a href="2020-04-29-pipx.html">pipx is like brew for python applications</a>                    <date style="float:right;">2020-04-29</date></p></dd> <dd><p><a href="2020-05-06-06-happy-python.html">My Happy Python Workflow</a>                    <date style="float:right;">2020-05-06</date></p></dd> <dd><p><a href="2020-05-17-1-python-lineprocessing.html">Python Line Processing Pattern</a>                    <date style="float:right;">2020-05-17</date></p></dd> <dd><p><a href="2020-05-19-1-shell-safe-api-key-password-generator.html">Shell Safe API key / Password Generator</a>                    <date style="float:right;">2020-05-19</date></p></dd> <dd><p><a href="2020-06-05-1-jsonfmt.html">jsonfmt</a>                    <date style="float:right;">2020-06-05</date></p></dd> <dd><p><a href="2020-06-05-2-csv2html.html">csv2html</a>                    <date style="float:right;">2020-06-05</date></p></dd> <dd><p><a href="2020-06-10-1-csv2html.nim.html">CSV2HTML in Nim</a>                    <date style="float:right;">2020-06-10</date></p></dd> <dt><span id="software" class="tagged">software</span></dt><dd><p><a href="2020-05-02-01-quip.html">Quip</a>                    <date style="float:right;">2020-05-02</date></p></dd> <dt><span id="zettelkasten" class="tagged">zettelkasten</span></dt><dd><p><a href="2020-05-15-1.html">About Grammarians and Philosophers</a>                    <date style="float:right;">2020-05-15</date></p></dd> </dl>

