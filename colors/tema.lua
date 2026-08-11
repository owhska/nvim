-- tema.lua
-- Colorscheme baseado nos princípios do artigo "I am sorry, but everyone is
-- getting syntax highlighting wrong" (Niki Tonsky).
--
-- Regras aplicadas:
--   1. Poucas cores (5 no total) -> fáceis de memorizar
--   2. Keywords (if/function/class/return...) NÃO são destacadas
--   3. Variáveis e chamadas de função usam a cor base (são 75% do código)
--   4. Constantes (strings/números) em verde
--   5. Definições top-level (função/classe/método) em azul claro
--   6. Comentários em amarelo vivo, não cinza apagado
--   7. Pontuação levemente esmaecida, para nomes se destacarem
--
-- Instalação: salve como ~/.config/nvim/colors/tema.lua
-- Uso:        :colorscheme tema

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end
vim.o.termguicolors = true
vim.g.colors_name = "tema"

-- === Paleta (5 cores + base) ===================================
local bg        = "#1c1c1c" -- fundo
local bg_alt    = "#262626" -- fundo de painéis/linha atual
local fg        = "#d6d6d6" -- texto base: keywords, variáveis, chamadas
local muted     = "#6c6c6c" -- pontuação, delimitadores
local green     = "#8ec07c" -- strings, números, constantes
local purple    = "#b294bb" -- constantes especiais (true/false/nil), tipos
local yellow    = "#e6c07b" -- comentários (vivos, não cinza!)
local blue      = "#83a8d3" -- definições top-level (função/classe/método)
local red       = "#e06c75" -- reservado só para erros/diagnostics

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- === Base UI =====================================================
hi("Normal",       { fg = fg, bg = bg })
hi("NormalFloat",  { fg = fg, bg = bg_alt })
hi("CursorLine",   { bg = bg_alt })
hi("CursorLineNr", { fg = yellow, bold = true })
hi("LineNr",       { fg = muted })
hi("SignColumn",   { bg = bg })
hi("VertSplit",    { fg = muted, bg = bg })
hi("Visual",       { bg = "#3a3a3a" })
hi("Search",       { fg = bg, bg = yellow })
hi("IncSearch",    { fg = bg, bg = blue })
hi("Pmenu",        { fg = fg, bg = bg_alt })
hi("PmenuSel",     { fg = bg, bg = blue })
hi("StatusLine",   { fg = fg, bg = bg_alt })
hi("StatusLineNC", { fg = muted, bg = bg_alt })
hi("Directory",    { fg = blue })
hi("Title",        { fg = blue, bold = true })
hi("MatchParen",   { fg = yellow, bold = true, underline = true })

-- === Sintaxe (grupos "legacy") ===================================
-- Regra: nada de destaque para keywords, variáveis ou chamadas.
hi("Comment",       { fg = yellow, italic = false })          -- comentários vivos
hi("Constant",      { fg = green })                            -- números
hi("String",        { fg = green })                            -- strings
hi("Character",     { fg = green })
hi("Number",        { fg = green })
hi("Boolean",       { fg = purple })
hi("Float",         { fg = green })

hi("Identifier",    { fg = fg })                                -- variáveis (sem cor)
hi("Function",      { fg = blue })                              -- definições top-level

hi("Statement",     { fg = fg })                                -- if/for/return...
hi("Conditional",   { fg = fg })
hi("Repeat",        { fg = fg })
hi("Label",         { fg = fg })
hi("Operator",      { fg = muted })
hi("Keyword",       { fg = fg })
hi("Exception",     { fg = fg })

hi("PreProc",       { fg = fg })
hi("Include",       { fg = fg })
hi("Define",        { fg = fg })
hi("Macro",         { fg = purple })
hi("PreCondit",     { fg = fg })

hi("Type",          { fg = purple })                            -- tipos/classes
hi("StorageClass",  { fg = fg })
hi("Structure",     { fg = purple })
hi("Typedef",       { fg = purple })

hi("Special",       { fg = purple })
hi("SpecialChar",   { fg = purple })
hi("Tag",           { fg = blue })
hi("Delimiter",     { fg = muted })                             -- pontuação esmaecida
hi("SpecialComment",{ fg = yellow, bold = true })
hi("Debug",         { fg = red })

hi("Underlined",    { fg = fg, underline = true })
hi("Ignore",        { fg = muted })
hi("Error",         { fg = red, bold = true })
hi("Todo",          { fg = yellow, bold = true, bg = bg })

-- === Treesitter (grupos modernos) ================================
hi("@variable",              { fg = fg })
hi("@variable.builtin",      { fg = fg })
hi("@parameter",             { fg = fg })
hi("@field",                 { fg = fg })
hi("@property",              { fg = fg })

hi("@function",               { fg = blue })
hi("@function.call",          { fg = fg })                      -- chamadas: sem destaque
hi("@method",                  { fg = blue })
hi("@method.call",             { fg = fg })
hi("@constructor",            { fg = blue })

hi("@keyword",                { fg = fg })
hi("@keyword.function",       { fg = fg })
hi("@keyword.return",         { fg = fg })
hi("@keyword.operator",       { fg = fg })
hi("@conditional",            { fg = fg })
hi("@repeat",                 { fg = fg })
hi("@exception",              { fg = fg })

hi("@string",                  { fg = green })
hi("@number",                  { fg = green })
hi("@float",                   { fg = green })
hi("@boolean",                 { fg = purple })
hi("@constant",                { fg = green })
hi("@constant.builtin",        { fg = purple })

hi("@type",                    { fg = purple })
hi("@type.builtin",            { fg = purple })

hi("@comment",                 { fg = yellow })
hi("@punctuation.delimiter",   { fg = muted })
hi("@punctuation.bracket",     { fg = muted })
hi("@operator",                { fg = muted })

hi("@tag",                     { fg = blue })
hi("@tag.attribute",           { fg = fg })

-- === Diagnostics (único lugar onde vermelho aparece) =============
hi("DiagnosticError", { fg = red })
hi("DiagnosticWarn",  { fg = yellow })
hi("DiagnosticInfo",  { fg = blue })
hi("DiagnosticHint",  { fg = muted })
hi("DiagnosticUnderlineError", { undercurl = true, sp = red })
hi("DiagnosticUnderlineWarn",  { undercurl = true, sp = yellow })

-- === Git / diff ====================================================
hi("DiffAdd",    { fg = green })
hi("DiffChange", { fg = yellow })
hi("DiffDelete", { fg = red })
hi("DiffText",   { fg = blue })
