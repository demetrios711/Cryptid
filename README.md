# Cryptid

# MVP List

Cryptid, a Wickr clone, is a

### 1. Hosting on Heroku (05/01/2018)

### 2. New account creation, login, and guest/demo login (04/04/2018, 2 days)
  + Users can sign up, sign in, log out
  + Users can use a demo login to try the site
  + Users can't use certain features without logging in (sending messages and adding contacts)

### 3. Messages (04/06/2018, 2 days)
  + Logged in users can send messages
  + Logged in users can view sent messages

### 4. Production README (04/13/2018, 0.5 days)

# Database Schema

## `users`
| column name       | data type | details                   |
|:------------------|:---------:|:--------------------------|
| `id`              | integer   | not null, primary key     |
| `username`        | string    | not null, indexed, unique |
| `email`           | string    | not null, indexed, unique |
| `username`        | string    | not null, indexed, unique |
| `public_digest`   | string    | not null, indexed, unique |
| `private_digest`  | string    | not null, indexed, unique |
| `password_digest` | string    | not null                  |
| `updated_at`      | datetime  | not null                  |
| `session_token`   | string    | not null, indexed, unique |
| `created_at`      | datetime  | not null                  |
| `updated_at`      | datetime  | not null                  |
| `last_login`      | datetime  | not null                  |

+ index on `username, unique: true`
+ index on `session_token, unique: true`

## `message`
| column name       | data type | details                   |
|:------------------|:---------:|:--------------------------|
| `user_id`         | integer   | not null, primary key     |
| `message`         | string    | not null, indexed, unique |
| `expir_time`      | datetime  | not null, indexed, unique |
| `reciever`        | string    | not null, indexed, unique |

## 'Local Storage'
| column name       | data type | details                   |
|:------------------|:---------:|:--------------------------|
| `hw_identifier`   | integer   | not null, primary key     |


+ index on `username, unique: true`
+ index on `session_token, unique: true`

## Frontend Routes
Our components are organized as follows:
+ `Root`
  + `App`
    + `NavBar`
    + (main component goes here)
    + `Footer`

The following routes, defined in `App`, will render components between `NavBar` and `Footer`.

+ `/`
  + `Splash`
+ `/login`
  + `SessionForm`
+ `/signup`
  + `SessionForm`
+ `/landing`
  + `inbox`
    + `messages`
+ `/users/:userId`
  + `ProfileComponent`
  + `inbox`
    + `messages`
+ `/messages/new`
  + `messageForm`
+ `/messages/:messageId`
  + `messageshow`
+ `/messages/:messageId/edit`
  + `messageForm`
  
# Backend Routes

## HTML

+ `GET /` `StaticPagesController#root`

## API Endpoints

### `users`
+ `GET /api/users` - returns the user information of displayed messages and for the User Search feature
+ `POST /api/users` - sign up

### `session`
+ `POST /api/session` - log in
+ `DELETE /api/session` - log out

### `messages`
+ `GET /api/messages` - returns relevant messages (filtered by `data`/`params`)
+ `GET /api/messages/:id` - returns message
+ `POST /api/messages` - creates a message
+ `PATCH /api/messages/:id` - edit a message
+ `DELETE /api/messages/:id` - remove a message

Note: likes does not include a `GET` route because we will have these routes render the `api/messages/show.json.jbuilder` view. See [Sample State](sample-state).  
