A Symfony inspired i18n for Meteor
==================================

Provides a collection named *i18n*, publication named *i18n* and a helper named *i18n* as well. Also provides a *ji18n* javascript function and a *i18n_map* function.

Usage:
------
in *client*:

```coffee
Session.set 'i18n.language', 'en'  # you can use whatever name you want
Session.set 'total_apples', 0
```

in *iron-router*:

```coffee
class @HomeController extends RouteController
    waitOn: -> Meteor.subscribe "i18n", Session.get('i18n.language')
    data: ->
        total_apples: Session.get "total_apples"
```

in *flow-router* you can use the url:

```http://localhost:3000/admin-post/?lang=es```

and:
```coffee
FlowRouter.route '/admin-post/',
subscriptions: (params, queryParams) ->
    lang = queryParams.lang or 'en'
    this.register('i18n', Meteor.subscribe("i18n", lang))
```

in *html template*:

```html
<template name='home'>
<h1>{{total_apples}}: {{ i18n 'THERE_ARE_APPLES' count=total_apples }}</h1>
</template>
```

An example of a document of *i18n* collection:

```javascript
{
    "language" : "en",
    "tag" : "THERE_ARE_APPLES",
    "count" : "2..",
    "value" : "There are {{count}} apples."
}
```

"2.." means that this translation will be used to values greater or equal to 2.

other example:

```javascript
{
    "language" : "en",
    "tag" : "THERE_ARE_APPLES",
    "count" : "0",
    "value" : "There are no apples."
}
```

In value you can have more complex strings like:

```
"There are {{count}} {{fruit}} in the basket."
```

And use like:

```html
{{ i18n 'THERE_ARE_FRUITS' count=total_fruits fruit=fruit }}
```

where fruit is passed here from the data section of iron-router.

*ji18n* is used this way:
```coffee
text = ji18n('THERE_ARE_APPLES', {count:0})
```

And here is an example on how to map languages:

```coffee
map =
  es:
    SAVE:
      any: 'Guardar'
  en:
    SAVE:
      any: 'Save'

i18n_map(map)
```
