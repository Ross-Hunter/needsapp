class QueryString

	constructor: (@queryString) ->
		@queryString or= window.document.location.search?.substr 1
		@variables = @queryString.split '&'
		@pairs = ([key, value] = pair.split '=' for pair in @variables)

	get: (name) ->
		for [key, value] in @pairs
			return value if key is name


qs = new QueryString()

$('#search').val(qs.get('q').replace('+', ' '))
$('#start_date').val(qs.get('start_date'))
$('#end_date').val(qs.get('end_date'))