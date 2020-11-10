import glob


outline = '''
<!doctype html>
<head>
  <meta http-equiv="refresh" content="0; URL=https://www.btbytes.com/posts/%s" />
</head>
<body>
  <p>If you are not redirected in five seconds, <a href="https://www.btbytes.com/posts/%s">click here</a>.</p>
</body>
'''

for old in glob.glob('2020*.html'):
	with open(old, 'w') as newf:
		newf.write(outline % (old, old))

