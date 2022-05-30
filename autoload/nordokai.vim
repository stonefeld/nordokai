function! nordokai#get_configuration() "{{{
  return {
        \ 'style': get(g:, 'nordokai_style', 'nord'),
        \ 'transparent_background': get(g:, 'nordokai_transparent_background', 0),
        \ 'menu_selection_background': get(g:, 'nordokai_menu_selection_background', 'gray'),
        \ 'sign_column_background': get(g:, 'nordokai_sign_column_background', 'default'),
        \ 'current_word': get(g:, 'nordokai_current_word', 'gray background'),
        \ 'diagnostic_line_highlight': get(g:, 'nordokai_diagnostic_line_highlight', 0),
        \ 'better_performance': get(g:, 'nordokai_better_performance', 0),
        \ 'transparent_float': get(g:, 'nordokai_transparent_float', 0),
        \ 'italic_comments': get(g:, 'nordokai_italic_comments', 0),
        \ 'invert_selecion': get(g:, 'nordokai_invert_selecion', 1),
        \ 'highlight_completion': get(g:, 'nordokai_highlight_completion', 0),
        \ }
endfunction "}}}

function! nordokai#get_palette(style) "{{{
  if a:style ==# 'nord'
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
  elseif a:style ==# 'base16'
    let palette = {
          \ 'nordokai0':        ['#181818', 'NONE', 'Black'     ],
          \ 'nordokai1':        ['#484848', 0,      'LightBlack'],
          \ 'nordokai2':        ['#282828', 'NONE', 'DarkGray'  ],
          \ 'nordokai3':        ['#383838', 8,      'Gray'      ],
          \ 'nordokai3_bright': ['#585858', 'NONE', 'LightGray' ],
          \ 'nordokai4':        ['#F8F8F8', 'NONE', 'White1'    ],
          \ 'nordokai5':        ['#E8E8E8', 7,      'White2'    ],
          \ 'nordokai6':        ['#D8D8D8', 15,     'White3'    ],
          \ 'nordokai7':        ['#7CAFC2', 14,     'LightBlue' ],
          \ 'nordokai7_bright': ['#86C1B9', 14,     'LightCyan' ],
          \ 'nordokai8':        ['#86C1B9', 6,      'Cyan'      ],
          \ 'nordokai9':        ['#7CAFC2', 4,      'Blue'      ],
          \ 'nordokai10':       ['#2E5984', 12,     'DarkBlue'  ],
          \ 'nordokai11':       ['#AB4642', 1,      'Red'       ],
          \ 'nordokai12':       ['#DC9656', 11,     'Orange'    ],
          \ 'nordokai13':       ['#F7CA88', 3,      'Yellow'    ],
          \ 'nordokai14':       ['#A1B56C', 2,      'Green'     ],
          \ 'nordokai15':       ['#BA8BAF', 5,      'Magenta'   ],
          \ 'none':             ['NONE',    'NONE', 'NONE'      ]
          \ }
  endif
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
