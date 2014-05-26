A Symfony inspired i18n for Meteor
----------------------------------

Provides a collection named *i18n*, publication named *i18n* and a helper named *i18n* as well. Also provides a *ji18n* javascript function.

Usage:

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

Also check the [sym-i18n-ui](https://github.com/miguelalarcos/sym-i18n-ui) that is a minimalistic UI for introducing traductions and pluralizations. Note that you have to export the MONGO_URL to the app you want to traduce.

I have another thing to say: ¡check my [meteor-boilerplate](https://github.com/miguelalarcos/meteor-boilerplate)!