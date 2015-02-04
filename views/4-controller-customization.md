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

The generated controller will look something like:

```ruby
class Admin::UsersController < Administrate::BaseController
  before_filter :authenticate

  def index
    @resources = resource_class.all
  end

  def show
    @resource = resource_class.find(params[:id])
  end

  # ...
end
```

But, once again, you're free to change it up however you like.
It acts just like any other Rails controller.

    class Admin::ProjectsController < Administrate::BaseController
      before_filter :omniauth_with_github
      before_filter :set_resource, only: [:show, :edit, :update, :destroy]

      def index
        @resources = Project.where(owner: current_user)
      end

      # Undefined controller actions are inherited
      # from Administrate::BaseController

      def set_resource
        @resource = Project.find(params[:id])
        unless @resource.owner == current_user
          raise ActiveRecord::RecordNotFound
        end
      end
    end

[generate-views]: 3-page-customization.md
