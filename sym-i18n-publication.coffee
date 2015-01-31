Meteor.publish 'i18n', (language) ->
  if language is undefined
    i18n.find({})
  else
    i18n.find({language: language})