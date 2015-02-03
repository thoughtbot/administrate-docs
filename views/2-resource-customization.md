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

| adapter  | index             | show              | forms          |
| -------- | ----------------- | ----------------- | -------------- |
| string   | plain text        | plain text        | text field     |
| email    | email link        | email link        | text field     |
| date     | formatted date    | formatted date    | date picker    |
| address  | formatted address | formatted address | address fields |
| password | hidden            | hidden            | password field |
| has_one  | linked item title | linked item title | select box     |
| has_many | count             | linked item list  | dunno yet      |
