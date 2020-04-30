bari -- a *mere* static site generator.

Requirements:

* You can read code (make & Python)
* You know what Pandoc is and know how to use it
* Your system has make, Python and Pandoc installed
* You can take these opinionated set of choices and modify it to your taste

Add a new blog post:

	cat > `date +%Y-%m-%d-01.md` << EOF
	first line is treated as title
	the rest of the post.
	fin.
	EOF

A file with 'YYYY-mm-dd' prefix is treated as a blog post. Anything after the 'YYYY-mm-dd' part is ignored by the program.

To build the blog posts, (home page) index.html & (archive page) archive.html, run `make`.

If you would like to add your name to each post, edit the Makefile and add `--metadata author="Your Name"` to the build step.

You can add a page (which is not a post), by creating a `anyfile.md` (ending with `.md` extension).

A page with title, date and author would look like this (following Pandoc's metadata header format):

	% Grand theories of the universe
	% 2020-04-28
	% A U Thor

	Herein I propose ...


Explanation of the files:

* `Makefile` -- main "script" to drive the compilation
* `style.css` -- style for the HTML files (uses [water.css](https://kognise.github.io/water.css/))
* `index.py` -- script to generate the home page
* `archive.py` -- script to generate the archive page
* `inc.before` -- If you want to add more links (eg: about), this is where you add it.
* `inc.after` -- If you want to add a copyright to the footer, this is where you add it.

----

What's the reasoning behind the name - bari?

bari (ಬರಿ) means *write* and *mere* in Kannada. So, you can *bari* your posts using *bari* markdown and generate your blog with *bari* pandoc, make and python.
