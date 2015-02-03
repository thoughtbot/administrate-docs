# General Configuration

You can configure Administrate settings in `config/initializers/active_admin.rb`.
Here are a few common configurations:

## Site Title Options

Every page has what's called the site title on the left side of the menu bar.
If you want, you can customize it.

```ruby
config.site_title       = "My Admin Site"
config.site_title_link  = "/"
config.site_title_image = "site_image.png"
config.site_title_image = "http://www.google.com/images/logos/google_logo_41.png"
```

## Internationalization (I18n)

To translate Administrate to a new language
or customize an existing translation,
run the translation generator:

```bash
rails generate administrate:translations
```

We welcome new/updated translations,
so feel free to [contribute]!

[contribute]: https://github.com/thoughtbot/administrate/blob/master/CONTRIBUTING.md
