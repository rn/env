;;; lua-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "lua-mode" "../../../../../../.emacs.d/elpa/lua-mode-20190113.1050/lua-mode.el"
;;;;;;  "755a63e2b6f73b590740df05f25e47b5")
;;; Generated autoloads from ../../../../../../.emacs.d/elpa/lua-mode-20190113.1050/lua-mode.el

(autoload 'lua-mode "lua-mode" "\
Major mode for editing Lua code.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.lua\\'" . lua-mode))

(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

(defalias 'run-lua #'lua-start-process)

(autoload 'lua-start-process "lua-mode" "\
Start a Lua process named NAME, running PROGRAM.
PROGRAM defaults to NAME, which defaults to `lua-default-application'.
When called interactively, switch to the process buffer.

\(fn &optional NAME PROGRAM STARTFILE &rest SWITCHES)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../../../.emacs.d/elpa/lua-mode-20190113.1050/init-tryout.el"
;;;;;;  "../../../../../../.emacs.d/elpa/lua-mode-20190113.1050/lua-mode-autoloads.el"
;;;;;;  "../../../../../../.emacs.d/elpa/lua-mode-20190113.1050/lua-mode-pkg.el"
;;;;;;  "../../../../../../.emacs.d/elpa/lua-mode-20190113.1050/lua-mode.el")
;;;;;;  (23887 60438 657963 54000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; lua-mode-autoloads.el ends here
