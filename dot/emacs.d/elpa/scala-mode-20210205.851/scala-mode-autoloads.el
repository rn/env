;;; scala-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "scala-compile" "scala-compile.el" (24616 5442
;;;;;;  43037 693000))
;;; Generated autoloads from scala-compile.el

(autoload 'scala-compile "scala-compile" "\
`compile' specialised to Scala.

First use in a buffer or calling with a prefix will prompt for a
command, otherwise the last command is used.

The command history is global.

A universal argument will invoke `scala-compile-alt', which
will cause the subsequent call to prompt.

A prefix argument will ensure that the user is prompted to
confirm the selection.

A string argument will run the command (for scripting).

\(fn &optional EDIT-COMMAND)" t nil)

;;;***

;;;### (autoloads nil "scala-mode" "scala-mode.el" (24616 5442 39284
;;;;;;  245000))
;;; Generated autoloads from scala-mode.el

(autoload 'scala-mode:set-scala-syntax-mode "scala-mode" "\
Sets the syntax-table and other related variables for the current buffer to those of scala-mode. Can be used to make some other major mode (such as sbt-mode) use scala syntax-table.

\(fn)" nil nil)

(autoload 'scala-mode:goto-start-of-code "scala-mode" "\
Go to the start of the real code in the file: object, class or trait.

\(fn)" t nil)

(autoload 'scala-mode "scala-mode" "\
Major mode for editing scala code.

When started, runs `scala-mode-hook'.

\\{scala-mode-map}

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.\\(scala\\|sbt\\|worksheet\\.sc\\)\\'" . scala-mode))

(modify-coding-system-alist 'file "\\.\\(scala\\|sbt\\|worksheet\\.sc\\)\\'" 'utf-8)

;;;***

;;;### (autoloads nil nil ("scala-mode-fontlock.el" "scala-mode-imenu.el"
;;;;;;  "scala-mode-indent.el" "scala-mode-lib.el" "scala-mode-map.el"
;;;;;;  "scala-mode-paragraph.el" "scala-mode-pkg.el" "scala-mode-prettify-symbols.el"
;;;;;;  "scala-mode-syntax.el") (24616 5442 44281 741000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; scala-mode-autoloads.el ends here
