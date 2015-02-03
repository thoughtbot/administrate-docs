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

You can write your views in the typical Rails fashion,
using whatever templating language you like (ERb, Haml, Slim, etc).

The `show`, `edit`, and `create` templates will be provided with
a variable called `@resource`,
while `index` will have the variable `@resources` (plural).

In addition, each view will have access to a variable called `@presenter`,
which is used as a helper by Administrate.
You probably won't need to use it yourself.

### Example

The generated view for an index page will look something like this:

    <h1><%= @presenter.plural_class_name.titleize %></h1>

    <div class="add-new">
      <%= link_to @presenter.new_path do %>
        Add new
      <% end %>
    </div>

    <table>
      <thead><tr>
        <% @presenter.attribute_names(:index).each do |attr_name| %>
          <th><%= attr_name %></th>
        <% end %>
      </tr></thead>

      <tbody>
        <% @resources.each do |resource| %>
          <tr>
            <% @presenter.attributes_for(
                 resource,
                 :index
               ).each do |attr, value| %>
              <td>
                <%= @presenter.render_attribute(
                      attr,
                      value,
                      resource
                    ).html_safe %>
              </td>
            <% end %>
          </tr>
        <% end %>
      </tbody>
    </table>

But you can easily customize it into anything you like,
with the Rails tools you know and love.

    <h1>Our awesome users!</h1>

    <% @resources.each do |resource| %>
      <div class="resource">
        <%= link_to resource.name, admin_resource_path(resource) %>
        <%= # ... %>
      </div>
    <% end %>
