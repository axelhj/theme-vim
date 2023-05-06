" Hard hacker theme for Vim
"
scriptencoding utf8
highlight clear
if exists("syntax_on")
  syntax reset
endif

set background=dark
let g:colors_name = "hardhacker"

if !has('gui_running') && &t_Co != 256 && !(has('termguicolors') && &termguicolors)
  finish
endif

" Palette
"
let s:bg_darker     = "#211e2a"
let s:bg_dark       = "#282433"
let s:bg            = s:bg_dark
let s:fg            = "#eee9fc"
let s:selection     = "#3f3951"
let s:comment       = "#938AAD"
let s:red           = "#e965a5"
let s:green         = "#b1f2a7"
let s:yellow        = "#ebde76"
let s:blue          = "#b1baf4"
let s:purple        = "#e192ef"
let s:cyan          = "#b3f4f3"
let s:black         = "#000000"

let s:bg2_darker    = "234"
let s:bg2_dark      = "235"
let s:bg2           = s:bg2_dark
let s:fg2           = "255"
let s:selection2    = "238"
let s:comment2      = "243"
let s:red2          = "205" "212
let s:green2        = "157"
let s:yellow2       = "227"
let s:blue2         = "153"
let s:purple2       = "219"
let s:cyan2         = "123"
let s:black2        = "16"

let s:none          = "NONE"

if !exists('g:hardhacker_darker')
    let g:hardhacker_darker = 0
endif

if g:hardhacker_darker == 1
    let s:bg = s:bg_darker
    let s:bg2 = s:bg2_darker
endif

" for terminal
let g:hardhacker#palette = {}
let g:hardhacker#palette.color_0  = s:bg_dark
let g:hardhacker#palette.color_1  = s:red
let g:hardhacker#palette.color_2  = s:green
let g:hardhacker#palette.color_3  = s:yellow
let g:hardhacker#palette.color_4  = s:blue
let g:hardhacker#palette.color_5  = s:purple
let g:hardhacker#palette.color_6  = s:cyan
let g:hardhacker#palette.color_7  = s:fg
let g:hardhacker#palette.color_8  = '#655980'
let g:hardhacker#palette.color_9  = s:red
let g:hardhacker#palette.color_10 = s:green
let g:hardhacker#palette.color_11 = s:yellow
let g:hardhacker#palette.color_12 = s:blue
let g:hardhacker#palette.color_13 = s:purple
let g:hardhacker#palette.color_14 = s:cyan
let g:hardhacker#palette.color_15 = s:fg

if has('nvim')
  for s:i in range(16)
    let g:terminal_color_{s:i} = g:hardhacker#palette['color_' . s:i]
  endfor
endif
if has('terminal')
  let g:terminal_ansi_colors = []
  for s:i in range(16)
    call add(g:terminal_ansi_colors, g:hardhacker#palette['color_' . s:i])
  endfor
endif

function s:hi_group(group, termfg, termbg, guifg, guibg, list)
    let l:attr = 'NONE'
    if has('nvim')
        let l:attr = join(a:list, ',')
    endif
    let l:hl_fields = [
        \ 'hi',
        \ a:group,
        \ 'ctermfg=' . a:termfg,
        \ 'ctermbg=' . a:termbg,
        \ 'cterm=' . l:attr,
        \ 'guifg=' . a:guifg,
        \ 'guibg=' . a:guibg,
        \ 'gui=' . l:attr
        \]
    execute join(l:hl_fields, ' ')
endfunction

function s:hi_group_without_attr(group, termfg, termbg, guifg, guibg)
    let l:list = ['NONE']
    call s:hi_group(a:group, a:termfg, a:termbg, a:guifg, a:guibg, l:list)
endfunction

" Set environment highlight
"
call s:hi_group_without_attr('Cursor', s:fg2, s:red2, s:fg, s:red)
call s:hi_group_without_attr('CursorLine', s:none, s:selection2, s:none, s:selection)
call s:hi_group_without_attr('CursorLineNr', s:purple2, s:bg2, s:purple, s:bg)
call s:hi_group_without_attr('CursorColumn', s:none, s:bg2,  s:none, s:bg)
call s:hi_group_without_attr('ColorColumn', s:none, s:bg2,  s:none, s:bg)

call s:hi_group_without_attr('StatusLine', s:fg2, s:selection2, s:fg, s:selection)
call s:hi_group_without_attr('StatusLineNC', s:fg2, s:bg2, s:fg, s:bg)
call s:hi_group_without_attr('StatusLineTerm', s:none, s:bg2, s:none, s:bg)
call s:hi_group_without_attr('StatusLineTermNC', s:none, s:bg2, s:none, s:bg)
call s:hi_group_without_attr('WildMenu', s:none, s:purple2, s:none, s:purple)

call s:hi_group_without_attr('Pmenu', s:comment2, s:bg2, s:comment, s:bg)
call s:hi_group_without_attr('PmenuSel', s:black2, s:purple2, s:black, s:purple)
call s:hi_group_without_attr('PmenuSbar', s:comment2, s:bg2, s:comment, s:bg)
call s:hi_group_without_attr('PmenuThumb', s:comment2, s:bg2, s:comment, s:bg)

call s:hi_group_without_attr('Folded', s:fg2, s:bg2, s:fg, s:bg)
call s:hi_group_without_attr('Normal', s:fg2, s:bg2, s:fg, s:bg)
call s:hi_group_without_attr('EndOfBuffer', s:comment2, s:bg2, s:comment, s:bg) 
call s:hi_group_without_attr('LineNr', s:comment2, s:bg2, s:comment, s:bg)
call s:hi_group_without_attr('Visual',  s:none, s:selection2, s:none, s:selection)
call s:hi_group_without_attr('VisualNOS',  s:none, s:selection2, s:none, s:selection)
call s:hi_group('Directory', s:blue2, s:none, s:blue, s:none, ['bold'])
call s:hi_group_without_attr('IncSearch', s:bg2, s:yellow2, s:bg, s:yellow)
call s:hi_group_without_attr('VertSplit', s:selection2, s:bg2, s:selection, s:bg)

execute 'hi Search ctermfg='.s:bg2.' ctermbg='.s:yellow2.' cterm=underline guifg='.s:bg.' guibg='.s:yellow.' gui=underline'
execute 'hi MatchParen ctermfg='.s:yellow2.' ctermbg=NONE cterm=underline guifg='.s:yellow.' guibg=NONE gui=underline'

" Set text highlight
"
function s:hi_fg_group(group, ctermfg, guifg, ...)
    if a:0 == 0
        call s:hi_group_without_attr(a:group, a:ctermfg, s:none, a:guifg, s:none)
    else 
        let l:list = a:000
        call s:hi_group(a:group, a:ctermfg, s:none, a:guifg, s:none, l:list)
    endif
endfunction

function s:hi_bg_group(group, ctermbg, guibg)
    call s:hi_group_without_attr(a:group, s:none, a:ctermbg, s:none, a:guibg)
endfunction

call s:hi_fg_group('HardHackerRed', s:red2, s:red)
call s:hi_fg_group('HardHackerRedBold', s:red2, s:red, 'bold')
call s:hi_fg_group('HardHackerPurple', s:purple2, s:purple)
call s:hi_fg_group('HardHackerBlue', s:blue2,s:blue)
call s:hi_fg_group('HardHackerYellow', s:yellow2, s:yellow)
call s:hi_fg_group('HardHackerCyan',s:cyan2, s:cyan)
call s:hi_fg_group('HardHackerGreen', s:green2, s:green)
call s:hi_fg_group('HardHackerFg', s:fg2, s:fg)
call s:hi_fg_group('HardHackerComment',s:comment2, s:comment)

call s:hi_bg_group('HardHackerBg', s:bg2, s:bg)
call s:hi_bg_group('HardHackerSelection', s:selection2, s:selection)

call s:hi_group_without_attr('HardHackerBlackYellow', s:black2, s:yellow2, s:black, s:yellow)
call s:hi_group_without_attr('HardHackerGreenSelection', s:green2, s:selection2, s:green, s:selection)
call s:hi_group_without_attr('HardHackerRedSelection', s:red2, s:selection2, s:red, s:selection)
call s:hi_group_without_attr('HardHackerYellowSelection', s:yellow2, s:selection2, s:yellow, s:selection)

hi! link Comment        HardHackerComment
hi! link String         HardHackerGreen
hi! link Constant       HardHackerPurple
hi! link Character      HardHackerYellow
hi! link Number         HardHackerYellow
hi! link Boolean        HardHackerYellow
hi! link Float          HardHackerYellow

hi! link Function       HardHackerRed
hi! link Identifier     HardHackerPurple

hi! link Exception      HardHackerBlue
hi! link Repeat         HardHackerBlue
hi! link Statement      HardHackerBlue
hi! link Conditional    HardHackerBlue
hi! link Label          HardHackerBlue
hi! link Keyword        HardHackerBlue
hi! link Operator       HardHackerFg

hi! link Type           HardHackerCyan
hi! link Delimiter      HardHackerFg

hi! link Tag            HardHackerCyan
hi! link Define         HardHackerCyan
hi! link Special        HardHackerBlue
" hi! link SpecialKey     HardHackerPurple
hi! link SpecialComment HardHackerCyan
hi! link StorageClass   HardHackerCyan
hi! link Structure      HardHackerCyan
hi! link Macro          HardHackerCyan
hi! link PreCondit      HardHackerPurple
hi! link Include        HardHackerBlue
hi! link Typedef        HardHackerCyan
hi! link PreProc        HardHackerPurple

hi! link DiffAdd        HardHackerGreenSelection
hi! link DiffAdded      DiffAdd
hi! link DiffDelete     HardHackerRedSelection
hi! link DiffRemoved    DiffDelete
hi! link DiffText       HardHackerBlackYellow
hi! link DiffChange     HardHackerYellowSelection

hi! link TabLine        Normal
hi! link TabLineFill    HardHackerBg
hi! link TabLineSel     HardHackerRed

hi! link MoreMsg        HardHackerRed
hi! link NonText        EndOfBuffer
hi! link WarningMsg     HardHackerYellow
hi! link Title          HardHackerRedBold
hi! link Question       HardHackerRed
hi! link SignColumn     HardHackerComment
hi! link Error          HardHackerBlackYellow
hi! link ErrorMsg       Error
execute 'hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline'
execute 'hi Todo ctermfg='.s:yellow2.' ctermbg=NONE cterm=inverse,bold guifg='.s:yellow.' guibg=NONE gui=inverse,bold,italic'

function s:is_valid(...)
    if ! exists('s:colors_name') || s:colors_name !=# 'hardhacker'
        return 0
    elseif a:0 > 0 && (exists('b:current_syntax') && index(a:000, b:current_syntax) != -1)
        return 1
    endif
    return 0
endfunction

if has('nvim')
    hi! link DiagnosticInfo             HardHackerCyan
    hi! link DiagnosticHint             HardHackerCyan
    hi! link DiagnosticError            HardHackerRed
    hi! link DiagnosticWarn             HardHackerYellow
    hi! link DiagnosticUnderlineError   HardHackerRed
    hi! link DiagnosticUnderlineHint    HardHackerFg
    hi! link DiagnosticUnderlineInfo    HardHackerFg
    hi! link DiagnosticUnderlineWarn    HardHackerYellow
    
    hi! link WinSeparator               HardHackerComment
    hi! link SpecialKey                 HardHackerBlue
    hi! link LspReferenceText           HardHackerSelection
    hi! link LspReferenceRead           HardHackerSelection
    hi! link LspReferenceWrite          HardHackerSelection

    hi! link LspDiagnosticsDefaultInformation   DiagnosticInfo
    hi! link LspDiagnosticsDefaultHint          DiagnosticHint
    hi! link LspDiagnosticsDefaultError         DiagnosticError
    hi! link LspDiagnosticsDefaultWarning       DiagnosticWarn
    hi! link LspDiagnosticsUnderlineError       DiagnosticUnderlineError
    hi! link LspDiagnosticsUnderlineHint        DiagnosticUnderlineHint
    hi! link LspDiagnosticsUnderlineInformation DiagnosticUnderlineInfo
    hi! link LspDiagnosticsUnderlineWarning     DiagnosticUnderlineWarn
else
    hi! link SpecialKey HardHackerPurple
endif


" SYNTAX
"
" HTML
"
hi! link htmlTag          HardHackerBlue
hi! link htmlEndTag       HardHackerBlue
hi! link htmlTagName      HardHackerBlue
hi! link htmlArg          HardHackerRed
hi! link htmlSpecialChar  HardHackerGreen

" JAVASCRIPT
"
hi! link javaScriptBraces   HardHackerFg
hi! link javaScriptNumber   Constant
hi! link javaScriptNull     Constant
hi! link javaScriptFunction Keyword

""" 'pangloss/vim-javascript'
hi! link jsArrowFunction           Operator
hi! link jsBuiltins                HardHackerCyan
hi! link jsClassDefinition         HardHackerCyan
hi! link jsClassMethodType         Keyword
hi! link jsDestructuringAssignment HardHackerYellow
hi! link jsDocParam                HardHackerYellow
hi! link jsDocTags                 Keyword
hi! link jsDocType                 Type
hi! link jsDocTypeBrackets         HardHackerCyan
hi! link jsFuncArgOperator         Operator
hi! link jsFuncArgs                HardHackerYellow
hi! link jsFunction                Keyword
hi! link jsNull                    Constant
hi! link jsObjectColon             HardHackerRed
hi! link jsSuper                   HardHackerPurple
hi! link jsTemplateBraces          Special
hi! link jsThis                    HardHackerPurple
hi! link jsUndefined               Constant

""" 'maxmellon/vim-jsx-pretty'
hi! link jsxTag             Keyword
hi! link jsxTagName         Keyword
hi! link jsxComponentName   Type
hi! link jsxCloseTag        Type
hi! link jsxAttrib          HardHackerGreen
hi! link jsxCloseString     Identifier
hi! link jsxOpenPunct       Identifier

" YAML
"
hi! link yamlAnchor          HardHackerPurple
hi! link yamlPlainScalar     HardHackerYellow
hi! link yamlAlias           HardHackerGreen
hi! link yamlFlowCollection  HardHackerPurple
hi! link yamlNodeTag         HardHackerPurple
hi! link yamlBlockMappingKey HardHackerCyan
hi! link yamlFlowIndicator   Delimiter

" CSS
"
hi! link cssNoise             HardHackerBlue
hi! link cssPseudoClassId     HardHackerBlue
hi! link cssAttrComma         Delimiter
hi! link cssAttrRegion        HardHackerCyan
hi! link cssFunctionComma     Delimiter
hi! link cssProp              HardHackerPurple
hi! link cssUnitDecorators    HardHackerBlue
hi! link cssBraces            Delimiter
hi! link cssAttributeSelector HardHackerGreen   
hi! link cssPseudoClass       HardHackerBlue
hi! link cssVendor            HardHackerGreen

" Rust
"
hi! link rustCommentLineDoc Comment

" Vim
"
hi! link vimEnvVar             Constant
hi! link vimAutoEventList      Type
hi! link vimUserAttrbCmpltFunc Function
hi! link vimFunction           Function
hi! link vimOption             Type
hi! link vimSetMod             Keyword
hi! link vimAutoCmdSfxList     Type
hi! link vimSetSep             Delimiter
hi! link vimUserFunc           Function
hi! link vimHiBang             Keyword

" JSON
"
hi! link jsonKeywordMatch HardHackerPurple
hi! link jsonKeyword      HardHackerPurple

" Shell
"
hi! link shEscape HardHackerRed
