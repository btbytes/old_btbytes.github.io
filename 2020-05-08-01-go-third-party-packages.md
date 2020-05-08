Notes to self: How to use Go Third Party Packages

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

◊golang