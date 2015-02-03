# Installation

Administrate is a Ruby Gem.

```ruby
gem 'administrate'
```

More accurately, it's a [Rails Engine](http://guides.rubyonrails.org/engines.html)
that can be injected into your existing Ruby on Rails application.

## Setting up Administrate

After installing the gem, you need to run the generator.

```sh
rails generate administrate:install
```

Now, restart the server:

```sh
rails server
```

and visit the dashboard at `localhost:3000/admin`
