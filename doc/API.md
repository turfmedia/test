# User API

## Authorization

Basic HTTP Authorization with API_KEY.

## Create a user

    POST /users

### Input (request JSON body)

Any information provided in the body will be stored for the user. Like for example:

Name | Type | Description
-----|------|--------------
`email`|`string` | user email.

### Response

``` json
{
  "message": "new user recorded 1",
  "user_id": 1
}
```

## Retrieve all users

    GET /users

### Response

``` json
{
  "users": {
    "1": {
      "email": "admin@example.com"
    }
  }
}
```

## Retrieve user

    GET /users/<em>:id</em>

### Response

``` json
{
  "email": "admin@example.com"
}
```

## Update user

    UPDATE /users/<em>:id</em>

### Input (request JSON body)

Any information provided in the body will be stored for the user.

### Response

``` json
{
  "message": "user updated 1",
  "user_id": 1
}
```

## Delete user

    DELETE /users/<em>:id</em>

### Parameters

Name | Type | Description
-----|------|--------------
`id`|`integer` | Description.

### Response

``` json
{
  "message": "user deleted 1",
  "user_id": 1
}
```
