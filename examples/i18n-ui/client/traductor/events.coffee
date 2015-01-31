Template.traductor.events
  'click #done_translations' :(e,t)->
    for el in t.findAll('.value-saved')
      el = $(el)
      value = el.val()
      if value != ''
        _id = el.attr('_id')
        i18n.update(_id, {$set: {status: 'done', value: value}})
  'click .edit': (e,t)->
    _id = $(e.target).attr('_id')
    i18n.update(_id, {$set: {status: 'saved'}})
  'click #save_translations': (e, t)->
    for el in t.findAll('.value_translated')
      el = $(el)
      value = el.val()
      if value != ''
        language = el.attr('language')
        tag = el.attr('tag')
        count = el.attr('count')
        if count != ''
          i18n.insert({status: 'done', language:language, tag: tag, value:value, count: count})
        else
          i18n.insert({status: 'done', language:language, tag: tag, value:value})