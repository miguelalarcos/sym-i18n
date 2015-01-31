Template.traductor.helpers
  languages: -> ['es', 'en']
  items: (language) ->
    ret = []
    for item_en in i18n.find(language: 'en').fetch()
      if not i18n.findOne(language: language, tag: item_en.tag, count: item_en.count)
        ret.push({language:language, tag: item_en.tag, reference: item_en.value, count: item_en.count})
    ret
  done: ->
    i18n.find(status: 'done')
  saved: ->
    i18n.find(status: 'saved')