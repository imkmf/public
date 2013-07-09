# Public

Public is a Ruby command-line tool for quickly copying files to your public
[Dropbox](https://dropbox.com) folder.

## Installation

Add this line to your application's Gemfile:

    gem 'public'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install public

## Usage

Run the command by itself to generate a configuration file:

```
> public
```

This will create `~/.public_gem`, where you can set your Dropbox ID:

```
dropbox_user_id: CHANGE_ME
```

Your Dropbox ID can be found in a URL from your public folder:

```
https://dl.dropboxusercontent.com/u/YOUR_ID/foobar
```

Once you change this, you can then run `public` with a file (or files) as the
argument to copy them to your Public folder **and** your clipboard.

```
> public foobar.txt
> public barbaz.txt foobaz.txt
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
