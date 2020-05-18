ready = ->
	Typed.new '.element',
		strings: [
			"Etudier avec simplicité et efficacité, c'est à dire viser l'essentiel, nous rend pratique et pragmatique."
			"Etudier n'est pas facile mais doit être SIMPLE!!!."
		]
		typeSpeed: 0
	return

$(document).ready ready
$(document).on 'turbolinks:load', ready

reaady = ->
	Typed.new '.elementBlog',
		strings: [
			"Etudier avec simplicité et efficacité, c'est à dire viser l'essentiel, nous rend pratique et pragmatique."
			"Etudier n'est pas facile mais devrait être SIMPLE!!!."
		]
		typeSpeed: 0
	return

$(document).ready reaady
$(document).on 'turbolinks:load', reaady