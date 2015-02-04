# What's Administrate do?

Great question.

Administrate is an admin dashboard for Rails apps.
Once you set it up for your project,
it gives you a window into all the data that lives in your app.

- It lets you see users who signed up recently.
- It lets you delete accounts when you can't stand the trolling anymore.
- It lets you update your blog posts and announcements.
- It lets you list new items so you can sell them and get that $$$.
- It doesn't do your laundry for you.

![admin-dashboard](bostonio-admin.gif)

## Dashboard Structure

The admin dashboard is made up of resources.
You can see them in the left navigation bar above.
Each resource has three different pages:

- an "index" page, which lists all of the resources in the database.
- a "show" page, which goes into more detail about a single resource.
- an "edit" page, which – you guessed it – lets you edit the resource.
