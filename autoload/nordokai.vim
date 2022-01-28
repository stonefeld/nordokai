function! nordokai#get_configuration() "{{{
  return {
        \ 'transparent_background': get(g:, 'nordokai_transparent_background', 0),
        \ 'menu_selection_background': get(g:, 'nordokai_menu_selection_background', 'gray'),
        \ 'sign_column_background': get(g:, 'nordokai_sign_column_background', 'default'),
        \ 'current_word': get(g:, 'nordokai_current_word', 'gray background'),
        \ 'diagnostic_line_highlight': get(g:, 'nordokai_diagnostic_line_highlight', 0),
        \ 'better_performance': get(g:, 'nordokai_better_performance', 0),
        \ 'transparent_float': get(g:, 'nordokai_trasparent_float', 1),
        \ }
endfunction "}}}

function! nordokai#get_palette() "{{{
  let palette = {
        \ 'nordokai0':        ['#2E3440', 'NONE', 'Black'     ],
        \ 'nordokai1':        ['#3B4252', 0,      'LightBlack'],
        \ 'nordokai2':        ['#434C5E', 'NONE', 'DarkGray'  ],
        \ 'nordokai3':        ['#4C566A', 8,      'Gray'      ],
        \ 'nordokai3_bright': ['#616E88', 'NONE', 'LightGray' ],
        \ 'nordokai4':        ['#D8DEE9', 'NONE', 'White1'    ],
        \ 'nordokai5':        ['#E5E9F0', 7,      'White2'    ],
        \ 'nordokai6':        ['#ECEFF4', 15,     'White3'    ],
        \ 'nordokai7':        ['#8FBCBB', 14,     'LightBlue' ],
        \ 'nordokai7_bright': ['#9FBCBB', 14,     'LightCyan' ],
        \ 'nordokai8':        ['#88C0D0', 6,      'Cyan'      ],
        \ 'nordokai9':        ['#81A1C1', 4,      'Blue'      ],
        \ 'nordokai10':       ['#5E81AC', 12,     'DarkBlue'  ],
        \ 'nordokai11':       ['#BF616A', 1,      'Red'       ],
        \ 'nordokai12':       ['#D08770', 11,     'Orange'    ],
        \ 'nordokai13':       ['#EBCB8B', 3,      'Yellow'    ],
        \ 'nordokai14':       ['#A3BE8C', 2,      'Green'     ],
        \ 'nordokai15':       ['#B48EAD', 5,      'Magenta'   ],
        \ 'none':             ['NONE',    'NONE', 'NONE'      ]
        \ }
  return palette
endfunction "}}}

function! nordokai#highlight(group, fg, bg, ...) "{{{
  execute 'highlight' a:group
        \ 'guifg=' . a:fg[0]
        \ 'guibg=' . a:bg[0]
        \ 'ctermfg=' . a:fg[1]
        \ 'ctermbg=' . a:bg[1]
        \ 'gui=' . (a:0 >= 1 ?
          \ (a:1 ==# 'undercurl' ?
            \ (executable('tmux') && $TMUX !=# '' ?
              \ 'underline' :
              \ 'undercurl') :
            \ a:1) :
          \ 'NONE')
        \ 'cterm=' . (a:0 >= 1 ?
          \ (a:1 ==# 'undercurl' ?
            \ 'underline' :
            \ a:1) :
          \ 'NONE')
        \ 'guisp=' . (a:0 >= 2 ?
          \ a:2[0] :
          \ 'NONE')
endfunction "}}}
