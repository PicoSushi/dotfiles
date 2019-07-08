;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; local packages
     skk

     ;; non-progn packages
     better-defaults
     git
     github
     markdown
     asciidoc
     multiple-cursors
     csv

     ;; programming language
     emacs-lisp
     (go
      :variables
      godoc-at-point-function 'godoc-gogetdoc
      ;; go-backend 'lsp
      )
     (rust
      :variables
      rust-format-on-save t
      )
     html
     javascript
     ruby
     shell-scripts
     haskell
     (python
      :variables
      python-test-runner 'pytest
      python-enable-yapf-format-on-save t
      )
     django
     c-c++
     latex
     sql
     typescript
     lua
     php
     systemd

     auto-completion                    ;; should be lower
     syntax-checking

     ;; fun
     games
     xkcd
     speed-reading
     spotify

     ;; org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     ;; syntax-checking
     treemacs
     version-control
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(
                                      howm
                                      autoinsert
                                      ;; tabbar
                                      ddskk
                                      rainbow-mode
                                      desktop
                                      twittering-mode
                                      wakatime-mode
                                      yasnippet-snippets

                                      ;; file editing modes
                                      editorconfig
                                      nginx-mode
                                      dockerfile-mode
                                      toml-mode
                                      lua-mode
                                      magic-latex-buffer
                                      graphviz-dot-mode
                                      terraform-mode

                                      yaml-mode
                                      ;; slack
                                      ;; alert
                                      ;; emojify
                                      ;; ag
                                      ;; navi2ch
                                      )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; File path pointing to emacs 27.1 executable compiled with support
   ;; for the portable dumper (this is currently the branch pdumper).
   ;; (default "emacs-27.0.50")
   dotspacemacs-emacs-pdumper-executable-file "emacs-27.0.50"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'emacs

   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         zenburn
                         spacemacs-dark
                         ;; spacemacs-light
                         ;; solarized-light
                         ;; solarized-dark
                         ;; leuven
                         monokai
                         )
   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Ricty Nerd Font"
                               :size 13
                               :weight normal
                               :width normal
                               ;:powerline-scale 1.1
)
   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 98
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 95

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers t

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server t

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  ;; must be init before skk-aquamarine
  (require 'skk nil t)
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."

  ;; not works well in user-init
  (global-set-key (kbd "C-h") 'delete-backward-char)
  (global-set-key (kbd "C-c ;") 'comment-dwim)
  (global-set-key (kbd "M-C-g") 'grep)
  (global-set-key (kbd "C-c #") 'hs-toggle-hiding)
  (global-set-key (kbd "M-y") 'helm-show-kill-ring)
  ;; (global-set-key (kbd "C-x C-j") 'skk-mode)
  (global-set-key (kbd "C-x C-b") 'ibuffer) ;buffer-listより高級なリスト
  (global-set-key (kbd "M-%") 'anzu-query-replace)
  (global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)
  (global-set-key [f5] 'revert-buffer)
  (global-set-key (kbd "<f3>")   'ahs-forward)
  (global-set-key (kbd "S-<f3>") 'ahs-backward)
  (global-set-key (kbd "M-m a m s c") 'spotify-current)

  (auto-image-file-mode t)                ; 画像ファイルを表示
  (menu-bar-mode -1)                      ; メニューバーを消す
  (tool-bar-mode -1)                      ; ツールバーを消す
  (setq eval-expression-print-length nil) ; evalした結果を全部表示
  (show-paren-mode 1)                     ; 対応する括弧を光らせる。
  (setq visible-bell t)                   ; visible bell
  (setq show-paren-delay 0)
  ;; (setq show-paren-style 'mixed) ; ウィンドウ内に収まらないときだけ括弧内も光らせる。
  (setq kill-whole-line t) ; 行の先頭でC-kを一回押すだけで行全体を消去する
  (setq require-final-newline t)          ; 最終行に必ず一行挿入する
  (setq next-line-add-newlines nil) ; バッファの最後でnewlineで新規行を追加するのを禁止する
  (icomplete-mode 1)                ; 補完可能なものを随時表示
  (setq history-length 100000)      ; 履歴数を大きくする
  (savehist-mode 1)                 ; ミニバッファの履歴を保存する
  (auto-compression-mode t)         ; gzファイルも編集できるようにする
  (setq ediff-window-setup-function 'ediff-setup-windows-plain) ; ediffを1ウィンドウで実行
  (setq diff-switches '("-u" "-p" "-N")) ; diffのオプション
  (setq vc-follow-symlinks t)   ; auto-follow version controlled symlink
  (setq suggest-key-bindings t) ; suggest keybinding
  (fset 'yes-or-no-p 'y-or-n-p) ; y/n
  (setq tab-indent-width 2)
  (setq indent-tabs-mode nil)
  (setq ediff-window-setup-function 'ediff-setup-windows-plain) ; コントロール用のバッファを同一フレーム内に表示
  (setq ediff-split-window-function 'split-window-horizontally) ; diffのバッファを上下ではなく左右に並べる
  (setq-default indicate-empty-lines t)   ; バッファの終端を表示
  (setq gc-cons-threshold 268435456)      ; no GC until 256 MiB
  (setq make-backup-files nil)
  (spacemacs/toggle-transparency)
  (setq x-select-enable-clipboard-manager nil)

  ;;show [EOF] at EOF
  (defun set-buffer-end-mark()
    (let ((overlay (make-overlay (point-max) (point-max))))
      (overlay-put overlay 'before-string #("[EOF]" 0 5 (face highlight)))
      (overlay-put overlay 'insert-behind-hooks
                   '((lambda (overlay after beg end &optional len)
                       (when after
                         (move-overlay overlay (point-max) (point-max))))))))
  (add-hook 'find-file-hooks 'set-buffer-end-mark)

  (add-to-list 'auto-mode-alist '("\.gas\\'" . js2-mode))
  (setq js2-basic-offset 2)

  ;; git-gutter
  (global-git-gutter-mode)
  (global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
  (global-set-key (kbd "C-x n") 'git-gutter:next-hunk)

  ;; golang
  (setq go-format-before-save t)

  ;; markdown
  (setq markdown-command "marked")

  ;; flycheck
  '(custom-set-variables '(flycheck-disabled-checkers '(javascript-jshint javascript-jscs))) ;jshint,jscsを使わないように

  ;; modelineに色を
  (set-face-attribute 'mode-line nil
                      :foreground "#fff"
                      :background "#009966"
                      :box nil)
  (set-face-attribute 'powerline-active1 nil
                      :foreground "#000"
                      :background "#00B666"
                      :inherit 'mode-line)
  (set-face-attribute 'powerline-active2 nil
                      :foreground "#000"
                      :background "#00FC66"
                      :inherit 'mode-line)
  (set-face-attribute 'mode-line-inactive nil
                      :foreground "#FFF"
                      :background "#004444"
                      :box nil)
  (set-face-attribute 'powerline-inactive1 nil
                      :foreground "#000"
                      :background "#00AAAA"
                      :inherit 'mode-line)
  (set-face-attribute 'powerline-inactive2 nil
                      :foreground "#000"
                      :background "#00FFFF"
                      :inherit 'mode-line)

  ;; twitter
  (setq twittering-icon-mode nil)
  (setq twittering-use-master-password t)
  (global-set-key (kbd "C-c t") 'twittering-update-status-interactive)

  ;; skk
  (cond ((file-readable-p "/usr/share/skk/SKK-JISYO.L.cdb")
         (setq skk-cdb-large-jisyo "/usr/share/skk/SKK-JISYO.L.cdb"))
        ((file-readable-p "/usr/share/skk/SKK-JISYO.L")
         (setq skk-large-jisyo "/usr/share/skk/SKK-JISYO.L"))
        )
  (if (file-exists-p "~/Dropbox/config/skk")
      ;; awful!
      (progn
        (setq skk-user-directory "~/Dropbox/config/skk") ;SKKの設定ファイル
        (setq skk-jisyo "~/Dropbox/config/skk/jisyo") ; が、読まれないが、こう設定するとjiysoは動く
        ;; (setq skk-large-jisyo "~/Dropbox/config/skk/SKK-JISYO.HUGE") ; causes freeze!
        (setq skk-jisyo-code 'utf-8)
        (setq skk-record "~/Dropbox/config/skk/record") ;しかし、recordとstudyは反映されない
        (setq skk-study "~/Dropbox/config/skk/study")    ;とりあえず追記しておく
        )
    )
  ;; (require 'skk-decor nil t)
  (defun skk-j-mode-activate ()
    (interactive)
    (cond (skk-j-mode
           (skk-toggle-kana nil))
          (t
           (skk-activate))))
  ;; Google IME SKK変換 (Buggyなので使わないことにする)
  ;; (if (file-executable-p "/usr/local/bin/google-ime-skk")
  ;;     (progn
  ;;       (setq skk-server-prog "/usr/local/bin/google-ime-skk")
  ;;       (setq skk-server-host "0.0.0.0")
  ;;       (setq skk-server-portnum 55100)
  ;;       ))
  (global-set-key (kbd "C-.") 'skk-j-mode-activate)
  (global-set-key (kbd "C-<henkan>") 'skk-j-mode-activate)
  (global-set-key (kbd "C-,") 'skk-latin-mode)
  (global-set-key (kbd "C-<muhenkan>") 'skk-latin-mode)

  (setq skk-cursor-hiragana-color "PaleGreen")
  (setq skk-cursor-katakana-color "HotPink1")
  (setq skk-egg-like-newline t)         ; ▼モードでEnterを押しても改行しない
  (setq skk-status-indicator 'minor-mode)
  (setq skk-status-indicator 'left)
  (setq skk-japanese-message-and-error t) ;日本語によるメッセージ、エラー表示
  (setq skk-version-codename-ja t)      ; 日本語によるバージョン表示
  (setq skk-use-color-cursor t)
  (setq skk-keep-record t)                ;統計を取る
  (setq skk-auto-save-timer
        (run-with-idle-timer 600 t 'skk-save-jisyo))

  ;; wakatime
  ;; need to make symlink at Dropbox install
  (cond ((file-readable-p "~/.wakatime.cfg")
         (global-wakatime-mode)))

  ;; alert
  (setq alert-default-style 'notifications)

  ;; google-translate
  (setq google-translate-default-source-language "en")
  (setq google-translate-default-target-language "ja")
  (setq google-translate-translation-directions-alist
        '(("en" . "ja") ("ja" . "en")))
  ;; ================================
  ;; THE END of dotspacemacs/user-config
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
