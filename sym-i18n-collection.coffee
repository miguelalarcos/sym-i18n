i18n = new Meteor.Collection "i18n",
    schema:
        language:
            type: String
        tag:
            type: String
        count:
            type: String
            optional: true
        value:
            type: String