#! /bin/sh
#
# notmuch.sh
# Copyright (C) 2020 Pedro Pablo <ppablocruzcobas@gmail.com>
#
# Distributed under terms of the MIT license.
#
# mbsync ppablocruzcobas@gmail.com > /dev/null && notmuch new > /dev/null
unread=$(notmuch count tag:unread)

if [ "$unread" -gt 10 ]; then
    echo {\"icon\":\"mail\", \"state\":\"Critical\", \"text\":\"$unread\"}
    exit
fi

if [ "$unread" -gt 1 ]; then
    echo {\"icon\":\"mail\", \"state\":\"Warning\", \"text\":\"$unread\"}
    exit
fi
    
echo {\"icon\":\"mail\", \"state\":\"Info\", \"text\":\"$unread\"}
