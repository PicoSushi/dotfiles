complete -c hgrep -s c -l min-context -d 'Minimum lines of leading and trailing context surrounding each match' -r
complete -c hgrep -s C -l max-context -d 'Maximum lines of leading and trailing context surrounding each match' -r
complete -c hgrep -l tab -d 'Number of spaces for tab character. Set 0 to pass tabs through directly' -r
complete -c hgrep -l theme -d 'Theme for syntax highlighting. Use --list-themes flag to print the theme list' -r
complete -c hgrep -s p -l printer -d 'Printer to print the match results. \'bat\' or \'syntect\' is available' -r
complete -c hgrep -l term-width -d 'Width (number of characters) of terminal window' -r
complete -c hgrep -l wrap -d 'Text-wrapping mode. \'char\' enables character-wise text-wrapping. \'never\' disables text-wrapping' -r -f -a "{char	,never	}"
complete -c hgrep -l generate-completion-script -d 'Print completion script for SHELL to stdout' -r -f -a "{bash	,zsh	,powershell	,fish	,elvish	}"
complete -c hgrep -s g -l glob -d 'Include or exclude files and directories for searching that match the given glob' -r
complete -c hgrep -s m -l max-count -d 'Limit the number of matching lines per file searched to NUM' -r
complete -c hgrep -l max-depth -d 'Limit the depth of directory traversal to NUM levels beyond the paths given' -r
complete -c hgrep -s t -l type -d 'Only search files matching TYPE. This option is repeatable. --type-list can print the list of types' -r
complete -c hgrep -s T -l type-not -d 'Do not search files matching TYPE. Inverse of --type. This option is repeatable. --type-list can print the list of types' -r
complete -c hgrep -l max-filesize -d 'Ignore files larger than NUM in size. This does not apply to directories.The input format accepts suffixes of K, M or G which correspond to kilobytes, megabytes and gigabytes, respectively. If no suffix is provided the input is treated as bytes' -r
complete -c hgrep -s h -l help -d 'Print help information'
complete -c hgrep -s V -l version -d 'Print version information'
complete -c hgrep -s G -l no-grid -d 'Remove borderlines for more compact output'
complete -c hgrep -l grid -d 'Add borderlines to output. This flag is an opposite of --no-grid'
complete -c hgrep -l list-themes -d 'List all available theme names and their samples. Samples show the output where \'let\' is searched. The names can be used at --theme option'
complete -c hgrep -s f -l first-only -d 'Show only the first code snippet per file'
complete -c hgrep -l custom-assets -d 'Load bat\'s custom assets. Note that this flag may not work with some version of `bat` command. This flag is only for bat printer'
complete -c hgrep -l background -d 'Paint background colors. This flag is only for syntect printer'
complete -c hgrep -l ascii-lines -d 'Use ASCII characters for drawing border lines instead of Unicode characters'
complete -c hgrep -l no-ignore -d 'Don\'t respect ignore files (.gitignore, .ignore, etc.)'
complete -c hgrep -s i -l ignore-case -d 'When this flag is provided, the given patterns will be searched case insensitively'
complete -c hgrep -s S -l smart-case -d 'Search case insensitively if the pattern is all lowercase. Search case sensitively otherwise'
complete -c hgrep -s . -l hidden -d 'Search hidden files and directories. By default, hidden files and directories are skipped'
complete -c hgrep -l glob-case-insensitive -d 'Process glob patterns given with the -g/--glob flag case insensitively'
complete -c hgrep -s F -l fixed-strings -d 'Treat the pattern as a literal string instead of a regular expression'
complete -c hgrep -s w -l word-regexp -d 'Only show matches surrounded by word boundaries'
complete -c hgrep -s L -l follow -d 'When this flag is enabled, hgrep will follow symbolic links while traversing directories'
complete -c hgrep -s U -l multiline -d 'Enable matching across multiple lines'
complete -c hgrep -l multiline-dotall -d 'Enable "dot all" in your regex pattern, which causes \'.\' to match newlines when multiline searching is enabled'
complete -c hgrep -l crlf -d 'When enabled, hgrep will treat CRLF (\'\\r\\n\') as a line terminator instead of just \'\\n\'. This flag is useful on Windows'
complete -c hgrep -l mmap -d 'Search using memory maps when possible. mmap is disabled by default unlike ripgrep'
complete -c hgrep -s x -l line-regexp -d 'Only show matches surrounded by line boundaries. This is equivalent to putting ^...$ around the search pattern'
complete -c hgrep -s P -l pcre2 -d 'When this flag is present, hgrep will use the PCRE2 regex engine instead of its default regex engine'
complete -c hgrep -l type-list -d 'Show all supported file types and their corresponding globs'
complete -c hgrep -s v -l invert-match -d 'Invert matching. Show lines that do not match the given patterns'
complete -c hgrep -l one-file-system -d 'When enabled, the search will not cross file system boundaries relative to where it started from'
complete -c hgrep -l no-unicode -d 'Disable unicode-aware regular expression matching'
