function! nordokai#get_configuration() "{{{
  return {
        \ 'style': get(g:, 'nordokai_style', 'default'),
        \ 'transparent_background': get(g:, 'nordokai_transparent_background', 0),
        \ 'disable_italic_comment': get(g:, 'nordokai_disable_italic_comment', 0),
        \ 'enable_italic': get(g:, 'nordokai_enable_italic', 0),
        \ 'cursor': get(g:, 'nordokai_cursor', 'auto'),
        \ 'menu_selection_background': get(g:, 'nordokai_menu_selection_background', 'gray'),
        \ 'sign_column_background': get(g:, 'nordokai_sign_column_background', 'default'),
        \ 'current_word': get(g:, 'nordokai_current_word', 'grey background'),
        \ 'lightline_disable_bold': get(g:, 'nordokai_lightline_disable_bold', 0),
        \ 'diagnostic_line_highlight': get(g:, 'nordokai_diagnostic_line_highlight', 0),
        \ 'better_performance': get(g:, 'nordokai_better_performance', 0),
        \ }
endfunction "}}}

function! nordokai#get_palette(style) "{{{
  if a:style ==# 'default'
    let palette = {
      \ 'nordokai0':        ['#2E3440', 'NONE', 'Black'    ],
      \ 'nordokai1':        ['#3B4252', 0,      'DarkGrey' ],
      \ 'nordokai2':        ['#434C5E', 'NONE', 'DarkGrey' ],
      \ 'nordokai3':        ['#4C566A', 8,      'DarkGrey' ],
      \ 'nordokai3_bright': ['#616E88', 'NONE', 'LightGrey'],
      \ 'nordokai4':        ['#D8DEE9', 'NONE', 'White'    ],
      \ 'nordokai5':        ['#E5E9F0', 7,      'White'    ],
      \ 'nordokai6':        ['#ECEFF4', 15,     'White'    ],
      \ 'nordokai7':        ['#8FBCBB', 14,     'DarkBlue' ],
      \ 'nordokai7_bright': ['#9FBCBB', 14,     'LightBlue'],
      \ 'nordokai8':        ['#88C0D0', 6,      'DarkBlue' ],
      \ 'nordokai9':        ['#81A1C1', 4,      'DarkBlue' ],
      \ 'nordokai10':       ['#5E81AC', 12,     'DarkBlue' ],
      \ 'nordokai11':       ['#BF616A', 1,      'Red'      ],
      \ 'nordokai12':       ['#D08770', 11,     'Orange'   ],
      \ 'nordokai13':       ['#EBCB8B', 3,      'Yellow'   ],
      \ 'nordokai14':       ['#A3BE8C', 2,      'Green'    ],
      \ 'nordokai15':       ['#B48EAD', 5,      'Magenta'  ],
      \ 'nordokai16':       ['#7F8490', 'NONE', 'LightGrey'],
      \ 'none':             ['NONE',    'NONE', 'NONE'     ]
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

" function! nordokai#ft_gen(path, last_modified, msg) "{{{
"   " Generate the `after/ftplugin` directory.
"   let full_content = join(readfile(a:path), "\n") " Get the content of `colors/nordokai.vim`
"   let ft_content = []
"   let rootpath = nordokai#ft_rootpath(a:path) " Get the path to place the `after/ftplugin` directory.
"   call substitute(full_content, '" ft_begin.\{-}ft_end', '\=add(ft_content, submatch(0))', 'g') " Search for 'ft_begin.\{-}ft_end' (non-greedy) and put all the search results into a list.
"   for content in ft_content
"     let ft_list = []
"     call substitute(matchstr(matchstr(content, 'ft_begin:.\{-}{{{'), ':.\{-}{{{'), '\(\w\|-\)\+', '\=add(ft_list, submatch(0))', 'g') " Get the file types. }}}}}}
"     for ft in ft_list
"       call nordokai#ft_write(rootpath, ft, content) " Write the content.
"     endfor
"   endfor
"   call nordokai#ft_write(rootpath, 'text', "let g:nordokai_last_modified = '" . a:last_modified . "'") " Write the last modified time to `after/ftplugin/text/nordokai.vim`
"   if a:msg ==# 'update'
"     echohl WarningMsg | echom '[nordokai] Updated ' . rootpath . '/after/ftplugin' | echohl None
"   else
"     echohl WarningMsg | echom '[nordokai] Generated ' . rootpath . '/after/ftplugin' | echohl None
"   endif
" endfunction "}}}

" function! nordokai#ft_write(rootpath, ft, content) "{{{
"   " Write the content.
"   let ft_path = a:rootpath . '/after/ftplugin/' . a:ft . '/nordokai.vim' " The path of a ftplugin file.
"   " create a new file if it doesn't exist
"   if !filereadable(ft_path)
"     call mkdir(a:rootpath . '/after/ftplugin/' . a:ft, 'p')
"     call writefile([
"           \ "if !exists('g:colors_name') || g:colors_name !=# 'nordokai'",
"           \ '    finish',
"           \ 'endif'
"           \ ], ft_path, 'a') " Abort if the current color scheme is not nordokai.
"     call writefile([
"           \ "if index(g:nordokai
" _loaded_file_types, '" . a:ft . "') ==# -1",
"           \ "    call add(g:nordoka_loaded_file_types, '" . a:ft . "')",
"           \ 'else',
"           \ '    finish',
"           \ 'endif'
"           \ ], ft_path, 'a') " Abort if this file type has already been loaded.
"   endif
"   " If there is something like `call nordokai#highlight()`, then add
"   " code to initialize the palette and configuration.
"   if matchstr(a:content, 'nordokai#highlight') !=# ''
"     call writefile(['let s:configuration = nordokai#get_configuration()', 'let s:palette = nordokai#get_palette(s:configuration.style)'], ft_path, 'a')
"   endif
"   " Append the content.
"   call writefile(split(a:content, "\n"), ft_path, 'a')
" endfunction "}}}

" function! nordokai#ft_rootpath(path) "{{{
"   " Get the directory where `after/ftplugin` is generated.
"   if (matchstr(a:path, '^/usr/share') ==# '') || has('win32') " Return the plugin directory. The `after/ftplugin` directory should never be generated in `/usr/share`, even if you are a root user.
"     return fnamemodify(a:path, ':p:h:h')
"   else " Use vim home directory.
"     if has('nvim')
"       return stdpath('config')
"     else
"       if has('win32') || has ('win64')
"         return $VIM . '/vimfiles'
"       else
"         return $HOME . '/.vim'
"       endif
"     endif
"   endif
" endfunction "}}}

" function! nordokai#ft_newest(path, last_modified) "{{{
"   " Determine whether the current ftplugin files are up to date by comparing the last modified time in `colors/nordokai.vim` and `after/ftplugin/text/nordokai.vim`.
"   let rootpath = nordokai#ft_rootpath(a:path)
"   execute 'source ' . rootpath . '/after/ftplugin/text/nordokai.vim'
"   return a:last_modified ==# g:nordokai_last_modified ? 1 : 0
" endfunction "}}}

" function! nordokai#ft_clean(path, msg) "{{{
"   " Clean the `after/ftplugin` directory.
"   let rootpath = nordokai#ft_rootpath(a:path)
"   " Remove `after/ftplugin/**/nordokai.vim`.
"   let file_list = split(globpath(rootpath, 'after/ftplugin/**/nordokai.vim'), "\n")
"   for file in file_list
"     call delete(file)
"   endfor
"   " Remove empty directories.
"   let dir_list = split(globpath(rootpath, 'after/ftplugin/*'), "\n")
"   for dir in dir_list
"     if globpath(dir, '*') ==# ''
"       call delete(dir, 'd')
"     endif
"   endfor
"   if globpath(rootpath . '/after/ftplugin', '*') ==# ''
"     call delete(rootpath . '/after/ftplugin', 'd')
"   endif
"   if globpath(rootpath . '/after', '*') ==# ''
"     call delete(rootpath . '/after', 'd')
"   endif
"   if a:msg
"     echohl WarningMsg | echom '[nordokai] Cleaned ' . rootpath . '/after/ftplugin' | echohl None
"   endif
" endfunction "}}}

" function! nordokai#ft_exists(path) "{{{
"   return filereadable(nordokai#ft_rootpath(a:path) . '/after/ftplugin/text/nordokai.vim')
" endfunction "}}}
