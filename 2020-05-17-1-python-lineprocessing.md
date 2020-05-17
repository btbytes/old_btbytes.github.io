Python Line Processing Pattern


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

The defensive way to handle this is: put the source files in a git repo, so that you can always revert the changes back.

Alternatively, you can write the changed contents to a temporary file, and rename that file to the original file if there were no errors. Essentially.

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


◊python