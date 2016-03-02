;;
;; config
;;
(require 'cl)

;; split out customisations
(setq custom-file "~/.emacs.d/init-custom.el")
(load custom-file 'noerror)

;; tidy-up display on startup <http://whattheemacsd.com/>
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(setq inhibit-startup-message t)

;; General settings
(setq focus-follows-mouse t)        ;; Shame this doesn't work on OSX
(line-number-mode 't)               ;; Display line numbers
(column-number-mode 't)             ;; Display column numbers
(transient-mark-mode 1)             ;; Should be default from 23 onwards
(show-paren-mode 1)                 ;; Parentheis highlight
(setq make-backup-files nil)        ;; No backup files
(setq auto-save-interval 0)         ;; No autosafe
(setq-default indent-tabs-mode nil) ;; No tabs by default

;; Load my colour theme and set font on Mac OS X
(load-theme 'rneugeba t)
(cond
   ((string-equal system-type "darwin")
    (set-frame-font "-*-Hack-normal-normal-normal-*-13-*-*-*-m-0-fontset-auto2")
    )
   )

;; <http://stackoverflow.com/questions/8606954/
;;    path-and-exec-path-set-but-emacs-does-not-find-executable>
(defun set-exec-path-from-shell-PATH ()
  "Set up Emacs' `exec-path' and PATH environment variable to
   match that used by the user's shell.
   This is particularly useful under Mac OSX, where GUI apps are not
   started from a shell."
  (interactive)
  (let ((path-from-shell
         (replace-regexp-in-string "[ \t\n]*$" ""
          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))
         ))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator)))
  )
(set-exec-path-from-shell-PATH)

;; package management
(eval-after-load "package"
  '(progn
     (add-to-list 'package-archives
                  '("marmalade" . "http://marmalade-repo.org/packages/"))
     (add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/"))
     (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
     (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
     (package-initialize)
     ))

(setq package-enable-at-startup nil)
(package-initialize)
;; Modes from packages after this

(dtrt-indent-mode 1)                ;; detect tabs/spaces automatically

;; ispell
(cond
   ((string-equal system-type "gnu/linux")
    (setq-default ispell-program-name "/usr/bin/aspell")
    )
   ((string-equal system-type "darwin")
    (setq-default ispell-program-name "/usr/local/bin/aspell")
    )
   )
(setq ispell-dictionary "british")

;; default save encoding: utf-8
(set-language-environment "utf-8")
(set-coding-priority (list 'coding-category-utf-8))
(prefer-coding-system 'utf-8)

;;
;; Functions
;;
(defun reread-dot-emacs ()
  "Re-read init file"
  (interactive)
  (load-file "~/.emacs.d/init.el")
  )

(defun my-kill-emacs ()
  "Kill frame or on last frame emacs"
  (interactive)
  (if (y-or-n-p "Really kill emacs? ")
      (if (cdr(frame-list))
          (delete-frame)
        (save-buffers-kill-emacs)
        )
    (message "Aborted"))
  )

(defun my-suspend-frame ()
  "Confirm before suspend emacs"
  (interactive)
  (if (y-or-n-p "Really minimise? ")
      (suspend-frame)
    (message "Aborted"))
  )

;;
;; mode hooks and customisation
;;
(add-hook 'text-mode-hook
          '(lambda ()
             (message "running text-mode-hook")
             (flyspell-mode t)
             (turn-on-visual-line-mode)
             (set-visual-wrap-column (+ fill-column 2))
             ))

;; prog-mode is not yet universally supported, so apply manually where missing
(defun prog-mode-hook-f ()
  (interactive)
  (message "running prog-mode-hook")
  ;(fci-mode t)
  (flyspell-prog-mode)
  ;(whitespace-cleanup)
  )
(add-hook 'prog-mode-hook 'prog-mode-hook-f)
(mapc (lambda (mode-hook) (add-hook mode-hook 'prog-mode-hook-f))
      '(nxml-mode-hook
        emacs-lisp-mode-hook
        ))

;; c-mode default indent is 4 (what else)
(setq-default c-basic-offset 4)

;; non-standard file associations
(push '("\\.tex$" . latex-mode) auto-mode-alist)
(push '("\\.latex$" . latex-mode) auto-mode-alist)
(push '("\\.bibtex$" . bibtex-mode) auto-mode-alist)

(push '("\\.gnp$" . gnuplot-mode) auto-mode-alist)
(push '("\\.gpl$" . gnuplot-mode) auto-mode-alist)

(push '("\\.php$" . php-mode) auto-mode-alist)
(push '("\\`<\\?xml" . web-mode) magic-mode-alist)
(push '("\\.html$" . web-mode) auto-mode-alist)

(push '("\\.md$" . markdown-mode) auto-mode-alist)
(push '("\\.markdown$" . markdown-mode) auto-mode-alist)
(push '("\\`==\\+==" . markdown-mode) magic-mode-alist)

(push '("bash_" . sh-mode) auto-mode-alist)

(push '("Makefile." . makefile-mode) auto-mode-alist)
(push '("\\.mk$" . makefile-mode) auto-mode-alist)


;;
;; Key bindings
;;

;; make my key-bindings win, except in minibuffer
;; <http://stackoverflow.com/questions/683425/globally-override-key-binding-in-emacs>

(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")

(define-key my-keys-minor-mode-map (kbd "C-x C-c")    'my-kill-emacs)
(define-key my-keys-minor-mode-map (kbd "C-x z")      'my-suspend-frame)
(define-key my-keys-minor-mode-map (kbd "C-x C-z")    'my-suspend-frame)
(define-key my-keys-minor-mode-map (kbd "C-z")        'nil)

(define-key my-keys-minor-mode-map (kbd "C-x g")      'goto-line)
(define-key my-keys-minor-mode-map (kbd "M-i")        'indent-region)
(define-key my-keys-minor-mode-map (kbd "M-%")        'query-replace-regexp)
(define-key my-keys-minor-mode-map (kbd "C-c C-SPC")  'whitespace-cleanup)

(define-key my-keys-minor-mode-map (kbd "<f1>")       'make-frame)
(define-key my-keys-minor-mode-map (kbd "<f4>")       'find-alternate-file)
(define-key my-keys-minor-mode-map (kbd "<f6>")       'switch-to-buffer)
(define-key my-keys-minor-mode-map (kbd "<f10>")      'kill-buffer)

(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; | point-to  | previous   | next        |
;; |-----------+------------+-------------|
;; | char      | <left>     | <right>     |
;; | word      | C/M-<left> | C/M-<right> |
;; | line      | <up>       | <down>      |
;; | paragraph | C-<up>     | C-<down>    |

;; | point-to | start  | end      |
;; |----------+--------+----------|
;; | line     | C-a    | C-e      |
;; | sentence | M-a    | M-e      |
;; | screen   | M-<up> | M-<down> |
;; | file     | M-\<   | M-\>     |

;; | window-to | key        |
;; |-----------+------------|
;; | top       | C-M-<down> |
;; | bottom    | C-M-<up>   |

;; | centre-current |     |
;; |----------------+-----|
;; | point          | M-r |
;; | window         | C-l |

;;
;; for poxy macbook keyboard with only the arrow keys
(define-key my-keys-minor-mode-map (kbd "C-<up>")     'backward-paragraph)
(define-key my-keys-minor-mode-map (kbd "C-<down>")   'forward-paragraph)
(define-key my-keys-minor-mode-map (kbd "M-<up>")     'warp-to-top-of-window)
(define-key my-keys-minor-mode-map (kbd "M-<down>")   'warp-to-bottom-of-window)
(define-key my-keys-minor-mode-map (kbd "C-M-<down>") 'line-to-top-of-window)
(define-key my-keys-minor-mode-map (kbd "C-M-<up>")   'line-to-bottom-of-window)

;;
;; for a sensible pc keyboard with pgup|pgdn|home|end
;;
(define-key my-keys-minor-mode-map (kbd "C-<prior>") 'warp-to-top-of-window)
(define-key my-keys-minor-mode-map (kbd "C-<next>")  'warp-to-bottom-of-window)
(define-key my-keys-minor-mode-map (kbd "C-<home>")  'line-to-top-of-window)
(define-key my-keys-minor-mode-map (kbd "C-<end>")   'line-to-bottom-of-window)
(define-key my-keys-minor-mode-map (kbd "<home>")    'beginning-of-buffer) ; M-<
(define-key my-keys-minor-mode-map (kbd "<end>")     'end-of-buffer)       ; M->
(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " my-keys" 'my-keys-minor-mode-map)

(defun my-minibuffer-setup-hook ()
  (my-keys-minor-mode 0))
(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)

;; (defadvice load (after give-my-keybindings-priority)
;;   "Try to ensure that my keybindings always have priority."
(defun force-my-keys-minor-mode ()
  (interactive)
  (if (not (eq (car (car minor-mode-map-alist)) 'my-keys-minor-mode))
      (let ((mykeys (assq 'my-keys-minor-mode minor-mode-map-alist)))
        (assq-delete-all 'my-keys-minor-mode minor-mode-map-alist)
        (add-to-list 'minor-mode-map-alist mykeys)))
  )

(require 'diminish)
(diminish 'my-keys-minor-mode)


(load custom-file)
;;
;; End
;;
