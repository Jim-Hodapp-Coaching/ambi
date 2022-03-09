# Ambi

Ambi is a web service that presents a Phoenix LiveView frontend to display real time ambient room conditions
like temperature, humidity, pressure, air quality, dust concentration, etc. It uses the Bulma CSS framework
for some attractive base UI components and Phoenix LiveView to push updates to the client with no page
refresh needed.

What Ambi's web-based UI looks like as of December, 2021

<img width="1568" alt="Screen Shot 2021-07-06 at 10 00 20 PM" src="https://user-images.githubusercontent.com/3219120/124693833-b2764e80-dea5-11eb-8e3c-36dfb6ed2d48.png">

## Set Up Git Hooks

The Ambi repository makes use of several Git hooks to ensure that code quality standards are met and consistent. To automatically configure these hooks for your local workspace, you can run the following:
```bash
./scripts/create-git-hooks
```

This will create symlinks to the Git hooks, preserving any hooks that you may have already configured.

## Install Postgresql

For macOS the [Postgreql.app](https://postgresapp.com/) is the easiest and best option for your local development machine. Version 12
is the most tested version of the DB at the time of writing.

For Linux, use the system package manager to install Postgresql@12

Keep the local db instance running on port 5432 and make sure to set up a postgres user/password.

## Install Node

Make sure to install [Node.js](https://nodejs.org/en/download/package-manager/), version 14 is the most tested version at the time of writing.
If you have multiple versions of Node installed, make sure that version 14 is run when running `node -v` from a command line.

E.g.:
```
$ node -v
v14.18.2
```

## Starting the Ambi backend (Elixir)

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Running in a Docker container

To run ambi in a Docker container along with another one for Postgresql 11:

 * Build the web/DB containers: `docker-compose build`
 * Create the DB in the DB container: `docker-compose run web mix ecto.create`
 * Run the Ecto DB migrations inside the web container: `docker-compose run web mix ecto.migrate`
 * Run the application in the container: `docker-compose up`

 Note: this basic Docker setup was done following this [guide](https://dev.to/hlappa/development-environment-for-elixir-phoenix-with-docker-and-docker-compose-2g17)

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

## License

This project is licensed under the [BSD + Patent license](https://opensource.org/licenses/BSDplusPatent).

Any submissions to this project (e.g. as Pull Requests) must be made available under these terms.
