function litehead
  set args $argv[2..]
  if test -z "$args"
    set args "limit 10"
  end
  set delim ""
  for table in (sqlite3 $argv[1] 'SELECT name FROM sqlite_schema WHERE type=\'table\'')
    echo "$delim$table:" (sqlite3 $argv[1] "SELECT count(\"*\") from $table") 'rows'
    sqlite3 -header -column -separator " " $argv[1] "SELECT * FROM $table $args"
    set delim "\n"
  end
end
