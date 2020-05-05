Building Go Programs with Source File Hash baked in


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

