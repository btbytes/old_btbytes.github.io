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

<a href="tags.html#mathematics" class="tag">mathematics</a> 
</div>
<div class="post"><date>2020-04-29</date>
[pipx is like brew for python applications
](2020-04-29-pipx.html)

<https://pypi.org/project/pipx/>

also similar to how cargo works for rust.

<a href="tags.html#python" class="tag">python</a> 

</div>
<div class="post"><date>2020-04-29</date>
[Courier is a nice monospace font
](2020-04-29-courier.html)

See [this man page](https://sveinbjorn.org/files/manpages/platypus.man.html)

<a href="tags.html#fonts" class="tag">fonts</a> 
</div>
<div class="post"><date>2020-04-29</date>
[Conway's law
](2020-04-29-conwayslaw.html)

named after (not John H Conway of game of life fame) programmer [Mel Conway](http://www.melconway.com/Home/Conways_Law.html) which states that:

> Any organization that designs a system (defined broadly) will produce a design whose structure is a copy of the organization's communication structure.

<a href="tags.html#computing" class="tag">computing</a> 
</div>

## Tags


**computing**: [Conway's law](2020-04-29-conwayslaw.html)

**fonts**: [Courier is a nice monospace font](2020-04-29-courier.html)

**mathematics**: [A worked exmaple of - A persian folk method of figuring interest](2020-05-01-01-interest-calculation.html)

**python**: [pipx is like brew for python applications](2020-04-29-pipx.html)