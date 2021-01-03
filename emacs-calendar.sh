wget -q -N https://calendar.google.com/calendar/ical/c_rkq3fc6u8k1nem23qegqc90l6c%40group.calendar.google.com/public/basic.ics -O emacs-calendar.ics
./ics-to-org --sort -f Etc/GMT emacs-calendar.ics > emacs-calendar-gmt.org
./ics-to-org --sort -f America/Toronto emacs-calendar.ics > emacs-calendar-toronto.org
./ics-to-org --sort -f America/Vancouver emacs-calendar.ics > emacs-calendar-vancouver.org
./ics-to-org --sort -f Asia/Kolkata emacs-calendar.ics > emacs-calendar-kolkata.org
./ics-to-org --sort -f Asia/Singapore emacs-calendar.ics > emacs-calendar-singapore.org
./ics-to-org --sort -f Europe/Berlin emacs-calendar.ics > emacs-calendar-berlin.org
