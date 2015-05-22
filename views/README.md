# Administrate

A Rails engine that helps you put together a super-flexible admin dashboard.

## Guiding Principles

Administrate is heavily inspired by projects
like [Rails Admin] and [ActiveAdmin],
but aims to provide a better user experience for site admins,
and to be easier for developers to customize.

To do that, we're following a few simple rules:

- No DSLs (domain-specific languages)
- Support the simplest use cases, and let the user override defaults with
  standard tools such as plain Rails controllers and views.
- Break up the library into core components and plugins,
  so each component stays small and easy to maintain.

[Rails Admin]: https://github.com/sferik/rails_admin
[ActiveAdmin]: http://activeadmin.info/
