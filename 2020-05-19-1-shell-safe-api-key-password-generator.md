Shell Safe API key / Password Generator

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

So, I wrote this little script, which probably has 1:30::code:documentation ration ;)

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
    -s --source a string of characters to use

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