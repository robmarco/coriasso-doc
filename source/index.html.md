---
title: Coriassos - API Documentation

language_tabs:
  - curl

# includes:
#  - errors

search: true
---

# Introduction

<br>
> Api Endpoint

```curl
https://api.coriassos.mobi
```

This API is organized around [REST](http://en.wikipedia.org/wiki/Representational_State_Transfer). Our API has predictable, resource-oriented URLs, and uses HTTP response codes to indicate API errors. We use built-in HTTP features, like HTTP authentication and HTTP verbs, which are understood by off-the-shelf HTTP clients.

We support [cross-origin resource sharing](http://en.wikipedia.org/wiki/Cross-origin_resource_sharing), allowing you to interact securely with our API from a client-side web application (though you should never expose your secret API key in any public website's client-side code).

[JSON](http://www.json.org) is returned by all API responses, including errors, although our API libraries convert responses to appropriate language-specific objects.


# Authentication

```curl
# Authentication using HTTP basic auth.
curl 'https://api.coriassos.mobi/v1/login' \
  -u {key}:

# Alternatively pass a Bearer token in an Authorization header.
curl 'https://api.coriassos.mobi/v1/login' \
  -H 'Authorization: Token token={key}'
```

api = Crocode::APIClient.authorize!('key')
```
> Make sure to replace `key` with your API key.


Authenticate your account when using the API by including your secret API key in the request. You can manage your API keys in the [Dashboard](http://www.croode.mobi/developers). Your API keys carry many privileges, so be sure to keep them secret! Do not share your secret API keys in publicly accessible areas such GitHub, client-side code, and so forth.

Authentication to the API is performed via [HTTP Basic Auth](https://en.wikipedia.org/wiki/Basic_access_authentication). Provide your API key as the basic auth username value. You do not need to provide a password.

If you need to authenticate via bearer auth (e.g., for a cross-origin request), use

<code>-H "Authorization: Token token=sk_test_BQokikJOvBiI2HlWgH4olfQ2"</code>

instead of

<code>-u sk_test_BQokikJOvBiI2HlWgH4olfQ2:.</code>

# Errors

This API uses conventional HTTP response codes to indicate the success or failure of an API request. In general, codes in the <code>2xx</code> range indicate success, codes in the <code>4xx</code> range indicate an error that failed given the information provided (e.g., a required parameter was omitted, an operation failed, etc.), and codes in the <code>5xx</code> range indicate an error with API servers (these are rare).

Not all errors map cleanly onto HTTP response codes, however. When a request is valid but does not complete successfully (e.g., an operation is declined), we return a <code>402</code> error code.

## HTTP Status codes

Code | Title | Description
---- | ----- | -----------
200 |	OK | The request was successful.
201	| Created	| The resource was successfully created.
202	| Async created	| The resource was asynchronously created
400	| Bad request	| Bad request.
401 | Unauthorized | Not valid API Key provided.
404	| Not found |	The resource does not exist.
422	| Validation error |	A validation error occurred.
50X	| Internal | Server Error	An error occurred with our API.

## Error types

> Example error response.

```json
{
  "error": {
    "type": "params_invalid",
    "message": "Name is required"
  }
}
```

All errors are returned in the form of JSON with a type and optional message.

Type | Description
---- | -----------
params_invalid | Your parameters were not valid.
unknown_record | Record was not found.
unknown_route | URL was not valid.
queued | Lookup queued. Try this request again in a few minutes.
rate_limit | The request has been rate limited.
api_error | Internal API error.

# Beers

You can find actions related with a list of beers or a beer.

## Get Beers

This endpoint retrieves a list of beers.

```curl
curl "http://api.coriassos.mobi/v1/beers"
```

> The above command returns JSON structured like this:

```json
{
    "pagination":
    {
        "current": 1,
        "next": null,
        "previous": null,
        "first_page": true,
        "last_page": true,
        "total_pages": 1,
        "total_items": 20
    },
    "data":
    [
        {
            "id": 1,
            "name": "Yuengling Black & Tan",
            "origin": "Pennsylvania, USA",
            "abv": 4.7,
            "description": "No notes at this time.",
            "created_at": "2016-10-20 11:54:49+0200",
            "updated_at": "2016-10-20 11:54:49+0200",
            "style":
            {
                "id": 1,
                "name": "Black & Tan",
                "description": "This applies to pre-blended packaged beers, where a brewery will blend a dark ale with a light ale or lager. It's by no means a traditional style of beer, but rather brewers capitalizing on the concept practiced at bars where the beers are physically layered.",
                "created_at": "2016-10-20 11:54:49+0200",
                "updated_at": "2016-10-20 11:54:49+0200"
            }
        }
    ]
}
```

### HTTP Request

`GET http://api.coriassos.mobi.com/v1/beers`

##Get beer

This endpoint retrieves a beer

```curl
curl "http://api.coriassos.mobi/v1/beers/beerId"
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": 1,
    "name": "Yuengling Black & Tan",
    "origin": "Pennsylvania, USA",
    "abv": 4.7,
    "description": "No notes at this time.",
    "created_at": "2016-10-20 11:54:49+0200",
    "updated_at": "2016-10-20 11:54:49+0200",
    "style": {
      "id": 1,
      "name": "Black & Tan",
      "description": "This applies to pre-blended packaged beers, where a brewery will blend a dark ale with a light ale or lager. It's by no means a traditional style of beer, but rather brewers capitalizing on the concept practiced at bars where the beers are physically layered.",
      "created_at": "2016-10-20 11:54:49+0200",
      "updated_at": "2016-10-20 11:54:49+0200"
    },
    "variants": [
      {
        "id": 1,
        "size": "33cl",
        "price": 150,
        "status": "enable",
        "created_at": "2016-10-20 11:54:49+0200",
        "updated_at": "2016-10-20 11:54:49+0200"
      },
      {
        "id": 2,
        "size": "50cl",
        "price": 210,
        "status": "enable",
        "created_at": "2016-10-20 11:54:49+0200",
        "updated_at": "2016-10-20 11:54:49+0200"
      },
      {
        "id": 3,
        "size": "75cl",
        "price": 300,
        "status": "enable",
        "created_at": "2016-10-20 11:54:49+0200",
        "updated_at": "2016-10-20 11:54:49+0200"
      }
    ]
  }
}
```

### HTTP Request

`GET http://api.coriassos.mobi.com/v1/beers/<beerId>`

# Categories

A category is an agrupation of beers defined by common characteristics

## Get Categories

This endpoint retrieves a list of categories

```curl
curl "http://api.coriassos.mobi/v1/categories"
```

> The above command returns JSON structured like this:

```json
{
  "pagination": {
    "current": 1,
    "next": null,
    "previous": null,
    "first_page": true,
    "last_page": true,
    "total_pages": 1,
    "total_items": 2
  },
  "data": [
    {
      "id": 1,
      "name": "Wild West America",
      "description": "",
      "status": "active",
      "created_at": "2016-10-20 11:54:49+0200",
      "updated_at": "2016-10-20 11:54:49+0200"
    },
    {
      "id": 2,
      "name": "Loving Europe",
      "description": "",
      "status": "active",
      "created_at": "2016-10-20 11:54:49+0200",
      "updated_at": "2016-10-20 11:54:49+0200"
    }
  ]
}
```

### HTTP Request

`GET http://api.coriassos.mobi.com/v1/categories`

## Get Category

This endpoint retrieves a Category

```curl
curl "http://api.coriassos.mobi/v1/categories/categoryId"
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": 1,
    "name": "Wild West America",
    "description": "",
    "status": "active",
    "created_at": "2016-10-20 11:54:49+0200",
    "updated_at": "2016-10-20 11:54:49+0200"
  }
}
```

### HTTP Request

`GET http://api.coriassos.mobi.com/v1/categories/<categoryId>`

## Get beers from a Category

This endpoint retrieves all the beers that belong to a category

```curl
curl "http://api.coriassos.mobi/v1/categories/categoryId/beers"
```

> The above command returns JSON structured like this:

```json
{
  "pagination": {
    "current": 1,
    "next": null,
    "previous": null,
    "first_page": true,
    "last_page": true,
    "total_pages": 1,
    "total_items": 13
  },
  "data": {
    "category": {
      "id": 1,
      "name": "Wild West America",
      "description": "",
      "status": "active",
      "created_at": "2016-10-20 11:54:49+0200",
      "updated_at": "2016-10-20 11:54:49+0200"
    },
    "beers": [
      {
        "id": 1,
        "name": "Yuengling Black & Tan",
        "origin": "Pennsylvania, USA",
        "abv": 4.7,
        "description": "No notes at this time.",
        "created_at": "2016-10-20 11:54:49+0200",
        "updated_at": "2016-10-20 11:54:49+0200",
        "style": {
          "id": 1,
          "name": "Black & Tan",
          "description": "This applies to pre-blended packaged beers, where a brewery will blend a dark ale with a light ale or lager. It's by no means a traditional style of beer, but rather brewers capitalizing on the concept practiced at bars where the beers are physically layered.",
          "created_at": "2016-10-20 11:54:49+0200",
          "updated_at": "2016-10-20 11:54:49+0200"
        }
      },
      {
        "id": 2,
        "name": "Grazias Induresca",
        "origin": "California, USA",
        "abv": 6.5,
        "description": "No notes at this time.",
        "created_at": "2016-10-20 11:54:49+0200",
        "updated_at": "2016-10-20 11:54:49+0200",
        "style": {
          "id": 1,
          "name": "Black & Tan",
          "description": "This applies to pre-blended packaged beers, where a brewery will blend a dark ale with a light ale or lager. It's by no means a traditional style of beer, but rather brewers capitalizing on the concept practiced at bars where the beers are physically layered.",
          "created_at": "2016-10-20 11:54:49+0200",
          "updated_at": "2016-10-20 11:54:49+0200"
        }
      }
    ]
  }
}
```

### HTTP Request

`GET http://api.coriassos.mobi.com/v1/categories/<categoryId>/beers`

# Styles

A Style is a label given to a beer that describes its overall character and often times its origin

## Get Styles

This endpoint retrieves a list of Styles

```curl
curl "http://api.coriassos.mobi/v1/styles"
```

> The above command returns JSON structured like this:

```json
{
  "pagination": {
    "current": 1,
    "next": null,
    "previous": null,
    "first_page": true,
    "last_page": true,
    "total_pages": 1,
    "total_items": 5
  },
  "data": [
    {
      "id": 1,
      "name": "Black & Tan",
      "description": "This applies to pre-blended packaged beers, where a brewery will blend a dark ale with a light ale or lager. It's by no means a traditional style of beer, but rather brewers capitalizing on the concept practiced at bars where the beers are physically layered.",
      "created_at": "2016-10-20 11:54:49+0200",
      "updated_at": "2016-10-20 11:54:49+0200"
    },
    {
      "id": 2,
      "name": "Belgian IPA",
      "description": "Inspired by the American India Pale Ale (IPA) and Double IPA, more and more Belgian brewers are brewing hoppy pale colored ales for the US market (like Chouffe & Urthel), and there's been an increase of Belgian IPAs being brewed by American brewers. Generally, Belgian IPAs are considered too hoppy by Belgian beer drinkers.",
      "created_at": "2016-10-20 11:54:49+0200",
      "updated_at": "2016-10-20 11:54:49+0200"
    }
  ]
}
```

### HTTP Request

`GET http://api.coriassos.mobi.com/v1/styles`

## Get Style

This endpoint retrieves a Style

```curl
curl "http://api.coriassos.mobi/v1/styles/styleId"
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "style": {
      "id": 1,
      "name": "Black & Tan",
      "description": "This applies to pre-blended packaged beers, where a brewery will blend a dark ale with a light ale or lager. It's by no means a traditional style of beer, but rather brewers capitalizing on the concept practiced at bars where the beers are physically layered.",
      "created_at": "2016-10-20 11:54:49+0200",
      "updated_at": "2016-10-20 11:54:49+0200"
    }
  }
}
```

### HTTP Request

`GET http://api.coriassos.mobi.com/v1/styles/<styleId>`

## Get beers from a style

This endpoint retrieves a beer that belong to a style

```curl
curl "http://api.coriassos.mobi/v1/styles/styleId/beers"
```

> The above command returns JSON structured like this:

```json
{
  "pagination": {
    "current": 1,
    "next": null,
    "previous": null,
    "first_page": true,
    "last_page": true,
    "total_pages": 1,
    "total_items": 4
  },
  "data": {
    "style": {
      "id": 1,
      "name": "Black & Tan",
      "description": "This applies to pre-blended packaged beers, where a brewery will blend a dark ale with a light ale or lager. It's by no means a traditional style of beer, but rather brewers capitalizing on the concept practiced at bars where the beers are physically layered.",
      "created_at": "2016-10-20 11:54:49+0200",
      "updated_at": "2016-10-20 11:54:49+0200"
    },
    "beers": [
      {
        "id": 1,
        "name": "Yuengling Black & Tan",
        "origin": "Pennsylvania, USA",
        "abv": 4.7,
        "description": "No notes at this time.",
        "created_at": "2016-10-20 11:54:49+0200",
        "updated_at": "2016-10-20 11:54:49+0200",
        "style": {
          "id": 1,
          "name": "Black & Tan",
          "description": "This applies to pre-blended packaged beers, where a brewery will blend a dark ale with a light ale or lager. It's by no means a traditional style of beer, but rather brewers capitalizing on the concept practiced at bars where the beers are physically layered.",
          "created_at": "2016-10-20 11:54:49+0200",
          "updated_at": "2016-10-20 11:54:49+0200"
        }
      },
      {
        "id": 2,
        "name": "Grazias Induresca",
        "origin": "California, USA",
        "abv": 6.5,
        "description": "No notes at this time.",
        "created_at": "2016-10-20 11:54:49+0200",
        "updated_at": "2016-10-20 11:54:49+0200",
        "style": {
          "id": 1,
          "name": "Black & Tan",
          "description": "This applies to pre-blended packaged beers, where a brewery will blend a dark ale with a light ale or lager. It's by no means a traditional style of beer, but rather brewers capitalizing on the concept practiced at bars where the beers are physically layered.",
          "created_at": "2016-10-20 11:54:49+0200",
          "updated_at": "2016-10-20 11:54:49+0200"
        }
      }
    ]
  }
}
```

### HTTP Request

`GET http://api.coriassos.mobi.com/v1/styles/<styleId>/beers`
