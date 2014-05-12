Meteor.publish 'i18n', (language) ->
    i18n.find({language: language})