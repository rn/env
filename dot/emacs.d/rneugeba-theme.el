;;; rneugeba-theme --- Personal colour theme converted from font-lock-mode
;;
;; Copyright 2015 Rolf Neugebauer
;;
;; Author: Rolf Neugebauer <rolf.neugebauer@gmail.com>
;; Version: 0.1
;; Licensed under the Apache License, Version 2.0 (the "License");
;; you may not use this file except in compliance with the License.
;; You may obtain a copy of the License at
;;
;;     http://www.apache.org/licenses/LICENSE-2.0
;;
;; Unless required by applicable law or agreed to in writing, software
;; distributed under the License is distributed on an "AS IS" BASIS,
;; WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;; See the License for the specific language governing permissions and
;; limitations under the License.

;;; Commentary:
;; Copy it to .emacs.d and add (load-theme 'rneugeba t) to init.el

;;; Code:
(deftheme rneugeba
  "My personal colour theme")

(custom-theme-set-faces
 'rneugeba
 '(default ((t (:foreground "white" :background "black"	:inherit nil))))
 '(cursor ((((background light)) (:background "black"))
           (((background dark))  (:background "white"))))
 '(fixed-pitch ((t (:family "Monospace"))))
 '(variable-pitch ((t (:family "Sans Serif"))))

 '(escape-glyph ((t (:foreground "#FF8000"))))
 '(minibuffer-prompt ((t (:foreground "#FF8000"))))

 ;; highlight colours
 '(highlight ((t (:foreground "white" :background "steelblue3"))))
 '(region ((t (:foreground "white" :background "steelblue3"))))
 '(shadow ((t (:foreground "#7c7c7c"))))
 '(error ((t (:foreground "red"))))
 '(warning ((t (:foreground "orange"))))

 '(secondary-selection ((t (:background "#262626"))))
 '(trailing-whitespace ((t (:foreground "white" :background "red"))))

 ;; Parenthesis matching (built-in)
 '(show-paren-match ((t (:background "grey50"))))
 '(show-paren-mismatch ((t (:background "red"))))

 ;; Standard fontlock colours
 '(font-lock-builtin-face ((t (:foreground "gold"))))
 '(font-lock-comment-delimiter-face ((t (:inherit (font-lock-comment-face)))))
 '(font-lock-comment-face ((t (:foreground "LightGoldenRod"))))
 '(font-lock-constant-face ((t (:foreground "#99CC99"))))
 '(font-lock-doc-face ((t (:foreground "aquamarine"))))
 '(font-lock-function-name-face ((t (:foreground "green"))))
 '(font-lock-keyword-face ((t (:foreground "gold"))))
 '(font-lock-negation-char-face ((t nil)))
 '(font-lock-preprocessor-face ((t (:foreground "aquamarine"))))
 '(font-lock-regexp-grouping-backslash ((t (:inherit (font-lock-string-face)))))
 '(font-lock-regexp-grouping-construct ((t (:foreground "#C6A24F"))))
 '(font-lock-string-face ((t (:foreground "turquoise"))))
 '(font-lock-type-face ((t (:foreground "gold"))))
 '(font-lock-variable-name-face ((t (:inherit (default)))))
 '(font-lock-warning-face ((t (:weight bold :foreground "red"))))

 ;; no idea
 '(button ((t (:inherit (link)))))
 '(link ((t (:underline (:color foreground-color :style line)
                        :inherit (font-lock-keyword-face)))))
 '(link-visited ((t (:foreground "violet" :inherit (link)))))
 '(fringe ((t (:background "grey10"))))
 '(header-line ((t (:foreground "grey90" :background "grey20"))))
 '(tooltip ((t (:foreground "#333" :background "#fff"
                :inherit (variable-pitch)))))

 ;; Search and highlight
 '(isearch ((t (:foreground "cyan1" :background "magenta4"))))
 '(isearch-fail ((t (:background "red"))))
 '(lazy-highlight ((t (:background "turquoise3"))))
 '(match ((t (foreground "white" :background "blue"))))
 '(next-error ((t (:inherit (region)))))
 '(query-replace ((t (:inherit (isearch)))))

 ;; org-mode
 '(org-level-1 ((t (:foreground "Gold"))))
 '(org-level-2 ((t (:foreground "Green"))))
 '(org-level-3 ((t (:foreground "LightGoldenrod"))))
 '(org-level-4 ((t (:foreground "turquoise"))))
 '(org-level-5 ((t (:foreground "IndianRed3"))))
 '(org-done ((t (:foreground "slategray" :bold t))))

 )

(provide-theme 'rneugeba)
;;; rneugeba-theme.el ends here
