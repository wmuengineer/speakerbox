Speakerbox is an app that i'm using as a starting point for all of the background jobs tutorials and examples.

This app is pretty basic with one exception. You need to set-up your aws keys and secrets so your initializers will work.

Here are the special gems to pay attention too:
* gem 'aws-sdk', '~> 1' - version 2 is the most current and since it's a breaking change we're sticking with v1 right now.
* gem 'high_voltage' - tool i'm using for static pages
* gem 'pg' - if you don't have PG installed you'll have problems but you can use sqlite.
