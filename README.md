# Cafe

## Description

This is a Coffee review application. The idea came from the experience I had with coffee.
Normally I like homemade coffee. Because my experience with outside coffee hasn’t been good.
I decided to came up with the idea that people could post about their coffee and get a reviews for others to see.

## Project Requirements

- Use a Rails API backend with a React frontend.
- Have at least three models on the backend, that include:
  1. at least one one-to-many relationship
  2. at least one many-to-many relationship
  3. full CRUD actions for at least one resource
- Have at least three different client-side routes using React Router. Be sure to include a nav bar or other UI element that allows users to navigate between routes.
- Implement authentication/authorization, including password protection. A user should be able to log in to the site with a secure password and stay logged in via user ID in the session hash.

## Installation

```bash
$ git clone https://github.com/JoseFlores25/phase4-cafe-shop-server
$ cd phase4-cafe-shop-server
```

- run the backend on http://localhost:3000

```bash
bundle install
&&
rails db:migrate
&&
rails s
```

To run the frontend on http://localhost:3001

```bash
$ git clone https://github.com/JoseFlores25/phase4-cafe-shop-client
$ cd phase4-cafe-shop-client
$ yarn install
$ yarn start
```
