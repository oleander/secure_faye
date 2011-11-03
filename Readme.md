# Secure faye

A secure faye server and client.

## Disclaimer

*Secure faye* isn't tested (enough) nor stable, and should therefore not be used in production.

## Client

``` ruby
SecureFaye::Connect.new.message("m").token("my-token").server("http://0.0.0.0:9292/faye").channel("c").send!
```

## Server

Start server by creating a file called `config.ru` using this code.

``` ruby
require "secure_faye/server"
unless ENV["FAYE_TOKEN"]
  abort("You must specify a FAYE_TOKEN.")
end

run SecureFaye::Server.new.instance
```

Start the server by running `FAYE_TOKEN=my-token rackup config.ru -s thin -E production`.

## Not enough?

If this isn't enough, try Ryan Bate's [Private Pub](https://github.com/ryanb/private_pub) gem.

## How to install

*Secure faye* isn't on Rubygems *yet*, but you can easily require it in you Gemfile.

``` ruby
gem "secure_faye", git: "git@github.com:oleander/secure_faye.git"
```

## Requirements

*Secure faye* is tested in *OS X 10.7.2* using Ruby *1.9.2*.

## License

*Secure faye* is released under the *MIT license*.