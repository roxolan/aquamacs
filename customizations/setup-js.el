;;;;;;;;;;; JavaScript language Support

; Enabling js2-mode as the main JS editing mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
; Enabling autocomplete ac-js2 mode in js2-mode:
(add-hook 'js2-mode-hook 'ac-js2-mode)
; Associating .json files with js2-mode
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
; Associating .es6 files with js2-mode
(add-to-list 'auto-mode-alist '("\\.es6$" . js2-mode))
; Setting the highest level of syntax highlighting for js2-mode
(setq js2-highlight-level 3)
; Setting 2 spaces for indentation
(setq-default js2-basic-offset 2)

(add-hook 'js-mode-hook 'subword-mode)
(add-hook 'html-mode-hook 'subword-mode)


(eval-after-load "sgml-mode"
  '(progn
     (require 'tagedit)
     (tagedit-add-paredit-like-keybindings)
     (add-hook 'html-mode-hook (lambda () (tagedit-mode 1)))))


;;;;;
;; JSX
;;;;;
;; Using web-mode to work properly with JSX files
;; inspired by https://truongtx.me/2014/03/10/emacs-setup-jsx-mode-and-jsx-syntax-checking/
;; jsx-mode package seems to lack sufficient support https://github.com/jsx/jsx-mode.el

(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))


;;;;;
;; coffeescript
;;;;;

(add-to-list 'auto-mode-alist '("\\.coffee.erb$" . coffee-mode))
(add-hook 'coffee-mode-hook 'subword-mode)
(add-hook 'coffee-mode-hook 'highlight-indentation-current-column-mode)
(add-hook 'coffee-mode-hook
          (defun coffee-mode-newline-and-indent ()
            (define-key coffee-mode-map "\C-j" 'coffee-newline-and-indent)
            (setq coffee-cleanup-whitespace nil)))
(custom-set-variables
 '(coffee-tab-width 2))

;;;;;;;; JavaScript-related Yasnippets
;; react-snippets from https://github.com/johnmastro/react-snippets.el
(require 'react-snippets)

(require 'js)

;;;;;
;; js2-refactor
;;;;;
;; available refactorings are listed at: https://github.com/magnars/js2-refactor.el
(require 'js2-refactor)
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-m")
;; eg. extract function with `C-c C-m ef`

;;;;;
;; Tern.js
;;;;;
;; Needs to be installed first via npm:
;; Initializing Tern and tern-auto-complete:
(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))
