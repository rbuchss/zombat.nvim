--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require('lush')
local hsl = lush.hsl

-- from lua/zombat/ansi_iterm2.lua
local ansi_colors = {
  black = hsl("#000000"),
  red = hsl("#f08072"),
  green = hsl("#c6e889"),
  yellow = hsl("#ecdfb1"),
  blue = hsl("#7fb7f2"),
  magenta = hsl("#e08cf8"),
  cyan = hsl("#aafaf7"),
  white = hsl("#e4e1d8"),

  bright_black = hsl("#404040"),
  bright_red = hsl("#eca395"),
  bright_green = hsl("#e6f6a9"),
  bright_yellow = hsl("#f0e9c3"),
  bright_blue = hsl("#b9d1fb"),
  bright_magenta = hsl("#debefa"),
  bright_cyan = hsl("#cefcf9"),
  bright_white = hsl("#fefefe"),

  foreground = hsl("#e4e1d8"),
  background = hsl("#1e1e1e"),

  cursor = hsl("#c7c7c7"),
  cursor_text = hsl("#feffff"),

  selection_background = hsl("#554c49"),
  selection_foreground = hsl("#c3c7ca"),
}

-- from lua/zombat/colors.lua
local c_step = 20

local c = ansi_colors

-- Add dark color variants not in pallet
c.dark_black = c.black.darken(c_step)
c.dark_red = c.red.darken(c_step)
c.dark_green = c.green.darken(c_step)
c.dark_yellow = c.yellow.darken(c_step)
c.dark_blue = c.blue.darken(c_step)
c.dark_magenta = c.magenta.darken(c_step)
c.dark_cyan = c.cyan.darken(c_step)
c.dark_white = c.white.darken(c_step)

-- Extend pallet colors
-- TODO: See if these should be replaced with the ANSI terminal colors
c.orange = hsl("#e5786d")
c.dark_orange = c.orange.darken(c_step)
c.violet = hsl("#b294bb")
c.purple = hsl("#d787ff")
c.grey = hsl("#574b49")
c.aqua = c.cyan
c.pink = c.bright_red.lighten(c_step)

-- A few grey scales
c.grey_1 = hsl("#c3c6ca")
c.grey_2 = hsl("#9c998e")
c.grey_3 = hsl("#636066")
c.grey_4 = hsl("#574b49")
c.grey_5 = hsl("#444444")
c.grey_6 = hsl("#32322f")

-- Other colors
c.error_red = hsl("#ff2026")

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    -- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
    -- groups, mostly used for styling UI elements.
    -- Comment them out and add your own properties to override the defaults.
    -- An empty definition `{}` will clear all styling, leaving elements looking
    -- like the 'Normal' group.
    -- To be able to link to a group, it must already be defined, so you may have
    -- to reorder items as you go.
    --
    -- See :h highlight-groups
    --
    -- ColorColumn    { }, -- Columns set with 'colorcolumn'
    -- Conceal        { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    -- ====================
    -- key: Cursor
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_classic.lua
    Cursor            { bg = c.yellow }, -- Character under the cursor
    -- ====================
    -- CurSearch      { }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
    -- lCursor        { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
    -- ====================
    -- key: CursorColumn
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_classic.lua
    CursorColumn      { Cursor }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    -- ====================
    -- ====================
    -- key: CursorLine
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_classic.lua
    CursorLine        { bg = c.grey_6 }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    -- ====================
    -- ====================
    -- key: Directory
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_classic.lua
    Directory         { fg = c.cyan }, -- Directory names (and other special names in listings)
    -- ====================
    -- ====================
    -- key: DiffAdd
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_lush.lua
    -- DiffAdd           { fg = c.dark_green.readable(), bg = c.dark_green }, -- Diff mode: Added line |diff.txt|
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_classic.lua
    -- DiffAdd          { bg = hsl("#2a0d6a") }, -- Diff mode: Added line |diff.txt|
    -- ====================
    -- ====================
    -- key: DiffChange
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_lush.lua
    -- DiffChange        { bg = c.violet }, -- Diff mode: Changed line |diff.txt|
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_classic.lua
    -- DiffChange       { bg = hsl("#382a37") }, -- Diff mode: Changed line |diff.txt|
    -- ====================
    -- ====================
    -- key: DiffDelete
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_lush.lua
    -- DiffDelete        { fg = c.red.readable(), bg = c.red }, -- Diff mode: Deleted line |diff.txt|
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_classic.lua
    -- DiffDelete       { fg = hsl("#242424"), bg = hsl("#3e3969") }, -- Diff mode: Deleted line |diff.txt|
    -- ====================
    -- ====================
    -- key: DiffText
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_lush.lua
    -- DiffText          { fg = c.magenta.readable(), bg = c.magenta }, -- Diff mode: Changed text within a changed line |diff.txt|
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_classic.lua
    -- DiffText         { bg = hsl("#382a37") }, -- Diff mode: Changed text within a changed line |diff.txt|
    -- ====================
    -- EndOfBuffer    { }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    -- TermCursor     { }, -- Cursor in a focused terminal
    -- TermCursorNC   { }, -- Cursor in an unfocused terminal
    -- ====================
    -- key: ErrorMsg
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_classic.lua
    ErrorMsg          { fg = c.error_red, bg = c.grey_5, gui = "bold" }, -- Error messages on the command line
    -- ====================
    -- ====================
    -- key: VertSplit
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_classic.lua
    VertSplit         { fg = c.grey_5, bg = c.grey_5 }, -- Column separating vertically split windows
    -- ====================
    -- ====================
    -- key: Folded
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_classic.lua
    Folded            { fg = c.grey_2, bg = c.grey_4 }, -- Line used for closed folds
    -- ====================
    -- ====================
    -- key: FoldColumn
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_classic.lua
    FoldColumn        { Folded }, -- 'foldcolumn'
    -- ====================
    -- SignColumn     { }, -- Column where |signs| are displayed
    -- IncSearch      { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    -- Substitute     { }, -- |:substitute| replacement text highlighting
    -- ====================
    -- key: LineNr
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_classic.lua
    LineNr            { fg = c.grey_4, bg = c.black }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    -- ====================
    -- LineNrAbove    { }, -- Line number for when the 'relativenumber' option is set, above the cursor line
    -- LineNrBelow    { }, -- Line number for when the 'relativenumber' option is set, below the cursor line
    -- CursorLineNr   { }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    -- CursorLineFold { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
    -- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
    -- ====================
    -- key: MatchParen
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_classic.lua
    MatchParen        { fg = c.yellow, bg = c.grey_2, gui = "bold" }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    -- ====================
    -- ModeMsg        { }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea        { }, -- Area for messages and cmdline
    -- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    -- MoreMsg        { }, -- |more-prompt|
    -- ====================
    -- key: NonText
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_classic.lua
    NonText           { LineNr }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    -- ====================
    -- ====================
    -- key: Normal
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_lush.lua
    Normal            { bg = c.background, fg = c.foreground }, -- Normal text
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_classic.lua
    -- Normal           { bg = c256mod.background, fg = c256mod.foreground }, -- Normal text
    -- ====================
    -- ====================
    -- key: NormalFloat
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_lush.lua
    -- NormalFloat       { bg = Normal.bg.lighten(10), fg = classic.Special.fg }, -- Normal text in floating windows.
    NormalFloat       { bg = Normal.bg.lighten(10), fg = Special.fg }, -- Normal text in floating windows.
    -- ====================
    -- ====================
    -- key: FloatBorder
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_lush.lua
    -- FloatBorder       { bg = NormalFloat.bg, fg = classic.Pmenu.fg }, -- Border of floating windows.
    FloatBorder       { bg = NormalFloat.bg, fg = Pmenu.fg }, -- Border of floating windows.
    -- ====================
    -- FloatTitle     { }, -- Title of floating windows.
    -- NormalNC       { }, -- normal text in non-current windows
    -- ====================
    -- key: Pmenu
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_classic.lua
    Pmenu             { fg = c.bright_yellow, bg = c.grey_5 }, -- Popup menu: Normal item.
    -- ====================
    -- ====================
    -- key: PmenuSel
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_classic.lua
    PmenuSel          { fg = c.bright_green.readable(), bg = c.bright_green }, -- Popup menu: Selected item.
    -- ====================
    -- PmenuKind      { }, -- Popup menu: Normal item "kind"
    -- PmenuKindSel   { }, -- Popup menu: Selected item "kind"
    -- PmenuExtra     { }, -- Popup menu: Normal item "extra text"
    -- PmenuExtraSel  { }, -- Popup menu: Selected item "extra text"
    -- PmenuSbar      { }, -- Popup menu: Scrollbar.
    -- PmenuThumb     { }, -- Popup menu: Thumb of the scrollbar.
    -- Question       { }, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine   { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    -- ====================
    -- key: Search
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_classic.lua
    Search            { fg = c.purple, bg = c.grey_3 }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    -- ====================
    -- ====================
    -- key: SpecialKey
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_classic.lua
    SpecialKey        { fg = c.grey_3, bg = c.grey_6 }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    -- ====================
    -- SpellBad       { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    -- SpellCap       { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal     { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare      { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    -- ====================
    -- key: StatusLine
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_classic.lua
    StatusLine        { fg = c.bright_yellow, bg = c.grey_5 }, -- Status line of current window
    -- ====================
    -- ====================
    -- key: StatusLineNC
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_classic.lua
    StatusLineNC      { fg = c.grey_2, bg = StatusLine.bg }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    -- ====================
    -- TabLine        { }, -- Tab pages line, not active tab page label
    -- TabLineFill    { }, -- Tab pages line, where there are no labels
    -- TabLineSel     { }, -- Tab pages line, active tab page label
    -- ====================
    -- key: Title
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_classic.lua
    Title             { fg = c.bright_yellow, gui = "bold" }, -- Titles for output from ":set all", ":autocmd" etc.
    -- ====================
    -- ====================
    -- key: Visual
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_classic.lua
    Visual            { fg = c.grey_1, bg = c.grey_4 }, -- Visual mode selection
    -- ====================
    -- ====================
    -- key: VisualNOS
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_classic.lua
    VisualNOS         { fg = c.grey_1, bg = c.grey_5 }, -- Visual mode selection when vim is "Not Owning the Selection".
    -- ====================
    -- ====================
    -- key: WarningMsg
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_classic.lua
    WarningMsg        { fg = c.bright_red }, -- Warning messages
    -- ====================
    -- Whitespace     { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    -- Winseparator   { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    -- WildMenu       { }, -- Current match in 'wildmenu' completion
    -- WinBar         { }, -- Window bar of current window
    -- WinBarNC       { }, -- Window bar of not-current windows

    -- Common vim syntax groups used for all kinds of code and markup.
    -- Commented-out groups should chain up to their preferred (*) group
    -- by default.
    --
    -- See :h group-name
    --
    -- Uncomment and edit if you want more specific syntax highlighting.

    -- ====================
    -- key: Comment
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_classic.lua
    Comment           { fg = c.grey_2 }, -- Any comment
    -- ====================

    -- ====================
    -- key: Constant
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_classic.lua
    Constant          { fg = c.orange }, -- (*) Any constant
    -- ====================
    -- ====================
    -- key: String
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_classic.lua
    String            { ctermfg=113, fg=hsl('#95e454') }, --   A string constant: "this is a string"
    -- ====================
    -- Character      { }, --   A character constant: 'c', '\n'
    -- ====================
    -- key: Number
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_classic.lua
    Number            { fg = c.orange }, --   A number constant: 234, 0xff
    -- ====================
    -- ====================
    -- key: Boolean
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_lush.lua
    Boolean           { fg = c.bright_red }, --   A boolean constant: TRUE, false
    -- ====================
    -- Float          { }, --   A floating point constant: 2.3e10

    -- Identifier     { }, -- (*) Any variable name
    Identifier     { fg = c.bright_green }, -- (*) Any variable name
    -- ====================
    -- key: Function
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_classic.lua
    Function          { fg = c.bright_green }, --   Function name (also: methods for classes)
    -- ====================

    -- ====================
    -- key: Statement
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_classic.lua
    Statement         { fg = c.blue }, -- (*) Any statement
    -- ====================
    -- Conditional    { }, --   if, then, else, endif, switch, etc.
    -- Repeat         { }, --   for, do, while, etc.
    -- ====================
    -- key: Label
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_lush.lua
    Label             { fg = c.magenta }, --   case, default, etc.
    -- ====================
    -- ====================
    -- key: Operator
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_lush.lua
    Operator          { fg = c.blue }, --   "sizeof", "+", "*", etc.
    -- ====================
    -- ====================
    -- key: Keyword
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_classic.lua
    Keyword           { fg = c.blue }, --   any other keyword
    -- ====================
    -- ====================
    -- key: Exception
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_lush.lua
    Exception         { fg = c.orange }, --   try, catch, throw
    -- ====================

    -- ====================
    -- key: PreProc
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_classic.lua
    PreProc           { fg = c.orange }, -- (*) Generic Preprocessor
    -- ====================
    -- Include        { }, --   Preprocessor #include
    -- Define         { }, --   Preprocessor #define
    -- Macro          { }, --   Same as Define
    -- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

    -- ====================
    -- key: Type
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_classic.lua
    Type              { fg = c.yellow }, -- (*) int, long, char, etc.
    -- ====================
    -- StorageClass   { }, --   static, register, volatile, etc.
    -- Structure      { }, --   struct, union, enum, etc.
    -- Typedef        { }, --   A typedef

    -- ====================
    -- key: Special
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_classic.lua
    Special           { fg = c.yellow }, -- (*) Any special symbol
    -- ====================
    -- SpecialChar    { }, --   Special character in a constant
    -- Tag            { }, --   You can use CTRL-] on this
    -- ====================
    -- key: Delimiter
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_lush.lua
    Delimiter         { fg = c.purple }, --   Character that needs attention
    -- ====================
    -- SpecialComment { }, --   Special things inside a comment (e.g. '\n')
    -- Debug          { }, --   Debugging statements

    -- Underlined     { gui = "underline" }, -- Text that stands out, HTML links
    -- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    -- Error          { }, -- Any erroneous construct
    -- ====================
    -- key: Todo
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_classic.lua
    Todo              { fg = c.grey_3 }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    -- ====================

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- LspReferenceText            { } , -- Used for highlighting "text" references
    -- LspReferenceRead            { } , -- Used for highlighting "read" references
    -- LspReferenceWrite           { } , -- Used for highlighting "write" references
    -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- ====================
    -- key: DiagnosticError
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_lush.lua
    DiagnosticError               { fg = c.dark_orange } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- ====================
    -- ====================
    -- key: DiagnosticWarn
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_lush.lua
    DiagnosticWarn                { fg = c.dark_yellow } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- ====================
    -- ====================
    -- key: DiagnosticInfo
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_lush.lua
    DiagnosticInfo                { fg = c.dark_green } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- ====================
    -- ====================
    -- key: DiagnosticHint
    -- Found in: /Users/russ/Developer/zombat.nvim/lua/lush_theme/zombat_lush.lua
    DiagnosticHint                { fg = c.dark_blue } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- ====================
    -- DiagnosticOk               { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
    -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
    -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
    -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
    -- DiagnosticVirtualTextOk    { } , -- Used for "Ok" diagnostic virtual text.
    -- DiagnosticUnderlineError   { } , -- Used to underline "Error" diagnostics.
    -- DiagnosticUnderlineWarn    { } , -- Used to underline "Warn" diagnostics.
    -- DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
    -- DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
    -- DiagnosticUnderlineOk      { } , -- Used to underline "Ok" diagnostics.
    -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
    -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
    -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
    -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
    -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.
    -- DiagnosticSignOk           { } , -- Used for "Ok" signs in sign column.

    -- Tree-Sitter syntax groups.
    --
    -- See :h treesitter-highlight-groups, some groups may not be listed,
    -- submit a PR fix to lush-template!
    --
    -- Tree-Sitter groups are defined with an "@" symbol, which must be
    -- specially handled to be valid lua code, we do this via the special
    -- sym function. The following are all valid ways to call the sym function,
    -- for more details see https://www.lua.org/pil/5.html
    --
    -- sym("@text.literal")
    -- sym('@text.literal')
    -- sym"@text.literal"
    -- sym'@text.literal'
    --
    -- For more information see https://github.com/rktjmp/lush.nvim/issues/109

    -- -- TSAnnotation         { },    -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
    -- -- TSAttribute          { },    -- (unstable) TODO: docs
    -- -- TSBoolean            { },    -- For booleans.
    -- -- TSCharacter          { },    -- For characters.
    -- -- TSComment            { },    -- For comment blocks.
    -- -- TSConstructor        { },    -- For constructor calls and definitions: ` { }` in Lua, and Java constructors.
    -- -- TSConditional        { },    -- For keywords related to conditionnals.
    -- -- TSConstant           { },    -- For constants
    -- -- TSConstBuiltin       { },    -- For constant that are built in the language: `nil` in Lua.
    -- -- TSConstMacro         { },    -- For constants that are defined by macros: `NULL` in C.
    -- -- TSError              { },    -- For syntax/parser errors.
    -- -- TSException          { },    -- For exception related keywords.
    -- -- TSField              { },    -- For fields.
    -- -- TSFloat              { },    -- For floats.
    -- TSFunction({ classic.Function }), -- For function (calls and definitions).
    -- -- TSFuncBuiltin        { },    -- For builtin functions: `table.insert` in Lua.
    -- -- TSFuncMacro          { },    -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    -- -- TSInclude            { },    -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
    -- TSKeyword({ classic.Keyword }), -- For keywords that don't fall in previous categories.
    -- -- TSKeywordFunction    { },    -- For keywords used to define a fuction.
    -- -- TSLabel              { },    -- For labels: `label:` in C and `:label:` in Lua.
    -- TSMethod({ classic.Function }), -- For method calls and definitions.
    -- -- TSNamespace          { },    -- For identifiers referring to modules and namespaces.
    -- -- TSNone               { },    -- TODO: docs
    -- -- TSNumber             { },    -- For all numbers
    -- -- TSOperator           { },    -- For any operator: `+`, but also `->` and `*` in C.
    -- -- TSParameter          { },    -- For parameters of a function.
    -- -- TSParameterReference { },    -- For references to parameters of a function.
    -- TSProperty({ classic.Identifier }), -- Same as `TSField`.
    -- -- TSPunctDelimiter     { },    -- For delimiters ie: `.`
    -- -- TSPunctBracket       { },    -- For brackets and parens.
    -- -- TSPunctSpecial       { },    -- For special punctutation that does not fall in the catagories before.
    -- -- TSRepeat             { },    -- For keywords related to loops.
    -- -- TSString             { },    -- For strings.
    -- -- TSStringRegex        { },    -- For regexes.
    -- -- TSStringEscape       { },    -- For escape characters within a string.
    -- -- TSSymbol             { },    -- For identifiers referring to symbols or atoms.
    -- TSType({ classic.Type }), -- For types.
    -- -- TSTypeBuiltin        { },    -- For builtin types.
    -- TSVariable({ classic.Identifier }), -- Any variable name that does not have another highlight.
    -- -- TSVariableBuiltin    { },    -- Variable names that are defined by the languages, like `this` or `self`.

    -- -- TSTag                { },    -- Tags like html tag names.
    -- -- TSTagDelimiter       { },    -- Tag delimiter like `<` `>` `/`
    -- TSText({ fg = Normal.fg }), -- For strings considered text in a markup language.
    -- -- TSEmphasis           { },    -- For text to be represented with emphasis.
    -- -- TSUnderline          { },    -- For text to be represented with an underline.
    -- -- TSStrike             { },    -- For strikethrough text.
    -- -- TSTitle              { },    -- Text that is part of a title.
    -- -- TSLiteral            { },    -- Literal text.
    -- -- TSURI                { },    -- Any URI like a link or email.

    -- sym"@text"         { TSText },
    -- -- sym"@text.literal"      { }, -- Comment
    -- -- sym"@text.reference"    { }, -- Identifier
    -- -- sym"@text.title"        { }, -- Title
    -- -- sym"@text.uri"          { }, -- Underlined
    -- -- sym"@text.underline"    { }, -- Underlined
    -- -- sym"@text.todo"         { }, -- Todo
    -- -- sym"@comment"           { }, -- Comment
    -- -- sym"@punctuation"       { }, -- Delimiter
    -- -- sym"@constant"          { }, -- Constant
    -- -- sym"@constant.builtin"  { }, -- Special
    -- -- sym"@constant.macro"    { }, -- Define
    -- -- sym"@define"            { }, -- Define
    -- -- sym"@macro"             { }, -- Macro
    -- -- sym"@string"            { }, -- String
    -- -- sym"@string.escape"     { }, -- SpecialChar
    -- -- sym"@string.special"    { }, -- SpecialChar
    -- -- sym"@character"         { }, -- Character
    -- -- sym"@character.special" { }, -- SpecialChar
    -- -- sym"@number"            { }, -- Number
    -- -- sym"@boolean"           { }, -- Boolean
    -- -- sym"@float"             { }, -- Float
    -- sym"@function"          { TSFunction }, -- Function
    -- -- sym"@function.builtin"  { }, -- Special
    -- -- sym"@function.macro"    { }, -- Macro
    -- -- sym"@parameter"         { }, -- Identifier
    -- sym"@method"            { TSMethod }, -- Function
    -- -- sym"@field"             { }, -- Identifier
    -- sym"@property"          { TSProperty }, -- Identifier
    -- -- sym"@constructor"       { }, -- Special
    -- -- sym"@conditional"       { }, -- Conditional
    -- -- sym"@repeat"            { }, -- Repeat
    -- -- sym"@label"             { }, -- Label
    -- -- sym"@operator"          { }, -- Operator
    -- sym"@keyword"           { TSKeyword }, -- Keyword
    -- -- sym"@exception"         { }, -- Exception
    -- sym"@variable"          { TSVariable }, -- Identifier
    -- sym"@type"              { TSType }, -- Type
    -- -- sym"@type.definition"   { }, -- Typedef
    -- -- sym"@storageclass"      { }, -- StorageClass
    -- -- sym"@structure"         { }, -- Structure
    -- -- sym"@namespace"         { }, -- Identifier
    -- -- sym"@include"           { }, -- Include
    -- -- sym"@preproc"           { }, -- PreProc
    -- -- sym"@debug"             { }, -- Debug
    -- -- sym"@tag"               { }, -- Tag

    -- -- cmp highlights
    -- CmpItemAbbrDeprecated({ fg = c.bright_green, gui = "strikethrough" }),
    -- CmpItemAbbrMatch({ fg = c.bright_green }),
    -- CmpItemAbbrMatchFuzzy({ CmpItemAbbrMatch }),
    -- CmpItemKindVariable({ TSVariable }),
    -- CmpItemKindInterface({ TSType }),
    -- CmpItemKindText({ TSText }),
    -- CmpItemKindFunction({ TSFunction }),
    -- CmpItemKindMethod({ TSMethod }),
    -- CmpItemKindKeyword({ TSKeyword }),
    -- CmpItemKindProperty({ TSProperty }),
    -- -- CmpItemKindUnit         { Normal },
}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
