My Happy Python Workflow

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
1. I like providing a CLI interface to my scripts; I use `argparse` often, even if it is to provide basic "--help".
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

◊python
