change = (event) ->
  n = event.data.index
  title_id = event.data.title_id
  url_id = event.data.url_id

  title_class = $(".page_title#{n+1}")
  url_class = $(".page_url#{n+1}")

  if title_id.val() && url_id.val()
    title_class.show()
    url_class.show()
  else
    title_class.hide()
    url_class.hide()


$(document).on "page:change", ->
  for n in [1..5]

    title_id = $("#page_title#{n}")
    url_id = $("#page_url" + n)

    previous_title_id = $("#page_title#{n-1}")
    previous_url_id = $("#page_url#{n-1}")

    title_class = $(".page_title#{n}")
    url_class = $(".page_url#{n}")

    title_id.on('change', {index: n, title_id: title_id, url_id: url_id}, change)
    url_id.on('change', {index: n, title_id: title_id, url_id: url_id}, change)

    # Если у текущей группы заполнено значение, или значение имеется 
    # у предыдущей группы, то отображаем обрабатываемую группу
    if (title_id.val() && url_id.val()) || (previous_title_id.val() && previous_url_id.val())
      title_class.show()
      url_class.show()
    else
      title_class.hide()
      url_class.hide()
