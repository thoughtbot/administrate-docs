# Customizing Pages

If you'd like more flexibility for displaying your information
than what Administrate provides,
it's easy to create your own templates.

## Generators

Administrate ships with generators for each of its templates:

```bash
rails generate administrate:views:index User
# Generates app/views/administrate/users/index.html.erb

rails generate administrate:views:show User
# Generates app/views/administrate/users/show.html.erb

rails generate administrate:views:edit User
# Generates app/views/administrate/users/edit.html.erb
# Generates app/views/administrate/users/_form.html.erb

rails generate administrate:views:edit User
# Generates app/views/administrate/users/new.html.erb
# Generates app/views/administrate/users/_form.html.erb

rails generate administrate:views User
# Generates all of the above
```

The `show`, `edit`, and `create` templates will be provided with a variable
called `@resource`, while `index` will have access to `@resources`.

You can write your views in the typical Rails fashion,
using whatever templating language you like (ERb, Haml, Slim, etc).
