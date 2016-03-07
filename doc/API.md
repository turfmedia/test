# User API

## Create a user

    POST /users

### Input (request JSON body)

Name | Type | Description
-----|------|--------------
`name`|`type` | Description.

### Response

``` json
{
  "text": "Hello world github/linguist#1 **cool**, and #1!",
  "mode": "gfm"
}
```

## Retrieve users

    GET /users

### Input (request JSON body)

Name | Type | Description
-----|------|--------------
`name`|`type` | Description.

### Response

``` json
{
  "text": "Hello world github/linguist#1 **cool**, and #1!",
  "mode": "gfm"
}
```

## Update user

    UPDATE /users

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
