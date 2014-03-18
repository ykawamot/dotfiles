#
# .bashrc.d/bash_completion.sh
#

BASH_COMPLETION_ORDER=(
  /usr/local/etc/bash_completion
  /opt/local/etc/bash_completion
  /etc/bash_completion
  )

for BASH_COMPLETION_CANDIDATE in ${BASH_COMPLETION_ORDER[@]} ; do
  test -f $BASH_COMPLETION_CANDIDATE && . $BASH_COMPLETION_CANDIDATE && break
done

unset BASH_COMPLETION_ORDER BASH_COMPLETION_CANDIDATE

# vim: ts=4 sw=4 et ft=sh
