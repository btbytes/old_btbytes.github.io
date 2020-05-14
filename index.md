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

## Archive
<dl><dt>2020</dt>
<dd><p><a href="2020-05-06-06-happy-python.html">My Happy Python Workflow
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
<dl><dt><span id="computing" class="tagged">computing</span></dt><dd><p><a href="2020-04-29-conwayslaw.html">Conway's law</a><date style="float:right;">2020-04-29</date></p></dd> <dt><span id="fonts" class="tagged">fonts</span></dt><dd><p><a href="2020-04-29-courier.html">Courier is a nice monospace font</a><date style="float:right;">2020-04-29</date></p></dd> <dt><span id="golang" class="tagged">golang</span></dt><dd><p><a href="2020-05-05-01-golang-hash-builds.html">Building Go Programs with Source File Hash baked in</a><date style="float:right;">2020-05-05</date></p></dd> <dd><p><a href="2020-05-08-01-go-third-party-packages.html">Notes to self: How to use Go Third Party Packages</a><date style="float:right;">2020-05-08</date></p></dd> <dt><span id="interesting" class="tagged">interesting</span></dt><dd><p><a href="2020-05-12-01-notes.html">A few interesting things</a><date style="float:right;">2020-05-12</date></p></dd> <dd><p><a href="2020-05-13-2-notes.html">Some interesting things</a><date style="float:right;">2020-05-13</date></p></dd> <dt><span id="mathematics" class="tagged">mathematics</span></dt><dd><p><a href="2020-05-01-01-interest-calculation.html">A worked exmaple of - A persian folk method of figuring interest</a><date style="float:right;">2020-05-01</date></p></dd> <dt><span id="programming" class="tagged">programming</span></dt><dd><p><a href="2020-05-06-04-codespaces.html">github codespaces</a><date style="float:right;">2020-05-06</date></p></dd> <dd><p><a href="2020-05-07-02-code-in-books.html">My code in books</a><date style="float:right;">2020-05-07</date></p></dd> <dd><p><a href="2020-05-14-1-getting-out-of-goldilocks-zone.html">Getting Out of the Programming Goldilocks Zone</a><date style="float:right;">2020-05-14</date></p></dd> <dt><span id="python" class="tagged">python</span></dt><dd><p><a href="2020-04-29-pipx.html">pipx is like brew for python applications</a><date style="float:right;">2020-04-29</date></p></dd> <dd><p><a href="2020-05-06-06-happy-python.html">My Happy Python Workflow</a><date style="float:right;">2020-05-06</date></p></dd> <dt><span id="software" class="tagged">software</span></dt><dd><p><a href="2020-05-02-01-quip.html">Quip</a><date style="float:right;">2020-05-02</date></p></dd> </dl>

