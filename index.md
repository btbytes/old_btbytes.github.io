<div class="post"><date>2020-05-15</date>
[About Grammarians and Philosophers
](2020-05-15-1.html)

Found this paper - [On the Architecture of Pāṇini's Grammar](https://web.stanford.edu/~kiparsky/Papers/hyderabad.pdf) (2002) by [Paul Kiparsky](https://web.stanford.edu/~kiparsky/) via [kaeshour](https://twitter.com/kaeshour/status/1261266973343784960)

Kaeshour made this observation --  **Greece : Geometry :: India : Grammar**.

<a name="paninirazor"></a>

Browsing around on Prof Kiparsky's website, I found another paper - [Pāṇini](https://web.stanford.edu/~kiparsky/Papers/panini_hist_of_phon_handbook.pdf) in Handbook of the History of Phonology. A very interesting point about Pāṇini's contribution:

> Pāṇini's achievement was to extend and formalize these initiatives in a vastly more ambitious undertaking: a grammar of the entire language that relates sound and meaning through rules for building words
and sentences from their minimal parts. It is not intended to be a practical reference grammar, still less a textbook; simplified and condensed works suitable for these purposes were produced later. It seeks solely
to extract all grammatical regularities, rigorously guided by the twin imperatives of complete coverage and
the principle of Minimum Description Length. The latter requires the grammar to be the shortest overall
representation of the data, crucially including the principles and abbreviatory conventions by which it the
data is encoded.

> The simplicity principle adopted by Pāṇini – call it Pāṇini's Razor – is conceptually related both to Occam’s
Razor and to the simplicity criterion of Chomsky and Halle (1968). Occam’s Razor, as understood in modern science, requires making the fewest assumptions and postulating the fewest entities. Pāṇini's Minimum
Description Length principle relativizes Occam’s Razor by pitting the cost of assumptions and postulates
against the work they do. They are welcome as long as the complexity that their formulation incurs earns its
keep by simplifying the overall grammar. This means that complexity is calculated on the entire grammar,
not only the operative rules but also the conventions that govern their application and interpret their abbreviatory conventions, as well as the list of roots and the Sivas ´ utras. The idea is essentially what is known as Minimum Description Length (Rissanen 1998) or Kolmogorov Complexity (Li and Vitányi 2008), see
Nannen 2010 for a concise review.

> Pāṇini's Razor is not limited to the Minimum Description Length principle. It also subsumes a form
of Occam’s Razor, which requires selecting among equally simple descriptions the one that minimizes new
theoretical terms. For example, the grammar uses the minimum necessary number of pratyah¯ aras ¯ , even
though they are all generated free of charge.

> Another aspect of Pāṇini's Razor is the preference for SPECIFICITY. Among equally simple formulations
compatible with the data, Pāṇini systematically chooses the most restricted one — if possible, one which
covers only the actually occurring cases. Thus specificity is a conservative curb on overgeneralization.

> Pāṇini's Razor.  **Minimum Description Length ≫ Occam’s Razor ≫ Specificity**

> From a modern perspective (which would have been totally alien to Pāṇini of course) Pāṇini's Razor offers
an interesting approach to induction, especially in language acquisition, where the problem is to find a
learning mechanism that avoids overgeneralization on the one hand, and undergeneralization by overfitting
the description to the data on the other.

---

Found this "Zettelkasten like" [notes on western philosophy](https://www.denizcemonduygu.com/philo/browse/) by [Deniz Cem Önduygu](https://twitter.com/denizcemonduygu) via [dhrumilwbc](https://twitter.com/dhrumilwbc/status/1261080204908171265). *creating a history of yourself using your daily note dates as the axis... the bidirectional links on each date and u can see the links between them like in this site*

Most of the paragraphs I clicked and read were referencing "The Story of Philosophy" by Bryan McGee.

It will be a great project to do something similar for Indian philosophy. 

This format allows the reader to visualize the chronology, who said what, were they agreeing with someone before them or refuting them? etc.,

I'm going to order McGee's book. It's published by DK. It's one of their "picture books".

---

Continuing on the theme of "Connectedness" of Zettelkasten, <https://www.statlect.com/> is a digital textbook for probability and statistics. One thing I liked about this book is links to key phrases are provided where they are used. For example, the page on  [Bernoulli Distribution](https://www.statlect.com/probability-distributions/Bernoulli-distribution) links to [support](https://www.statlect.com/glossary/support-of-a-random-variable), the definition of which I was shaky on. 

Linking to definitions and concepts much like a Wiki is a great concept. The next step in that interaction is "immediate lookup/linking" model [shown here](https://notes.andymatuschak.org/About_these_notes) in *Evergreen Notes*.

<a href="index.html#grammar" class="tag grammar">grammar</a>  <a href="index.html#zettelkasten" class="tag zettelkasten">zettelkasten</a>  <a href="index.html#philosophy" class="tag philosophy">philosophy</a> 
</div>
<div class="post"><date>2020-05-14</date>
[gistash, RFCs
](2020-05-14-4-notes.html)

<a name="gistash">**Project Idea: gistash**</a>

What if we can use Github's gist as we use `git stash`? I initially thought of this as a way to "backup" drafts I'm working on here. I start writing posts with a `.txt` extension that I `.gitignore`, so that I don't commit half finished posts to git plus also my [blog generation script](https://github.com/btbytes/btbytes.github.io/blob/master/bari) won't pick up the `.txt` files for processing. It will be nice to stash them away to a private gist.

The solution is a script to store given files in a [github gist](https://gist.github.com/), update them in place if they already exist.

When creating a new gist:

	$ gistash *.txt
	    uploading a.txt
	    uploading b.txt
	    done.

When updating an existing, gist(say `28fe346dc83fd26a43c351c507c6599d`) that you have permissions to update:

	$ gistash *.txt 28fe346dc83fd26a43c351c507c6599d
	    updating a.txt
	    updating b.txt
	    uploading c.txt
        done.

Gist has an API to [update a gist](https://developer.github.com/v3/gists/#update-a-gist) which can be used to implment this.

Only thing remaining is to actually write the code ;). The little "write up", is a nice segue to this article I read today:

[Scaling Engineering Teams via Writing Things Down and Sharing - aka RFCs](https://blog.pragmaticengineer.com/scaling-engineering-teams-via-writing-things-down-rfcs/).

When you consider that some of the most robust software things were built using the RFC process, involving people working in different organizations, often with conflicting interests, using "written down" things to make engineering decisions is a great practice.

<a href="index.html#interesting" class="tag interesting">interesting</a>  <a href="index.html#ideas" class="tag ideas">ideas</a> 
</div>
<div class="post"><date>2020-05-14</date>
[Getting Out of the Programming Goldilocks Zone
](2020-05-14-1-getting-out-of-goldilocks-zone.html)

As a programmer, I have my [goldilocks zone](2020-05-06-06-happy-python.html) (Python).

In order to reach for a different language, I'll expect to get comfortable doing the following things in a new language:

* string manipulation - split, join etc
* string formatting and printing
* string templating
* reading and writing to files
* iterating over the contents of a file
* json parsing and generation
* reading and writing csv files
* regular expressions
* command line arguments and parsing them
* http client operations - GET, POST
* reading configurations from a file - toml, yaml, ini
* processing xml files
* generating HTML files
* dealing with unicode encoding
* unit testing
* connecting to and querying sql databases
* shelling out and calling external processes
* threads
* multiprocessing
* asynchronous programming
* using third party code and library
* packaging code for reuse
* packaging binaries for deployment
* cross-platform compilation

<a href="index.html#programming" class="tag programming">programming</a> 
</div>
<div class="post"><date>2020-05-13</date>
[Some interesting things
](2020-05-13-2-notes.html)

[Your Makefiles are wrong](https://tech.davis-hansson.com/p/make/) taught me some good tricks about writing make files.

----

"Move slow and make things." -- \@stevelosh (on his twitter profile). I often think about that.

Steve's [A Road to Common Lisp](https://stevelosh.com/blog/2018/08/a-road-to-common-lisp/) is an excellent article that captures some of his thought process behind that "motto". I particularly like the "*Escaping the Hamster Wheel of Backwards Incompatibility*" section.

If you desire to make things that are solving *unusual* and *novel* things, and you see the things you build last for years, if not decades, you *have* consider what technologies you put your time into. Steve chose Common Lisp, and I think its a solid choice.

----

[Deno](https://deno.land) 1.0 [was announced today](https://deno.land/v1). I've long ignored node.js, and the ecosystem around it primarily because I think the situation around `node_modules` is ridiculous. My hope for deno is that it can become a replacement for Python (and Go) for many tasks.

----

Common Lisp things:

Using a portacle instance instead of trying to configure my emacs installation to avoid [*the Omnibus configuration pattern*](https://twitter.com/btbytes/status/1259890526242983939).

Trying to familiarize myself with [str](https://github.com/vindarel/cl-str/) library. 

Common characters:

	#\Space #\Newline #\Backspace #\Tab #\Linefeed #\Page #\Return

Spelled out: "Hash-Backslash-NAME" - `#\Space`.

<a href="index.html#interesting" class="tag interesting">interesting</a> 
</div>
<div class="post"><date>2020-05-12</date>
[A few interesting things
](2020-05-12-01-notes.html)

[entr](http://eradman.com/entrproject/) is nice tool to add to the repertoire of scripting and make files. One of the examples given on that page is to use this program to watch over HTML+CSS file when you are editing one. I am thinking of using this to create a kind of "markdown live editor", which uses pandoc to render markdown to html.

---

I posted a [gerbil scheme](https://cons.io) to [lobste.rs](https://lobste.rs/s/c29wn2/gerbil_scheme) where the creator of [Fennel Lang](https://fennel-lang.org/) posted a link which lead to this [rich makefile](https://git.sr.ht/~technomancy/fennel-lang.org/tree/master/makefile) which is worthy of studying.

For instance, this line: `reference.html: fennel/reference.md ; $(PANDOC) --toc -o $@ $^`. I believe this means I can write one line "actions" followed by semi-colon.

The other thing that Makefile reminded me of is the `--lua-filter`. Pandoc ships with a lua interpreter, which makes it easy to write post processing filters without needing an additional software installed (eg: for python, you still need some kind Pandoc library).

*Each Lua filter must contain element-transforming functions indexed by the name of the AST element on which the filter function should be applied.*

*The pandoc Lua module provides helper functions for element creation. It is always loaded into the script’s Lua environment.*

*The following is an example Lua script for macro-expansion:*

```lua
function expand_hello_world(inline)
  if inline.c == '{{helloworld}}' then
    return pandoc.Emph{ pandoc.Str "Hello, World" }
  else
    return inline
  end
end

return {{Str = expand_hello_world}}
```


Important thing to remember from above snippet -- Make sure you are "indexing" the functions by the AST element (above, the function `expand_hello_world` is indexed to `Str` AST element type).

---

Data science courses of Dr Michael Guerzhoy at Princeton [SML201](http://guerzhoy.princeton.edu/201s20/) has good intro material based on R.

---

Started using [bbedit](https://www.barebones.com/products/bbedit/index.html) more. I even configured the scripts that help me in editing this blog to use `bbedit` directly.  I really like (much like Textwrangler's) ability to "Untitled" buffers as a quick way to start writing without worrying about losing them if I close the editor without saving them to a file. 

---

Humour: [Why we at $FAMOUS_COMPANY Switched to $HYPED_TECHNOLOGY](https://saagarjha.com/blog/2020/05/10/why-we-at-famous-company-switched-to-hyped-technology/) via [Ramakrishnan](https://rkrishnan.org/).

---

I rediscovered [Gerbil Scheme](https://cons.io/) two days ago, and many things clicked for me this time around, perhaps reading all the Clojure and Janet code helped. But, since this evening Racket is blowing my mind. I totally see myself reading more about Racket in the days to come.


<a href="index.html#interesting" class="tag interesting">interesting</a> 
</div>

## Archive
<dl><dt>2020</dt>
<dd><p><a href="2020-05-08-01-go-third-party-packages.html">Notes to self: How to use Go Third Party Packages
</a> <date style="float:right;">2020-05-08</date></p></dd><dd><p><a href="2020-05-07-02-code-in-books.html">My code in books
</a> <date style="float:right;">2020-05-07</date></p></dd><dd><p><a href="2020-05-06-06-happy-python.html">My Happy Python Workflow
</a> <date style="float:right;">2020-05-06</date></p></dd><dd><p><a href="2020-05-06-04-codespaces.html">github codespaces
</a> <date style="float:right;">2020-05-06</date></p></dd><dd><p><a href="2020-05-05-02-bari.html">Just-what-you-need blogging with bari
</a> <date style="float:right;">2020-05-05</date></p></dd><dd><p><a href="2020-05-05-01-golang-hash-builds.html">Building Go Programs with Source File Hash baked in
</a> <date style="float:right;">2020-05-05</date></p></dd><dd><p><a href="2020-05-02-01-quip.html">Quip
</a> <date style="float:right;">2020-05-02</date></p></dd><dd><p><a href="2020-05-01-01-interest-calculation.html">A worked exmaple of - A persian folk method of figuring interest
</a> <date style="float:right;">2020-05-01</date></p></dd><dd><p><a href="2020-04-29-pipx.html">pipx is like brew for python applications
</a> <date style="float:right;">2020-04-29</date></p></dd><dd><p><a href="2020-04-29-courier.html">Courier is a nice monospace font
</a> <date style="float:right;">2020-04-29</date></p></dd><dd><p><a href="2020-04-29-conwayslaw.html">Conway's law
</a> <date style="float:right;">2020-04-29</date></p></dd></dl>
## Tags
<dl><dt><span id="computing" class="tagged">computing</span></dt><dd><p><a href="2020-04-29-conwayslaw.html">Conway's law</a><date style="float:right;">2020-04-29</date></p></dd> <dt><span id="fonts" class="tagged">fonts</span></dt><dd><p><a href="2020-04-29-courier.html">Courier is a nice monospace font</a><date style="float:right;">2020-04-29</date></p></dd> <dt><span id="golang" class="tagged">golang</span></dt><dd><p><a href="2020-05-05-01-golang-hash-builds.html">Building Go Programs with Source File Hash baked in</a><date style="float:right;">2020-05-05</date></p></dd> <dd><p><a href="2020-05-08-01-go-third-party-packages.html">Notes to self: How to use Go Third Party Packages</a><date style="float:right;">2020-05-08</date></p></dd> <dt><span id="grammar" class="tagged">grammar</span></dt><dd><p><a href="2020-05-15-1.html">About Grammarians and Philosophers</a><date style="float:right;">2020-05-15</date></p></dd> <dt><span id="ideas" class="tagged">ideas</span></dt><dd><p><a href="2020-05-14-4-notes.html">gistash, RFCs</a><date style="float:right;">2020-05-14</date></p></dd> <dt><span id="interesting" class="tagged">interesting</span></dt><dd><p><a href="2020-05-12-01-notes.html">A few interesting things</a><date style="float:right;">2020-05-12</date></p></dd> <dd><p><a href="2020-05-13-2-notes.html">Some interesting things</a><date style="float:right;">2020-05-13</date></p></dd> <dd><p><a href="2020-05-14-4-notes.html">gistash, RFCs</a><date style="float:right;">2020-05-14</date></p></dd> <dt><span id="mathematics" class="tagged">mathematics</span></dt><dd><p><a href="2020-05-01-01-interest-calculation.html">A worked exmaple of - A persian folk method of figuring interest</a><date style="float:right;">2020-05-01</date></p></dd> <dt><span id="philosophy" class="tagged">philosophy</span></dt><dd><p><a href="2020-05-15-1.html">About Grammarians and Philosophers</a><date style="float:right;">2020-05-15</date></p></dd> <dt><span id="programming" class="tagged">programming</span></dt><dd><p><a href="2020-05-06-04-codespaces.html">github codespaces</a><date style="float:right;">2020-05-06</date></p></dd> <dd><p><a href="2020-05-07-02-code-in-books.html">My code in books</a><date style="float:right;">2020-05-07</date></p></dd> <dd><p><a href="2020-05-14-1-getting-out-of-goldilocks-zone.html">Getting Out of the Programming Goldilocks Zone</a><date style="float:right;">2020-05-14</date></p></dd> <dt><span id="python" class="tagged">python</span></dt><dd><p><a href="2020-04-29-pipx.html">pipx is like brew for python applications</a><date style="float:right;">2020-04-29</date></p></dd> <dd><p><a href="2020-05-06-06-happy-python.html">My Happy Python Workflow</a><date style="float:right;">2020-05-06</date></p></dd> <dt><span id="software" class="tagged">software</span></dt><dd><p><a href="2020-05-02-01-quip.html">Quip</a><date style="float:right;">2020-05-02</date></p></dd> <dt><span id="zettelkasten" class="tagged">zettelkasten</span></dt><dd><p><a href="2020-05-15-1.html">About Grammarians and Philosophers</a><date style="float:right;">2020-05-15</date></p></dd> </dl>

