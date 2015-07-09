i18n_map = (map) ->
  i18n.remove({})
  for lang, content of map
    for tag, content2 of content
      for count, value of content2
        if count == 'any'
          count = undefined
        i18n.insert language: lang, tag: tag, count: count, value: value