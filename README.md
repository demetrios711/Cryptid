# Cryptid

# MVP List

Cryptid, a Wickr clone, is a

### 1. Hosting on Heroku (04/03/2018)

### 2. New account creation, login, and guest/demo login (04/04/2018, 2 days)
  + Users can sign up, sign in, log out
  + Users can use a demo login to try the site
  + Users can't use certain features without logging in (creating chirps & likes)

### 3. Chirps (04/06/2018, 2 days)
  + Logged in users can create chirps
  + Users can view a list chirps
  + Logged in users can edit existing chirps

### 4. Likes (04/10/2018, 2 days)
  + Logged in users can 'like' chirps
  + The like count is displayed for each chirp

### 5. Dashboard and Profile (04/11/2018, 1 day)
  + Users have a private dashboard of other user's chirps
  + Users have a public profile of their own chirps

### 6. Search Users (04/12/2018, 1 day)
  + Users can search for other users through text to see that user's profile

### 7. Production README (04/13/2018, 0.5 days)

# Database Schema

## `users`
| column name       | data type | details                   |
|:------------------|:---------:|:--------------------------|
| `id`              | integer   | not null, primary key     |
| `username`        | string    | not null, indexed         |
| `email`           | string    | not null, indexed, unique |         
| `password_digest` | string    | not null                  |
| `session_token`   | string    | not null, indexed, unique |
| `created_at`      | datetime  | not null                  |
| `updated_at`      | datetime  | not null                  |

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
+ `/feed`
  + `ChirpIndex`
    + `ChirpIndexItem`
+ `/users/:userId`
  + `ProfileComponent`
  + `ChirpIndex`
    + `ChirpIndexItem`
+ `/chirps/new`
  + `ChirpForm`
+ `/chirps/:chirpId`
  + `ChirpShow`
+ `/chirps/:chirpId/edit`
  + `ChirpForm`
  
# Backend Routes

## HTML

+ `GET /` `StaticPagesController#root`

## API Endpoints

### `users`
+ `GET /api/users` - returns the user information of displayed chirps and for the User Search feature
+ `POST /api/users` - sign up

### `session`
+ `POST /api/session` - log in
+ `DELETE /api/session` - log out

### `chirps`
+ `GET /api/chirps` - returns relevant chirps (filtered by `data`/`params`)
+ `GET /api/chirps/:id` - returns chirp
+ `POST /api/chirps` - creates a chirp
+ `PATCH /api/chirps/:id` - edit a chirp
+ `DELETE /api/chirps/:id` - remove a chirp

### `likes`
+ `POST /api/chirps/:chirp_id/likes` - like a chirp
+ `DELETE /api/chirps/:chirp_id/likes` - unlike a chirp

Note: likes does not include a `GET` route because we will have these routes render the `api/chirps/show.json.jbuilder` view. See [Sample State](sample-state).  
