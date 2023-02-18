vim9script

# these actually get used bottom to top,
g:rbpt_colorpairs = [
  ['brown',       'RoyalBlue3'],
  ['Darkblue',    'SeaGreen3'],
  ['darkgray',    'DarkOrchid3'],
  ['darkgreen',   'firebrick3'],
  ['darkcyan',    'RoyalBlue3'],
  ['darkmagenta', 'DarkOrchid3'],
  ['darkred',     'SeaGreen3'],
  ['gray',        'RoyalBlue3'],
  ['brown',       'firebrick3'],
  ['darkgreen',   'MediumOrchid2'],
  ['Darkblue',    'SteelBlue'],
  ['black',       'HotPink'],
  ['darkcyan',    'DarkKhaki'],
  ['darkred',     'SpringGreen3'],
  ['darkmagenta', 'DarkOrange3'],
  ['red',         'Grey58'],
]

b:delimitMate_quotes = "\""
rainbow_parentheses#activate()
rainbow_parentheses#load(0)
