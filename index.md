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
<div class="post"><div class="post-title"><span id="20">°20 // <a href="2020-05-19-1-shell-safe-api-key-password-generator.html">Shell Safe API key / Password Generator
</a></span> <span class="post-date"><date>2020-05-19</date></span></div>

Recently I became aware of an instance where a program broke because the AWS secrets they were using contained special characters that are not shell safe.

Examples of such characters are:

* `$ & ' " ; | ` -- shell syntax
* `!` -- history expansion
* `[ ` -- shell wildcard

You can be extra caution and use only the alphanumeric range, that is

* A-Z
* a-z
* 0-9

But, you will also miss out on some characters that are benign.

So, I wrote this little script, which probably has 1:30::code:documentation ratio ;)

I also added a little nice UX improvement. Often times, random strings have a character or two that make it hard to double click and select the whole string. In my experience it is `@` and `%`.

So you can choose to generate API key/passwords of any length, that are even easy double-click and copy from the shell.

* not easy -- `lD53xg6sjT4dRZ0anO@u+V` (selection stops at the `@` character)
* easy -- `sQt03aBrXhPbOU+K9WwI/_` (double click selects the whole string)


The code for [`apikeygen.py`](https://gist.github.com/btbytes/87e10bc7768b67cd1435eefa332ef971):

```python
#!/usr/bin/env python
"""
apikeygen.py

Generate a shell safe API key (or password)

Generated string should not have any characters that need to be escaped in
the shell. The following characters have special meaning in some shell contexts

    ! # $ ' ( ) * , ; . < = > ? [ ] ^ { } | ~ - . : \

Arguments:
    -l --length length of the API key to be generated. Default is 32.
    -s --source a string of characters to use.
    -c --clickable make the string clickable.

Revision:
    2020-05-19: Initial revision

Reference:
    https://unix.stackexchange.com/a/357932
"""

import random


def apikeygen(length, source):
    return ''.join(random.sample(source, length))


if __name__ == '__main__':
    import argparse
    import string
    source = string.ascii_lowercase\
        + string.ascii_uppercase\
        + string.digits\
        + '@%_/+'
    dirty = '@%'
    parser = argparse.ArgumentParser()
    parser.add_argument(
        '-l',
        '--length',
        type=int,
        help='length of the API key to be generated.',
        default=32)
    parser.add_argument(
        '-s',
        '--source',
        help='a string of characters to use.',
        default=source)
    parser.add_argument(
        '-c',
        '--clickable',
        help='make the string clickable.',
        action='store_true',
        default=source)
    args = parser.parse_args()
    source = args.source
    if args.clickable:
        source = ''.join([c for c in source if c not in dirty])
    print(apikeygen(args.length, source))

```

<a href="index.html#python" class="tag python">python                        </a> 
</div>
<div class="post"><div class="post-title"><span id="19">°19 // <a href="2020-05-17-2-the-rabbits.html">Sustainable tech by The Rabbits
</a></span> <span class="post-date"><date>2020-05-17</date></span></div>

Came across [The Rabbits](https://100r.co/site/about_us.html) via [HN](https://news.ycombinator.com/item?id=23211273). Two tech folks who are building stuff  in the way of "resilience and self-reliance using low-tech solutions.". They appear to building most of their stuff in [C99, ASM and JS](https://100r.co/site/philosophy.html#accessibility).

Their [Ronin](https://100r.co/site/ronin.html) project implements a browser based lisp interpreter, which can be used for making generative art. You can play with a program in [the playground](https://hundredrabbits.github.io/Ronin/). 

[Dotgrid](https://100r.co/site/dotgrid.html) is  a grid-based vector drawing software designed to create logos, icons and type. Like their applications, being able to drive the program with keystrokes seems like a feature I'd like to explore. I'm a total dummy when it comes to vector graphics. The simplicity of this tool might help exploration and learning.

[Orca](https://100r.co/site/orca.html) immediately brought to my mind [Colorforth](https://colorforth.github.io) by Charles Moore. 

Their minimalistic, prose-writing oriented editor [Left](https://100r.co/site/left.html) makes me write my own text editor. I donated $5 and downloaded Left. 


Further reading:

* Blogroll and travelogues on their [Home page](https://100r.co/site/home.html)
* Their podcasts on Future of Coding -- 

  * [#44 - Making Your Own Tools: Devine Lu Linvega](https://futureofcoding.org/episodes/044)
  * [#45 - Orca: Devine Lu Linvega](https://futureofcoding.org/episodes/045) 

</div>
<div class="post"><div class="post-title"><span id="18">°18 // <a href="2020-05-17-1-python-lineprocessing.html">Python Line Processing Pattern
</a></span> <span class="post-date"><date>2020-05-17</date></span></div>


Sometimes you want to write a program that has to modify line(s) in a text file. The "UNIX" way of doing this is of course to use `sed` (stream editor) or `awk`. Since I can type faster than think in `awk`, I write python instead.

The common pattern for such programs is:


```
	for file in matching_files
		for line in file
			if line matches pattern
				modify the line
				print the line
			else
				write the line
```

One twist to the above is, you don't want to overwrite the file before you know the overwriting can complete successfully. 

The defensive way to handle this is: put the source files in a git repo, so that you can always revert the changes back. This is also useful in `git diff`ing the changes so that you can verify your program actually does what you wanted. 

In addition, you can write the changed contents to a temporary file, and rename that file to the original file if there were no errors. Essentially.

	$ ./processing_script original.txt > temp.txt && mv temp.txt original.txt

I learnt about `NamedTemporaryFile` module recently, and I used it to do the following. 


```python
#!/usr/bin/env python
"""
This program will rewrite the following:

    ---
    title: AWK programming language
    kind: notebook
    tags: programming-language
    date: 2020-02-12T05:51:45
    ---

to:
    ---
    title: AWK programming language
    kind: notebook
    tags: programming-language
    date: 2020-02-12
    updated: 2020-02-12T05:51:45
    ---
"""
import glob
import shutil
import tempfile


def main():
    files = glob.glob('*.md')
    for mdfile in files:
        temp = tempfile.NamedTemporaryFile('w', delete=False)
        with open(mdfile) as inp:
            for line in inp:
                if line.startswith('date: '):
                    timestamp = line.split('date: ')[1]
                    dt = timestamp[:10]
                    print(f'{mdfile} {dt}')
                    temp.write(f'date: {dt}\n')
                    temp.write(f'updated: {timestamp}')
                else:
                    temp.write(line)
        temp.close()
        shutil.move(temp.name, mdfile)


if __name__ == '__main__':
    main()

```

Update: [David Glick](https://twitter.com/davisagli/status/1262092392959787008) pointed out that -- *You can skip "lines = inp.readlines()" and just iterate over inp; it'll give you one line at a time.*

Update-2 (2020/5/20): If you want to know more about `awk`, which is really the best know "line processing" language, see [this video](https://youtu.be/43BNFcOdBlY) by Ben Porter from Apr 2020. 

<a href="index.html#python" class="tag python">python                        </a> 
</div>

## Archive
(Reverse chronologic)<dl id="archive-links"><dt class="archive-year" id="y2020">2020</dt>
<dd class="archive-item"><p><span id="17">°17. <a href="2020-05-15-2.html">Some Interesting Links
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
<dl><dt><span id="computing" class="tagged">computing</span></dt><dd><p><a href="2020-04-29-conwayslaw.html">Conway's law</a>                    <date style="float:right;">2020-04-29</date></p></dd> <dt><span id="fonts" class="tagged">fonts</span></dt><dd><p><a href="2020-04-29-courier.html">Courier is a nice monospace font</a>                    <date style="float:right;">2020-04-29</date></p></dd> <dt><span id="golang" class="tagged">golang</span></dt><dd><p><a href="2020-05-05-01-golang-hash-builds.html">Building Go Programs with Source File Hash baked in</a>                    <date style="float:right;">2020-05-05</date></p></dd> <dd><p><a href="2020-05-08-01-go-third-party-packages.html">Notes to self: How to use Go Third Party Packages</a>                    <date style="float:right;">2020-05-08</date></p></dd> <dd><p><a href="2020-05-22-1-thread-reaper.html">Thread Reaper</a>                    <date style="float:right;">2020-05-22</date></p></dd> <dt><span id="grammar" class="tagged">grammar</span></dt><dd><p><a href="2020-05-15-1.html">About Grammarians and Philosophers</a>                    <date style="float:right;">2020-05-15</date></p></dd> <dt><span id="ideas" class="tagged">ideas</span></dt><dd><p><a href="2020-05-14-4-notes.html">gistash, RFCs</a>                    <date style="float:right;">2020-05-14</date></p></dd> <dt><span id="interesting" class="tagged">interesting</span></dt><dd><p><a href="2020-05-12-01-notes.html">A few interesting things</a>                    <date style="float:right;">2020-05-12</date></p></dd> <dd><p><a href="2020-05-13-2-notes.html">Some interesting things</a>                    <date style="float:right;">2020-05-13</date></p></dd> <dd><p><a href="2020-05-14-4-notes.html">gistash, RFCs</a>                    <date style="float:right;">2020-05-14</date></p></dd> <dd><p><a href="2020-05-15-2.html">Some Interesting Links</a>                    <date style="float:right;">2020-05-15</date></p></dd> <dt><span id="javascript" class="tagged">javascript</span></dt><dd><p><a href="2020-05-20-1-threadreaderapp-bookmark.html">Thread reader app browser bookmark</a>                    <date style="float:right;">2020-05-20</date></p></dd> <dt><span id="mathematics" class="tagged">mathematics</span></dt><dd><p><a href="2020-05-01-01-interest-calculation.html">A worked exmaple of - A persian folk method of figuring interest</a>                    <date style="float:right;">2020-05-01</date></p></dd> <dt><span id="patterns" class="tagged">patterns</span></dt><dd><p><a href="2020-05-15-2.html">Some Interesting Links</a>                    <date style="float:right;">2020-05-15</date></p></dd> <dt><span id="philosophy" class="tagged">philosophy</span></dt><dd><p><a href="2020-05-15-1.html">About Grammarians and Philosophers</a>                    <date style="float:right;">2020-05-15</date></p></dd> <dt><span id="programming" class="tagged">programming</span></dt><dd><p><a href="2020-05-06-04-codespaces.html">github codespaces</a>                    <date style="float:right;">2020-05-06</date></p></dd> <dd><p><a href="2020-05-07-02-code-in-books.html">My code in books</a>                    <date style="float:right;">2020-05-07</date></p></dd> <dd><p><a href="2020-05-14-1-getting-out-of-goldilocks-zone.html">Getting Out of the Programming Goldilocks Zone</a>                    <date style="float:right;">2020-05-14</date></p></dd> <dt><span id="python" class="tagged">python</span></dt><dd><p><a href="2020-04-29-pipx.html">pipx is like brew for python applications</a>                    <date style="float:right;">2020-04-29</date></p></dd> <dd><p><a href="2020-05-06-06-happy-python.html">My Happy Python Workflow</a>                    <date style="float:right;">2020-05-06</date></p></dd> <dd><p><a href="2020-05-17-1-python-lineprocessing.html">Python Line Processing Pattern</a>                    <date style="float:right;">2020-05-17</date></p></dd> <dd><p><a href="2020-05-19-1-shell-safe-api-key-password-generator.html">Shell Safe API key / Password Generator</a>                    <date style="float:right;">2020-05-19</date></p></dd> <dt><span id="software" class="tagged">software</span></dt><dd><p><a href="2020-05-02-01-quip.html">Quip</a>                    <date style="float:right;">2020-05-02</date></p></dd> <dt><span id="zettelkasten" class="tagged">zettelkasten</span></dt><dd><p><a href="2020-05-15-1.html">About Grammarians and Philosophers</a>                    <date style="float:right;">2020-05-15</date></p></dd> </dl>

