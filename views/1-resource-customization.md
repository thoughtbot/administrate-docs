# Registering Resources

Every Administrate resource corresponds to a Rails model.
Before creating a resource you must first create a Rails model for it.

## Create a Resource

The basic command for creating a resource is

```
rails generate administrate:resource User
```

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

The statement `user.string :name` tells Administrate
that a user's name should be treated as a string.
Administrate will see to that by displaying it in a `<span>`
on the index and show pages, and by creating a text field for it in forms.

By defining the type of each of the resource's attributes,
you're telling Administrate how to display it on each page of the dashboard.

Common types and their behaviors:

| adapter  | core? | index page        | show page         | forms          |
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

It's possible to [define custom attribute handlers],
but in most cases you'll be able to find a gem to do the work for you.

[define custom attribute handlers]: 2-1-custom-attribute-adapters.md

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
