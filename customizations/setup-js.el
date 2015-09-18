;;;;;;;;;;; JavaScript language Support

; Enabling js2-mode as the main JS editing mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
; Enabling autocomplete ac-js2 mode in js2-mode:
(add-hook 'js2-mode-hook 'ac-js2-mode)
; Associating .json files with js2-mode
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
; Setting the highest level of syntax highlighting for js2-mode
(setq js2-highlight-level 3)

;; Using web-mode to work properly with JSX files
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))
