# Customizing attribute partials

Occasionally you might want to change how specific types of attributes appear
across all dashboards.
For example, you might want all `float` values to round to three decimal points.

To get started, run the appropriate rails generator:

```bash
rails generate administrate:views:field float
```

This will generate three files:

- `app/view/fields/form/_float.html.erb`
- `app/view/fields/index/_float.html.erb`
- `app/view/fields/show/_float.html.erb`

The generated templates will look like:

```eruby
<%= float.data %>
```

The templates all have access to an `Administrate::Field` variable
named after the field type.
In this case, the variable is an instance of `Administrate::Field::Float`,
named `float`.

Changing floats to display to three decimal places might look like this:

```eruby
<%= float.data.round(3) %>
```

If you only want to change how an attribute appears
on a single page (e.g. `index`), you may delete the unnecessary templates.
