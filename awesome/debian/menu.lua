-- automatically generated file. Do not edit (see /usr/share/doc/menu/html)

module("debian.menu")

Debian_menu = {}

Debian_menu["Debian_Anwendungen_Audio"] = {
	{"Banshee","/usr/bin/banshee","/usr/share/pixmaps/banshee.xpm"},
	{"grecord (GNOME 2.0 Recorder)","/usr/bin/gnome-sound-recorder","/usr/share/pixmaps/gnome-grecord.xpm"},
	{"Rhythmbox","/usr/bin/rhythmbox","/usr/share/pixmaps/rhythmbox-small.xpm"},
}
Debian_menu["Debian_Anwendungen_Barrierefreiheit"] = {
	{"Xmag","xmag"},
}
Debian_menu["Debian_Anwendungen_Betrachter"] = {
	{"digikam","/usr/bin/digikam"},
	{"Evince","/usr/bin/evince","/usr/share/pixmaps/evince.xpm"},
	{"Eye of GNOME","/usr/bin/eog","/usr/share/pixmaps/gnome-eog.xpm"},
	{"Shotwell","/usr/bin/shotwell"},
	{"Xditview","xditview"},
	{"XDvi","/usr/bin/xdvi"},
}
Debian_menu["Debian_Anwendungen_Büro"] = {
	{"FreeMind","/usr/bin/freemind","/usr/share/pixmaps/FreeMindWindowIcon.xpm"},
	{"LibreOffice Calc","/usr/bin/libreoffice --calc","/usr/share/icons/hicolor/32x32/apps/libreoffice-calc.xpm"},
	{"LibreOffice Impress","/usr/bin/libreoffice --impress","/usr/share/icons/hicolor/32x32/apps/libreoffice-impress.xpm"},
	{"LibreOffice Writer","/usr/bin/libreoffice --writer","/usr/share/icons/hicolor/32x32/apps/libreoffice-writer.xpm"},
	{"pdfshuffler","/usr/bin/pdfshuffler"},
	{"Vym","/usr/bin/vym","/usr/share/vym/icons/vym.xpm"},
}
Debian_menu["Debian_Anwendungen_Dateiverwaltung"] = {
	{"Baobab","/usr/bin/baobab","/usr/share/pixmaps/baobab.xpm"},
	{"Brasero","/usr/bin/brasero"},
	{"File-Roller","/usr/bin/file-roller","/usr/share/pixmaps/file-roller.xpm"},
	{"GNOME Search Tool","/usr/bin/gnome-search-tool","/usr/share/pixmaps/gsearchtool.xpm"},
	{"Nautilus","/usr/bin/nautilus","/usr/share/pixmaps/nautilus.xpm"},
}
Debian_menu["Debian_Anwendungen_Datenverwaltung"] = {
	{"gourmet","/usr/bin/gourmet"},
	{"SQLite database browser","/usr/bin/sqlitebrowser","/usr/share/pixmaps/sqlitebrowser.xpm"},
	{"Tomboy","/usr/bin/tomboy"},
}
Debian_menu["Debian_Anwendungen_Editoren"] = {
	{"Emacs 23 (text)", "x-terminal-emulator -e ".."/usr/bin/emacs23 -nw"},
	{"Emacs 23 (X11)","/usr/bin/emacs23"},
	{"Gedit","/usr/bin/gedit","/usr/share/pixmaps/gedit-icon.xpm"},
	{"GVIM","/usr/bin/vim.gnome -g -f","/usr/share/pixmaps/vim-32.xpm"},
	{"Nano", "x-terminal-emulator -e ".."/bin/nano","/usr/share/nano/nano-menu.xpm"},
	{"Xedit","xedit"},
}
Debian_menu["Debian_Anwendungen_Emulatoren"] = {
	{"VirtualBox","/usr/bin/virtualbox","/usr/share/pixmaps/virtualbox.xpm"},
}
Debian_menu["Debian_Anwendungen_Grafik"] = {
	{"dotty","/usr/bin/dotty"},
	{"Hugin","/usr/bin/hugin"},
	{"ImageMagick","/usr/bin/display logo:","/usr/share/pixmaps/display.xpm"},
	{"Inkscape","/usr/bin/inkscape","/usr/share/pixmaps/inkscape.xpm"},
	{"lefty","/usr/bin/lefty"},
	{"LibreOffice Draw","/usr/bin/libreoffice --draw","/usr/share/icons/hicolor/32x32/apps/libreoffice-draw.xpm"},
	{"PTBatcherGUI","/usr/bin/PTBatcherGUI"},
	{"Stable version of Scribus","/usr/bin/scribus","/usr/share/pixmaps/scribus.xpm"},
	{"The GIMP","/usr/bin/gimp","/usr/share/pixmaps/gimp.xpm"},
	{"X Window Snapshot","xwd | xwud"},
}
Debian_menu["Debian_Anwendungen_Netzwerk_Dateiübertragung"] = {
	{"FileZilla","/usr/bin/filezilla","/usr/share/pixmaps/filezilla.xpm"},
	{"Transmission BitTorrent Client (GTK)","/usr/bin/transmission-gtk","/usr/share/pixmaps/transmission.xpm"},
}
Debian_menu["Debian_Anwendungen_Netzwerk_Kommunikation"] = {
	{"Evolution","/usr/bin/evolution","/usr/share/pixmaps/evolution.xpm"},
	{"Mumble","/usr/bin/mumble","/usr/share/pixmaps/mumble.xpm"},
	{"Pidgin","/usr/bin/pidgin","/usr/share/pixmaps/pidgin-menu.xpm"},
	{"Remmina","/usr/bin/remmina"},
	{"Telnet", "x-terminal-emulator -e ".."/usr/bin/telnet"},
	{"Vinagre","vinagre"},
	{"Xbiff","xbiff"},
}
Debian_menu["Debian_Anwendungen_Netzwerk_Web-Nachrichten"] = {
	{"Miro","/usr/bin/miro"},
}
Debian_menu["Debian_Anwendungen_Netzwerk_Web-Surfen"] = {
	{"Epiphany web browser","/usr/bin/epiphany-browser"},
	{"Google Chrome","/opt/google/chrome/google-chrome","/opt/google/chrome/product_logo_32.xpm"},
}
Debian_menu["Debian_Anwendungen_Netzwerk"] = {
	{ "Dateiübertragung", Debian_menu["Debian_Anwendungen_Netzwerk_Dateiübertragung"] },
	{ "Kommunikation", Debian_menu["Debian_Anwendungen_Netzwerk_Kommunikation"] },
	{ "Web-Nachrichten", Debian_menu["Debian_Anwendungen_Netzwerk_Web-Nachrichten"] },
	{ "Web-Surfen", Debian_menu["Debian_Anwendungen_Netzwerk_Web-Surfen"] },
}
Debian_menu["Debian_Anwendungen_Programmierung"] = {
	{"Data Display Debugger","/usr/bin/ddd"},
	{"Doxywizard","/usr/bin/doxywizard"},
	{"Eclipse","eclipse"},
	{"Erlang Shell", "x-terminal-emulator -e ".."/usr/bin/erl","/usr/share/pixmaps/erlang.xpm"},
	{"GDB", "x-terminal-emulator -e ".."/usr/bin/gdb"},
	{"IDLE (Python IDE)","/usr/bin/idle -n","/usr/share/pixmaps/idle.xpm"},
	{"IDLE (Python v2.7)","/usr/bin/idle-python2.7 -n","/usr/share/pixmaps/python2.7.xpm"},
	{"Python (v2.7)", "x-terminal-emulator -e ".."/usr/bin/python2.7","/usr/share/pixmaps/python2.7.xpm"},
	{"Python (v3.2)", "x-terminal-emulator -e ".."/usr/bin/python3.2","/usr/share/pixmaps/python3.2.xpm"},
	{"qgit","/usr/bin/qgit"},
	{"Ruby (irb1.8)", "x-terminal-emulator -e ".."/usr/bin/irb1.8"},
	{"Tclsh8.5", "x-terminal-emulator -e ".."/usr/bin/tclsh8.5"},
	{"TkWish8.5","x-terminal-emulator -e /usr/bin/wish8.5"},
}
Debian_menu["Debian_Anwendungen_Shells"] = {
	{"Bash", "x-terminal-emulator -e ".."/bin/bash --login"},
	{"Csh", "x-terminal-emulator -e ".."/bin/bsd-csh -l"},
	{"Dash", "x-terminal-emulator -e ".."/bin/dash -i"},
	{"Sh", "x-terminal-emulator -e ".."/bin/sh --login"},
	{"Zsh", "x-terminal-emulator -e ".."/bin/zsh4"},
}
Debian_menu["Debian_Anwendungen_System_Administration"] = {
	{"DSL/PPPoE configuration tool", "x-terminal-emulator -e ".."/usr/sbin/pppoeconf","/usr/share/pixmaps/pppoeconf.xpm"},
	{"Editres","editres"},
	{"Gnome Control Center","/usr/bin/gnome-control-center",},
	{"GNOME Network Tool","/usr/bin/gnome-nettool","/usr/share/pixmaps/gnome-nettool.xpm"},
	{"GNOME partition editor","su-to-root -X -c /usr/sbin/gparted","/usr/share/pixmaps/gparted.xpm"},
	{"pppconfig", "x-terminal-emulator -e ".."su-to-root -p root -c /usr/sbin/pppconfig"},
	{"TeXconfig", "x-terminal-emulator -e ".."/usr/bin/texconfig"},
	{"Xclipboard","xclipboard"},
	{"Xfontsel","xfontsel"},
	{"Xkill","xkill"},
	{"Xrefresh","xrefresh"},
}
Debian_menu["Debian_Anwendungen_System_Hardware"] = {
	{"gpointing-device-settings","/usr/bin/gpointing-device-settings"},
	{"Xvidtune","xvidtune"},
}
Debian_menu["Debian_Anwendungen_System_Paketverwaltung"] = {
	{"Synaptic Package Manager","synaptic-pkexec","/usr/share/synaptic/pixmaps/synaptic_32x32.xpm"},
}
Debian_menu["Debian_Anwendungen_System_Sicherheit"] = {
	{"Seahorse","/usr/bin/seahorse",},
}
Debian_menu["Debian_Anwendungen_System_Sprachumgebung"] = {
	{"Input Method Swicher", "x-terminal-emulator -e ".."/usr/bin/im-switch"},
}
Debian_menu["Debian_Anwendungen_System_Überwachung"] = {
	{"GNOME system monitor","/usr/bin/gnome-system-monitor"},
	{"htop", "x-terminal-emulator -e ".."/usr/bin/htop"},
	{"Pstree", "x-terminal-emulator -e ".."/usr/bin/pstree.x11","/usr/share/pixmaps/pstree16.xpm"},
	{"Top", "x-terminal-emulator -e ".."/usr/bin/top"},
	{"Xconsole","xconsole -file /dev/xconsole"},
	{"Xev","x-terminal-emulator -e xev"},
	{"Xload","xload"},
}
Debian_menu["Debian_Anwendungen_System"] = {
	{ "Administration", Debian_menu["Debian_Anwendungen_System_Administration"] },
	{ "Hardware", Debian_menu["Debian_Anwendungen_System_Hardware"] },
	{ "Paketverwaltung", Debian_menu["Debian_Anwendungen_System_Paketverwaltung"] },
	{ "Sicherheit", Debian_menu["Debian_Anwendungen_System_Sicherheit"] },
	{ "Sprachumgebung", Debian_menu["Debian_Anwendungen_System_Sprachumgebung"] },
	{ "Überwachung", Debian_menu["Debian_Anwendungen_System_Überwachung"] },
}
Debian_menu["Debian_Anwendungen_Terminalemulatoren"] = {
	{"Gnome Terminal","/usr/bin/gnome-terminal","/usr/share/pixmaps/gnome-terminal.xpm"},
	{"XTerm","xterm","/usr/share/pixmaps/xterm-color_32x32.xpm"},
	{"X-Terminal as root (GKsu)","/usr/bin/gksu -u root /usr/bin/x-terminal-emulator","/usr/share/pixmaps/gksu-debian.xpm"},
	{"XTerm (Unicode)","uxterm","/usr/share/pixmaps/xterm-color_32x32.xpm"},
}
Debian_menu["Debian_Anwendungen_Text"] = {
	{"Character map","/usr/bin/gucharmap"},
}
Debian_menu["Debian_Anwendungen_Wissenschaft_Chemie"] = {
	{"PyMOL","/usr/bin/pymol","/usr/share/pixmaps/pymol.xpm"},
}
Debian_menu["Debian_Anwendungen_Wissenschaft_Datenanalyse"] = {
	{"QtiPlot","/usr/bin/qtiplot","/usr/share/pixmaps/qtiplot.xpm"},
}
Debian_menu["Debian_Anwendungen_Wissenschaft_Mathematik"] = {
	{"Bc", "x-terminal-emulator -e ".."/usr/bin/bc"},
	{"Calc", "x-terminal-emulator -e ".."/usr/bin/calc"},
	{"Dc", "x-terminal-emulator -e ".."/usr/bin/dc"},
	{"GCalcTool","/usr/bin/gcalctool","/usr/share/pixmaps/gcalctool.xpm"},
	{"Gnuplot", "x-terminal-emulator -e ".."/usr/bin/gnuplot"},
	{"Grace","/usr/bin/xmgrace","/usr/share/pixmaps/grace-menu.xpm"},
	{"LibreOffice Math","/usr/bin/libreoffice --math","/usr/share/icons/hicolor/32x32/apps/libreoffice-math.xpm"},
	{"psppire","/usr/bin/psppire"},
	{"SpeedCrunch","/usr/bin/speedcrunch","/usr/share/pixmaps/speedcrunch.xpm"},
	{"Wcalc", "x-terminal-emulator -e ".."/usr/bin/wcalc","/usr/share/pixmaps/wcalc.xpm"},
	{"Xcalc","xcalc"},
}
Debian_menu["Debian_Anwendungen_Wissenschaft"] = {
	{ "Chemie", Debian_menu["Debian_Anwendungen_Wissenschaft_Chemie"] },
	{ "Datenanalyse", Debian_menu["Debian_Anwendungen_Wissenschaft_Datenanalyse"] },
	{ "Mathematik", Debian_menu["Debian_Anwendungen_Wissenschaft_Mathematik"] },
}
Debian_menu["Debian_Anwendungen"] = {
	{ "Audio", Debian_menu["Debian_Anwendungen_Audio"] },
	{ "Barrierefreiheit", Debian_menu["Debian_Anwendungen_Barrierefreiheit"] },
	{ "Betrachter", Debian_menu["Debian_Anwendungen_Betrachter"] },
	{ "Büro", Debian_menu["Debian_Anwendungen_Büro"] },
	{ "Dateiverwaltung", Debian_menu["Debian_Anwendungen_Dateiverwaltung"] },
	{ "Datenverwaltung", Debian_menu["Debian_Anwendungen_Datenverwaltung"] },
	{ "Editoren", Debian_menu["Debian_Anwendungen_Editoren"] },
	{ "Emulatoren", Debian_menu["Debian_Anwendungen_Emulatoren"] },
	{ "Grafik", Debian_menu["Debian_Anwendungen_Grafik"] },
	{ "Netzwerk", Debian_menu["Debian_Anwendungen_Netzwerk"] },
	{ "Programmierung", Debian_menu["Debian_Anwendungen_Programmierung"] },
	{ "Shells", Debian_menu["Debian_Anwendungen_Shells"] },
	{ "System", Debian_menu["Debian_Anwendungen_System"] },
	{ "Terminalemulatoren", Debian_menu["Debian_Anwendungen_Terminalemulatoren"] },
	{ "Text", Debian_menu["Debian_Anwendungen_Text"] },
	{ "Wissenschaft", Debian_menu["Debian_Anwendungen_Wissenschaft"] },
}
Debian_menu["Debian_Hilfe"] = {
	{"Info", "x-terminal-emulator -e ".."info"},
	{"TeXdoctk","/usr/bin/texdoctk"},
	{"Xman","xman"},
	{"yelp","/usr/bin/yelp"},
}
Debian_menu["Debian_Spiele_Kartenspiele"] = {
	{"Gnome FreeCell","/usr/games/sol --variation freecell","/usr/share/pixmaps/freecell.xpm"},
	{"Gnome Solitaire Games","/usr/games/sol","/usr/share/pixmaps/aisleriot.xpm"},
}
Debian_menu["Debian_Spiele_Rätsel"] = {
	{"gbrainy","/usr/games/gbrainy","/usr/share/pixmaps/gbrainy.xpm"},
}
Debian_menu["Debian_Spiele_Spielzeuge"] = {
	{"Oclock","oclock"},
	{"Redshift","gtk-redshift"},
	{"Xclock (analog)","xclock -analog"},
	{"Xclock (digital)","xclock -digital -update 1"},
	{"Xeyes","xeyes"},
	{"Xlogo","xlogo"},
}
Debian_menu["Debian_Spiele"] = {
	{ "Kartenspiele", Debian_menu["Debian_Spiele_Kartenspiele"] },
	{ "Rätsel", Debian_menu["Debian_Spiele_Rätsel"] },
	{ "Spielzeuge", Debian_menu["Debian_Spiele_Spielzeuge"] },
}
Debian_menu["Debian"] = {
	{ "Anwendungen", Debian_menu["Debian_Anwendungen"] },
	{ "Hilfe", Debian_menu["Debian_Hilfe"] },
	{ "Spiele", Debian_menu["Debian_Spiele"] },
}
