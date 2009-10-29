Speedgeeks LA Demo App
======================

This is the demo app I used for my Heroku presentation at Speedgeeks LA on October 26th 2009.

There are three little demos here:

* HTTP Caching with Varnish
* Memory caching with Memcached
* Horizontal HTTP Scaling with Dynos

You can deploy this app to Heroku and do your own testing:

    heroku create
    git push heroku master
    
The app is also running at http://speedgeeks.heroku.com

1. HTTP Caching
---------------

The example here is a simple page that reads an image from disk, applies some transformations with Imagemagick, and finally displays the result.

The slow version of the page will be at http://appname.heroku.com/varnish_slow

The fast version of the page that utilizes Varnish with a far-future expires head will be at http://appname.heroku.com/varnish_fast

You can check out the code differences by comparing:

* app/controllers/varnish_fast_controller.rb
* app/controllers/varnish_slow_controller.rb

If you want to run [ab](http://httpd.apache.org/docs/2.0/programs/ab.html) to compare, you can run something like "ab -c1 -t20 http://url" to see how many requests you can squeeze out in 20 seconds.

2. Memory Caching
------------------

This one shows the benefit of using memcached with Heroku. The example is a page that renders a list of RSS feed items stored in a database.

The uncached version of the page is at http://appname.heroku.com/memcached_slow and the cached version is at http://appname.heroku.com/memcached_slow.

To compare code, look at the views in

* app/views/memcached_slow/feeds.html.erb
* app/views/memcached_fast/cached_partial.html.erb

To use memcached on Heroku in your own app, you'll need to add the memcached addon:

    heroku addons:add memcached
    
Feel free to email me, if you're having trouble with this.


3. Horizontal HTTP Scaling
--------------------------

By default, every Heroku app is running on one single-threaded app server process called a Dyno. Even though a single Dyno can be quite powerful (especially when combined with appropriate caching), higher concurrency is needed when the dynamic part of your gets serious HTTP traffic.

Here's the intentionally slow page I made to test: http://appname.heroku.com/dynos

Once we put this page under load, the app server will start to build a backlog of requests to process. Response times get continuously slower as the queue grows longer, and eventually you'll start losing requests.

Try this to simulate load for 20 seconds: "ab -c20 -t20 http://url".

Here, you have 20 concurrent requests hitting your app, but only one single-threaded process to serve them. The results should look pretty bad.

On Heroku, you can quickly scale horizontally to increase your HTTP processing capability. To scale up to 10 app server processes, simply do:

    heroku dynos 10
    
... and re-run the benchmark. Note that you will need a verified Heroku account to do this as additional Dynos are priced at $0.05/hour. Email me if you need help getting started with additional dynos.

Thanks!

/Morten



