;; Customizations relating to editing a buffer.

;; Key binding to use "hippie expand" for text autocompletion
;; http://www.emacswiki.org/emacs/HippieExpand
(global-set-key "\M- " 'hippie-expand)

;; Lisp-friendly hippie expand
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-lisp-symbol-partially
       try-complete-lisp-symbol))

;; Highlights matching parenthesis
(show-paren-mode 1)

;; Highlight current line
(global-hl-line-mode 1)

;; Don't use hard tabs
(setq-default indent-tabs-mode nil)

;; When you visit a file, point goes to the last place where it
;; was when you previously visited the same file.
;; http://www.emacswiki.org/emacs/SavePlace
(require 'saveplace)
(setq-default save-place t)
;; keep track of saved places in 'places' file located in /Library/Preferences/Aquamacs Emacs/Packages [= user-emacs-directory]:
(setq save-place-file (concat user-emacs-directory "places"))

;; Emacs can automatically create backup files. This tells Emacs to
;; put all backups in 'backups' located in /Library/Preferences/Aquamacs Emacs/Packages [= user-emacs-directory]
;; More info: http://www.gnu.org/software/emacs/manual/html_node/elisp/Backup-Files.html
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory
                                               "backups"))))
(setq auto-save-default nil)

;; enabling Rainbow Delimiters
;; http://www.emacswiki.org/emacs/RainbowDelimiters
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
;; using it globally was crashing:
; (global-rainbow-delimiters-mode t)

;; use 2 spaces for tabs
;; the function making sure tabs make only 2 spaces
(defun die-tabs ()
  (interactive)
  (set-variable 'tab-width 2)
  (mark-whole-buffer)
  (untabify (region-beginning) (region-end))
  (keyboard-quit))

;; fix weird os x kill error
(defun ns-get-pasteboard ()
  "Returns the value of the pasteboard, or nil for unsupported formats."
  (condition-case nil
      (ns-get-selection-internal 'CLIPBOARD)
    (quit nil)))

;; Disabling automatic electric indentation
;; More on it: http://emacsredux.com/blog/2013/03/29/automatic-electric-indentation/
(setq electric-indent-mode nil)


;;;;;
;; Yasnippet + Auto-complete
;;;;;

(require 'yasnippet)
(add-to-list 'yas-snippet-dirs (concat user-emacs-directory "snippets"))
(yas-global-mode t)

;; Remove Yasnippet's default tab key binding
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
;; Set Yasnippet's key binding to shift+tab
(define-key yas-minor-mode-map (kbd "<backtab>") 'yas-expand)
;; Alternatively use Control-c + tab
(define-key yas-minor-mode-map (kbd "\C-c TAB") 'yas-expand)

;;; auto complete mod
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (concat user-emacs-directory "ac-dict"))
(ac-config-default)
(global-auto-complete-mode t)
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")


;;;;;
;; paredit
;;;;;

;; Using paredit with non lisp mode
;; https://truongtx.me/2014/02/22/emacs-using-paredit-with-non-lisp-mode/
(defun my-paredit-nonlisp ()
  "Turn on paredit mode for non-lisps."
  (interactive)
  (set (make-local-variable 'paredit-space-for-delimiter-predicates)
       '((lambda (endp delimiter) nil)))
  (paredit-mode 1))

;; enabling paredit for JS files
(add-hook 'js-mode-hook 'my-paredit-nonlisp)

;; making paredit work for curly braces as well
(define-key js-mode-map "{" 'paredit-open-curly)
(define-key js-mode-map "}" 'paredit-close-curly-and-newline)


;;;;;
;; flycheck
;;;;;
(require 'flycheck)
;; flycheck has built-in support for jshint, so no need to install jshint-mode anymore
;; this will activate flycheck any time .js file is opened:
;; using flycheck as superior to flymake is suggested by:
;; https://truongtx.me/2014/02/21/emacs-setup-jshint-for-on-the-fly-petential-error-checking/
(add-hook 'js-mode-hook
          (lambda () (flycheck-mode t)))
