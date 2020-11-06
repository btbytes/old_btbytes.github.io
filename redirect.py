import glob


outline = '''
<!doctype html>
<head>
  <meta http-equiv="refresh" content="2; URL=https://cortex.btbytes.com/%s" />
</head>
<body>
  <p>If you are not redirected in five seconds, <a href="https://cortex.btbytes.com/%s">click here</a>.</p>
</body>
'''

for old in glob.glob('2020*.html'):
	with open(old, 'w') as newf:
		newf.write(outline % (old, old))

