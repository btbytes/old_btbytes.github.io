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

<a href="index.html#interesting" class="tag interesting">interesting</a> 
</div>
<div class="post"><date>2020-05-08</date>
[Notes to self: How to use Go Third Party Packages
](2020-05-08-01-go-third-party-packages.html)

I've been following Go programming language since about 2009 or so (have the t-shirt).

Go does package management differently than other languages. For one there was no tar.gz, egg, or gem to download.  This note is just a reminder to myself how things work.


How to find new, interesting Go packages? [Golang weekly](https://golangweekly.com/issues/311) is one place. [Rek](https://github.com/lucperkins/rek) looks interesting.

[Rek](https://github.com/lucperkins/rek) is like [Python requests](https://requests.readthedocs.io/en/master/)

You install the package with: `go get github.com/lucperkins/rek`

The source is installed under: `$GOPATH/src/github.com/lucperkins/rek`. On my machines, `$GOPATH` is usually set to `$HOME/go`.

I can then use this package in a program like this: `import "github.com/lucperkins/rek"`


----

The complete program for posterity (also, the example code from the library home page had syntax errors) is here:

```go
package main

import "github.com/lucperkins/rek"
import "fmt"
import "time"

// Comment Struct
type Comment struct {
	Body string `json:"body"`
}

func main() {
	comment := Comment{Body: "Test message"}
	headers := map[string]string{"X-Custom-Header": "Custom Header Ino "}
	res, _ := rek.Post("https://httpbin.org/post",
		rek.Json(comment),
		rek.Headers(headers),
		rek.BasicAuth("user", "pass"),
		rek.Timeout(5*time.Second),
	)

	fmt.Println(res.StatusCode())
	fmt.Println(res.Text())
}

```

Running this program with `go run .` will produce:

```
200
{
  "args": {},
  "data": "{\"body\":\"Test message\"}",
  "files": {},
  "form": {},
  "headers": {
    "Accept-Encoding": "gzip",
    "Authorization": "Basic dXNlcjpwYXNz",
    "Content-Length": "23",
    "Content-Type": "application/json; charset=utf-8",
    "Host": "httpbin.org",
    "User-Agent": "Go-http-client/2.0",
    "X-Amzn-Trace-Id": "Root=1-5eb56f0a-33437e749f972658c175508a",
    "X-Custom-Header": "Custom Header Ino"
  },
  "json": {
    "body": "Test message"
  },
  "origin": "123.45.67.8",
  "url": "https://httpbin.org/post"
}
```

Update:

1. Running `go get -u package` (note the `-u` flag) will *update* the local copy of the package.
2. Running `go get -u -d foo/...` will download all the subpackages of `foo`.



<a href="index.html#golang" class="tag golang">golang</a> 
</div>
<div class="post"><date>2020-05-07</date>
[My code in books
](2020-05-07-02-code-in-books.html)

During a "vanity search" of this blog "btbytes.github.io", I found out that some of my code have been quoted in published books:

([A Particle Swarm Optimization](https://gist.github.com/btbytes/79877)) implementation in Python in ["Intelligent IoT Projects in 7 Days"](https://www.packtpub.com/hardware-and-creative/intelligent-iot-projects-7-days). I remember writing this code for Dr Eberhart's "Computation Intelligence" class at IUPUI.

![](images/pso-book.png)

The code in question:
```python
#!/usr/bin/env python

'''
pso.py

A simple implementation of the Particle Swarm Optimisation Algorithm.
Uses Numpy for matrix operations.
Pradeep Gowda 2009-03-16
'''

from numpy import array
from random import random
from math import sin, sqrt

iter_max = 10000
pop_size = 100
dimensions = 2
c1 = 2
c2 = 2
err_crit = 0.00001

class Particle:
    pass

def f6(param):
    '''Schaffer's F6 function'''
    para = param*10
    para = param[0:2]
    num = (sin(sqrt((para[0] * para[0]) + (para[1] * para[1])))) * \
        (sin(sqrt((para[0] * para[0]) + (para[1] * para[1])))) - 0.5
    denom = (1.0 + 0.001 * ((para[0] * para[0]) + (para[1] * para[1]))) * \
            (1.0 + 0.001 * ((para[0] * para[0]) + (para[1] * para[1])))
    f6 =  0.5 - (num/denom)
    errorf6 = 1 - f6
    return f6, errorf6;


#initialize the particles
particles = []
for i in range(pop_size):
    p = Particle()
    p.params = array([random() for i in range(dimensions)])
    p.fitness = 0.0
    p.v = 0.0
    particles.append(p)

# let the first particle be the global best
gbest = particles[0]
err = 999999999
while i < iter_max :
    for p in particles:
        fitness,err = f6(p.params)
        if fitness > p.fitness:
            p.fitness = fitness
            p.best = p.params

        if fitness > gbest.fitness:
            gbest = p
        v = p.v + c1 * random() * (p.best - p.params) \
                + c2 * random() * (gbest.params - p.params)
        p.params = p.params + v

    i  += 1
    if err < err_crit:
        break
    #progress bar. '.' = 10%
    if i % (iter_max/10) == 0:
        print '.'

print '\nParticle Swarm Optimisation\n'
print 'PARAMETERS\n','-'*9
print 'Population size : ', pop_size
print 'Dimensions      : ', dimensions
print 'Error Criterion : ', err_crit
print 'c1              : ', c1
print 'c2              : ', c2
print 'function        :  f6'

print 'RESULTS\n', '-'*7
print 'gbest fitness   : ', gbest.fitness
print 'gbest params    : ', gbest.params
print 'iterations      : ', i+1
## Uncomment to print particles
#for p in particles:
#    print 'params: %s, fitness: %s, best: %s' % (p.params, p.fitness, p.best)
```

That's in Python2.x. Should probably rewrite it in Python3 one of these days.


----

A link to my [PyOFC2](http://btbytes.github.io/pyofc2/) Python charting library in ["Building a Cloud Computing Service: An Introduction to the Cloud"](https://books.google.com/books?id=RHBWBQAAQBAJ&lpg=PA46&ots=K3Ax-hLlZg&dq=btbytes.github.io&pg=PA46#v=onepage&q=btbytes.github.io&f=false).

![](images/pyofc2-book.png)

<a href="index.html#programming" class="tag programming">programming</a> 
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
1. Start with a `README.md` in the project, even if it is a single file project.
1. I always use `virtualenv`; Pipenv is a quick way to spin one up in the development environments.
1. Always capture the dependencies in `requirements.txt`, unless I'm writing a setup.py
1. Writing a `setup.py` file is a great idea, and I should do it more often.
1. I always write a `Makefile`.
1. For Python projects, the common "targets" are -- `deps` (for creating venvs and installing package dependencies), `package` (for packaging into tarballs and wheels) and `test` to run the test suite.
1. The `Makefile` serves as contextual memory.
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
1. I always write "dunder main"(`__main__`), unless its a throw away script (or a would've-been-a-bash-script script).
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

## Archive
<dl><dt>2020</dt>
<dd><p><a href="2020-05-05-02-bari.html">Just-what-you-need blogging with bari
</a> <date style="float:right;">2020-05-05</date></p></dd><dd><p><a href="2020-05-05-01-golang-hash-builds.html">Building Go Programs with Source File Hash baked in
</a> <date style="float:right;">2020-05-05</date></p></dd><dd><p><a href="2020-05-02-01-quip.html">Quip
</a> <date style="float:right;">2020-05-02</date></p></dd><dd><p><a href="2020-05-01-01-interest-calculation.html">A worked exmaple of - A persian folk method of figuring interest
</a> <date style="float:right;">2020-05-01</date></p></dd><dd><p><a href="2020-04-29-pipx.html">pipx is like brew for python applications
</a> <date style="float:right;">2020-04-29</date></p></dd><dd><p><a href="2020-04-29-courier.html">Courier is a nice monospace font
</a> <date style="float:right;">2020-04-29</date></p></dd><dd><p><a href="2020-04-29-conwayslaw.html">Conway's law
</a> <date style="float:right;">2020-04-29</date></p></dd></dl>
## Tags
<dl><dt><span id="computing" class="tagged">computing</span></dt><dd><p><a href="2020-04-29-conwayslaw.html">Conway's law</a><date style="float:right;">2020-04-29</date></p></dd> <dt><span id="fonts" class="tagged">fonts</span></dt><dd><p><a href="2020-04-29-courier.html">Courier is a nice monospace font</a><date style="float:right;">2020-04-29</date></p></dd> <dt><span id="golang" class="tagged">golang</span></dt><dd><p><a href="2020-05-05-01-golang-hash-builds.html">Building Go Programs with Source File Hash baked in</a><date style="float:right;">2020-05-05</date></p></dd> <dd><p><a href="2020-05-08-01-go-third-party-packages.html">Notes to self: How to use Go Third Party Packages</a><date style="float:right;">2020-05-08</date></p></dd> <dt><span id="interesting" class="tagged">interesting</span></dt><dd><p><a href="2020-05-12-01-notes.html">A few interesting things</a><date style="float:right;">2020-05-12</date></p></dd> <dt><span id="mathematics" class="tagged">mathematics</span></dt><dd><p><a href="2020-05-01-01-interest-calculation.html">A worked exmaple of - A persian folk method of figuring interest</a><date style="float:right;">2020-05-01</date></p></dd> <dt><span id="programming" class="tagged">programming</span></dt><dd><p><a href="2020-05-06-04-codespaces.html">github codespaces</a><date style="float:right;">2020-05-06</date></p></dd> <dd><p><a href="2020-05-07-02-code-in-books.html">My code in books</a><date style="float:right;">2020-05-07</date></p></dd> <dt><span id="python" class="tagged">python</span></dt><dd><p><a href="2020-04-29-pipx.html">pipx is like brew for python applications</a><date style="float:right;">2020-04-29</date></p></dd> <dd><p><a href="2020-05-06-06-happy-python.html">My Happy Python Workflow</a><date style="float:right;">2020-05-06</date></p></dd> <dt><span id="software" class="tagged">software</span></dt><dd><p><a href="2020-05-02-01-quip.html">Quip</a><date style="float:right;">2020-05-02</date></p></dd> </dl>

