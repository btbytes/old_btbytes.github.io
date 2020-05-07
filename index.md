<div class="post"><date>2020-05-07</date>
[My code in books
](2020-05-07-02-code-in-books.html)

During a "vanity search" of this blog "btbytes.github.io", I found out that some of my code have been quoted in published books:

([A Particle Swarm Optimization](https://gist.github.com/btbytes/79877)) implementation in Python in ["Intelligent IoT Projects in 7 Days"](https://www.packtpub.com/hardware-and-creative/intelligent-iot-projects-7-days). I remember writing this code for Dr Eberhart's "Computation Intelligence" class at IUPUI.

![](images/pso-book.png)

<script src="https://gist.github.com/btbytes/79877.js?file=pso.py"></script>

----

A link to my [PyOFC2](http://btbytes.github.io/pyofc2/) Python charting library in ["Building a Cloud Computing Service: An Introduction to the Cloud"](https://books.google.com/books?id=RHBWBQAAQBAJ&lpg=PA46&ots=K3Ax-hLlZg&dq=btbytes.github.io&pg=PA46#v=onepage&q=btbytes.github.io&f=false).

![](images/pyofc2-book.png)


</div>
<div class="post"><date>2020-05-06</date>
[My Happy Python Workflow
](2020-05-06-06-happy-python.html)

This is my current python programming workflow. I'm quite happy with it. I constantly try to get better.


1. I use Python3.x for all new projects.
1. I use SublimeText3(ST3) for editing.
1. I use Two ST3 plugins -- `Anaconda` and `PyYapf`.
1. Anaconda catches things like unused variables, syntax errors, and PEP8 violations.
1. I use PyYAPF formatting compulsively.
1. ..and "Highlight Trailing Whitespace", I find trailing whitespace unpleasant.
1. I take PEP8 warnings seriously and try to keep `pyflakes` happy.
1. Vim in the shell. No plugins.
1. Start with with a README.md in the project, even if it is a single file project.
1. I always use virtualenv; Pipenv is a quick way spin one up in the development environments.
1. Always capture the dependencies in `requirements.txt`, unless I'm writing a setup.py
1. Writing a `setup.py` file is a great idea, and I should do it more often.
1. I always write a `Makefile`.
1. For Python projects, the common "targets" are -- `deps` (for creating venvs and installing package dependencies), `package` (for packaging into tarballs and wheels) and `test` to run the test suite.
1. The makefile serves as contextual memory.
1. For "scripting" applications, I like to avoid using third party libraries as much as possible and keep to the standard library.
1. I like providing a CLI interface to my scripts; I use `argparse` often, even if it is to provide basic `--help`.
1. `click` looks neat, and I can see using it more often for larger projects.
1. `docopt` has fallen out of favour. Too fidgety for my taste.
1. I tried `python-poetry` for one project, and I like what it does. 
1. I like putting package versions in my `setup.py` files. I don't know if "Semantic versioning" is still a thing, but I like the x.y.z format, so I'm sticking to it.
1. Any program that is big enough to have a setup.py file will also have CLI entry_points.
1. I prefer writing small, self contained functions.
1. I wouldn't write a class unless I feel like I'm passing around too many variables between functions.
1. I like putting unit testing in the same file as the code, if it's a single file program.
1. doc tests seemed like a good idea, but unit tests are a good way to grow the tests without redoing the doc tests.
1. I have started writing type annotations, though nowhere near where I could be.
1. I *love*  `f-strings`. I never seemed to remember the right way to call format strings before I got used to `f-strings`, though `.format` came earlier. 
1. I don't like long variable names, especially ones with `camelCase`; `snake_case` for me please.
1. I use single character variable names when their meaning is clear from the context.
1. I seldom read code without rewriting some parts of it. Many times the changes do become pull requests.
1. I don't like commented out code in middle of programs.
1. I'm still not good with the `async` stuff.
1. I prefer using multiprocessing over threads. I don't remember the last time I wrote Python threading code.
1. I'm team single-quotes '. I like when my string look like -- `'hello, world!'` instead of `"hello, world!"`.
1. I haven't used the walrus operator yet.
1. I always write "dunder main", unless its a throw away script (or a would've-been-a-bash-script script).
1. You won't catch me manipulating "path" to insert dependent library locations. I know how to use packages and virtualenvs.
1. 4 spaces. No TABs characters in my programs. I do use the TAB key to tell the editor to indent appropriately.

<a href="index.html#python" class="tag python">python</a> 
</div>
<div class="post"><date>2020-05-06</date>
[github codespaces
](2020-05-06-04-codespaces.html)

The announcement of github [Codespaces](https://github.com/features/codespaces) made me think of why I almost always default to programming in Python.  One is definitely familiarity. But, I think the bigger issue (for me, at least) is that the default Python I have on most machines I work on is sufficient enough to be productive right away.

I use sublime text for editing python, which is quite fast to startup and the two python plugins -- anaconda and PyYAPF is sufficient for me to be very productive with Python.

There are a ton of languages that I'd like to try to build my programming muscles over time by writing small programs, but this "goldilocks" environment has prevented from doing so.


I hope things like github codespaces can allow me capture the "works great for me setup" in a config file(s), and thus allow me to jump into a project quickly and start coding away and not worry about the right language version (ruby), right interpreter (javascript), right "module" setup (go), right standard library(OCaml), easy to install libraries (haskell) etc.,

<a href="index.html#programming" class="tag programming">programming</a> 
</div>
<div class="post"><date>2020-05-05</date>
[Just-what-you-need blogging with bari
](2020-05-05-02-bari.html)

I write this blog using a combination of `pandoc`, `make` and a small-ish python script called [bari](https://github.com/btbytes/bari). 

It is easy for me to design, write and maintain my own code than inherit someone else's assumptions and "wants" for their software.

I saw another blog [https://blog.notryan.com/](https://blog.notryan.com/) that is also written in a similar spirit -- uses only C, and a bash script to generate a "text only" blog and RSS feed.

So, go on, write your own little program(s) to do what you need to get writing. Some of it is yak-shaving; but some yaks are small, some of you are expert shavers. You will figure it out. 


</div>
<div class="post"><date>2020-05-05</date>
[Building Go Programs with Source File Hash baked in
](2020-05-05-01-golang-hash-builds.html)


Imagine a scenario where you are trying to replace a script written in Bash with Go. Lets assume for the sake of this disucssion the following:

1. This program is longer than what you are comfortable maintaining in Bash/Perl/Python
2. This program has library dependencies
3. The target deployment system does not have a "devops" setup to install required dependencies (or has an older version of the OS)
4. The script does not change often
5. The "deployment" consists of copying/syncing/`git pull` script into the target machine.
6. The target system does not have a golang compiler

Writing the "scripts" that fit the above criteria in Go looks like a win. You get:

1. static typing, and developer productivity tooling & apparatus
2. single deployable binary (that you can commit along with the source)
3. dependencies baked in

The one issue with checking in the binary with source code is, you can't be sure if the binary is built with the latest source that is adjacent to it.


Essentially, this is what we want to have:

	$ sha256sum hello.go
	0246c2bce7473e5c02e8ef510ff89e7ef5aedf74ffb7df66cdb19acb433d24aa  hello.go

The `sha256sum` of the source file is - `0246c2bce7473e5c02e8ef510ff89e7ef5aedf74ffb7df66cdb19acb433d24aa`.

Let's say we have a binary `hello`, that is adjacent to this source file, that we assume to be compiled from this source file.

What if we could verify that?

	$ ./hello -v
	0246c2bce7473e5c02e8ef510ff89e7ef5aedf74ffb7df66cdb19acb433d24aa

If the program prints the same hash, we can assume that they match.

What if there was a way to "bake-in" the hash of the source file into the binary? We can.

```go
// hello.go
package main

import (
        "fmt"
)

var sourcehash string

func main() {
        fmt.Println(sourcehash)
}
```

Build step:

	$ export SOURCEHASH=`sha256sum hello.go | cut -d' ' -f1`
	$ go build -ldflags "-X main.sourcehash=$SOURCEHASH"

Verify:

	$ ./hello
	7fffa4353f81b58c682e5b33ec7d720cc6db8e469a10d6fc5f31e11eafaa9104

NOTE: there is nothing stopping you from passing in any value to `-ldflags`. This meant to be in an environment where you have complete control of the source, binary and the build process, and you are adding something to the build output to help you later on (in case of a doubt).


I was wondering if I could do this and [found the answer on SO](https://stackoverflow.com/a/28460195).

<a href="index.html#golang" class="tag golang">golang</a> 
</div>

## Archive
### 2020
<date>2020-05-02</date> [Quip
](2020-05-02-01-quip.html)

<date>2020-05-01</date> [A worked exmaple of - A persian folk method of figuring interest
](2020-05-01-01-interest-calculation.html)

<date>2020-04-29</date> [pipx is like brew for python applications
](2020-04-29-pipx.html)

<date>2020-04-29</date> [Courier is a nice monospace font
](2020-04-29-courier.html)

<date>2020-04-29</date> [Conway's law
](2020-04-29-conwayslaw.html)


## Tags


<span id="computing" class="tagged">computing</span>: ◊[Conway's law](2020-04-29-conwayslaw.html)

<span id="fonts" class="tagged">fonts</span>: ◊[Courier is a nice monospace font](2020-04-29-courier.html)

<span id="golang" class="tagged">golang</span>: ◊[Building Go Programs with Source File Hash baked in](2020-05-05-01-golang-hash-builds.html)

<span id="mathematics" class="tagged">mathematics</span>: ◊[A worked exmaple of - A persian folk method of figuring interest](2020-05-01-01-interest-calculation.html)

<span id="programming" class="tagged">programming</span>: ◊[github codespaces](2020-05-06-04-codespaces.html)

<span id="python" class="tagged">python</span>: ◊[pipx is like brew for python applications](2020-04-29-pipx.html) ◊[My Happy Python Workflow](2020-05-06-06-happy-python.html)

<span id="software" class="tagged">software</span>: ◊[Quip](2020-05-02-01-quip.html)