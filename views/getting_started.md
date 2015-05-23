# Getting Started

Administrate is released as a Ruby gem, and can be installed on Rails
applications version 4.2 or greater.

Add the following to your Gemfile:

```ruby
# Gemfile
gem "administrate"
```

Re-bundle, then run the installer:

```bash
$ rails generate administrate:install
```

The installer creates a few files:

- `app/controllers/admin/dashboard_controller.rb`
- `app/dashboards/dashboard_manifest.rb`

The `DashboardController` can be customized to add authentication logic,
authorization, pagination, or other controller-level concerns.

`DashboardManifest` can be customized to show or hide
different models on the dashboard.

The installer will also add a line to your `config/routes.rb` file:

```ruby
  DashboardManifest.new.dashboards.each do |dashboard_resource|
    resources dashboard_resource
  end

  root controller: DashboardManifest.new.root_dashboard, action: :index
```

Visit http://localhost:3000/admin to see your new dashboards in action.

Generated `DashboardController`:

```ruby
# app/controllers/admin/dashboard_controller.rb

# `Admin::DashboardController`
# Public API
#
# All Administrate controllers inherit from this `DashboardController`,
# making it the ideal place to put authentication logic or other
# `before_filter`s.
#
# If you want to add pagination, overwrite the RESTful controller actions.
# For more information, see [TODO].
class Admin::DashboardController < ApplicationController
  include Adminsitrate::RestActions

  before_filter :authenticate_admin

  def authenticate_admin
    # TODO Add authentication logic here.
  end
end
```

Generated `DashboardManifest`:

```ruby
# app/dashboards/dashboard_manifest.rb

# `DashboardManifest`
# Public API
#
# DashboardManifest provides some information about the dashboards displayed
# by Administrate.
class DashboardManifest
  # `#dashboards`
  # Returns a list of dashboards to display in the side navigation menu
  #
  # These are all of the rails models that we found in your database
  # at the time you installed Administrate.
  #
  # To show or hide dashboards, add or remove the model name from this list.
  # Dashboards returned from this method must be Rails models for Administrate
  # to work correctly.
  def dashboards
    [
      :customers,
      :line_items,
      :orders,
      :products,
    ]
  end

  # `#root_dashboard`
  # Returns the name of the dashboard that will be displayed
  # at "http://your_site.com/admin"
  #
  # This dashboard will likely be the first page that admins see
  # when they log into the dashboard.
  def root_dashboard
    dashboards.first
  end
end
```

