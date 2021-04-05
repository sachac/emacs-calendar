timezones='America/Vancouver
America/Chicago
America/Toronto
Etc/GMT
Europe/Berlin
Asia/Kolkata
Asia/Singapore'
  DATE=$(date +"%Y%m01")
  for ZONE in $timezones; do
    STUB=$(echo $ZONE | sed s/^.*\\/// | tr A-Z a-z)
    ical2html -l -f "Times are in $ZONE" -z $ZONE $DATE P8W emacs-calendar.ics | perl -e 'undef $/; $_ = <>; $_ =~ s/<span class=summary>([^<]+)<\/span>\n<pre><b class=location>([^<]+)<\/b><\/pre>/<span class="summary"><a href="$2">$1<\/a><\/span>/g; print $_' > emacs-calendar-$STUB.html
  done
