i18n = new Meteor.Collection "i18n"
schema = new SimpleSchema
      language:
          type: String
      tag:
          type: String
      count:
          type: String
          optional: true
      value:
          type: String
      status:
          type: String


i18n.attachSchema schema