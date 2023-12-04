vim9script

b:ale_fixers = ['black']
b:ale_python_flake8_options = '--max-line-length 88'

g:python_highlight_builtin_objs  = 1
g:python_highlight_builtin_funcs = 0
g:python_highlight_builtin_funcs_kwarg = 0
g:python_highlight_exceptions = 1
g:python_highlight_string_format = 1
g:python_highlight_string_templates = 1
g:python_highlight_func_calls = 1
g:python_highlight_file_headers_as_comments = 1

hi link pythonImport pythonInclude
hi link pythonInclude GruvboxFg3
hi link pythonFunctionCall GruvboxBlue
