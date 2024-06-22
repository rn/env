;;; 0blayout-autoloads.el --- automatically extracted autoloads (do not edit)   -*- lexical-binding: t -*-
;; Generated by the `loaddefs-generate' function.

;; This file is part of GNU Emacs.

;;; Code:

(add-to-list 'load-path (or (and load-file-name (directory-file-name (file-name-directory load-file-name))) (car load-path)))



;;; Generated autoloads from 0blayout.el

(autoload '0blayout-add-keybindings-with-prefix "0blayout" "\
Add 0blayout keybindings using the prefix PREFIX.

(fn PREFIX)")
(defvar 0blayout-mode nil "\
Non-nil if 0bLayout mode is enabled.
See the `0blayout-mode' command
for a description of this minor mode.")
(custom-autoload '0blayout-mode "0blayout" nil)
(autoload '0blayout-mode "0blayout" "\
Handle layouts with ease

This is a global minor mode.  If called interactively, toggle the
`0bLayout mode' mode.  If the prefix argument is positive, enable
the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `(default-value \\='0blayout-mode)'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

(fn &optional ARG)" t)
(register-definition-prefixes "0blayout" '("0blayout-"))

;;; End of scraped data

(provide '0blayout-autoloads)

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; no-native-compile: t
;; coding: utf-8-emacs-unix
;; End:

;;; 0blayout-autoloads.el ends here
