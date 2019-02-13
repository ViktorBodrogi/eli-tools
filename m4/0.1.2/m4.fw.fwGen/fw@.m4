m4_define(`_DO_NOT_EDIT_',`@! GENERATED FILE, DO NOT EDIT!')m4_dnl
m4_dnl
m4_define(`__TITLE__',      m4_ifdef(`_TITLE_',`_TITLE_',``Hello, world!''))m4_dnl
m4_define(`__AUTHOR__',     m4_ifdef(`_AUTHOR_',`_AUTHOR_',``Viktor Bodrogi <viktor@axonnet.hu>''))m4_dnl
m4_define(`__COPYRIGHT__',  `__AUTHOR__, `Jul 2016'')m4_dnl
m4_define(`__VERSION__',    ``Draft, version 0.1.1'')m4_dnl
m4_dnl
m4_define(`_FW_TITLE_',     `_FW_(t) `title titlefont centre "$1"'')m4_dnl
m4_define(`_FW_CHAPTER_',   `_FW_(t) `title smalltitlefont centre "$1"'')m4_dnl
m4_define(`_FW_MAIN_',      `_FW_(t) `title smalltitlefont left "$1"'')m4_dnl
m4_define(`_FW_CENTRE_',    `_FW_(t) `title normalfont centre "$1"'')m4_dnl
m4_define(`_FW_TOC_',       `_FW_(t) `table_of_contents'')m4_dnl
m4_define(`_FW_COPYRIGHT_', `_FW_(!) `Copyright of '__COPYRIGHT__.')m4_dnl
m4_define(`_FW_TYPESETTER_',`_FW_(p) `typesetter ='')m4_dnl
m4_define(`_FW_MAX_LENGTH_',`_FW_(p) `maximum_input_line_length ='')m4_dnl
m4_define(`_FW_HTML_',      `_FW_TYPESETTER_ html')m4_dnl
m4_define(`_FW_INFINITY_',  `_FW_MAX_LENGTH_ infinity')m4_dnl
m4_dnl
m4_define(`_FW_File_Header_',`m4_dnl
_FW_COPYRIGHT_
_DO_NOT_EDIT_
_FW_INFINITY_
_FW_HTML_

_FW_TITLE_($1)
_FW_CHAPTER_(__COPYRIGHT__)
_FW_CENTRE_(__VERSION__)
_FW_TOC_

__A($1)
m4_shift($@)')m4_dnl
m4_dnl
m4_define(`__END___',`__B(Helpers)')m4_dnl
m4_dnl # M4 Library
m4_define(`m4_reverse',`m4_ifelse(`$#',`0',,`$#',`1',``$1'',`m4_reverse(m4_shift($@)),`$1'')')m4_dnl
m4_dnl
m4_define(`_FC_',`@')m4_dnl
m4_define(`_FW_',`@$1')m4_dnl
m4_define(`_FWX_',`@$')m4_dnl
m4_define(`_FWN_',`@<$1@>')m4_dnl
m4_define(`_FWP_',`@($1@)')m4_dnl
m4_define(`_FWB_',`@{$1@}')m4_dnl
m4_define(`_FWY_',`@$1@<$2@>')m4_dnl
m4_dnl
m4_define(`__A__',`@A')m4_dnl
m4_define(`__A',`@A@<$@@>')m4_dnl
m4_define(`__B__',`@B')m4_dnl
m4_define(`__B',`@B@<$@@>')m4_dnl
m4_define(`__C__',`@C')m4_dnl
m4_define(`__C',`@C@<$@@>')m4_dnl
m4_define(`__D__',`@D')m4_dnl
m4_define(`__D',`@D@<$@@>')m4_dnl
m4_define(`__E__',`@E')m4_dnl
m4_define(`__E',`@E@<$@@>')m4_dnl
m4_dnl
m4_dnl # File
m4_define(`_FW_FILE_',`_FWY_(N,$1)')m4_dnl
m4_define(`_FW_SPEC_',`_FWY_(O,$1)')m4_dnl
m4_dnl
m4_dnl # Define
m4_define(`_FW_DEF_',`@$_FWN_($1)')m4_dnl
m4_define(`_FW_Def_',`_FW_DEF_($1)@{$2@}')m4_dnl
m4_define(`_FW_Define_',`_FW_DEF_($1)==@{$2@}')m4_dnl
m4_dnl # Macro arguments
m4_define(`_Z_',`@Z')m4_dnl
m4_define(`_M_',`@M')m4_dnl
m4_define(`_ZM_',`@Z@M')m4_dnl
m4_dnl
m4_define(`___create_arg_defs___',`m4_dnl
m4_define(`_$1_',`_FWP_(`@'$1)')m4_dnl
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
