i18n = @i18n

Meteor.publish 'i18n', (language) ->
    i18n.find({language: language})