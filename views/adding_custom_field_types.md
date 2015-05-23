# Adding Custom Field Types

If your application deals with a nonstandard data type,
you can create an `Administrate::Field` object to help display
the custom data type across the dashboard.

`Administrate::Field` objects consist of two parts:
a Ruby class and associated views.

For example, let's create a `Field` that displays [Gravatars] based on an email.

[Gravatars]: https://gravatar.com/

First, we'll create a subclass of `Administrate::Field::Base`,
with a helper method that will calculate the Gravatar URL for us.

```ruby
# lib/administrate/fields/gravatar.rb
# (location of the file does not matter)
require 'digest/md5'

module Administrate
  module Field
    class Gravatar < Administrate::Field::Base
      def gravatar_url
        email_address = params[:email].downcase
        hash = Digest::MD5.hexdigest(email_address)
        "http://www.gravatar.com/avatar/#{hash}"
      end
    end
  end
end
```

Next, we'll create partials to define
how the field will be defined on each page.
The easiest way to create the partials is with a generator:

```bash
rails generate administrate:views:field gravatar
```

After this, the process is the same as outlined
on the [Customizing Attribute Partials] page.
The generator creates three files:

- `app/view/fields/form/_float.html.erb`
- `app/view/fields/index/_float.html.erb`
- `app/view/fields/show/_float.html.erb`

Let's customize the `show` page. By default, it looks like:

```eruby
<%= gravatar.data %>
```

Since we want to display an image, we can change it to:

```eruby
<%= image_tag gravatar.data %>
```

You can customize the other generated partials in the same way.

[Customizing Attribute Partials]: /customizing_attribute_partials
