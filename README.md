# Form Intro

## Query strings

The essential piece: add a **query string** onto _any_ URL in your Rails app, e.g.

```
/rock?dessert=Ice cream&color=Orange
```

and watch what happens in your server log when you visit that URL.

Rails parses any query string parameters and puts them into a special Hash called `params`. You have access to `params` in the action.

With that simple fact, combined with the way that HTML forms behave, we can invent ways to make any forms we want work!

## Review form attributes

Remember when we [reverse engineered HTML forms](https://slides.com/raghubetina/04-essential-html-and-css?token=TunUbuP_#/11)? Review and remind yourself what each attribute does — `action`, `id`, `for`, `value`, `type`, `placeholder`, `name`.

## Google Cloud Translate

 - [Google Cloud Translation](https://cloud.google.com/translate)

Here's the crux of using the official gem:

Add the gem to your Gemfile:

```ruby
# /Gemfile
gem "google-cloud-translate"
```

Then `bundle install` and restart your web server.

You now have access to the `Google::Cloud::Translate` class. To use it:

```ruby
gt_client = Google::Cloud::Translate.new({ :version => :v2 })
translation = gt_client.translate("Hello, world!", { :to => "es" })
```

Amazing!

To list all available languages,

```ruby
languages = gt_client.languages("en") # The argument determines what language to list the other language names in
languages.size #=> 104
languages[0].code #=> "af"
languages[0].name #=> "Afrikaans"
```

Read more at the gem docs:

 - [Ruby gem documentation](https://googleapis.dev/ruby/google-cloud-translate/latest/index.html#Using_the_legacy_v2_client)
