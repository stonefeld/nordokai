" Initialization: {{{
let s:configuration = nordokai#get_configuration()
let s:palette = nordokai#get_palette()

if !(exists('g:colors_name') && g:colors_name ==# 'nordokai' && s:configuration.better_performance)
  highlight clear
  if exists('syntax_on')
    syntax reset
  endif
endif

let g:colors_name = 'nordokai'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif
" }}}
" Common Highlight Groups: {{{
" UI: {{{
if s:configuration.transparent_background
  call nordokai#highlight('Normal', s:palette.nordokai6, s:palette.none)
  call nordokai#highlight('Terminal', s:palette.nordokai6, s:palette.none)
  call nordokai#highlight('EndOfBuffer', s:palette.nordokai1, s:palette.none)
  call nordokai#highlight('Folded', s:palette.nordokai3_bright, s:palette.none)
  call nordokai#highlight('ToolbarLine', s:palette.nordokai6, s:palette.none)
  call nordokai#highlight('SignColumn', s:palette.nordokai6, s:palette.none)
  call nordokai#highlight('FoldColumn', s:palette.nordokai3_bright, s:palette.none)
else
  call nordokai#highlight('Normal', s:palette.nordokai6, s:palette.nordokai0)
  call nordokai#highlight('Terminal', s:palette.nordokai6, s:palette.nordokai0)
  call nordokai#highlight('EndOfBuffer', s:palette.nordokai1, s:palette.nordokai0)
  call nordokai#highlight('Folded', s:palette.nordokai3_bright, s:palette.nordokai1)
  call nordokai#highlight('ToolbarLine', s:palette.nordokai6, s:palette.nordokai2)
  if s:configuration.sign_column_background ==# 'default'
    call nordokai#highlight('SignColumn', s:palette.nordokai6, s:palette.nordokai1)
    call nordokai#highlight('FoldColumn', s:palette.nordokai3_bright, s:palette.nordokai1)
  else
    call nordokai#highlight('SignColumn', s:palette.nordokai6, s:palette.none)
    call nordokai#highlight('FoldColumn', s:palette.nordokai3_bright, s:palette.none)
  endif
endif
call nordokai#highlight('LineNr', s:palette.nordokai3, s:palette.none)
call nordokai#highlight('IncSearch', s:palette.nordokai1, s:palette.nordokai13)
call nordokai#highlight('Search', s:palette.none, s:palette.nordokai3)
call nordokai#highlight('ColorColumn', s:palette.none, s:palette.nordokai1)
call nordokai#highlight('Conceal', s:palette.nordokai3_bright, s:palette.none)
call nordokai#highlight('Cursor', s:palette.nordokai0, s:palette.nordokai6)
highlight! link lCursor Cursor
if &diff
  call nordokai#highlight('CursorLine', s:palette.none, s:palette.none, 'underline')
  call nordokai#highlight('CursorColumn', s:palette.none, s:palette.none, 'bold')
else
  call nordokai#highlight('CursorLine', s:palette.none, s:palette.nordokai1)
  call nordokai#highlight('CursorColumn', s:palette.none, s:palette.nordokai1)
endif
if &diff
  call nordokai#highlight('CursorLineNr', s:palette.nordokai13, s:palette.none, 'underline')
elseif (&relativenumber == 1 && &cursorline == 0) || s:configuration.sign_column_background !=# 'default'
  call nordokai#highlight('CursorLineNr', s:palette.nordokai13, s:palette.none)
else
  if s:configuration.transparent_background
    call nordokai#highlight('CursorLineNr', s:palette.nordokai13, s:palette.none)
  else
    call nordokai#highlight('CursorLineNr', s:palette.nordokai13, s:palette.nordokai1)
  endif
endif
call nordokai#highlight('DiffAdd', s:palette.none, s:palette.nordokai14)
call nordokai#highlight('DiffChange', s:palette.none, s:palette.nordokai9)
call nordokai#highlight('DiffDelete', s:palette.none, s:palette.nordokai11)
call nordokai#highlight('DiffText', s:palette.nordokai0, s:palette.nordokai6)
call nordokai#highlight('Directory', s:palette.nordokai14, s:palette.none)
call nordokai#highlight('ErrorMsg', s:palette.nordokai4, s:palette.nordokai11)
call nordokai#highlight('WarningMsg', s:palette.nordokai13, s:palette.none, 'bold')
call nordokai#highlight('ModeMsg', s:palette.nordokai13, s:palette.none, 'bold')
call nordokai#highlight('MoreMsg', s:palette.nordokai8, s:palette.none, 'bold')
call nordokai#highlight('MatchParen', s:palette.nordokai13, s:palette.none, 'bold')
call nordokai#highlight('NonText', s:palette.nordokai1, s:palette.none)
call nordokai#highlight('Whitespace', s:palette.nordokai1, s:palette.none)
call nordokai#highlight('SpecialKey', s:palette.nordokai7_bright, s:palette.none)
call nordokai#highlight('Pmenu', s:palette.nordokai6, s:palette.nordokai2)
call nordokai#highlight('PmenuSbar', s:palette.none, s:palette.nordokai2)
call nordokai#highlight('PmenuThumb', s:palette.none, s:palette.nordokai3_bright)
call nordokai#highlight('NormalFloat', s:palette.nordokai6, s:palette.nordokai2)
if s:configuration.menu_selection_background ==# 'blue'
  call nordokai#highlight('PmenuSel', s:palette.nordokai0, s:palette.nordokai9)
elseif s:configuration.menu_selection_background ==# 'nord'
  call nordokai#highlight('PmenuSel', s:palette.nordokai8, s:palette.nordokai3_bright)
elseif s:configuration.menu_selection_background ==# 'green'
  call nordokai#highlight('PmenuSel', s:palette.nordokai0, s:palette.nordokai14)
elseif s:configuration.menu_selection_background ==# 'red'
  call nordokai#highlight('PmenuSel', s:palette.nordokai0, s:palette.nordokai11)
elseif s:configuration.menu_selection_background ==# 'gray'
  call nordokai#highlight('Pmenu', s:palette.nordokai4, s:palette.nordokai1)
  call nordokai#highlight('PmenuSel', s:palette.nordokai1, s:palette.nordokai4)
elseif s:configuration.menu_selection_background ==# 'bright'
  call nordokai#highlight('Pmenu', s:palette.nordokai1, s:palette.nordokai6)
  call nordokai#highlight('PmenuSel', s:palette.nordokai1, s:palette.nordokai4)
  call nordokai#highlight('NormalFloat', s:palette.nordokai1, s:palette.nordokai6)
endif
highlight! link WildMenu PmenuSel
call nordokai#highlight('Question', s:palette.nordokai13, s:palette.none)
call nordokai#highlight('SpellBad', s:palette.nordokai11, s:palette.none, 'undercurl', s:palette.nordokai11)
call nordokai#highlight('SpellCap', s:palette.nordokai13, s:palette.none, 'undercurl', s:palette.nordokai13)
call nordokai#highlight('SpellLocal', s:palette.nordokai8, s:palette.none, 'undercurl', s:palette.nordokai8)
call nordokai#highlight('SpellRare', s:palette.nordokai15, s:palette.none, 'undercurl', s:palette.nordokai15)
call nordokai#highlight('StatusLine', s:palette.nordokai6, s:palette.nordokai3)
call nordokai#highlight('StatusLineTerm', s:palette.nordokai6, s:palette.nordokai2)
call nordokai#highlight('StatusLineNC', s:palette.nordokai3_bright, s:palette.nordokai1)
call nordokai#highlight('StatusLineTermNC', s:palette.nordokai3_bright, s:palette.nordokai1)
call nordokai#highlight('TabLine', s:palette.nordokai3_bright, s:palette.nordokai1)
call nordokai#highlight('TabLineFill', s:palette.nordokai3_bright, s:palette.nordokai3)
call nordokai#highlight('TabLineSel', s:palette.nordokai6, s:palette.nordokai3_bright)
call nordokai#highlight('VertSplit', s:palette.nordokai3, s:palette.none)
call nordokai#highlight('Visual', s:palette.none, s:palette.nordokai3)
call nordokai#highlight('VisualNOS', s:palette.none, s:palette.nordokai3, 'underline')
highlight! link QuickFixLine Visual
call nordokai#highlight('Debug', s:palette.nordokai13, s:palette.none)
call nordokai#highlight('debugPC', s:palette.nordokai0, s:palette.nordokai14)
call nordokai#highlight('debugBreakpoint', s:palette.nordokai0, s:palette.nordokai11)
call nordokai#highlight('ToolbarButton', s:palette.nordokai0, s:palette.nordokai10)
if has('nvim')
  highlight! link Substitute IncSearch
  highlight! link DiagnosticFloatingError ErrorFloat
  highlight! link DiagnosticFloatingWarn WarningFloat
  highlight! link DiagnosticFloatingInfo InfoFloat
  highlight! link DiagnosticFloatingHint HintFloat
  highlight! link DiagnosticError ErrorText
  highlight! link DiagnosticWarn WarningText
  highlight! link DiagnosticInfo InfoText
  highlight! link DiagnosticHint HintText
  highlight! link DiagnosticVirtualTextError Red
  highlight! link DiagnosticVirtualTextWarn Yellow
  highlight! link DiagnosticVirtualTextInfo Blue
  highlight! link DiagnosticVirtualTextHint Green
  highlight! link DiagnosticUnderlineError ErrorTextLsp
  highlight! link DiagnosticUnderlineWarn WarningTextLsp
  highlight! link DiagnosticUnderlineInfo InfoTextLsp
  highlight! link DiagnosticUnderlineHint HintTextLsp
  highlight! link DiagnosticSignError RedSign
  highlight! link DiagnosticSignWarn YellowSign
  highlight! link DiagnosticSignInfo BlueSign
  highlight! link DiagnosticSignHint GreenSign
  highlight! link TermCursor Cursor
  highlight! link healthError Red
  highlight! link healthSuccess Green
  highlight! link healthWarning Yellow
endif

" }}}
" Syntax: {{{
call nordokai#highlight('Boolean', s:palette.nordokai12, s:palette.none)
call nordokai#highlight('Character', s:palette.nordokai14, s:palette.none)
call nordokai#highlight('Comment', s:palette.nordokai3_bright, s:palette.none)
call nordokai#highlight('Conditional', s:palette.nordokai15, s:palette.none)
call nordokai#highlight('Constant', s:palette.nordokai12, s:palette.none)
call nordokai#highlight('Define', s:palette.nordokai11, s:palette.none)
call nordokai#highlight('Delimiter', s:palette.nordokai11, s:palette.none)
call nordokai#highlight('Emphasis', s:palette.none, s:palette.none, 'bold')
call nordokai#highlight('Error', s:palette.nordokai11, s:palette.none)
call nordokai#highlight('Exception', s:palette.nordokai11, s:palette.none)
call nordokai#highlight('Field', s:palette.nordokai7, s:palette.none)
call nordokai#highlight('Float', s:palette.nordokai12, s:palette.none)
call nordokai#highlight('Function', s:palette.nordokai9, s:palette.none)
call nordokai#highlight('Identifier', s:palette.nordokai9, s:palette.none)
call nordokai#highlight('Ignore', s:palette.nordokai3_bright, s:palette.none)
call nordokai#highlight('Include', s:palette.nordokai9, s:palette.none)
call nordokai#highlight('Keyword', s:palette.nordokai15, s:palette.none)
call nordokai#highlight('Label', s:palette.nordokai15, s:palette.none)
call nordokai#highlight('Macro', s:palette.nordokai12, s:palette.none)
call nordokai#highlight('Namespace', s:palette.nordokai8, s:palette.none)
call nordokai#highlight('Number', s:palette.nordokai12, s:palette.none)
call nordokai#highlight('Operator', s:palette.nordokai11, s:palette.none)
call nordokai#highlight('Parameter', s:palette.nordokai11, s:palette.none)
call nordokai#highlight('PreProc', s:palette.nordokai9, s:palette.none)
call nordokai#highlight('PreCondit', s:palette.nordokai11, s:palette.none)
call nordokai#highlight('Property', s:palette.nordokai11, s:palette.none)
call nordokai#highlight('Punct', s:palette.nordokai11, s:palette.none)
call nordokai#highlight('Repeat', s:palette.nordokai15, s:palette.none)
call nordokai#highlight('Special', s:palette.nordokai13, s:palette.none)
call nordokai#highlight('SpecialChar', s:palette.nordokai13, s:palette.none)
call nordokai#highlight('SpecialComment', s:palette.nordokai13, s:palette.none)
call nordokai#highlight('Structure', s:palette.nordokai9, s:palette.none)
call nordokai#highlight('StorageClass', s:palette.nordokai8, s:palette.none)
call nordokai#highlight('Statement', s:palette.nordokai11, s:palette.none)
call nordokai#highlight('String', s:palette.nordokai14, s:palette.none)
call nordokai#highlight('Tag', s:palette.nordokai9, s:palette.none)
call nordokai#highlight('Text', s:palette.nordokai6, s:palette.none)
call nordokai#highlight('Title', s:palette.nordokai6, s:palette.none)
call nordokai#highlight('Todo', s:palette.nordokai13, s:palette.none)
call nordokai#highlight('Type', s:palette.nordokai13, s:palette.none)
call nordokai#highlight('Typedef', s:palette.nordokai11, s:palette.none)
call nordokai#highlight('Underlined', s:palette.none, s:palette.none, 'underline')
call nordokai#highlight('Variable', s:palette.nordokai6, s:palette.none)
" }}}
" Predefined Highlight Groups: {{{
call nordokai#highlight('Fg', s:palette.nordokai6, s:palette.none)
call nordokai#highlight('Gray', s:palette.nordokai3_bright, s:palette.none)
call nordokai#highlight('LightGray', s:palette.nordokai3_bright, s:palette.none)
call nordokai#highlight('Red', s:palette.nordokai11, s:palette.none)
call nordokai#highlight('Orange', s:palette.nordokai12, s:palette.none)
call nordokai#highlight('Yellow', s:palette.nordokai13, s:palette.none)
call nordokai#highlight('Green', s:palette.nordokai14, s:palette.none)
call nordokai#highlight('Blue', s:palette.nordokai9, s:palette.none)
call nordokai#highlight('LightBlue', s:palette.nordokai7, s:palette.none)
call nordokai#highlight('Cyan', s:palette.nordokai8, s:palette.none)
call nordokai#highlight('Purple', s:palette.nordokai15, s:palette.none)
if s:configuration.transparent_background || s:configuration.sign_column_background !=# 'default'
  call nordokai#highlight('RedSign', s:palette.nordokai11, s:palette.none)
  call nordokai#highlight('OrangeSign', s:palette.nordokai12, s:palette.none)
  call nordokai#highlight('YellowSign', s:palette.nordokai13, s:palette.none)
  call nordokai#highlight('GreenSign', s:palette.nordokai14, s:palette.none)
  call nordokai#highlight('BlueSign', s:palette.nordokai8, s:palette.none)
  call nordokai#highlight('PurpleSign', s:palette.nordokai15, s:palette.none)
else
  call nordokai#highlight('RedSign', s:palette.nordokai11, s:palette.nordokai1)
  call nordokai#highlight('OrangeSign', s:palette.nordokai12, s:palette.nordokai1)
  call nordokai#highlight('YellowSign', s:palette.nordokai13, s:palette.nordokai1)
  call nordokai#highlight('GreenSign', s:palette.nordokai14, s:palette.nordokai1)
  call nordokai#highlight('BlueSign', s:palette.nordokai8, s:palette.nordokai1)
  call nordokai#highlight('PurpleSign', s:palette.nordokai15, s:palette.nordokai1)
endif
if s:configuration.diagnostic_line_highlight
  call nordokai#highlight('ErrorLine', s:palette.none, s:palette.nordokai11)
  call nordokai#highlight('WarningLine', s:palette.none, s:palette.nordokai13)
  call nordokai#highlight('InfoLine', s:palette.none, s:palette.nordokai9)
  call nordokai#highlight('HintLine', s:palette.none, s:palette.nordokai14)
else
  highlight clear ErrorLine
  highlight clear WarningLine
  highlight clear InfoLine
  highlight clear HintLine
endif
call nordokai#highlight('ErrorText', s:palette.nordokai11, s:palette.none)
call nordokai#highlight('WarningText', s:palette.nordokai13, s:palette.none)
call nordokai#highlight('InfoText', s:palette.nordokai9, s:palette.none)
call nordokai#highlight('HintText', s:palette.nordokai14, s:palette.none)
call nordokai#highlight('ErrorTextLsp', s:palette.none, s:palette.none, 'undercurl', s:palette.nordokai11)
call nordokai#highlight('WarningTextLsp', s:palette.none, s:palette.none, 'undercurl', s:palette.nordokai13)
call nordokai#highlight('InfoTextLsp', s:palette.none, s:palette.none, 'undercurl', s:palette.nordokai8)
call nordokai#highlight('HintTextLsp', s:palette.nordokai3_bright, s:palette.none)
call nordokai#highlight('ErrorFloat', s:palette.nordokai11, s:palette.nordokai2)
call nordokai#highlight('WarningFloat', s:palette.nordokai13, s:palette.nordokai2)
call nordokai#highlight('InfoFloat', s:palette.nordokai8, s:palette.nordokai2)
call nordokai#highlight('HintFloat', s:palette.nordokai14, s:palette.nordokai2)
if s:configuration.menu_selection_background ==# 'bright'
  call nordokai#highlight('ErrorFloat', s:palette.nordokai11, s:palette.nordokai6)
  call nordokai#highlight('WarningFloat', s:palette.nordokai13, s:palette.nordokai6)
  call nordokai#highlight('InfoFloat', s:palette.nordokai8, s:palette.nordokai6)
  call nordokai#highlight('HintFloat', s:palette.nordokai14, s:palette.nordokai6)
endif
if &diff
  call nordokai#highlight('CurrentWord', s:palette.nordokai0, s:palette.nordokai14)
elseif s:configuration.current_word ==# 'gray background'
  call nordokai#highlight('CurrentWord', s:palette.none, s:palette.nordokai2)
else
  call nordokai#highlight('CurrentWord', s:palette.none, s:palette.none, s:configuration.current_word)
endif
" }}}
" }}}
" Terminal: {{{
if (has('termguicolors') && &termguicolors) || has('gui_running')
  " Definition
  let s:terminal = {
        \ 'black':    s:palette.nordokai3,
        \ 'red':      s:palette.nordokai11,
        \ 'yellow':   s:palette.nordokai13,
        \ 'green':    s:palette.nordokai14,
        \ 'cyan':     s:palette.nordokai7_bright,
        \ 'blue':     s:palette.nordokai9,
        \ 'purple':   s:palette.nordokai15,
        \ 'white':    s:palette.nordokai6
        \ }
  " Implementation: {{{
  if !has('nvim')
    let g:terminal_ansi_colors = [s:terminal.black[0], s:terminal.red[0], s:terminal.green[0], s:terminal.yellow[0],
          \ s:terminal.blue[0], s:terminal.purple[0], s:terminal.cyan[0], s:terminal.white[0], s:terminal.black[0], s:terminal.red[0],
          \ s:terminal.green[0], s:terminal.yellow[0], s:terminal.blue[0], s:terminal.purple[0], s:terminal.cyan[0], s:terminal.white[0]]
  else
    let g:terminal_color_0 = s:terminal.black[0]
    let g:terminal_color_1 = s:terminal.red[0]
    let g:terminal_color_2 = s:terminal.green[0]
    let g:terminal_color_3 = s:terminal.yellow[0]
    let g:terminal_color_4 = s:terminal.blue[0]
    let g:terminal_color_5 = s:terminal.purple[0]
    let g:terminal_color_6 = s:terminal.cyan[0]
    let g:terminal_color_7 = s:terminal.white[0]
    let g:terminal_color_8 = s:terminal.black[0]
    let g:terminal_color_9 = s:terminal.red[0]
    let g:terminal_color_10 = s:terminal.green[0]
    let g:terminal_color_11 = s:terminal.yellow[0]
    let g:terminal_color_12 = s:terminal.blue[0]
    let g:terminal_color_13 = s:terminal.purple[0]
    let g:terminal_color_14 = s:terminal.cyan[0]
    let g:terminal_color_15 = s:terminal.white[0]
  endif
  " }}}
endif
" }}}
" Plugins: {{{
" nvim-treesitter/nvim-treesitter {{{
highlight! link TSAnnotation Identifier
highlight! link TSAttribute Identifier
highlight! link TSBoolean Boolean
highlight! link TSCharacter Character
highlight! link TSComment Comment
highlight! link TSConditional Conditional
highlight! link TSConstBuiltin Keyword
highlight! link TSConstMacro PreProc
highlight! link TSConstant Constant
highlight! link TSConstructor Type
highlight! link TSEmphasis Emphasis
highlight! link TSError Error
highlight! link TSException Exception
highlight! link TSField Field
highlight! link TSFloat Float
highlight! link TSFuncBuiltin Function
highlight! link TSFuncMacro Macro
highlight! link TSFunction Function
highlight! link TSInclude Include
highlight! link TSKeyword Keyword
highlight! link TSKeywordFunction Keyword
highlight! link TSLabel Label
highlight! link TSMethod Function
highlight! link TSNamespace Namespace
highlight! link TSNumber Number
highlight! link TSOperator Operator
highlight! link TSParameter Parameter
highlight! link TSParameterReference Parameter
highlight! link TSProperty Property
highlight! link TSPunctBracket Punct
highlight! link TSPunctDelimiter Punct
highlight! link TSPunctSpecial Punct
highlight! link TSRepeat Repeat
highlight! link TSString String
highlight! link TSStringEscape Special
highlight! link TSStringRegex Special
highlight! link TSStructure Structure
highlight! link TSTag Tag
highlight! link TSTagDelimiter Delimiter
highlight! link TSText Text
highlight! link TSType Type
highlight! link TSTypeBuiltin Type
highlight! link TSUnderline Underlined
highlight! link TSURI markdownUrl
highlight! link TSVariable Variable
highlight! link TSVariableBuiltin Boolean
" }}}
" junegunn/fzf.vim {{{
let g:fzf_colors = {
      \ 'fg':      [ 'fg', 'Normal'                               ],
      \ 'bg':      [ 'bg', 'Normal'                               ],
      \ 'hl':      [ 'fg', 'Comment'                              ],
      \ 'fg+':     [ 'fg', 'CursorLine', 'CursorColumn', 'Normal' ],
      \ 'bg+':     [ 'bg', 'CursorLine', 'CursorColumn'           ],
      \ 'hl+':     [ 'fg', 'Statement'                            ],
      \ 'info':    [ 'fg', 'PreProc'                              ],
      \ 'border':  [ 'fg', 'Normal'                               ],
      \ 'prompt':  [ 'fg', 'Conditional'                          ],
      \ 'pointer': [ 'fg', 'Exception'                            ],
      \ 'marker':  [ 'fg', 'Keyword'                              ],
      \ 'spinner': [ 'fg', 'Label'                                ],
      \ 'header':  [ 'fg', 'Comment'                              ],
      \ }
" }}}
" ap/vim-buftabline {{{
highlight! link BufTabLineCurrent TabLineSel
highlight! link BufTabLineActive TabLine
highlight! link BufTabLineHidden TabLineFill
highlight! link BufTabLineFill TabLineFill
" }}}
" netrw {{{
" https://www.vim.org/scripts/script.php?script_id=1075
highlight! link netrwDir Blue
highlight! link netrwClassify Yellow
highlight! link netrwLink Orange
highlight! link netrwSymLink Orange
highlight! link netrwExe Green
highlight! link netrwComment Gray
highlight! link netrwList Yellow
highlight! link netrwHelpCmd Blue
highlight! link netrwCmdSep Gray
highlight! link netrwVersion Purple
" }}}
" ctrlp {{{
" https://github.com/kien/ctrlp.vim
call nordokai#highlight('CtrlPMatch', s:palette.nordokai13, s:palette.none, 'bold')
highlight! link CtrlPPrtBase Orange
highlight! link CtrlPPrtCursor Normal
highlight! link CtrlPLinePre Orange
" }}}
" }}}
" Extended File Types: {{{
" vim-plug: https://github.com/junegunn/vim-plug {{{
call nordokai#highlight('plug1', s:palette.nordokai11, s:palette.none, 'bold')
call nordokai#highlight('plugNumber', s:palette.nordokai13, s:palette.none, 'bold')
highlight! link plug2 Blue
highlight! link plugBracket Blue
highlight! link plugName Green
highlight! link plugDash Red
highlight! link plugNotLoaded Gray
highlight! link plugH2 Purple
highlight! link plugMessage Purple
highlight! link plugError Red
highlight! link plugRelDate Gray
highlight! link plugStar Purple
highlight! link plugUpdate Blue
highlight! link plugDeleted Gray
highlight! link plugEdge Purple
" }}}
" " vim-markdown: https://github.com/gabrielelana/vim-markdown{{{
call nordokai#highlight('mkdURL', s:palette.nordokai8, s:palette.none, 'underline')
call nordokai#highlight('mkdInlineURL', s:palette.nordokai8, s:palette.none, 'underline')
call nordokai#highlight('mkd', s:palette.nordokai3_bright, s:palette.none)
highlight! link mkdCodeDelimiter Green
highlight! link mkdBold Gray
highlight! link mkdLink Red
highlight! link mkdHeading Gray
highlight! link mkdListItem Red
highlight! link mkdRule Purple
highlight! link mkdDelimiter Gray
highlight! link mkdId Yellow
" }}}
" tex {{{
" builtin: http://www.drchip.org/astronaut/vim/index.html#SYNTAX_TEX{{{
highlight! link texStatement Blue
highlight! link texOnlyMath Gray
highlight! link texDefName Yellow
highlight! link texNewCmd Orange
highlight! link texCmdName Blue
highlight! link texBeginEnd Red
highlight! link texBeginEndName Green
highlight! link texDocType Red
highlight! link texDocTypeArgs Orange
highlight! link texInputFile Green
" }}}
" vimtex: https://github.com/lervag/vimtex {{{
highlight! link texFileArg Green
highlight! link texCmd Blue
highlight! link texCmdPackage Blue
highlight! link texCmdDef Red
highlight! link texDefArgName Yellow
highlight! link texCmdNewcmd Red
highlight! link texCmdClass Red
highlight! link texCmdTitle Red
highlight! link texCmdAuthor Red
highlight! link texCmdEnv Red
highlight! link texCmdPart Red
highlight! link texEnvArgName Green
" }}}
" }}}
" html/markdown/javascriptreact/typescriptreact {{{
" builtin: https://notabug.org/jorgesumle/vim-html-syntax{{{
call nordokai#highlight('htmlH1', s:palette.nordokai6, s:palette.none, 'bold')
call nordokai#highlight('htmlH2', s:palette.nordokai6, s:palette.none, 'bold')
call nordokai#highlight('htmlH3', s:palette.nordokai6, s:palette.none, 'bold')
call nordokai#highlight('htmlH4', s:palette.nordokai6, s:palette.none, 'bold')
call nordokai#highlight('htmlH5', s:palette.nordokai6, s:palette.none, 'bold')
call nordokai#highlight('htmlH6', s:palette.nordokai6, s:palette.none, 'bold')
call nordokai#highlight('htmlLink', s:palette.none, s:palette.none, 'underline')
call nordokai#highlight('htmlBold', s:palette.none, s:palette.none, 'bold')
call nordokai#highlight('htmlBoldUnderline', s:palette.none, s:palette.none, 'bold,underline')
call nordokai#highlight('htmlBold', s:palette.none, s:palette.none, 'bold')
call nordokai#highlight('htmlBoldUnderline', s:palette.none, s:palette.none, 'bold,underline')
call nordokai#highlight('htmlUnderline', s:palette.none, s:palette.none, 'underline')
call nordokai#highlight('htmlUnderline', s:palette.none, s:palette.none, 'underline')
call nordokai#highlight('html', s:palette.none, s:palette.none)
highlight! link htmlTag Red
highlight! link htmlEndTag Red
highlight! link htmlTagN Blue
highlight! link htmlTagName Blue
highlight! link htmlArg Green
highlight! link htmlScriptTag Red
highlight! link htmlSpecialTagName Blue
highlight! link htmlString String
" }}}
" }}}
" htmldjango {{{
" builtin: https://github.com/vim/vim/blob/master/runtime/syntax/htmldjango.vim{{{
highlight! link djangoTagBlock Yellow
" }}}
" }}}
" xml {{{
" builtin: https://github.com/chrisbra/vim-xml-ftplugin{{{
highlight! link xmlTag Green
highlight! link xmlEndTag Blue
highlight! link xmlTagName Red
highlight! link xmlEqual Orange
highlight! link xmlAttrib Blue
highlight! link xmlEntity Red
highlight! link xmlEntityPunct Red
highlight! link xmlDocTypeDecl Gray
highlight! link xmlDocTypeKeyword Red
highlight! link xmlCdataStart Gray
highlight! link xmlCdataCdata Purple
highlight! link xmlString Green
" }}}
" }}}
" css/scss/sass/less {{{
" builtin: https://github.com/JulesWang/css.vim{{{
" highlight! link cssStringQ Green
highlight! link cssStringQQ Green
highlight! link cssAttrComma Gray
highlight! link cssBraces Gray
highlight! link cssTagName Purple
highlight! link cssClassNameDot Gray
highlight! link cssClassName Red
highlight! link cssFunctionName Orange
highlight! link cssAttr Green
highlight! link cssCommonAttr Green
highlight! link cssProp Blue
highlight! link cssPseudoClassId Yellow
highlight! link cssPseudoClassFn Green
highlight! link cssPseudoClass Yellow
highlight! link cssImportant Red
highlight! link cssSelectorOp Orange
highlight! link cssSelectorOp2 Orange
highlight! link cssColor Green
highlight! link cssUnitDecorators Green
highlight! link cssValueLength Green
highlight! link cssValueInteger Green
highlight! link cssValueNumber Green
highlight! link cssValueAngle Green
highlight! link cssValueTime Green
highlight! link cssValueFrequency Green
highlight! link cssVendor Gray
highlight! link cssNoise Gray
" }}}
" }}}
" vim {{{
call nordokai#highlight('vimCommentTitle', s:palette.nordokai3_bright, s:palette.none, 'bold')
highlight! link vimLet Red
highlight! link vimFunction Green
highlight! link vimIsCommand Fg
highlight! link vimUserFunc Green
highlight! link vimFuncName Green
highlight! link vimMap Blue
highlight! link vimNotation Purple
highlight! link vimMapLhs Green
highlight! link vimMapRhs Green
highlight! link vimSetEqual Blue
highlight! link vimSetSep Fg
highlight! link vimOption Blue
highlight! link vimUserAttrbKey Blue
highlight! link vimUserAttrb Green
highlight! link vimAutoCmdSfxList Orange
highlight! link vimSynType Orange
highlight! link vimHiBang Orange
highlight! link vimSet Blue
highlight! link vimSetSep Gray
" }}}
" diff/git {{{
highlight! link diffAdded Green
highlight! link diffRemoved Red
highlight! link diffChanged Blue
highlight! link diffOldFile Yellow
highlight! link diffNewFile Orange
highlight! link diffFile Purple
highlight! link diffLine Gray
highlight! link diffIndexLine Purple
" }}}
" gitcommit {{{
highlight! link gitcommitSummary Red
highlight! link gitcommitUntracked Gray
highlight! link gitcommitDiscarded Gray
highlight! link gitcommitSelected Gray
highlight! link gitcommitUnmerged Gray
highlight! link gitcommitOnBranch Gray
highlight! link gitcommitArrow Gray
highlight! link gitcommitFile Green
" }}}
" help {{{
call nordokai#highlight('helpNote', s:palette.nordokai15, s:palette.none, 'bold')
call nordokai#highlight('helpHeadline', s:palette.nordokai11, s:palette.none, 'bold')
call nordokai#highlight('helpHeader', s:palette.nordokai12, s:palette.none, 'bold')
call nordokai#highlight('helpURL', s:palette.nordokai14, s:palette.none, 'underline')
call nordokai#highlight('helpHyperTextEntry', s:palette.nordokai8, s:palette.none, 'bold')
highlight! link helpHyperTextJump Blue
highlight! link helpCommand Yellow
highlight! link helpExample Green
highlight! link helpSpecial Purple
highlight! link helpSectionDelim Gray
" }}}
" }}}
