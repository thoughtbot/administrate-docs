# Customizing page views

In order to change the appearance of any page,
you can provide custom Rails views:

```bash
# Note: not implemented yet, but you can still override the view manually
rails generate administrate:views:show
```

... will generate `app/views/admin/dashboards/show.html.erb`.

Any changes to this template file will affect the show pages for each resource.
Similar generators exist for `index` and `form` templates.

In order to change a dashboard page for a single type of resource,
there are more specific template generators available:

```bash
# Note: not implemented yet, but you can still override the view manually
rails generate administrate:views:show customer
```

... will generate `app/views/admin/customers/show.html.erb`.

Any changes to this template file
will *only* affect the show pages for customers,
and leave the show pages for other resources unchanged.
Similar generators exist for `index` and `form` templates.
