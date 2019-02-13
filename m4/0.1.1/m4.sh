#!/bin/sh

echo "*** $*" 1>&2

# sh script for command $ODIN_M4, output $ODIN_out
# standard params
ODIN_out=$1;shift; ODIN_file=$1;shift; ODIN_dir=$1;shift;
file=`basename $ODIN_file`
flags="$flags $ODIN_M4_FLAGS"

# other params
case $file in *.m4);; *) file=$file.m4;; esac

ODIN_inc_sp=$1;shift;ODIN_before=$1;shift;ODIN_after=$1;shift;
ODIN_error=$1;shift;ODIN_fatal=$1;shift;ODIN_prefix=$1;shift;
ODIN_quiet=$1;shift;ODIN_macro=$1;shift;ODIN_word=$1;shift;ODIN_interactive=$1;shift;
ODIN_define=$1;shift;ODIN_include=$1;shift;ODIN_synclines=$1;shift;ODIN_undefine=$1;shift;
ODIN_gnu=$1;shift;ODIN_traditional=$1;shift;ODIN_hashsize=$1;shift;ODIN_nesting=$1;shift;
ODIN_freeze=$1;shift;ODIN_reload=$1;shift;
ODIN_debug=$1;shift;ODIN_debugfile=$1;shift;ODIN_arglength=$1;shift;ODIN_trace=$1;shift;

# flags
flags="$flags -I $ODIN_dir"
if [ "$ODIN_inc_sp" != "" ] ; then
   for f in `cat $ODIN_inc_sp`; do
      flags="$flags -I $f"; done; fi
if [ "$ODIN_error" != "" ] ; then flags="$flags -E"; fi
if [ "$ODIN_fatal" != "" ] ; then flags="$flags -EE"; fi
if [ "$ODIN_prefix" != "" ] ; then flags="$flags -P"; fi
if [ "$ODIN_quiet" != "" ] ; then flags="$flags -Q"; fi
if [ "$ODIN_macro" != "" ] ; then flags="$flags --warn-macro-sequence=$ODIN_macro"; fi
if [ "$ODIN_word" != "" ] ; then flags="$flags --word-regexp=$ODIN_word"; fi
if [ "$ODIN_interactive" != "" ] ; then flags="$flags -i"; fi
if [ "$ODIN_define" != "" ] ; then
   for f in `cat $ODIN_define`; do
      flags="$flags -D $f"; done; fi
if [ "$ODIN_include" != "" ] ; then flags="$flags -I $ODIN_include"; fi
if [ "$ODIN_synclines" != "" ] ; then flags="$flags -s"; fi
if [ "$ODIN_undefine" != "" ] ; then flags="$flags -U $ODIN_undefine"; fi
if [ "$ODIN_gnu" != "" ] ; then flags="$flags -g"; fi
if [ "$ODIN_traditional" != "" ] ; then flags="$flags -G"; fi
if [ "$ODIN_hashsize" != "" ] ; then flags="$flags -H $ODIN_hashsize"; fi
if [ "$ODIN_nesting" != "" ] ; then flags="$flags -L $ODIN_nesting"; fi
if [ "$ODIN_freeze" != "" ] ; then flags="$flags -F $ODIN_freeze"; fi
if [ "$ODIN_reload" != "" ] ; then flags="$flags -R $ODIN_reload"; fi
if [ "$ODIN_debug" != "" ] ; then flags="$flags --debug=$ODIN_debug"; fi
if [ "$ODIN_debugfile" != "" ] ; then flags="$flags -o $ODIN_debugfile"; fi
if [ "$ODIN_arglength" != "" ] ; then flags="$flags -l $ODIN_arglength"; fi
if [ "$ODIN_trace" != "" ] ; then flags="$flags -t $ODIN_trace"; fi

# execute
ln -s $ODIN_file $file

file="$ODIN_before $file $ODIN_after"
if [ "$ODINVERBOSE" != "" ] ; then
   echo ${ODINRBSHOST}$ODIN_M4 $flags $file; fi

$ODIN_M4 $flags $file >$ODIN_out 2>WARNINGS \
 || { status=$?; mv WARNINGS ERRORS; echo "$ODIN_M4 failed with $status" >>ERRORS; }

# post process

exit 0
