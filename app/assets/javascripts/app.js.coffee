class QueryString

	constructor: (@queryString) ->
		@queryString or= window.document.location.search?.substr 1
		@variables = @queryString.split '&'
		@pairs = ([key, value] = pair.split '=' for pair in @variables)

	get: (name) ->
		for [key, value] in @pairs
			return value if key is name


qs = new QueryString()

$('#need_category').val(qs.get('need%5Bcategory%5D'))
#$('#search').placeholder()
$('#search').val(qs.get('q').replace('+', ' '))
#$('#start_date').placeholder()
$('#start_date').val(qs.get('start_date'))
#$('#end_date').placeholder()
$('#end_date').val(qs.get('end_date'))
