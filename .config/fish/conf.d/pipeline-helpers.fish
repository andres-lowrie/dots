function fn.split -d "Shortcut for awk" -a delim -a field
  if test "$field" = "first"
    set field '$1'
  else if test "$field" = "last"
    set field '$NF'
  else if test "$field" = "count"
    set field NF
  else if test "$field" = "all"
    set field '$0'
  else if test -z "$field"
    set field '$0'
  else
    set field "\$$field"
  end

  set -l prog "{ print $field }"

  awk -F "$delim" "$prog"
end
