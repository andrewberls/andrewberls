randomFromTo = (from, to) ->
  Math.floor(Math.random() * (to - from + 1) + from)

$ ->
  phrases = [
    'really enjoy making websites',
    'build things for the web'
  ]
  idx = randomFromTo(0, phrases.length - 1)
  $('.greeting').html(phrases[idx])
