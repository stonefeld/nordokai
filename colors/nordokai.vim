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
highlight! link vCursor Cursor
highlight! link iCursor Cursor
highlight! link lCursor Cursor
highlight! link CursorIM Cursor
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
call nordokai#highlight('ErrorMsg', s:palette.nordokai11, s:palette.none, 'bold,underline')
call nordokai#highlight('WarningMsg', s:palette.nordokai13, s:palette.none, 'bold')
call nordokai#highlight('ModeMsg', s:palette.nordokai6, s:palette.none, 'bold')
call nordokai#highlight('MoreMsg', s:palette.nordokai8, s:palette.none, 'bold')
call nordokai#highlight('MatchParen', s:palette.nordokai13, s:palette.none, 'bold')
call nordokai#highlight('NonText', s:palette.nordokai1, s:palette.none)
call nordokai#highlight('Whitespace', s:palette.nordokai3, s:palette.none)
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
call nordokai#highlight('StatusLine', s:palette.nordokai6, s:palette.nordokai1)
call nordokai#highlight('StatusLineOuterBlock', s:palette.nordokai1, s:palette.nordokai8)
call nordokai#highlight('StatusLineInnerBlock', s:palette.nordokai4, s:palette.nordokai3)
call nordokai#highlight('StatusLineTerm', s:palette.nordokai6, s:palette.nordokai2)
call nordokai#highlight('StatusLineNC', s:palette.nordokai3_bright, s:palette.nordokai1)
call nordokai#highlight('StatusLineTermNC', s:palette.nordokai3_bright, s:palette.nordokai1)
call nordokai#highlight('TabLine', s:palette.nordokai3_bright, s:palette.nordokai1)
call nordokai#highlight('TabLineFill', s:palette.nordokai3_bright, s:palette.nordokai3)
call nordokai#highlight('TabLineSel', s:palette.nordokai6, s:palette.nordokai3_bright)
call nordokai#highlight('VertSplit', s:palette.nordokai3, s:palette.none)
call nordokai#highlight('Visual', s:palette.none, s:palette.nordokai3)
call nordokai#highlight('VisualNOS', s:palette.none, s:palette.nordokai3, 'underline')
call nordokai#highlight('QuickFixLine', s:palette.nordokai8, s:palette.none, 'bold')
call nordokai#highlight('Debug', s:palette.nordokai13, s:palette.none)
call nordokai#highlight('debugPC', s:palette.nordokai0, s:palette.nordokai14)
call nordokai#highlight('debugBreakpoint', s:palette.nordokai0, s:palette.nordokai11)
call nordokai#highlight('ToolbarButton', s:palette.nordokai0, s:palette.nordokai10)
if has('nvim')
  call nordokai#highlight('Substitute', s:palette.nordokai0, s:palette.nordokai13)
  highlight! link LspDiagnosticsFloatingError ErrorFloat
  highlight! link LspDiagnosticsFloatingWarning WarningFloat
  highlight! link LspDiagnosticsFloatingInformation InfoFloat
  highlight! link LspDiagnosticsFloatingHint HintFloat
  highlight! link LspDiagnosticsDefaultError ErrorText
  highlight! link LspDiagnosticsDefaultWarning WarningText
  highlight! link LspDiagnosticsDefaultInformation InfoText
  highlight! link LspDiagnosticsDefaultHint HintText
  highlight! link LspDiagnosticsVirtualTextError Red
  highlight! link LspDiagnosticsVirtualTextWarning Yellow
  highlight! link LspDiagnosticsVirtualTextInformation Blue
  highlight! link LspDiagnosticsVirtualTextHint Green
  highlight! link LspDiagnosticsUnderlineError ErrorTextLsp
  highlight! link LspDiagnosticsUnderlineWarning WarningTextLsp
  highlight! link LspDiagnosticsUnderlineInformation InfoTextLsp
  highlight! link LspDiagnosticsUnderlineHint HintTextLsp
  highlight! link LspDiagnosticsSignError RedSign
  highlight! link LspDiagnosticsSignWarning YellowSign
  highlight! link LspDiagnosticsSignInformation BlueSign
  highlight! link LspDiagnosticsSignHint GreenSign
  highlight! link LspReferenceText CurrentWord
  highlight! link LspReferenceRead CurrentWord
  highlight! link LspReferenceWrite CurrentWord
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
call nordokai#highlight('Operator', s:palette.nordokai4, s:palette.none)
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
call nordokai#highlight('HintBulb', s:palette.nordokai13, s:palette.nordokai1)
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
" voldikss/vim-floaterm {{{
highlight! link FloatermBorder Normal
" }}}
" glepnir/lspsaga.nvim {{{
highlight! link LspDiagnosticsDefaultInformation HintBulb
" }}}
" hrsh7th/nvim-cmp {{{
call nordokai#highlight('CmpItemAbbrMatch', s:palette.none, s:palette.none, 'bold')
" }}}
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
" neoclide/coc.nvim {{{
call nordokai#highlight('CocHoverRange', s:palette.none, s:palette.none, 'bold,underline')
highlight! link CocErrorFloat ErrorFloat
highlight! link CocWarningFloat WarningFloat
highlight! link CocInfoFloat InfoFloat
highlight! link CocHintFloat HintFloat
highlight! link CocErrorHighlight ErrorText
highlight! link CocWarningHighlight WarningText
highlight! link CocInfoHighlight InfoText
highlight! link CocHintHighlight HintText
highlight! link CocHighlightText CurrentWord
highlight! link CocErrorSign RedSign
highlight! link CocWarningSign YellowSign
highlight! link CocInfoSign BlueSign
highlight! link CocHintSign GreenSign
highlight! link CocWarningVirtualText Gray
highlight! link CocErrorVirtualText Gray
highlight! link CocInfoVirtualText Gray
highlight! link CocHintVirtualText Gray
highlight! link CocErrorLine ErrorLine
highlight! link CocWarningLine WarningLine
highlight! link CocInfoLine InfoLine
highlight! link CocHintLine HintLine
highlight! link CocCodeLens Gray
highlight! link HighlightedyankRegion Visual
highlight! link CocGitAddedSign GreenSign
highlight! link CocGitChangeRemovedSign PurpleSign
highlight! link CocGitChangedSign BlueSign
highlight! link CocGitRemovedSign RedSign
highlight! link CocGitTopRemovedSign RedSign
highlight! link CocExplorerBufferRoot Red
highlight! link CocExplorerBufferExpandIcon Blue
highlight! link CocExplorerBufferBufnr Yellow
highlight! link CocExplorerBufferModified Yellow
highlight! link CocExplorerBufferReadonly Red
highlight! link CocExplorerBufferBufname Gray
highlight! link CocExplorerBufferFullpath Gray
highlight! link CocExplorerFileRoot Red
highlight! link CocExplorerFileRootName Green
highlight! link CocExplorerFileExpandIcon Blue
highlight! link CocExplorerFileFullpath Gray
highlight! link CocExplorerFileDirectory Green
highlight! link CocExplorerFileGitStaged Purple
highlight! link CocExplorerFileGitUnstaged Yellow
highlight! link CocExplorerFileGitRootStaged Purple
highlight! link CocExplorerFileGitRootUnstaged Yellow
highlight! link CocExplorerGitPathChange Fg
highlight! link CocExplorerGitContentChange Fg
highlight! link CocExplorerGitRenamed Purple
highlight! link CocExplorerGitCopied Fg
highlight! link CocExplorerGitAdded Green
highlight! link CocExplorerGitUntracked Blue
highlight! link CocExplorerGitUnmodified Fg
highlight! link CocExplorerGitUnmerged Orange
highlight! link CocExplorerGitMixed Fg
highlight! link CocExplorerGitModified Yellow
highlight! link CocExplorerGitDeleted Red
highlight! link CocExplorerGitIgnored Gray
highlight! link CocExplorerFileSize Blue
highlight! link CocExplorerTimeAccessed Purple
highlight! link CocExplorerTimeCreated Purple
highlight! link CocExplorerTimeModified Purple
highlight! link CocExplorerFileRootName Orange
highlight! link CocExplorerBufferNameVisible Green
highlight! link CocExplorerIndentLine Conceal
highlight! link CocExplorerHelpDescription Gray
highlight! link CocExplorerHelpHint Gray
" }}}
" prabirshrestha/vim-lsp {{{
highlight! link LspErrorVirtual Gray
highlight! link LspWarningVirtual Gray
highlight! link LspInformationVirtual Gray
highlight! link LspHintVirtual Gray
highlight! link LspErrorHighlight ErrorText
highlight! link LspWarningHighlight WarningText
highlight! link LspInformationHighlight InfoText
highlight! link LspHintHighlight HintText
highlight! link lspReference CurrentWord
" }}}
" ycm-core/YouCompleteMe {{{
highlight! link YcmErrorSign RedSign
highlight! link YcmWarningSign YellowSign
highlight! link YcmErrorLine ErrorLine
highlight! link YcmWarningLine WarningLine
highlight! link YcmErrorSection ErrorText
highlight! link YcmWarningSection WarningText
" }}}
" dense-analysis/ale {{{
highlight! link ALEError ErrorText
highlight! link ALEWarning WarningText
highlight! link ALEInfo InfoText
highlight! link ALEErrorSign RedSign
highlight! link ALEWarningSign YellowSign
highlight! link ALEInfoSign BlueSign
highlight! link ALEErrorLine ErrorLine
highlight! link ALEWarningLine WarningLine
highlight! link ALEInfoLine InfoLine
highlight! link ALEVirtualTextError Gray
highlight! link ALEVirtualTextWarning Gray
highlight! link ALEVirtualTextInfo Gray
highlight! link ALEVirtualTextStyleError Gray
highlight! link ALEVirtualTextStyleWarning Gray
" }}}
" neomake/neomake {{{
highlight! link NeomakeError ErrorText
highlight! link NeomakeWarning WarningText
highlight! link NeomakeInfo InfoText
highlight! link NeomakeMessage HintText
highlight! link NeomakeErrorSign RedSign
highlight! link NeomakeWarningSign YellowSign
highlight! link NeomakeInfoSign BlueSign
highlight! link NeomakeMessageSign GreenSign
highlight! link NeomakeVirtualtextError Gray
highlight! link NeomakeVirtualtextWarning Gray
highlight! link NeomakeVirtualtextInfo Gray
highlight! link NeomakeVirtualtextMessag Gray
" }}}
" vim-syntastic/syntastic {{{
highlight! link SyntasticError ErrorText
highlight! link SyntasticWarning WarningText
highlight! link SyntasticErrorSign RedSign
highlight! link SyntasticWarningSign YellowSign
highlight! link SyntasticErrorLine ErrorLine
highlight! link SyntasticWarningLine WarningLine
" }}}
" Yggdroot/LeaderF{{{
if !exists('g:Lf_StlColorscheme')
  let g:Lf_StlColorscheme = 'one'
endif
call nordokai#highlight('Lf_hl_match', s:palette.nordokai14, s:palette.none, 'bold')
call nordokai#highlight('Lf_hl_match0', s:palette.nordokai14, s:palette.none, 'bold')
call nordokai#highlight('Lf_hl_match1', s:palette.nordokai8, s:palette.none, 'bold')
call nordokai#highlight('Lf_hl_match2', s:palette.nordokai11, s:palette.none, 'bold')
call nordokai#highlight('Lf_hl_match3', s:palette.nordokai13, s:palette.none, 'bold')
call nordokai#highlight('Lf_hl_match4', s:palette.nordokai15, s:palette.none, 'bold')
call nordokai#highlight('Lf_hl_matchRefine', s:palette.nordokai13, s:palette.none, 'bold')
highlight! link Lf_hl_cursorline Fg
highlight! link Lf_hl_selection DiffAdd
highlight! link Lf_hl_rgHighlight Visual
highlight! link Lf_hl_gtagsHighlight Visual
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
" Shougo/denite.nvim{{{
call nordokai#highlight('deniteMatchedChar', s:palette.nordokai14, s:palette.none, 'bold')
call nordokai#highlight('deniteMatchedRange', s:palette.nordokai14, s:palette.none, 'bold,underline')
call nordokai#highlight('deniteInput', s:palette.nordokai14, s:palette.nordokai1, 'bold')
call nordokai#highlight('deniteStatusLineNumber', s:palette.nordokai15, s:palette.nordokai1)
call nordokai#highlight('deniteStatusLinePath', s:palette.nordokai6, s:palette.nordokai1)
highlight! link deniteSelectedLine Green
" }}}
" kien/ctrlp.vim{{{
call nordokai#highlight('CtrlPMatch', s:palette.nordokai15, s:palette.none)
call nordokai#highlight('CtrlPPrtBase', s:palette.nordokai15, s:palette.none)
call nordokai#highlight('CtrlPLinePre', s:palette.nordokai15, s:palette.none)
call nordokai#highlight('CtrlPMode1', s:palette.nordokai4, s:palette.nordokai2)
call nordokai#highlight('CtrlPMode2', s:palette.nordokai4, s:palette.nordokai2)
call nordokai#highlight('CtrlPStats', s:palette.nordokai4, s:palette.nordokai2)
call nordokai#highlight('CtrlPPrtCursor', s:palette.nordokai0, s:palette.nordokai4)
highlight! link CtrlPNoEntries Red
highlight! link CtrlPBufferPath Normal
highlight! link CtrlPBufferHid Normal
" }}}
" airblade/vim-gitgutter {{{
highlight! link GitGutterAdd GreenSign
highlight! link GitGutterChange BlueSign
highlight! link GitGutterDelete RedSign
highlight! link GitGutterChangeDelete PurpleSign
" }}}
" mhinz/vim-signify {{{
highlight! link SignifySignAdd GreenSign
highlight! link SignifySignChange BlueSign
highlight! link SignifySignDelete RedSign
highlight! link SignifySignChangeDelete PurpleSign
" }}}
" andymass/vim-matchup {{{
call nordokai#highlight('MatchParenCur', s:palette.none, s:palette.none, 'bold')
call nordokai#highlight('MatchWord', s:palette.none, s:palette.none, 'underline')
call nordokai#highlight('MatchWordCur', s:palette.none, s:palette.none, 'underline')
" }}}
" easymotion/vim-easymotion {{{
highlight! link EasyMotionTarget Search
highlight! link EasyMotionShade Gray
" }}}
" justinmk/vim-sneak {{{
call nordokai#highlight('SneakLabelMask', s:palette.nordokai14, s:palette.nordokai14)
highlight! link Sneak Search
highlight! link SneakLabel Search
highlight! link SneakScope DiffText
" }}}
" terryma/vim-multiple-cursors {{{
highlight! link multiple_cursors_cursor Cursor
highlight! link multiple_cursors_visual Visual
" }}}
" mg979/vim-visual-multi {{{
let g:VM_Mono_hl = 'Cursor'
let g:VM_Extend_hl = 'Visual'
let g:VM_Cursor_hl = 'Cursor'
let g:VM_Insert_hl = 'Cursor'
" }}}
" dominikduda/vim_current_word {{{
highlight! link CurrentWord CurrentWord
highlight! link CurrentWordTwins CurrentWord
" }}}
" RRethy/vim-illuminate {{{
highlight! link illuminatedWord CurrentWord
" }}}
" itchyny/vim-cursorword {{{
highlight! link CursorWord0 CurrentWord
highlight! link CursorWord1 CurrentWord
" }}}
" Yggdroot/indentLine {{{
let g:indentLine_color_gui = s:palette.nordokai3_bright[0]
let g:indentLine_color_term = s:palette.nordokai3_bright[1]
" }}}
" nathanaelkane/vim-indent-guides {{{
if get(g:, 'indent_guides_auto_colors', 1) == 0
  call nordokai#highlight('IndentGuidesOdd', s:palette.nordokai0, s:palette.nordokai1)
  call nordokai#highlight('IndentGuidesEven', s:palette.nordokai0, s:palette.nordokai2)
endif
" }}}
" kshenoy/vim-signature {{{
highlight! link SignatureMarkText BlueSign
highlight! link SignatureMarkerText PurpleSign
" }}}
" ap/vim-buftabline {{{
highlight! link BufTabLineCurrent TabLineSel
highlight! link BufTabLineActive TabLine
highlight! link BufTabLineHidden TabLineFill
highlight! link BufTabLineFill TabLineFill
" }}}
" liuchengxu/vim-which-key {{{
highlight! link WhichKey Red
highlight! link WhichKeySeperator Green
highlight! link WhichKeyGroup Orange
highlight! link WhichKeyDesc Blue
" }}}
" unblevable/quick-scope {{{
call nordokai#highlight('QuickScopePrimary', s:palette.nordokai14, s:palette.none, 'underline')
call nordokai#highlight('QuickScopeSecondary', s:palette.nordokai8, s:palette.none, 'underline')
" }}}
" APZelos/blamer.nvim {{{
highlight! link Blamer Gray
" }}}
" cohama/agit.vim {{{
highlight! link agitTree Gray
highlight! link agitDate Green
highlight! link agitRemote Red
highlight! link agitHead Blue
highlight! link agitRef Orange
highlight! link agitTag Blue
highlight! link agitStatFile Blue
highlight! link agitStatRemoved Red
highlight! link agitStatAdded Green
highlight! link agitStatMessage Orange
highlight! link agitDiffRemove Red
highlight! link agitDiffAdd Green
highlight! link agitDiffHeader Blue
highlight! link agitAuthor Yellow
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
" }}}
" " Extended File Types: {{{
" " vim-plug {{{
" " https://github.com/junegunn/vim-plug
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
" tagbar {{{
" https://github.com/majutsushi/tagbar
highlight! link TagbarFoldIcon Blue
highlight! link TagbarSignature Green
highlight! link TagbarKind Red
highlight! link TagbarScope Orange
highlight! link TagbarNestedKind Blue
highlight! link TagbarVisibilityPrivate Red
highlight! link TagbarVisibilityPublic Blue
" }}}
" vista/vista_kind/vista_markdown {{{
" https://github.com/liuchengxu/vista.vim
highlight! link VistaBracket Gray
highlight! link VistaChildrenNr Orange
highlight! link VistaScope Red
highlight! link VistaTag Green
highlight! link VistaPrefix Gray
highlight! link VistaIcon Blue
highlight! link VistaScopeKind Yellow
highlight! link VistaColon Gray
highlight! link VistaLineNr Gray
highlight! link VistaHeadNr Fg
highlight! link VistaPublic Green
highlight! link VistaProtected Yellow
highlight! link VistaPrivate Red
" }}}
" nerdtree {{{
" https://github.com/preservim/nerdtree
highlight! link NERDTreeDir Green
highlight! link NERDTreeDirSlash Green
highlight! link NERDTreeOpenable Blue
highlight! link NERDTreeClosable Blue
highlight! link NERDTreeFile Fg
highlight! link NERDTreeExecFile Red
highlight! link NERDTreeUp Gray
highlight! link NERDTreeCWD Purple
highlight! link NERDTreeHelp Gray
highlight! link NERDTreeToggleOn Green
highlight! link NERDTreeToggleOff Red
highlight! link NERDTreeFlags Blue
highlight! link NERDTreeLinkFile Gray
highlight! link NERDTreeLinkTarget Green
" }}}
" dirvish {{{
" https://github.com/justinmk/vim-dirvish
highlight! link DirvishPathTail Blue
highlight! link DirvishArg Yellow
" }}}
" startify/quickmenu {{{
" https://github.com/mhinz/vim-startify
" https://github.com/skywind3000/quickmenu.vim
highlight! link StartifyBracket Gray
highlight! link StartifyFile Green
highlight! link StartifyNumber Orange
highlight! link StartifyPath Gray
highlight! link StartifySlash Gray
highlight! link StartifySection Blue
highlight! link StartifyHeader Red
highlight! link StartifySpecial Gray
" }}}
" quickmenu {{{
" https://github.com/skywind3000/quickmenu.vim
highlight! link QuickmenuOption Green
highlight! link QuickmenuNumber Orange
highlight! link QuickmenuBracket Gray
highlight! link QuickmenuHelp Blue
highlight! link QuickmenuSpecial Gray
highlight! link QuickmenuHeader Purple
" }}}
" undotree {{{
" https://github.com/mbbill/undotree
call nordokai#highlight('UndotreeSavedBig', s:palette.nordokai11, s:palette.none, 'bold')
highlight! link UndotreeNode Blue
highlight! link UndotreeNodeCurrent Purple
highlight! link UndotreeSeq Green
highlight! link UndotreeCurrent Blue
highlight! link UndotreeNext Yellow
highlight! link UndotreeTimeStamp Gray
highlight! link UndotreeHead Purple
highlight! link UndotreeBranch Blue
highlight! link UndotreeSavedSmall Red
" }}}
" markdown {{{
" builtin: {{{
call nordokai#highlight('markdownH1', s:palette.nordokai6, s:palette.none, 'bold')
call nordokai#highlight('markdownH2', s:palette.nordokai6, s:palette.none, 'bold')
call nordokai#highlight('markdownH3', s:palette.nordokai6, s:palette.none, 'bold')
call nordokai#highlight('markdownH4', s:palette.nordokai6, s:palette.none, 'bold')
call nordokai#highlight('markdownH5', s:palette.nordokai6, s:palette.none, 'bold')
call nordokai#highlight('markdownH6', s:palette.nordokai6, s:palette.none, 'bold')
call nordokai#highlight('markdownUrl', s:palette.none, s:palette.none)
call nordokai#highlight('markdown', s:palette.none, s:palette.none)
call nordokai#highlight('markdownBold', s:palette.none, s:palette.none, 'bold')
call nordokai#highlight('markdownDelimiter', s:palette.nordokai3_bright, s:palette.none)
highlight! link markdownCode Green
highlight! link markdownCodeBlock Green
highlight! link markdownCodeDelimiter Green
highlight! link markdownBlockquote Gray
highlight! link markdownListMarker Red
highlight! link markdownOrderedListMarker Red
highlight! link markdownRule Purple
highlight! link markdownHeadingRule Gray
highlight! link markdownUrlDelimiter Gray
highlight! link markdownLinkDelimiter Gray
highlight! link markdownLinkTextDelimiter Gray
highlight! link markdownHeadingDelimiter Gray
highlight! link markdownLinkText Red
highlight! link markdownUrlTitleDelimiter Green
highlight! link markdownIdDeclaration markdownLinkText
highlight! link markdownBoldDelimiter Gray
highlight! link markdownId Yellow
" }}}
" vim-markdown: https://github.com/gabrielelana/vim-markdown{{{
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
" }}}
" rst {{{
" builtin: https://github.com/marshallward/vim-restructuredtext{{{
call nordokai#highlight('rstStandaloneHyperlink', s:palette.nordokai15, s:palette.none, 'underline')
call nordokai#highlight('rstEmphasis', s:palette.none, s:palette.none)
call nordokai#highlight('rstStrongEmphasis', s:palette.none, s:palette.none, 'bold')
call nordokai#highlight('rstStandaloneHyperlink', s:palette.nordokai8, s:palette.none, 'underline')
call nordokai#highlight('rstHyperlinkTarget', s:palette.nordokai8, s:palette.none, 'underline')
highlight! link rstSubstitutionReference Blue
highlight! link rstInterpretedTextOrHyperlinkReference Green
highlight! link rstTableLines Gray
highlight! link rstInlineLiteral Green
highlight! link rstLiteralBlock Green
highlight! link rstQuotedLiteralBlock Green
" }}}
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
highlight! link cssStringQ Green
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
" scss {{{
" scss-syntax: https://github.com/cakebaker/scss-syntax.vim{{{
highlight! link scssMixinName Orange
highlight! link scssSelectorChar Gray
highlight! link scssSelectorName Red
highlight! link scssInterpolationDelimiter Yellow
highlight! link scssVariableValue Green
highlight! link scssNull Purple
highlight! link scssBoolean Purple
highlight! link scssVariableAssignment Gray
highlight! link scssAttribute Green
highlight! link scssFunctionName Orange
highlight! link scssVariable Fg
highlight! link scssAmpersand Purple
" }}}
" }}}
" less {{{
" vim-less: https://github.com/groenewege/vim-less{{{
highlight! link lessMixinChar Gray
highlight! link lessClass Red
highlight! link lessFunction Orange
" }}}
" }}}
" javascript/javascriptreact {{{
" builtin: http://www.fleiner.com/vim/syntax/javascript.vim{{{
highlight! link javaScriptNull Orange
highlight! link javaScriptIdentifier Blue
highlight! link javaScriptParens Fg
highlight! link javaScriptBraces Fg
highlight! link javaScriptNumber Purple
highlight! link javaScriptLabel Red
highlight! link javaScriptGlobal Blue
highlight! link javaScriptMessage Blue
" }}}
" vim-javascript: https://github.com/pangloss/vim-javascript{{{
highlight! link jsNoise Fg
highlight! link Noise Fg
highlight! link jsParens Fg
highlight! link jsBrackets Fg
highlight! link jsObjectBraces Fg
highlight! link jsThis Blue
highlight! link jsUndefined Orange
highlight! link jsNull Orange
highlight! link jsNan Orange
highlight! link jsSuper Orange
highlight! link jsPrototype Orange
highlight! link jsFunction Red
highlight! link jsGlobalNodeObjects Blue
highlight! link jsGlobalObjects Blue
highlight! link jsArrowFunction Red
highlight! link jsArrowFuncArgs Fg
highlight! link jsFuncArgs Fg
highlight! link jsObjectProp Fg
highlight! link jsVariableDef Fg
highlight! link jsObjectKey Orange
highlight! link jsParen Fg
highlight! link jsParenIfElse Fg
highlight! link jsParenRepeat Fg
highlight! link jsParenSwitch Fg
highlight! link jsParenCatch Fg
highlight! link jsBracket Fg
highlight! link jsObjectValue Fg
highlight! link jsDestructuringBlock Fg
highlight! link jsBlockLabel Purple
highlight! link jsFunctionKey Green
highlight! link jsClassDefinition Blue
highlight! link jsDot Gray
highlight! link jsSpreadExpression Purple
highlight! link jsSpreadOperator Green
highlight! link jsModuleKeyword Blue
highlight! link jsTemplateExpression Purple
highlight! link jsTemplateBraces Purple
highlight! link jsClassMethodType Blue
highlight! link jsExceptions Blue
" }}}
" yajs: https://github.com/othree/yajs.vim{{{
highlight! link javascriptOpSymbol Red
highlight! link javascriptOpSymbols Red
highlight! link javascriptIdentifierName Fg
highlight! link javascriptVariable Blue
highlight! link javascriptObjectLabel Fg
highlight! link javascriptPropertyNameString Fg
highlight! link javascriptFuncArg Fg
highlight! link javascriptObjectLiteral Green
highlight! link javascriptIdentifier Orange
highlight! link javascriptArrowFunc Red
highlight! link javascriptTemplate Purple
highlight! link javascriptTemplateSubstitution Purple
highlight! link javascriptTemplateSB Purple
highlight! link javascriptNodeGlobal Blue
highlight! link javascriptDocTags Red
highlight! link javascriptDocNotation Blue
highlight! link javascriptClassSuper Orange
highlight! link javascriptClassName Blue
highlight! link javascriptClassSuperName Blue
highlight! link javascriptOperator Red
highlight! link javascriptBrackets Fg
highlight! link javascriptBraces Fg
highlight! link javascriptLabel Purple
highlight! link javascriptEndColons Gray
highlight! link javascriptObjectLabelColon Gray
highlight! link javascriptDotNotation Gray
highlight! link javascriptGlobalArrayDot Gray
highlight! link javascriptGlobalBigIntDot Gray
highlight! link javascriptGlobalDateDot Gray
highlight! link javascriptGlobalJSONDot Gray
highlight! link javascriptGlobalMathDot Gray
highlight! link javascriptGlobalNumberDot Gray
highlight! link javascriptGlobalObjectDot Gray
highlight! link javascriptGlobalPromiseDot Gray
highlight! link javascriptGlobalRegExpDot Gray
highlight! link javascriptGlobalStringDot Gray
highlight! link javascriptGlobalSymbolDot Gray
highlight! link javascriptGlobalURLDot Gray
highlight! link javascriptMethod Green
highlight! link javascriptMethodName Green
highlight! link javascriptObjectMethodName Green
highlight! link javascriptGlobalMethod Green
highlight! link javascriptDOMStorageMethod Green
highlight! link javascriptFileMethod Green
highlight! link javascriptFileReaderMethod Green
highlight! link javascriptFileListMethod Green
highlight! link javascriptBlobMethod Green
highlight! link javascriptURLStaticMethod Green
highlight! link javascriptNumberStaticMethod Green
highlight! link javascriptNumberMethod Green
highlight! link javascriptDOMNodeMethod Green
highlight! link javascriptES6BigIntStaticMethod Green
highlight! link javascriptBOMWindowMethod Green
highlight! link javascriptHeadersMethod Green
highlight! link javascriptRequestMethod Green
highlight! link javascriptResponseMethod Green
highlight! link javascriptES6SetMethod Green
highlight! link javascriptReflectMethod Green
highlight! link javascriptPaymentMethod Green
highlight! link javascriptPaymentResponseMethod Green
highlight! link javascriptTypedArrayStaticMethod Green
highlight! link javascriptGeolocationMethod Green
highlight! link javascriptES6MapMethod Green
highlight! link javascriptServiceWorkerMethod Green
highlight! link javascriptCacheMethod Green
highlight! link javascriptFunctionMethod Green
highlight! link javascriptXHRMethod Green
highlight! link javascriptBOMNavigatorMethod Green
highlight! link javascriptServiceWorkerMethod Green
highlight! link javascriptDOMEventTargetMethod Green
highlight! link javascriptDOMEventMethod Green
highlight! link javascriptIntlMethod Green
highlight! link javascriptDOMDocMethod Green
highlight! link javascriptStringStaticMethod Green
highlight! link javascriptStringMethod Green
highlight! link javascriptSymbolStaticMethod Green
highlight! link javascriptRegExpMethod Green
highlight! link javascriptObjectStaticMethod Green
highlight! link javascriptObjectMethod Green
highlight! link javascriptBOMLocationMethod Green
highlight! link javascriptJSONStaticMethod Green
highlight! link javascriptGeneratorMethod Green
highlight! link javascriptEncodingMethod Green
highlight! link javascriptPromiseStaticMethod Green
highlight! link javascriptPromiseMethod Green
highlight! link javascriptBOMHistoryMethod Green
highlight! link javascriptDOMFormMethod Green
highlight! link javascriptClipboardMethod Green
highlight! link javascriptTypedArrayStaticMethod Green
highlight! link javascriptBroadcastMethod Green
highlight! link javascriptDateStaticMethod Green
highlight! link javascriptDateMethod Green
highlight! link javascriptConsoleMethod Green
highlight! link javascriptArrayStaticMethod Green
highlight! link javascriptArrayMethod Green
highlight! link javascriptMathStaticMethod Green
highlight! link javascriptSubtleCryptoMethod Green
highlight! link javascriptCryptoMethod Green
highlight! link javascriptProp Fg
highlight! link javascriptBOMWindowProp Fg
highlight! link javascriptDOMStorageProp Fg
highlight! link javascriptFileReaderProp Fg
highlight! link javascriptURLUtilsProp Fg
highlight! link javascriptNumberStaticProp Fg
highlight! link javascriptDOMNodeProp Fg
highlight! link javascriptRequestProp Fg
highlight! link javascriptResponseProp Fg
highlight! link javascriptES6SetProp Fg
highlight! link javascriptPaymentProp Fg
highlight! link javascriptPaymentResponseProp Fg
highlight! link javascriptPaymentAddressProp Fg
highlight! link javascriptPaymentShippingOptionProp Fg
highlight! link javascriptTypedArrayStaticProp Fg
highlight! link javascriptServiceWorkerProp Fg
highlight! link javascriptES6MapProp Fg
highlight! link javascriptRegExpStaticProp Fg
highlight! link javascriptRegExpProp Fg
highlight! link javascriptXHRProp Fg
highlight! link javascriptBOMNavigatorProp Green
highlight! link javascriptDOMEventProp Fg
highlight! link javascriptBOMNetworkProp Fg
highlight! link javascriptDOMDocProp Fg
highlight! link javascriptSymbolStaticProp Fg
highlight! link javascriptSymbolProp Fg
highlight! link javascriptBOMLocationProp Fg
highlight! link javascriptEncodingProp Fg
highlight! link javascriptCryptoProp Fg
highlight! link javascriptBOMHistoryProp Fg
highlight! link javascriptDOMFormProp Fg
highlight! link javascriptDataViewProp Fg
highlight! link javascriptBroadcastProp Fg
highlight! link javascriptMathStaticProp Fg
" }}}
" vim-jsx-pretty: https://github.com/maxmellon/vim-jsx-pretty{{{
highlight! link jsxTagName Red
highlight! link jsxOpenPunct Green
highlight! link jsxClosePunct Blue
highlight! link jsxEscapeJs Purple
highlight! link jsxAttrib Blue
" }}}
" }}}
" typescript/typescriptreact {{{
" vim-typescript: https://github.com/leafgarland/typescript-vim{{{
highlight! link typescriptStorageClass Red
highlight! link typescriptEndColons Fg
highlight! link typescriptSource Blue
highlight! link typescriptMessage Green
highlight! link typescriptGlobalObjects Blue
highlight! link typescriptInterpolation Purple
highlight! link typescriptInterpolationDelimiter Purple
highlight! link typescriptBraces Fg
highlight! link typescriptParens Fg
" }}}
" yats: https:github.com/HerringtonDarkholme/yats.vim{{{
highlight! link typescriptMethodAccessor Red
highlight! link typescriptVariable Blue
highlight! link typescriptVariableDeclaration Fg
highlight! link typescriptTypeReference Blue
highlight! link typescriptBraces Orange
highlight! link typescriptEnumKeyword Red
highlight! link typescriptEnum Blue
highlight! link typescriptIdentifierName Fg
highlight! link typescriptProp Fg
highlight! link typescriptCall Fg
highlight! link typescriptInterfaceName Blue
highlight! link typescriptEndColons Fg
highlight! link typescriptMember Fg
highlight! link typescriptMemberOptionality Red
highlight! link typescriptObjectLabel Fg
highlight! link typescriptDefaultParam Fg
highlight! link typescriptArrowFunc Red
highlight! link typescriptAbstract Red
highlight! link typescriptObjectColon Gray
highlight! link typescriptTypeAnnotation Gray
highlight! link typescriptAssign Red
highlight! link typescriptBinaryOp Red
highlight! link typescriptUnaryOp Red
highlight! link typescriptFuncComma Fg
highlight! link typescriptClassName Blue
highlight! link typescriptClassHeritage Blue
highlight! link typescriptInterfaceHeritage Blue
highlight! link typescriptIdentifier Orange
highlight! link typescriptGlobal Blue
highlight! link typescriptOperator Red
highlight! link typescriptNodeGlobal Blue
highlight! link typescriptExport Red
highlight! link typescriptImport Red
highlight! link typescriptTypeParameter Blue
highlight! link typescriptReadonlyModifier Red
highlight! link typescriptAccessibilityModifier Red
highlight! link typescriptAmbientDeclaration Red
highlight! link typescriptTemplateSubstitution Purple
highlight! link typescriptTemplateSB Purple
highlight! link typescriptExceptions Red
highlight! link typescriptCastKeyword Red
highlight! link typescriptOptionalMark Red
highlight! link typescriptNull Orange
highlight! link typescriptMappedIn Red
highlight! link typescriptFuncTypeArrow Red
highlight! link typescriptTernaryOp Red
highlight! link typescriptParenExp Fg
highlight! link typescriptIndexExpr Fg
highlight! link typescriptDotNotation Gray
highlight! link typescriptGlobalNumberDot Gray
highlight! link typescriptGlobalStringDot Gray
highlight! link typescriptGlobalArrayDot Gray
highlight! link typescriptGlobalObjectDot Gray
highlight! link typescriptGlobalSymbolDot Gray
highlight! link typescriptGlobalMathDot Gray
highlight! link typescriptGlobalDateDot Gray
highlight! link typescriptGlobalJSONDot Gray
highlight! link typescriptGlobalRegExpDot Gray
highlight! link typescriptGlobalPromiseDot Gray
highlight! link typescriptGlobalURLDot Gray
highlight! link typescriptGlobalMethod Green
highlight! link typescriptDOMStorageMethod Green
highlight! link typescriptFileMethod Green
highlight! link typescriptFileReaderMethod Green
highlight! link typescriptFileListMethod Green
highlight! link typescriptBlobMethod Green
highlight! link typescriptURLStaticMethod Green
highlight! link typescriptNumberStaticMethod Green
highlight! link typescriptNumberMethod Green
highlight! link typescriptDOMNodeMethod Green
highlight! link typescriptPaymentMethod Green
highlight! link typescriptPaymentResponseMethod Green
highlight! link typescriptHeadersMethod Green
highlight! link typescriptRequestMethod Green
highlight! link typescriptResponseMethod Green
highlight! link typescriptES6SetMethod Green
highlight! link typescriptReflectMethod Green
highlight! link typescriptBOMWindowMethod Green
highlight! link typescriptGeolocationMethod Green
highlight! link typescriptServiceWorkerMethod Green
highlight! link typescriptCacheMethod Green
highlight! link typescriptES6MapMethod Green
highlight! link typescriptFunctionMethod Green
highlight! link typescriptRegExpMethod Green
highlight! link typescriptXHRMethod Green
highlight! link typescriptBOMNavigatorMethod Green
highlight! link typescriptServiceWorkerMethod Green
highlight! link typescriptIntlMethod Green
highlight! link typescriptDOMEventTargetMethod Green
highlight! link typescriptDOMEventMethod Green
highlight! link typescriptDOMDocMethod Green
highlight! link typescriptStringStaticMethod Green
highlight! link typescriptStringMethod Green
highlight! link typescriptSymbolStaticMethod Green
highlight! link typescriptObjectStaticMethod Green
highlight! link typescriptObjectMethod Green
highlight! link typescriptJSONStaticMethod Green
highlight! link typescriptEncodingMethod Green
highlight! link typescriptBOMLocationMethod Green
highlight! link typescriptPromiseStaticMethod Green
highlight! link typescriptPromiseMethod Green
highlight! link typescriptSubtleCryptoMethod Green
highlight! link typescriptCryptoMethod Green
highlight! link typescriptBOMHistoryMethod Green
highlight! link typescriptDOMFormMethod Green
highlight! link typescriptConsoleMethod Green
highlight! link typescriptDateStaticMethod Green
highlight! link typescriptDateMethod Green
highlight! link typescriptArrayStaticMethod Green
highlight! link typescriptArrayMethod Green
highlight! link typescriptMathStaticMethod Green
highlight! link typescriptStringProperty Fg
highlight! link typescriptDOMStorageProp Fg
highlight! link typescriptFileReaderProp Fg
highlight! link typescriptURLUtilsProp Fg
highlight! link typescriptNumberStaticProp Fg
highlight! link typescriptDOMNodeProp Fg
highlight! link typescriptBOMWindowProp Fg
highlight! link typescriptRequestProp Fg
highlight! link typescriptResponseProp Fg
highlight! link typescriptPaymentProp Fg
highlight! link typescriptPaymentResponseProp Fg
highlight! link typescriptPaymentAddressProp Fg
highlight! link typescriptPaymentShippingOptionProp Fg
highlight! link typescriptES6SetProp Fg
highlight! link typescriptServiceWorkerProp Fg
highlight! link typescriptES6MapProp Fg
highlight! link typescriptRegExpStaticProp Fg
highlight! link typescriptRegExpProp Fg
highlight! link typescriptBOMNavigatorProp Green
highlight! link typescriptXHRProp Fg
highlight! link typescriptDOMEventProp Fg
highlight! link typescriptDOMDocProp Fg
highlight! link typescriptBOMNetworkProp Fg
highlight! link typescriptSymbolStaticProp Fg
highlight! link typescriptEncodingProp Fg
highlight! link typescriptBOMLocationProp Fg
highlight! link typescriptCryptoProp Fg
highlight! link typescriptDOMFormProp Fg
highlight! link typescriptBOMHistoryProp Fg
highlight! link typescriptMathStaticProp Fg
" }}}
" }}}
" dart {{{
" dart-lang: https://github.com/dart-lang/dart-vim-plugin{{{
highlight! link dartCoreClasses Blue
highlight! link dartTypeName Blue
highlight! link dartInterpolation Purple
highlight! link dartTypeDef Red
highlight! link dartClassDecl Red
highlight! link dartLibrary Red
highlight! link dartMetadata Orange
" }}}
" }}}
" c/cpp/objc/objcpp {{{
" vim-cpp-enhanced-highlight: https://github.com/octol/vim-cpp-enhanced-highlight{{{
highlight! link cLabel Red
highlight! link cppSTLnamespace Blue
highlight! link cppSTLtype Blue
highlight! link cppAccess Red
highlight! link cppStructure Red
highlight! link cppSTLios Blue
highlight! link cppSTLiterator Blue
highlight! link cppSTLexception Red
" }}}
" vim-cpp-modern: https://github.com/bfrg/vim-cpp-modern{{{
highlight! link cppSTLVariable Blue
" }}}
" chromatica: https://github.com/arakashic/chromatica.nvim{{{
highlight! link Member Orange
highlight! link Variable Fg
highlight! link Namespace Blue
highlight! link EnumConstant Orange
highlight! link chromaticaException Red
highlight! link chromaticaCast Red
highlight! link OperatorOverload Red
highlight! link AccessQual Red
highlight! link Linkage Red
highlight! link AutoType Blue
" }}}
" vim-lsp-cxx-highlight https://github.com/jackguo380/vim-lsp-cxx-highlight{{{
highlight! link LspCxxHlSkippedRegion Gray
highlight! link LspCxxHlSkippedRegionBeginEnd Red
highlight! link LspCxxHlGroupEnumConstant Orange
highlight! link LspCxxHlGroupNamespace Blue
highlight! link LspCxxHlGroupMemberVariable Orange
" }}}
" }}}
" objc {{{
" builtin: {{{
highlight! link objcModuleImport Red
highlight! link objcException Red
highlight! link objcProtocolList Fg
highlight! link objcDirective Red
highlight! link objcPropertyAttribute Purple
highlight! link objcHiddenArgument Fg
" }}}
" }}}
" cs {{{
" builtin: https://github.com/nickspoons/vim-cs{{{
highlight! link csUnspecifiedStatement Red
highlight! link csStorage Red
highlight! link csClass Red
highlight! link csNewType Blue
highlight! link csContextualStatement Red
highlight! link csInterpolationDelimiter Purple
highlight! link csInterpolation Purple
highlight! link csEndColon Fg
" }}}
" }}}
" python {{{
" builtin: {{{
highlight! link pythonBuiltin Blue
highlight! link pythonExceptions Red
highlight! link pythonDecoratorName Orange
" }}}
" python-syntax: https://github.com/vim-python/python-syntax{{{
highlight! link pythonExClass Blue
highlight! link pythonBuiltinType Blue
highlight! link pythonBuiltinObj Orange
highlight! link pythonDottedName Orange
highlight! link pythonBuiltinFunc Green
highlight! link pythonFunction Green
highlight! link pythonDecorator Orange
highlight! link pythonInclude Include
highlight! link pythonImport PreProc
highlight! link pythonOperator Red
highlight! link pythonConditional Blue
highlight! link pythonRepeat Blue
highlight! link pythonException Red
highlight! link pythonNone Orange
highlight! link pythonCoding Gray
highlight! link pythonDot Gray
" }}}
" semshi: https://github.com/numirias/semshi{{{
call nordokai#highlight('semshiUnresolved', s:palette.nordokai12, s:palette.none, 'undercurl')
highlight! link semshiImported Blue
highlight! link semshiParameter Orange
highlight! link semshiParameterUnused Gray
highlight! link semshiSelf Blue
highlight! link semshiGlobal Green
highlight! link semshiBuiltin Green
highlight! link semshiAttribute Orange
highlight! link semshiLocal Red
highlight! link semshiFree Red
highlight! link semshiSelected CocHighlightText
highlight! link semshiErrorSign ALEErrorSign
highlight! link semshiErrorChar ALEErrorSign
" }}}
" }}}
" lua {{{
" builtin: {{{
highlight! link luaFunc Green
highlight! link luaFunction Red
highlight! link luaTable Fg
highlight! link luaIn Red
" }}}
" vim-lua: https://github.com/tbastos/vim-lua{{{
highlight! link luaFuncCall Green
highlight! link luaLocal Red
highlight! link luaSpecialValue Green
highlight! link luaBraces Fg
highlight! link luaBuiltIn Blue
highlight! link luaNoise Gray
highlight! link luaLabel Purple
highlight! link luaFuncTable Blue
highlight! link luaFuncArgName Fg
highlight! link luaEllipsis Red
highlight! link luaDocTag Green
" }}}
" }}}
" java {{{
" builtin: {{{
highlight! link javaClassDecl Red
highlight! link javaMethodDecl Red
highlight! link javaVarArg Fg
highlight! link javaAnnotation Purple
highlight! link javaUserLabel Purple
highlight! link javaTypedef Orange
highlight! link javaParen Fg
highlight! link javaParen1 Fg
highlight! link javaParen2 Fg
highlight! link javaParen3 Fg
highlight! link javaParen4 Fg
highlight! link javaParen5 Fg
" }}}
" }}}
" kotlin {{{
" kotlin-vim: https://github.com/udalov/kotlin-vim{{{
highlight! link ktSimpleInterpolation Purple
highlight! link ktComplexInterpolation Purple
highlight! link ktComplexInterpolationBrace Purple
highlight! link ktStructure Red
highlight! link ktKeyword Orange
" }}}
" }}}
" scala {{{
" builtin: https://github.com/derekwyatt/vim-scala{{{
highlight! link scalaNameDefinition Fg
highlight! link scalaInterpolationBoundary Purple
highlight! link scalaInterpolation Purple
highlight! link scalaTypeOperator Red
highlight! link scalaOperator Red
highlight! link scalaKeywordModifier Red
" }}}
" }}}
" go {{{
" builtin: https://github.com/google/vim-ft-go{{{
highlight! link goDirective Red
highlight! link goConstants Orange
highlight! link goDeclType Red
" }}}
" polyglot: {{{
highlight! link goPackage Red
highlight! link goImport Red
highlight! link goBuiltins Green
highlight! link goPredefinedIdentifiers Orange
highlight! link goVar Red
" }}}
" }}}
" rust {{{
" builtin: https://github.com/rust-lang/rust.vim{{{
highlight! link rustStructure Red
highlight! link rustIdentifier Orange
highlight! link rustModPath Blue
highlight! link rustModPathSep Gray
highlight! link rustSelf Orange
highlight! link rustSuper Orange
highlight! link rustDeriveTrait Purple
highlight! link rustEnumVariant Purple
highlight! link rustMacroVariable Orange
highlight! link rustAssert Green
highlight! link rustPanic Green
highlight! link rustPubScopeCrate Blue
highlight! link rustAttribute Purple
" }}}
" }}}
" swift {{{
" swift.vim: https://github.com/keith/swift.vim{{{
highlight! link swiftInterpolatedWrapper Purple
highlight! link swiftInterpolatedString Purple
highlight! link swiftProperty Fg
highlight! link swiftTypeDeclaration Red
highlight! link swiftClosureArgument Orange
highlight! link swiftStructure Red
" }}}
" }}}
" php {{{
" builtin: https://jasonwoof.com/gitweb/?p=vim-syntax.git;a=blob;f=php.vim;hb=HEAD{{{
highlight! link phpVarSelector Fg
highlight! link phpIdentifier Fg
highlight! link phpDefine Green
highlight! link phpStructure Red
highlight! link phpSpecialFunction Green
highlight! link phpInterpSimpleCurly Purple
highlight! link phpComparison Red
highlight! link phpMethodsVar Fg
highlight! link phpInterpVarname Fg
highlight! link phpMemberSelector Red
highlight! link phpLabel Red
" }}}
" php.vim: https://github.com/StanAngeloff/php.vim{{{
highlight! link phpParent Fg
highlight! link phpNowDoc Yellow
highlight! link phpFunction Green
highlight! link phpMethod Green
highlight! link phpClass Blue
highlight! link phpSuperglobals Blue
highlight! link phpNullValue Orange
" }}}
" }}}
" ruby {{{
" builtin: https://github.com/vim-ruby/vim-ruby{{{
highlight! link rubyKeywordAsMethod Green
highlight! link rubyInterpolation Purple
highlight! link rubyInterpolationDelimiter Purple
highlight! link rubyStringDelimiter Yellow
highlight! link rubyBlockParameterList Fg
highlight! link rubyDefine Red
highlight! link rubyModuleName Red
highlight! link rubyAccess Red
highlight! link rubyMacro Red
highlight! link rubySymbol Fg
" }}}
" }}}
" haskell {{{
" haskell-vim: https://github.com/neovimhaskell/haskell-vim{{{
highlight! link haskellBrackets Fg
highlight! link haskellIdentifier Orange
highlight! link haskellDecl Red
highlight! link haskellType Blue
highlight! link haskellDeclKeyword Red
highlight! link haskellWhere Red
highlight! link haskellDeriving Red
highlight! link haskellForeignKeywords Red
" }}}
" }}}
" perl/pod {{{
" builtin: https://github.com/vim-perl/vim-perl{{{
highlight! link perlStatementPackage Red
highlight! link perlStatementInclude Red
highlight! link perlStatementStorage Red
highlight! link perlStatementList Red
highlight! link perlMatchStartEnd Red
highlight! link perlVarSimpleMemberName Green
highlight! link perlVarSimpleMember Fg
highlight! link perlMethod Green
highlight! link podVerbatimLine Green
highlight! link podCmdText Yellow
highlight! link perlVarPlain Fg
highlight! link perlVarPlain2 Fg
" }}}
" }}}
" ocaml {{{
" builtin: https://github.com/rgrinberg/vim-ocaml{{{
highlight! link ocamlArrow Red
highlight! link ocamlEqual Red
highlight! link ocamlOperator Red
highlight! link ocamlKeyChar Red
highlight! link ocamlModPath Green
highlight! link ocamlFullMod Green
highlight! link ocamlModule Blue
highlight! link ocamlConstructor Orange
highlight! link ocamlModParam Fg
highlight! link ocamlModParam1 Fg
highlight! link ocamlAnyVar Fg " aqua
highlight! link ocamlPpxEncl Red
highlight! link ocamlPpxIdentifier Fg
highlight! link ocamlSigEncl Red
highlight! link ocamlModParam1 Fg
" }}}
" }}}
" erlang {{{
" builtin: https://github.com/vim-erlang/vim-erlang-runtime{{{
highlight! link erlangAtom Fg
highlight! link erlangVariable Fg
highlight! link erlangLocalFuncRef Green
highlight! link erlangLocalFuncCall Green
highlight! link erlangGlobalFuncRef Green
highlight! link erlangGlobalFuncCall Green
highlight! link erlangAttribute Blue
highlight! link erlangPipe Red
" }}}
" }}}
" elixir {{{
" vim-elixir: https://github.com/elixir-editors/vim-elixir{{{
highlight! link elixirStringDelimiter Yellow
highlight! link elixirKeyword Red
highlight! link elixirInterpolation Purple
highlight! link elixirInterpolationDelimiter Purple
highlight! link elixirSelf Blue
highlight! link elixirPseudoVariable Orange
highlight! link elixirModuleDefine Red
highlight! link elixirBlockDefinition Red
highlight! link elixirDefine Red
highlight! link elixirPrivateDefine Red
highlight! link elixirGuard Red
highlight! link elixirPrivateGuard Red
highlight! link elixirProtocolDefine Red
highlight! link elixirImplDefine Red
highlight! link elixirRecordDefine Red
highlight! link elixirPrivateRecordDefine Red
highlight! link elixirMacroDefine Red
highlight! link elixirPrivateMacroDefine Red
highlight! link elixirDelegateDefine Red
highlight! link elixirOverridableDefine Red
highlight! link elixirExceptionDefine Red
highlight! link elixirCallbackDefine Red
highlight! link elixirStructDefine Red
highlight! link elixirExUnitMacro Red
" }}}
" }}}
" lisp {{{
" builtin: http://www.drchip.org/astronaut/vim/index.html#SYNTAX_LISP{{{
highlight! link lispAtomMark Purple
highlight! link lispKey Orange
highlight! link lispFunc Green
" }}}
" }}}
" clojure {{{
" builtin: https://github.com/guns/vim-clojure-static{{{
highlight! link clojureMacro Red
highlight! link clojureFunc Green
highlight! link clojureConstant Orange
highlight! link clojureSpecial Red
highlight! link clojureDefine Red
highlight! link clojureKeyword Blue
highlight! link clojureVariable Fg
highlight! link clojureMeta Purple
highlight! link clojureDeref Purple
" }}}
" }}}
" matlab {{{
" builtin: {{{
highlight! link matlabSemicolon Fg
highlight! link matlabFunction Red
highlight! link matlabImplicit Green
highlight! link matlabDelimiter Fg
highlight! link matlabOperator Green
highlight! link matlabArithmeticOperator Red
highlight! link matlabArithmeticOperator Red
highlight! link matlabRelationalOperator Red
highlight! link matlabRelationalOperator Red
highlight! link matlabLogicalOperator Red
" }}}
" }}}
" sh/zsh {{{
" builtin: http://www.drchip.org/astronaut/vim/index.html#SYNTAX_SH{{{
highlight! link shRange Fg
highlight! link shOption Purple
highlight! link shQuote Yellow
highlight! link shVariable Blue
highlight! link shDerefSimple Blue
highlight! link shDerefVar Blue
highlight! link shDerefSpecial Blue
highlight! link shDerefOff Blue
highlight! link shVarAssign Red
highlight! link shFunctionOne Green
highlight! link shFunctionKey Red
" }}}
" }}}
" zsh {{{
" builtin: https://github.com/chrisbra/vim-zsh{{{
highlight! link zshOption Blue
highlight! link zshSubst Orange
highlight! link zshFunction Green
" }}}
" }}}
" ps1 {{{
" vim-ps1: https://github.com/PProvost/vim-ps1{{{
highlight! link ps1FunctionInvocation Green
highlight! link ps1FunctionDeclaration Green
highlight! link ps1InterpolationDelimiter Purple
highlight! link ps1BuiltIn Blue
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
" make {{{
highlight! link makeIdent Purple
highlight! link makeSpecTarget Blue
highlight! link makeTarget Orange
highlight! link makeCommands Red
" }}}
" cmake {{{
highlight! link cmakeCommand Red
highlight! link cmakeKWconfigure_package_config_file Blue
highlight! link cmakeKWwrite_basic_package_version_file Blue
highlight! link cmakeKWExternalProject Green
highlight! link cmakeKWadd_compile_definitions Green
highlight! link cmakeKWadd_compile_options Green
highlight! link cmakeKWadd_custom_command Green
highlight! link cmakeKWadd_custom_target Green
highlight! link cmakeKWadd_definitions Green
highlight! link cmakeKWadd_dependencies Green
highlight! link cmakeKWadd_executable Green
highlight! link cmakeKWadd_library Green
highlight! link cmakeKWadd_link_options Green
highlight! link cmakeKWadd_subdirectory Green
highlight! link cmakeKWadd_test Green
highlight! link cmakeKWbuild_command Green
highlight! link cmakeKWcmake_host_system_information Green
highlight! link cmakeKWcmake_minimum_required Green
highlight! link cmakeKWcmake_parse_arguments Green
highlight! link cmakeKWcmake_policy Green
highlight! link cmakeKWconfigure_file Green
highlight! link cmakeKWcreate_test_sourcelist Green
highlight! link cmakeKWctest_build Green
highlight! link cmakeKWctest_configure Green
highlight! link cmakeKWctest_coverage Green
highlight! link cmakeKWctest_memcheck Green
highlight! link cmakeKWctest_run_script Green
highlight! link cmakeKWctest_start Green
highlight! link cmakeKWctest_submit Green
highlight! link cmakeKWctest_test Green
highlight! link cmakeKWctest_update Green
highlight! link cmakeKWctest_upload Green
highlight! link cmakeKWdefine_property Green
highlight! link cmakeKWdoxygen_add_docs Green
highlight! link cmakeKWenable_language Green
highlight! link cmakeKWenable_testing Green
highlight! link cmakeKWexec_program Green
highlight! link cmakeKWexecute_process Green
highlight! link cmakeKWexport Green
highlight! link cmakeKWexport_library_dependencies Green
highlight! link cmakeKWfile Green
highlight! link cmakeKWfind_file Green
highlight! link cmakeKWfind_library Green
highlight! link cmakeKWfind_package Green
highlight! link cmakeKWfind_path Green
highlight! link cmakeKWfind_program Green
highlight! link cmakeKWfltk_wrap_ui Green
highlight! link cmakeKWforeach Green
highlight! link cmakeKWfunction Green
highlight! link cmakeKWget_cmake_property Green
highlight! link cmakeKWget_directory_property Green
highlight! link cmakeKWget_filename_component Green
highlight! link cmakeKWget_property Green
highlight! link cmakeKWget_source_file_property Green
highlight! link cmakeKWget_target_property Green
highlight! link cmakeKWget_test_property Green
highlight! link cmakeKWif Green
highlight! link cmakeKWinclude Green
highlight! link cmakeKWinclude_directories Green
highlight! link cmakeKWinclude_external_msproject Green
highlight! link cmakeKWinclude_guard Green
highlight! link cmakeKWinstall Green
highlight! link cmakeKWinstall_files Green
highlight! link cmakeKWinstall_programs Green
highlight! link cmakeKWinstall_targets Green
highlight! link cmakeKWlink_directories Green
highlight! link cmakeKWlist Green
highlight! link cmakeKWload_cache Green
highlight! link cmakeKWload_command Green
highlight! link cmakeKWmacro Green
highlight! link cmakeKWmark_as_advanced Green
highlight! link cmakeKWmath Green
highlight! link cmakeKWmessage Green
highlight! link cmakeKWoption Green
highlight! link cmakeKWproject Green
highlight! link cmakeKWqt_wrap_cpp Green
highlight! link cmakeKWqt_wrap_ui Green
highlight! link cmakeKWremove Green
highlight! link cmakeKWseparate_arguments Green
highlight! link cmakeKWset Green
highlight! link cmakeKWset_directory_properties Green
highlight! link cmakeKWset_property Green
highlight! link cmakeKWset_source_files_properties Green
highlight! link cmakeKWset_target_properties Green
highlight! link cmakeKWset_tests_properties Green
highlight! link cmakeKWsource_group Green
highlight! link cmakeKWstring Green
highlight! link cmakeKWsubdirs Green
highlight! link cmakeKWtarget_compile_definitions Green
highlight! link cmakeKWtarget_compile_features Green
highlight! link cmakeKWtarget_compile_options Green
highlight! link cmakeKWtarget_include_directories Green
highlight! link cmakeKWtarget_link_directories Green
highlight! link cmakeKWtarget_link_libraries Green
highlight! link cmakeKWtarget_link_options Green
highlight! link cmakeKWtarget_precompile_headers Green
highlight! link cmakeKWtarget_sources Green
highlight! link cmakeKWtry_compile Green
highlight! link cmakeKWtry_run Green
highlight! link cmakeKWunset Green
highlight! link cmakeKWuse_mangled_mesa Green
highlight! link cmakeKWvariable_requires Green
highlight! link cmakeKWvariable_watch Green
highlight! link cmakeKWwrite_file Green
" }}}
" json {{{
highlight! link jsonKeyword Red
highlight! link jsonString Green
highlight! link jsonBoolean Blue
highlight! link jsonNoise Gray
highlight! link jsonQuote Gray
highlight! link jsonBraces Fg
" }}}
" yaml {{{
highlight! link yamlKey Red
highlight! link yamlConstant Blue
highlight! link yamlString Green
" }}}
" toml {{{
call nordokai#highlight('tomlTable', s:palette.nordokai15, s:palette.none, 'bold')
highlight! link tomlKey Red
highlight! link tomlBoolean Blue
highlight! link tomlString Green
highlight! link tomlTableArray tomlTable
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
" dosini {{{
call nordokai#highlight('dosiniHeader', s:palette.nordokai11, s:palette.none, 'bold')
highlight! link dosiniLabel Blue
highlight! link dosiniValue Green
highlight! link dosiniNumber Green
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
