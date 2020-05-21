Thread reader app browser bookmark

[Thread reader](https://threadreaderapp.com/) is a website that allows you to read twitter threads as a single page, example -- [this thread on Acropolis of Athens](https://threadreaderapp.com/thread/1262700517714788354.html).

When I want to search for a twitter thread on their website or crete a new page of a twitter thread, I have to copy the top tweet of the thread, head over to <https://threadreaderapp.com/> and paste the URL in the search box.

This is something that should be automated, so I created a bookmark that you can drag to the bookmarks toolbar. When you see a twitter thread, hit the bookmark, to be taken to the thread's page on Thread reader.

Drag this bookmark to your browser's bookmark toolbar &raquo; <em><a href="javascript:q=location.href;void(t=open('https://threadreaderapp.com/search?q='+encodeURIComponent(q)));">Thread Reader</a></em>


◊javascript
