# Registering Resources

Every Administrate resource corresponds to a Rails model.
Before creating a resource you must first create a Rails model for it.

## Create a Resource

The basic command for creating a resource is
`rails g administrate:resource User`.
The generator will produce an empty `app/admin/user.rb` file like so:

```ruby
Administrate.register User do |user|
end
```

In order to display the resource properly,
you'll need to specify the attributes of the resource:

```ruby
Administrate.register User do |user|
  user.string :name, index: true
  user.email :email, index: true
  user.date :date_of_birth
  # `.address` provided by the `administrate-address` gem
  user.address :address
  user.password :password, edit: false
  user.has_many :billing_plan
end
```

By defining the type of each of the resource's attributes,
you're telling Administrate how to display it on each page of the dashboard.

Common types and their behaviors:

| adapter  | core? | index             | show              | forms          |
| -------- | ----- | ----------------- | ----------------- | -------------- |
| string   | yes   | plain text        | plain text        | text field     |
| text     | yes   | truncated text    | full text         | text area      |
| email    | yes   | email link        | email link        | text field     |
| date     | yes   | formatted date    | formatted date    | date picker    |
| password | yes   | hidden            | hidden            | password field |
| has_one  | yes   | linked item title | linked item title | select box     |
| has_many | yes   | count             | linked item list  | dunno yet      |
| image    | no    | image tag         | image tag         | file upload    |
| address  | no    | formatted address | formatted address | address fields |

## Handling Custom Attributes

If your model has an attribute that's not handled by Administrate
(say, for example, geoJSON data),
it's easy to write your own adapter for it.

Attribute adapters are simple classes that define how to present an attribute
in Administrate's interfaces.

To write your own, simply implement the class...

    class GeoJsonAdapter < Administrate::Adapters::TextAdapter
      def render
    <<-HTML
      <div class="geojson" data-geometry=#{attribute_value}></div>
      <script src="/scripts/render_geojson.js" />
    HTML
      end

      # for the form field, this adapter will inherit behavior from TextAdapter,
      # and display a text area.
    end

... register your adapter with Administrate ...

    # config/initializers/administrate.rb
    Administrate::Adapters.register(:geometry, GeoJsonAdapter)

... and then use the adapter in your resources!

    Administrate.register Neighborhood do |neighborhood|
      neighborhood.string :name
      neighborhood.geometry :coordinates
    end

### Key Attributes

You can specify a key attribute on a model:

```ruby
Administrate.register User do |user|
  user.key :name

  user.string :name, index: true
  # ...
end
```

Key attributes will be used as identifiers for the resource
throughout the admin dashboard.

On a resource's index page,
the key attribute will be a link to the show page.
