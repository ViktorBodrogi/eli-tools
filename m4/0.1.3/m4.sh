#!/bin/sh
# sh script for command $ODIN_M4, output $ODIN_out

# standard params
ODIN_out=$1;shift; ODIN_file=$1;shift; ODIN_dir=$1;shift;
file=`basename $ODIN_file`
lib=`dirname $0`

case $file in *.m4);; *) file=$file.m4;; esac

# other params
ODIN_flags=$1;shift;ODIN_inc_sp=$1;shift;
ODIN_define=$1;shift;ODIN_debug=$1;shift;ODIN_debugfile=$1;shift;
ODIN_before=$1;shift;ODIN_after=$1;shift;

# flags
flags="$flags $ODIN_M4_FLAGS -I $ODIN_dir"
flags="$flags -I $lib"

if [ -f "$lib/$ODIN_out.m4" ]; then
    flags="$flags -D M4_PRELOAD=$ODIN_out.m4"
else
    if [ -f "$lib/m4.fw.fwGen/$ODIN_out.m4" ]; then
        flags="$flags -I $lib/m4.fw.fwGen"
        flags="$flags -D M4_PRELOAD=$ODIN_out.m4"
    fi
fi

#if [ "$ODIN_include" != "" ] ; then flags="$flags -I $ODIN_include"; 
if [ "$ODIN_inc_sp" != "" ] ; then
   for f in `cat $ODIN_inc_sp`; do
      flags="$flags -I $f"; done; fi
if [ "$ODIN_flags" != "" ] ; then
   for f in `cat $ODIN_flags`; do
      flags="$flags $f"; done; fi
if [ "$ODIN_define" != "" ] ; then
   for f in `cat $ODIN_define`; do
      flags="$flags -D $f"; done; fi
if [ "$ODIN_debug" != "" ] ; then flags="$flags -d $ODIN_debug"; fi
if [ "$ODIN_debugfile" != "" ] ; then flags="$flags -o $ODIN_debugfile"; fi

before=""
if [ "$ODIN_before" != "" ] ; then
   for f in `cat $ODIN_before`; do
      before="$before $f"; done; fi
after=""
if [ "$ODIN_after" != "" ] ; then
   for f in `cat $ODIN_after`; do
      after="$after $f"; done; fi

# execute
ln -s $ODIN_file $file

file="$before $file $after"

if [ "$ODINVERBOSE" != "" ] ; then
   echo ${ODINRBSHOST}$ODIN_M4 $flags $file; fi

$ODIN_M4 $flags $file >$ODIN_out 2>WARNINGS \
 || {
        status=$?; mv WARNINGS ERRORS;
        echo "$ODIN_M4 failed with $status" >>ERRORS;
    }

# post process
exit 0
