#! /bin/sh
#
# logout-menu.sh
# Copyright (C) 2020 Pedro Pablo <ppablocruzcobas@gmail.com>
#
# Distributed under terms of the MIT license.
printf "Lock,i3exit lock,system-lock-screen\nLogout,i3exit logout,system-log-out\nSuspend,i3exit suspend,system-suspend\nRestart,i3exit reboot,system-restart\nHibernate,i3exit hibernate,system-suspend-hibernate\nShutdown,i3exit shutdown,system-shutdown\n" | jgmenu --simple --center
