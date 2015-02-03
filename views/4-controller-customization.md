# Customizing Controllers

When you need to customize controller actions,
Administrate makes it easy with a simple generator:

```bash
rails generate administrate:controller User
# Generates app/controllers/admin/users_controller.rb
```

After generating the controller,
it's generally advisable to
[generate the corresponding views as well][generate-views].
Generating both the controller and views together
makes it easier to develop without having to conform
to the Administrate controller/view API.

[generate-views]: 3-page-customization.md
