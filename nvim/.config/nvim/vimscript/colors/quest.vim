" Name:     Quest
set background=dark

hi clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'quest'

let s:t_Co = exists('&t_Co') && !empty(&t_Co) && &t_Co > 1 ? &t_Co : 2
let s:italics = (((&t_ZH != '' && &t_ZH != '[7m') || has('gui_running')) && !has('iOS')) || has('nvim')

if (has('termguicolors') && &termguicolors) || has('gui_running')
  let g:terminal_ansi_colors = ['#0F1118', '#59585E', '#A04F55', '#A38F71',
        \ '#566A8F', '#8E6DA3', '#A39F98', '#dcd6d0', '#9a9591', '#59585E',
        \ '#A04F55', '#A38F71', '#566A8F', '#8E6DA3', '#A39F98', '#dcd6d0']
  if has('nvim')
    let g:terminal_color_0 = '#0F1118'
    let g:terminal_color_1 = '#59585E'
    let g:terminal_color_2 = '#A04F55'
    let g:terminal_color_3 = '#A38F71'
    let g:terminal_color_4 = '#566A8F'
    let g:terminal_color_5 = '#8E6DA3'
    let g:terminal_color_6 = '#A39F98'
    let g:terminal_color_7 = '#dcd6d0'
    let g:terminal_color_8 = '#9a9591'
    let g:terminal_color_9 = '#59585E'
    let g:terminal_color_10 = '#A04F55'
    let g:terminal_color_11 = '#A38F71'
    let g:terminal_color_12 = '#566A8F'
    let g:terminal_color_13 = '#8E6DA3'
    let g:terminal_color_14 = '#A39F98'
    let g:terminal_color_15 = '#dcd6d0'
  endif
  if !exists('g:substrata_italic_comments')
    let g:substrata_italic_comments = 1
  endif
  if !exists('g:substrata_italic_functions')
    let g:substrata_italic_functions = 1
  endif
  hi Normal guifg=#dcd6d0 guibg=#191c25 guisp=NONE gui=NONE cterm=NONE
  hi Cursor guifg=#191c25 guibg=#dcd6d0 guisp=NONE gui=NONE cterm=NONE
  hi None guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi CursorLineNr guifg=#6c6f82 guibg=#20222d guisp=NONE gui=NONE cterm=NONE
  hi FoldColumn guifg=#3c3f4e guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi Folded guifg=#6c6f82 guibg=#272935 guisp=NONE gui=NONE cterm=NONE
  hi LineNr guifg=#3c3f4e guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi MatchParen guifg=#dcd6d0 guibg=#0F1118 guisp=NONE gui=bold cterm=bold
  hi SignColumn guifg=#3c3f4e guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi Ignore guifg=#3c3f4e guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi Pmenu guifg=#6c6f82 guibg=#272935 guisp=NONE gui=NONE cterm=NONE
  hi PmenuSbar guifg=#272935 guibg=#272935 guisp=NONE gui=NONE cterm=NONE
  hi PmenuSel guifg=#dcd6d0 guibg=#0F1118 guisp=NONE gui=NONE cterm=NONE
  hi PmenuThumb guifg=#20222d guibg=#20222d guisp=NONE gui=NONE cterm=NONE
  hi ErrorMsg guifg=#59585E guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi ModeMsg guifg=#9a9591 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi MoreMsg guifg=#566A8F guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi Question guifg=#566A8F guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi WarningMsg guifg=#A38F71 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi ColorColumn guifg=NONE guibg=#20222d guisp=NONE gui=NONE cterm=NONE
  hi CursorColumn guifg=NONE guibg=#20222d guisp=NONE gui=NONE cterm=NONE
  hi CursorLine guifg=NONE guibg=#20222d guisp=NONE gui=NONE cterm=NONE
  hi QuickFixLine guifg=NONE guibg=#0F1118 guisp=NONE gui=NONE cterm=NONE
  hi StatusLine guifg=#6c6f82 guibg=#0F1118 guisp=NONE gui=NONE cterm=NONE
  hi StatusLineNC guifg=#9a9591 guibg=#272935 guisp=NONE gui=NONE cterm=NONE
  hi VertSplit guifg=#3c3f4e guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi WildMenu guifg=#191c25 guibg=#dcd6d0 guisp=NONE gui=NONE cterm=NONE
  hi IncSearch guifg=#191c25 guibg=#dcd6d0 guisp=NONE gui=NONE cterm=NONE
  hi Search guifg=#191c25 guibg=#566A8F guisp=NONE gui=NONE cterm=NONE
  hi Visual guifg=NONE guibg=#0F1118 guisp=NONE gui=NONE cterm=NONE
  hi DiffAdd guifg=#A04F55 guibg=#1c2316 guisp=NONE gui=NONE cterm=NONE
  hi DiffChange guifg=NONE guibg=#272935 guisp=NONE gui=NONE cterm=NONE
  hi DiffDelete guifg=#59585E guibg=#2d1d16 guisp=NONE gui=NONE cterm=NONE
  hi DiffText guifg=#A38F71 guibg=#262011 guisp=NONE gui=NONE cterm=NONE
  hi Comment guifg=#9a9591 guibg=NONE guisp=NONE gui=italic cterm=italic
  hi Constant guifg=#8E6DA3 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi Error guifg=#59585E guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi PreProc guifg=#566A8F guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi Special guifg=#A39F98 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi Statement guifg=#566A8F guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi Type guifg=#8E6DA3 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi Delimiter guifg=#6c6f82 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi Directory guifg=#566A8F guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi Function guifg=#566A8F guibg=NONE guisp=NONE gui=italic cterm=italic
  hi Operator guifg=#6c6f82 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi SpecialComment guifg=#dcd6d0 guibg=NONE guisp=NONE gui=italic cterm=italic
  hi String guifg=#A39F98 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi Title guifg=#dcd6d0 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi Todo guifg=#dcd6d0 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi Typedef guifg=#8E6DA3 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi Underlined guifg=#566A8F guibg=NONE guisp=NONE gui=underline cterm=underline
  hi vimOption guifg=#566A8F guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi SpellBad guifg=#59585E guibg=NONE guisp=#59585E gui=undercurl cterm=undercurl
  hi SpellCap guifg=#59585E guibg=NONE guisp=#59585E gui=undercurl cterm=undercurl
  hi SpellLocal guifg=#59585E guibg=NONE guisp=#59585E gui=undercurl cterm=undercurl
  hi SpellRare guifg=#59585E guibg=NONE guisp=#59585E gui=undercurl cterm=undercurl
  if !s:italics
    hi Comment gui=NONE cterm=NONE
    hi Function gui=NONE cterm=NONE
    hi SpecialComment gui=NONE cterm=NONE
  endif
  let g:indentLine_color_gui  = '#3c3f4e'
  let g:indentLine_color_term = 238
  let g:limelight_conceal_guifg = '#9a9591'
  let g:limelight_conceal_ctermfg = 60
  hi! link Terminal Normal
  hi! link TabLine StatusLineNC
  hi! link TabLineFill StatusLineNC
  hi! link TabLineSel StatusLine
  hi! link StatusLineTerm StatusLine
  hi! link StatusLineTermNC StatusLineNC
  hi! link VisualNOS Visual
  hi! link diffAdded DiffAdd
  hi! link diffBDiffer WarningMsg
  hi! link diffChanged DiffChange
  hi! link diffCommon WarningMsg
  hi! link diffDiffer WarningMsg
  hi! link diffFile Directory
  hi! link diffIdentical WarningMsg
  hi! link diffIndexLine Number
  hi! link diffIsA WarningMsg
  hi! link diffNoEOL WarningMsg
  hi! link diffOnly WarningMsg
  hi! link diffRemoved DiffDelete
  hi! link Boolean Constant
  hi! link Character Constant
  hi! link Float Constant
  hi! link Number Constant
  hi! link StorageClass Statement
  hi! link Conditional Statement
  hi! link Exception Statement
  hi! link Keyword Statement
  hi! link Label Statement
  hi! link Repeat Statement
  hi! link Define PreProc
  hi! link Include PreProc
  hi! link Macro PreProc
  hi! link PreCondit PreProc
  hi! link Structure Type
  hi! link Typedef Type
  hi! link Debug Special
  hi! link SpecialChar Special
  hi! link Tag Special
  hi! link Noise Delimiter
  hi! link StringDelimiter Delimiter
  hi! link Conceal Ignore
  hi! link NonText Ignore
  hi! link SpecialKey Ignore
  hi! link EndOfBuffer Ignore
  hi! link Whitespace Ignore
  hi! link Identifier None
  hi! link Searchlight IncSearch
  hi! link cssBraces Delimiter
  hi! link gitcommitOverflow Error
  hi! link gitcommitSummary Title
  hi! link helpHyperTextJump Underlined
  hi! link htmlArg Function
  hi! link htmlEndTag Delimiter
  hi! link htmlLink Underlined
  hi! link htmlSpecialTagName htmlTagName
  hi! link htmlTag Delimiter
  hi! link htmlTagName Statement
  hi! link rustAttribute Delimiter
  hi! link rustDerive rustAttribute
  hi! link rustDeriveTrait rustDerive
  hi! link rustIdentifier Typedef
  hi! link rustModPath None
  hi! link rustSigil Delimiter
  hi! link scssAttribute Delimiter
  hi! link vimAutoCmdSfxList Type
  hi! link vimAutoEventList Identifier
  hi! link vimCmdSep Special
  hi! link vimCommentTitle SpecialComment
  hi! link vimContinue Delimiter
  hi! link vimHighlight Statement
  hi! link vimUserFunc Function
  hi markdownBold guifg=NONE guibg=NONE guisp=NONE gui=bold ctermfg=NONE ctermbg=NONE cterm=bold
  hi markdownItalic guifg=NONE guibg=NONE guisp=NONE gui=italic ctermfg=NONE ctermbg=NONE cterm=italic
  hi markdownUrl guifg=#9a9591 guibg=NONE guisp=NONE gui=underline cterm=underline
  hi markdownCode guifg=NONE guibg=#272935 guisp=NONE gui=NONE cterm=NONE
  hi markdownFaded guifg=#9a9591 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi! link markdownBlockquote None
  hi! link markdownCodeBlock markdownCode
  hi! link markdownCodeDelimiter markdownCode
  hi! link markdownH1Delimiter markdownH1
  hi! link markdownH2Delimiter markdownH2
  hi! link markdownH3Delimiter markdownH3
  hi! link markdownH4Delimiter markdownH4
  hi! link markdownH5Delimiter markdownH5
  hi! link markdownH6Delimiter markdownH6
  hi! link markdownId markdownFaded
  hi! link markdownIdDeclaration markdownFaded
  hi! link markdownLinkDelimiter markdownFaded
  hi! link markdownLinkText None
  hi! link markdownLinkTextDelimiter markdownFaded
  hi! link markdownListMarker markdownFaded
  hi! link markdownRule None
  if !s:italics
    hi markdownItalic gui=NONE cterm=NONE
  endif
  if !g:substrata_italic_comments
    hi Comment        cterm=NONE gui=NONE
    hi SpecialComment cterm=NONE gui=NONE
  endif
  if !g:substrata_italic_functions
    hi Function       cterm=NONE gui=NONE
  endif
  unlet s:t_Co s:italics
  finish
endif

if s:t_Co >= 256
  if !exists('g:substrata_italic_comments')
    let g:substrata_italic_comments = 1
  endif
  if !exists('g:substrata_italic_functions')
    let g:substrata_italic_functions = 1
  endif
  hi Normal ctermfg=146 ctermbg=234 cterm=NONE
  if !has('patch-8.0.0616') && !has('nvim') " Fix for Vim bug
    set background=dark
  endif
  hi Cursor ctermfg=234 ctermbg=189 cterm=NONE
  hi None ctermfg=NONE ctermbg=NONE cterm=NONE
  hi CursorLineNr ctermfg=242 ctermbg=235 cterm=NONE
  hi FoldColumn ctermfg=238 ctermbg=NONE cterm=NONE
  hi Folded ctermfg=242 ctermbg=235 cterm=NONE
  hi LineNr ctermfg=238 ctermbg=NONE cterm=NONE
  hi MatchParen ctermfg=189 ctermbg=236 cterm=bold
  hi SignColumn ctermfg=238 ctermbg=NONE cterm=NONE
  hi Ignore ctermfg=238 ctermbg=NONE cterm=NONE
  hi Pmenu ctermfg=242 ctermbg=235 cterm=NONE
  hi PmenuSbar ctermfg=235 ctermbg=235 cterm=NONE
  hi PmenuSel ctermfg=189 ctermbg=236 cterm=NONE
  hi PmenuThumb ctermfg=235 ctermbg=235 cterm=NONE
  hi ErrorMsg ctermfg=216 ctermbg=NONE cterm=NONE
  hi ModeMsg ctermfg=60 ctermbg=NONE cterm=NONE
  hi MoreMsg ctermfg=110 ctermbg=NONE cterm=NONE
  hi Question ctermfg=110 ctermbg=NONE cterm=NONE
  hi WarningMsg ctermfg=179 ctermbg=NONE cterm=NONE
  hi ColorColumn ctermfg=NONE ctermbg=235 cterm=NONE
  hi CursorColumn ctermfg=NONE ctermbg=235 cterm=NONE
  hi CursorLine ctermfg=NONE ctermbg=235 cterm=NONE
  hi QuickFixLine ctermfg=NONE ctermbg=236 cterm=NONE
  hi StatusLine ctermfg=242 ctermbg=236 cterm=NONE
  hi StatusLineNC ctermfg=60 ctermbg=235 cterm=NONE
  hi VertSplit ctermfg=238 ctermbg=NONE cterm=NONE
  hi WildMenu ctermfg=234 ctermbg=146 cterm=NONE
  hi IncSearch ctermfg=234 ctermbg=146 cterm=NONE
  hi Search ctermfg=234 ctermbg=67 cterm=NONE
  hi Visual ctermfg=NONE ctermbg=236 cterm=NONE
  hi DiffAdd ctermfg=114 ctermbg=234 cterm=NONE
  hi DiffChange ctermfg=NONE ctermbg=235 cterm=NONE
  hi DiffDelete ctermfg=216 ctermbg=234 cterm=NONE
  hi DiffText ctermfg=179 ctermbg=234 cterm=NONE
  hi Comment ctermfg=60 ctermbg=NONE cterm=italic
  hi Constant ctermfg=139 ctermbg=NONE cterm=NONE
  hi Error ctermfg=173 ctermbg=NONE cterm=NONE
  hi PreProc ctermfg=67 ctermbg=NONE cterm=NONE
  hi Special ctermfg=116 ctermbg=NONE cterm=NONE
  hi Statement ctermfg=67 ctermbg=NONE cterm=NONE
  hi Type ctermfg=139 ctermbg=NONE cterm=NONE
  hi Delimiter ctermfg=242 ctermbg=NONE cterm=NONE
  hi Directory ctermfg=67 ctermbg=NONE cterm=NONE
  hi Function ctermfg=110 ctermbg=NONE cterm=italic
  hi Operator ctermfg=242 ctermbg=NONE cterm=NONE
  hi SpecialComment ctermfg=189 ctermbg=NONE cterm=italic
  hi String ctermfg=73 ctermbg=NONE cterm=NONE
  hi Title ctermfg=189 ctermbg=NONE cterm=NONE
  hi Todo ctermfg=189 ctermbg=NONE cterm=NONE
  hi Typedef ctermfg=182 ctermbg=NONE cterm=NONE
  hi Underlined ctermfg=110 ctermbg=NONE cterm=underline
  hi vimOption ctermfg=110 ctermbg=NONE cterm=NONE
  hi SpellBad ctermfg=173 ctermbg=NONE cterm=undercurl
  hi SpellCap ctermfg=173 ctermbg=NONE cterm=undercurl
  hi SpellLocal ctermfg=173 ctermbg=NONE cterm=undercurl
  hi SpellRare ctermfg=173 ctermbg=NONE cterm=undercurl
  if !s:italics
    hi Comment cterm=NONE
    hi Function cterm=NONE
    hi SpecialComment cterm=NONE
  endif
  let g:indentLine_color_gui  = '#3c3f4e'
  let g:indentLine_color_term = 238
  let g:limelight_conceal_guifg = '#9a9591'
  let g:limelight_conceal_ctermfg = 60
  hi! link Terminal Normal
  hi! link TabLine StatusLineNC
  hi! link TabLineFill StatusLineNC
  hi! link TabLineSel StatusLine
  hi! link StatusLineTerm StatusLine
  hi! link StatusLineTermNC StatusLineNC
  hi! link VisualNOS Visual
  hi! link diffAdded DiffAdd
  hi! link diffBDiffer WarningMsg
  hi! link diffChanged DiffChange
  hi! link diffCommon WarningMsg
  hi! link diffDiffer WarningMsg
  hi! link diffFile Directory
  hi! link diffIdentical WarningMsg
  hi! link diffIndexLine Number
  hi! link diffIsA WarningMsg
  hi! link diffNoEOL WarningMsg
  hi! link diffOnly WarningMsg
  hi! link diffRemoved DiffDelete
  hi! link Boolean Constant
  hi! link Character Constant
  hi! link Float Constant
  hi! link Number Constant
  hi! link StorageClass Statement
  hi! link Conditional Statement
  hi! link Exception Statement
  hi! link Keyword Statement
  hi! link Label Statement
  hi! link Repeat Statement
  hi! link Define PreProc
  hi! link Include PreProc
  hi! link Macro PreProc
  hi! link PreCondit PreProc
  hi! link Structure Type
  hi! link Typedef Type
  hi! link Debug Special
  hi! link SpecialChar Special
  hi! link Tag Special
  hi! link Noise Delimiter
  hi! link StringDelimiter Delimiter
  hi! link Conceal Ignore
  hi! link NonText Ignore
  hi! link SpecialKey Ignore
  hi! link EndOfBuffer Ignore
  hi! link Whitespace Ignore
  hi! link Identifier None
  hi! link Searchlight IncSearch
  hi! link cssBraces Delimiter
  hi! link gitcommitOverflow Error
  hi! link gitcommitSummary Title
  hi! link helpHyperTextJump Underlined
  hi! link htmlArg Function
  hi! link htmlEndTag Delimiter
  hi! link htmlLink Underlined
  hi! link htmlSpecialTagName htmlTagName
  hi! link htmlTag Delimiter
  hi! link htmlTagName Statement
  hi! link rustAttribute Delimiter
  hi! link rustDerive rustAttribute
  hi! link rustDeriveTrait rustDerive
  hi! link rustIdentifier Typedef
  hi! link rustModPath None
  hi! link rustSigil Delimiter
  hi! link scssAttribute Delimiter
  hi! link vimAutoCmdSfxList Type
  hi! link vimAutoEventList Identifier
  hi! link vimCmdSep Special
  hi! link vimCommentTitle SpecialComment
  hi! link vimContinue Delimiter
  hi! link vimHighlight Statement
  hi! link vimUserFunc Function
  hi markdownBold ctermfg=NONE ctermbg=NONE cterm=bold
  hi markdownItalic ctermfg=NONE ctermbg=NONE cterm=italic
  hi markdownUrl ctermfg=60 ctermbg=NONE cterm=underline
  hi markdownCode ctermfg=NONE ctermbg=235 cterm=NONE
  hi markdownFaded ctermfg=60 ctermbg=NONE cterm=NONE
  hi! link markdownBlockquote None
  hi! link markdownCodeBlock markdownCode
  hi! link markdownCodeDelimiter markdownCode
  hi! link markdownH1Delimiter markdownH1
  hi! link markdownH2Delimiter markdownH2
  hi! link markdownH3Delimiter markdownH3
  hi! link markdownH4Delimiter markdownH4
  hi! link markdownH5Delimiter markdownH5
  hi! link markdownH6Delimiter markdownH6
  hi! link markdownId markdownFaded
  hi! link markdownIdDeclaration markdownFaded
  hi! link markdownLinkDelimiter markdownFaded
  hi! link markdownLinkText None
  hi! link markdownLinkTextDelimiter markdownFaded
  hi! link markdownListMarker markdownFaded
  hi! link markdownRule None
  if !s:italics
    hi markdownItalic cterm=NONE
  endif
  if !g:substrata_italic_comments
    hi Comment        cterm=NONE gui=NONE
    hi SpecialComment cterm=NONE gui=NONE
  endif
  if !g:substrata_italic_functions
    hi Function       cterm=NONE gui=NONE
  endif
  unlet s:t_Co s:italics
  finish
endif

" Background: dark
" Color: base0        #191c25 ~ # Background
" Color: base1        #20222d ~ # Slightly lighter
" Color: base2        #272935 ~ # Much lighter
" Color: base3        #0F1118 ~ # Lightest
" Color: base4        #3c3f4e ~ # Almost invisible
" Color: base5        #9a9591 ~ # Much darker
" Color: base6        #6c6f82 ~ # Slightly darker
" Color: base7        #dcd6d0 ~ # Foreground
" Color: base8        #dcd6d0 ~ # Lighter
" Color: red          #59585E ~
" Color: green        #A04F55 ~
" Color: yellow       #A38F71 ~
" Color: blue         #566A8F ~
" Color: pink         #8E6DA3 ~
" Color: cyan         #A39F98 ~
" Color: light_red    #59585E ~
" Color: light_green  #A04F55 ~
" Color: light_yellow #A38F71 ~
" Color: light_blue   #566A8F ~
" Color: light_pink   #8E6DA3 ~
" Color: light_cyan   #A39F98 ~
" Color: red_wash     #2d1d16 ~
" Color: green_wash   #1c2316 ~
" Color: yellow_wash  #262011 ~
" Term colors: base3      red        green       yellow
" Term colors: blue       pink       cyan        base7
" Term colors: base5      light_red  light_green light_yellow
" Term colors: light_blue light_pink light_cyan  base8
" vim: et ts=2 sw=2
