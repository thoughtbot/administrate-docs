# Customizing Dashboards

In order to customize which attributes get displayed for each resource,
use the dashboard generator:

```bash
$ rails generate administrate:dashboard customer
```

This will generate a file at `app/dashboards/customer_dashboard.rb` – edit away!

```ruby
# app/dashboards/customer_dashboard.rb
require "administrate/dashboard/base"

# `CustomerDashboard`
# Public API
#
# Dashboard objects specify which of a model's attributes
# get displayed on different sections of the dashboard.
class CustomerDashboard < Administrate::Dashboard::Base

  # `#attribute_types`
  # returns a hash describing the type of each of the model's attributes.
  #
  # Each key is one of the resource's attributes,
  # and each of the values is the type of that attribute.
  #
  # There are a number of options for attribute types:
  # - `belongs_to`
  # - `datetime`
  # - `has_many`
  # - `integer`
  # - `string`
  # - `float`
  #
  # Each attribute type is backed by an `Administrate::Field` object.
  # You shouldn't need to edit `Field` objects,
  # but if you need to represent an attribute of a non-standard data type,
  # you may want to implement your own subclass of `Administrate::Field::Base`.
  def attribute_types
    {
      id: :integer,
      name: :string,
      email: :string,
      created_at: :datetime,
      updated_at: :datetime,
      orders: :has_many,
    }
  end

  # `#index_page_attributes`
  # returns an array of attributes that will be displayed on the
  # resource's index page
  def index_page_attributes
    attributes
  end

  # `#show_page_attributes`
  # returns an array of attributes that will be displayed on the
  # resource's show page
  def show_page_attributes
    attributes
  end

  # `#form_attributes`
  # returns an array of attributes that will be displayed on the
  # resource's forms (new and edit pages)
  #
  # Make sure not to return any read-only attributes from this method,
  # or you'll get an error when updating any of the resources.
  def form_attributes
    attributes - read_only_attributes
  end

  private

  # This method is not used directly by Administrate,
  # and you may remove it if you wish.
  def attributes
    [
      :id,
      :name,
      :email,
      :created_at,
      :updated_at,
      :orders,
    ]
  end

  # This method is not used directly by Administrate,
  # and you may remove it if you wish.
  def read_only_attributes
    [
      :id,
      :created_at,
      :updated_at,
    ]
  end
end
```
