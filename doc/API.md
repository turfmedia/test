# User API

## Create a user

    POST /users

### Parameters

Name | Type | Description
-----|------|--------------
`name`|`type` | Description.

### Input (request JSON body)

Name | Type | Description
-----|------|--------------
`name`|`type` | Description.

### Response

``` json
{
  "text": "Hello world github/linguist#1 **cool**, and #1!",
  "mode": "gfm",
  "context": "github/gollum"
}
```

## Retrieve users

    GET /users

### Parameters

Name | Type | Description
-----|------|--------------
`name`|`type` | Description.

### Input (request JSON body)

Name | Type | Description
-----|------|--------------
`name`|`type` | Description.

### Response

<%= json :user %>

## Update user

    UPDATE /users

### Parameters

Name | Type | Description
-----|------|--------------
`name`|`type` | Description.

### Input (request JSON body)

Name | Type | Description
-----|------|--------------
`name`|`type` | Description.

### Response

<%= json :user %>

## Delete user

    DELETE /users

### Parameters

Name | Type | Description
-----|------|--------------
`name`|`type` | Description.

### Input (request JSON body)

Name | Type | Description
-----|------|--------------
`name`|`type` | Description.

### Response

<%= json :user %>
