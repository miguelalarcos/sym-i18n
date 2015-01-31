Template.admin.events
  'click #save_en': (e,t) ->
    tag = $(t.find('#tag_en'))
    value = $(t.find('#value_en'))
    count = $(t.find('#count_en'))
    if tag.val() != '' and value.val() != ''
      if count.val() != ''
        i18n.insert({status: 'approved', language: 'en', tag: tag.val(), value: value.val(), count: count.val()})
      else
        i18n.insert({status: 'approved', language: 'en', tag: tag.val(), value: value.val()})
    tag.val('')
    value.val('')
    count.val('')
  'click .approve': (e,t) ->
    _id = $(e.target).attr('_id')
    i18n.update(_id, {$set:{status:'approved'}})
  'click .done': (e,t) ->
    _id = $(e.target).attr('_id')
    i18n.update(_id, {$set:{status:'done'}})