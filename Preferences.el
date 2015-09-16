;; This is the Aquamacs Preferences file.
;; Add Emacs-Lisp code here that should be executed whenever
;; you start Aquamacs Emacs. If errors occur, Aquamacs will stop
;; evaluating this file and print errors in the *Messags* buffer.
;; Use this file in place of ~/.emacs (which is loaded as well.)

(global-set-key (kbd "C-x C-b") 'ibuffer) ;; a more convenient buffer opener


;; Packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t) ; Org-mode's repository
(add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
;; (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
;;                         ("marmalade" . "https://marmalade-repo.org/packages/")
;;			   ("melpa" . "http://melpa-stable.milkbox.net/packages/")))

(package-initialize)

;; getting $PATH from shell
(exec-path-from-shell-initialize)

;; loading theme
(load-theme 'fogus t)


;;;;;;;;;; GO Language Support

;; GOPATH 
(setenv "GOPATH" "/Users/1/gocode")

;; gofmt will reformat any go file before saving
(setq exec-path (cons "/usr/local/go/bin" exec-path))
(add-to-list 'exec-path "/Users/1/gocode/bin")

;; adding godef key binding
(defun my-go-mode-hook ()
  ; Call Gofmt before saving                                                    
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go generate && go build -v && go test -v && go vet"))
  ; Godef jump key binding                                                      
(local-set-key (kbd "C-.") 'godef-jump))
(add-hook 'go-mode-hook 'my-go-mode-hook)


;; Autocomplete
(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)

;; ECB
(require 'ecb)


;;;;;;;;;;; JavaScript language Support

; Enabling js2-mode as the main JS editing mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
; Enabling autocomplete ac-js2 mode in js2-mode:
(add-hook 'js2-mode-hook 'ac-js2-mode)
; Associating .json files with js2-mode
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))

;; Using web-mode to work properly with JSX files
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))




;; C# Mode
(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(setq auto-mode-alist
   (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))
