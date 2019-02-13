m4_define(`_FWDO_NOT_EDIT_',`@! GENERATED FILE, DO NOT EDIT!')m4_dnl
m4_dnl
m4_define(`__TITLE__',      m4_ifdef(`_TITLE_',`_TITLE_',``Hello, world!''))m4_dnl
m4_define(`__AUTHOR__',     m4_ifdef(`_AUTHOR_',`_AUTHOR_',``Viktor Bodrogi <viktor@axonnet.hu>''))m4_dnl
m4_define(`__COPYRIGHT__',  `__AUTHOR__, `Jul 2016'')m4_dnl
m4_define(`__VERSION__',    ``Draft, version 0.1.1'')m4_dnl
m4_dnl
m4_define(`_FW_TITLE_',     `_FW(t) `title titlefont centre "$1"'')m4_dnl
m4_define(`_FW_CHAPTER_',   `_FW(t) `title smalltitlefont centre "$1"'')m4_dnl
m4_define(`_FW_MAIN_',      `_FW(t) `title smalltitlefont left "$1"'')m4_dnl
m4_define(`_FW_CENTRE_',    `_FW(t) `title normalfont centre "$1"'')m4_dnl
m4_define(`_FW_TOC_',       `_FW(t) `table_of_contents'')m4_dnl
m4_define(`_FW_COPYRIGHT_', `_FW(!) `Copyright of '__COPYRIGHT__.')m4_dnl
m4_define(`_FW_TYPESETTER_',`_FW(p) `typesetter ='')m4_dnl
m4_define(`_FW_MAX_LENGTH_',`_FW(p) `maximum_input_line_length ='')m4_dnl
m4_define(`_FW_HTML_',      `_FWTYPESETTER_ html')m4_dnl
m4_define(`_FW_INFINITY_',  `_FWMAX_LENGTH_ infinity')m4_dnl
m4_dnl
m4_define(`_FW_File_Header_',`m4_dnl
_FW_COPYRIGHT_
_FW_DO_NOT_EDIT_
_FW_INFINITY_
_FW_HTML_

_FW_TITLE_($1)
_FW_CHAPTER_(__COPYRIGHT__)
_FW_CENTRE_(__VERSION__)
_FW_TOC_

__A($1)
m4_shift($@)')m4_dnl
m4_dnl # M4 Library
m4_divert(`-1')
m4_m4_define(`m4_reverse', `m4_ifelse(`$#',`0',,`$#',`1',``$1'',`m4_reverse(m4_shift($@)),`$1'')')
m4_m4_define(`m4_cond',`m4_ifelse(`$#',`1',`$1',
    `m4_ifelse($1, `$2', `$3',
        `$0(m4_shift(m4_shift(m4_shift($@))))')')')
# m4_join(sep, args) - join each non-empty ARG into a single
# string, with each element separated by SEP
m4_define(`m4_join',
`m4_ifelse(`$#', `2', ``$2'',
  `m4_ifelse(`$2', `', `', ``$2'_')$0(`$1', m4_shift(m4_shift($@)))')')
m4_define(`_m4_join',
`m4_ifelse(`$#$2', `2', `',
  `m4_ifelse(`$2', `', `', ``$1$2'')$0(`$1', m4_shift(m4_shift($@)))')')
# m4_joinall(sep, args) - join each ARG, including empty ones,
# into a single string, with each element separated by SEP
m4_define(`m4_joinall', ``$2'_$0(`$1', m4_shift($@))')
m4_define(`_m4_joinall',
`m4_ifelse(`$#', `2', `', ``$1$3'$0(`$1', m4_shift(shift($@)))')')
# m4_quote(args) - convert args to single-quoted string
m4_define(`m4_quote', `m4_ifelse(`$#', `0', `', ``$*'')')
# m4_dquote(args) - convert args to quoted list of quoted strings
m4_define(`m4_dquote', ``$@'')
# m4_dquote_elt(args) - convert args to list of double-quoted strings
m4_define(`m4_dquote_elt', `m4_ifelse(`$#', `0', `', `$#', `1', ```$1''',
    ```$1'',$0(m4_shift($@))')')
m4_define(`m4_argn', `m4_ifelse(`$1', 1, ``$2'',
  `m4_argn(decr(`$1'), m4_shift(m4_shift($@)))')')
# m4_forloop(var, from, to, stmt) - simple version
m4_define(`m4_forloop', `m4_pushdef(`$1', `$2')_m4_forloop($@)m4_popdef(`$1')')
m4_define(`_m4_forloop',
    `$4`'m4_ifelse($1, `$3', `', `m4_define(`$1', m4_incr($1))$0($@)')')
# m4_foreach(x, (item_1, item_2, ..., item_n), stmt)
#   parenthesized list, simple version
m4_define(`m4_foreach', `m4_pushdef(`$1')_m4_foreach($@)m4_popdef(`$1')')
m4_define(`_m4_arg1', `$1')
m4_define(`_m4_foreach', `m4_ifelse(`$2', `()', `',
    `m4_define(`$1', _m4_arg1$2)$3`'$0(`$1', (m4_shift$2), `$3')')')
# m4_foreachq(x, `item_1, item_2, ..., item_n', stmt)
#   quoted list, simple version
m4_define(`m4_foreachq', `m4_pushdef(`$1')_m4_foreachq($@)m4_popdef(`$1')')
m4_define(`_m4_arg1', `$1')
m4_define(`_m4_foreachq', `m4_ifelse(quote($2), `', `',
    `m4_define(`$1', `_m4_arg1($2)')$3`'$0(`$1', `m4_shift($2)', `$3')')')
# m4_stack_foreach(macro, action)
# Invoke ACTION with a single argument of each definition
# from the definition stack of MACRO, starting with the oldest.
m4_define(`m4_stack_foreach',
`_m4_stack_reverse(`$1', `_m4_tmp-$1')'m4_dnl
`_m4_stack_reverse(`_m4_tmp-$1', `$1', `$2(m4_defn(`$1'))')')
# m4_stack_foreach_lifo(macro, action)
# Invoke ACTION with a single argument of each definition
# from the definition stack of MACRO, starting with the newest.
m4_define(`m4_stack_foreach_lifo',
`_m4_stack_reverse(`$1', `_m4_tmp-$1', `$2(m4_defn(`$1'))')'m4_dnl
`_m4_stack_reverse(`_m4_tmp-$1', `$1')')
m4_define(`_m4_stack_reverse',
`m4_ifdef(`$1', `m4_pushdef(`$2', m4_defn(`$1'))$3`'m4_popdef(`$1')$0($@)')')
m4_define(`m4_define_blind', `m4_ifelse(`$#', `0', ``$0'',
`_m4_$0(`$1', `$2', `$'`#', `$'`0')')')
m4_define(`_m4_define_blind', `m4_define(`$1',
`m4_ifelse(`$3', `0', ``$4'', `$2')')')
# m4_curry(macro, args)
# Expand to a macro call that takes one argument, then invoke
# macro(args, extra).
m4_define(`m4_curry', `$1(m4_shift($@,)_m4_$0')
m4_define(`_m4_curry', ``$1')')
m4_define(`m4_rename', `m4_copy($@)m4_undefine(`$1')')
m4_define(`m4_copy', `m4_ifdef(`$2', `m4_errprint(`$2 already defined
')m4_m4exit(`1')', `m4_stack_foreach(`$1', `m4_curry(`m4_pushdef', `$2')')')')
m4_pushdef(`a', `1')m4_pushdef(`a', m4_defn(`m4_divnum'))m4_pushdef(`a', `2')
# m4_upcase(text)
# m4_downcase(text)
# m4_capitalize(text)
#   change case of text, simple version
m4_define(`m4_upcase', `m4_translit(`$*', `a-z', `A-Z')')
m4_define(`m4_downcase', `m4_translit(`$*', `A-Z', `a-z')')
m4_define(`_m4_capitalize',
    `m4_regexp(`$1', `^\(\w\)\(\w*\)',
        `m4_upcase(`\1')`'m4_downcase(`\2')')')
m4_define(`m4_capitalize', `m4_patsubst(`$1', `\w+', `_m4_$0(`\&')')')
m4_define(`m4_fatal_error',
    `m4_errprint(m4___program__:m4___file__:m4___line__`: fatal error: $*
')m4_m4exit(`1')')
m4_define(`exch', ``$2', `$1'')
# m4_forloop2(var, from, to, stmt) - improved version:
#   works even if VAR is not a strict macro name
#   performs sanity check that FROM is larger than TO
#   allows complex numerical expressions in TO and FROM
m4_define(`m4_forloop2', `m4_ifelse(m4_eval(`($2) <= ($3)'), `1',
    `m4_pushdef(`$1')_m4_$0(`$1', m4_eval(`$2'),
        m4_eval(`$3'), `$4')m4_popdef(`$1')')')
m4_define(`_m4_forloop2',
    `m4_define(`$1', `$2')$4`'m4_ifelse(`$2', `$3', `',
        `$0(`$1', m4_incr(`$2'), `$3', `$4')')')
# m4_forloop3_arg(from, to, macro) - invoke MACRO(value) for
#   each value between FROM and TO, without define overhead
m4_define(`forloop3_arg', `m4_ifelse(eval(`($1) <= ($2)'), `1',
    `_m4_forloop3(`$1', m4_eval(`$2'), `$3(', `)')')')
# forloop3(var, from, to, stmt) - refactored to share code
m4_define(`m4_forloop3', `m4_ifelse(m4_eval(`($2) <= ($3)'), `1',
    `m4_pushdef(`$1')_m4_forloop3(m4_eval(`$2'), m4_eval(`$3'),
        `m4_define(`$1',', `)$4')m4_popdef(`$1')')')
m4_define(`_m4_forloop3',
    `$3`$1'$4`'m4_ifelse(`$1', `$2', `',
        `$0(m4_incr(`$1'), `$2', `$3', `$4')')')
m4_divert`'m4_dnl
m4_dnl
m4_define(`__END__',`')m4_dnl
m4_dnl
m4_dnl # Define _FC_ to ctrl char
m4_define(`_FWC_',`@')m4_dnl
m4_define(`_FW',`_FWC_()$1')m4_dnl
m4_define(`_FWX_',`_FW($)')m4_dnl
m4_define(`_FWN_',`_FW(<)'`$1'`_FW(>)')m4_dnl
m4_define(`_FWB_',`_FW({)'`$@'`_FW(})')m4_dnl
m4_define(`_FWY_',`_FW($1)_FWN_($2)')m4_dnl
m4_dnl
m4_define(`__A__',`_FWC_()A')m4_dnl
m4_define(`__A',`_FWC_()A_FWC_()<$@_FWC_()>')m4_dnl
m4_define(`__B__',`_FWC_()B')m4_dnl
m4_define(`__B',`_FWC_()B_FWC_()<$@_FWC_()>')m4_dnl
m4_define(`__C__',`_FWC_()C')m4_dnl
m4_define(`__C',`_FWC_()C_FWC_()<$@_FWC_()>')m4_dnl
m4_define(`__D__',`_FWC_()D')m4_dnl
m4_define(`__D',`_FWC_()D_FWC_()<$@_FWC_()>')m4_dnl
m4_define(`__E__',`_FWC_()E')m4_dnl
m4_define(`__E',`_FWC_()E_FWC_()<$@_FWC_()>')m4_dnl
m4_dnl
m4_dnl # File
m4_define(`_FWFILE_',`_FWY_(N,$1)')m4_dnl
m4_define(`_FWSPEC_',`_FWY_(O,$1)')m4_dnl
m4_dnl
m4_dnl # Define
m4_define(`_FWDEF_',`_FWC_()$_FWN_($1)')m4_dnl
m4_define(`_FWDef_',`_FWDEF_($1)_FWC_(){$2_FWC_()}')m4_dnl
m4_define(`_FWDefine_',`_FWDEF_($1)==_FWC_(){$2_FWC_()}')m4_dnl
m4_dnl # Macro arguments
m4_define(`_Z_',`_FWC_()Z')m4_dnl
m4_define(`_M_',`_FWC_()M')m4_dnl
m4_define(`_ZM_',`_FWC_()Z_FWC_()M')m4_dnl
m4_dnl
m4_define(`___create_arg_defs___',`m4_dnl
m4_define(`_$1_',`_FWP_(`_FWC_()'$1)')m4_dnl
m4_define(`_$1Z_',`_$1_()_Z_()')m4_dnl
m4_define(`_$1M_',`_$1_()_M_()')m4_dnl
m4_define(`_$1ZM_',`_$1_()_ZM_()')m4_dnl
')m4_dnl
___create_arg_defs___(1)m4_dnl
___create_arg_defs___(2)m4_dnl
___create_arg_defs___(3)m4_dnl
___create_arg_defs___(4)m4_dnl
___create_arg_defs___(5)m4_dnl
___create_arg_defs___(6)m4_dnl
___create_arg_defs___(7)m4_dnl
___create_arg_defs___(8)m4_dnl
___create_arg_defs___(9)m4_dnl
m4_dnl # File begins here
m4_ifdef(`_HEADER_',`_HEADER_',`_FW_File_Header_(`__TITLE__')')
