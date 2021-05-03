if test -n "$GEM_ROOT"
  set -gx GEM_HOME $GEM_ROOT
  if not contains $GEM_ROOT/bin $PATH
    set -x PATH $GEM_ROOT/bin $PATH
  end
end
