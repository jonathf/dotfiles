function xrandrconnect
  for display in (xrandr | grep '\bconnected' | sed -e 's/ connected .*//')
    set --local rotation ""
    if test $display != "eDP-1"
      set cmd xrandr --output eDP-1 --auto --primary --output $display --auto --above eDP-1
      if test -n "$argv[1]"
        set cmd $cmd --rotate $argv[1]
      end
      $cmd
    end
  end
end
