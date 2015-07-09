i18n_map = (map) ->
  i18n.remove({})
  for lang, content of map
    for tag, content of content
      for count, value of content
        if count == 'any'
          count = undefined
        #_id = i18n.findOne({language: lang, tag: tag, count: count})
        #if _id
        #  i18n.update _id, {$set: {value: value}}
        #else
        i18n.insert language: lang, tag: tag, count: count, value: value