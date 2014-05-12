sub = (txt, context) ->
    txt.replace /\{\{(.+?)\}\}/g, (whole, part) ->
        context[part.trim()]


UI.registerHelper 'i18n', (tag, context) ->
    c = context.hash
    count = c.count

    try
        if count is undefined
            t = i18n.findOne({tag: tag}).value
            return sub(t,c)
        else             
            ranges = (x.count for x in i18n.find({tag: tag}).fetch())
            flag = false
            for r in ranges
                if /../.test r                    
                    r_min_r_max = r.split('..')
                    r_min = r_min_r_max[0]
                    r_max = r_min_r_max[1]
                    if (r_min == '' and r_max == '') or (r_min == '' and count <= parseInt(r_max)) or
                       (r_max == '' and count >= parseInt(r_min)) or (parseInt(r_min) <= count <= parseInt(r_max))
                        flag = true
                        break
                else
                    if parseInt(r) == count
                        flag = true
                        break
            if flag
                t =  i18n.findOne({tag: tag, count: r}).value
                return sub(t, c)
            else
                'not found.'
    catch error
        console.log error
        'not found..'
    


