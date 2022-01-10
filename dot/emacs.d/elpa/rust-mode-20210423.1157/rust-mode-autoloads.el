;;; rust-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "rust-mode" "rust-mode.el" (24929 36742 159217
;;;;;;  219000))
;;; Generated autoloads from rust-mode.el

(autoload 'rust-mode "rust-mode" "\
Major mode for Rust code.

\\{rust-mode-map}

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

;;;***

;;;### (autoloads nil "rust-utils" "rust-utils.el" (24929 36742 161002
;;;;;;  786000))
;;; Generated autoloads from rust-utils.el

(autoload 'rust-dbg-wrap-or-unwrap "rust-utils" "\
Either remove or add the dbg! macro.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("rust-cargo.el" "rust-compile.el" "rust-mode-pkg.el"
;;;;;;  "rust-playpen.el" "rust-rustfmt.el") (24929 36742 163572
;;;;;;  140000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; rust-mode-autoloads.el ends here
