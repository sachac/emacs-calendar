timezones='Etc/GMT
America/Toronto
America/Vancouver
Asia/Kolkata
Asia/Singapore
Europe/Berlin'
wget -q -N https://calendar.google.com/calendar/ical/c_rkq3fc6u8k1nem23qegqc90l6c%40group.calendar.google.com/public/basic.ics -O emacs-calendar.ics
DATE=$(date +"%Y%m01")
for ZONE in $timezones; do
  STUB=$(echo $ZONE | sed s/^.*\\/// | tr A-Z a-z)
  ruby ./ics-to-org --sort -f $ZONE emacs-calendar.ics > emacs-calendar-$STUB.org
  ical2html -l -f "Times are in $ZONE" -z $ZONE $DATE P8W emacs-calendar.ics | perl -e 'undef $/; s/<span class=summary>([^<]+)<\/span>\n<pre><b class=location>([^<]+)<\/b><\/pre>/<span class="summary"><a href="$2">$1<\/a><\/span>/' > emacs-calendar-$STUB.html
done
