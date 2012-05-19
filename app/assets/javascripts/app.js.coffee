class QueryString

	constructor: (@queryString) ->
		@queryString or= window.document.location.search?.substr 1
		@variables = @queryString.split '&'
		@pairs = ([key, value] = pair.split '=' for pair in @variables)

	get: (name) ->
		for [key, value] in @pairs
			return value if key is name

#Pull filter params from qs and fill in filter values
jQuery ->
	qs = new QueryString()

	if qs?
		if qs.get('need%5Bcategory%5D')?
			$('#need_category').val(qs.get('need%5Bcategory%5D'))
		if qs.get('q')?
			$('#search').val(qs.get('q').replace(/\+/g, ' '))
		if qs.get('start_date')?
			$('#start_date').val(qs.get('start_date').replace(/%2F/g, '/'))
		if qs.get('end_date')?
			$('#end_date').val(qs.get('end_date').replace(/%2F/g, '/'))

#Clear the alerts after a short period
window.setTimeout (->
  $('.alert').fadeTo(500, 0).slideUp 'slow', (->
   	$(this).remove())
  ), 3000
