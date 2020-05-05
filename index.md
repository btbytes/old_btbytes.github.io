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

1. static typing
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

</div>
<div class="post"><date>2020-05-02</date>
[Quip
](2020-05-02-01-quip.html)

[Quip](https://quip.com/) from Salesforce looks like "Jupyter notebooks" for sales and service workers.

I came across this site while reading [The Best Medium-Hard Data Analyst SQL Interview Questions  ](https://quip.com/2gwZArKuWk7W). Looking at this document and the "tour", it appears to be a turbo charged "Word" / Google Docs more than full fledged data analytics platform.

I have never used "Sharepoint", so I can't compare it to that.

There is no "free tier" to try out.

<a href="index.html#software" class="tag software">software</a> 
</div>
<div class="post"><date>2020-05-01</date>
[A worked exmaple of - A persian folk method of figuring interest
](2020-05-01-01-interest-calculation.html)

I found the paper ["A persian folk method of figuring interest"](https://twitter.com/docmilanfar/status/1254535223733186560) via Dr Peyman Milanfar on twitter, where he described this method as the one deployed by his father to quickly calculate the monthly payments on a home loan.

I thought it is a good idea to do a workout of the formula myself so that I can remember it:

For this demonstration, let's consider a loan amount (Principal) of $10,000 for a period of 4 years(48 months) at an interest rate of 7% pa.

Step 1: calculate the interest amount over the loan period

	Interest = 0.5 * Principal * Number of years * Annual Interest Rate
	Interest = 0.5 * 10000 * 4 * 0.07
	Interest = 1400.0

Step 2: calculate the Monthly Payment

	Monthly Payment = (Principal + Interest) / (Number of Months)
	Monthly Payment = (10000 + 1400.0) / 48
	Monthly Payment = 237.5


Applying the actual mortagage formula for Monthly Payment (`C`) is:

	C = r * (1 + r )^N * P / ((1 + r )^N - 1)

where,

	r = monthly interest rate => 0.07 / 12
	N = total number of months => 48
	P = principal => 10,000

therefore we have,

	C = 239.46

The shortcut method is a very good approximation of the true calculation, and it is made of simple arithmetic operations available on any handheld calculator / phone.

This is surprisingly handy when you are at a negotiating table (eg: Car purchase). This is the kind of mentral tricks that are really useful in the "real world". Try it out.

----

Update: The original paper is a page long, so I put the image here:

![](https://i.imgur.com/wTzH0Cy.png)

Credit: [Dr Peyman Milanfar](https://twitter.com/docmilanfar/status/1254535223733186560).


<a href="index.html#mathematics" class="tag mathematics">mathematics</a> 
</div>
<div class="post"><date>2020-04-29</date>
[pipx is like brew for python applications
](2020-04-29-pipx.html)

<https://pypi.org/project/pipx/>

also similar to how cargo works for rust.

<a href="index.html#python" class="tag python">python</a> 

</div>
<div class="post"><date>2020-04-29</date>
[Courier is a nice monospace font
](2020-04-29-courier.html)

See [this man page](https://sveinbjorn.org/files/manpages/platypus.man.html)

<a href="index.html#fonts" class="tag fonts">fonts</a> 
</div>

## Archive
### 2020
<date>2020-05-05</date> [Building Go Programs with Source File Hash baked in
](2020-05-05-01-golang-hash-builds.html)


## Tags


<span id="computing" class="tagged">computing</span>: ◊[Conway's law](2020-04-29-conwayslaw.html)

<span id="fonts" class="tagged">fonts</span>: ◊[Courier is a nice monospace font](2020-04-29-courier.html)

<span id="mathematics" class="tagged">mathematics</span>: ◊[A worked exmaple of - A persian folk method of figuring interest](2020-05-01-01-interest-calculation.html)

<span id="python" class="tagged">python</span>: ◊[pipx is like brew for python applications](2020-04-29-pipx.html)

<span id="software" class="tagged">software</span>: ◊[Quip](2020-05-02-01-quip.html)