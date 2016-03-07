# User API

## Authorization

Basic HTTP Authorization with API_KEY.

## Create a user

    POST /users

### Input (request JSON body)

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

## Retrieve users

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

## Update user

    UPDATE /users/<em>:id</em>

### Input (request JSON body)

Name | Type | Description
-----|------|--------------
`name`|`type` | Description.

### Response

``` json
{
  "text": "Hello world github/linguist#1 **cool**, and #1!",
  "context": "github/gollum"
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
  "text": "Hello world github/linguist#1 **cool**, and #1!",
  "context": "github/gollum"
}
```
