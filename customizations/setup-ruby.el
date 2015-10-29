;;;;;;;;;; Ruby Language & Rails Support

;;;;;
;; Enhanced Ruby Mode
;;;;;
;; https://github.com/zenspider/Enhanced-Ruby-Mode 
(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
;(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
;(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))
(setq enh-ruby-bounce-deep-indent t)
(setq enh-ruby-hanging-brace-indent-level 2)
;; more configuration of enh-ruby-mode suggested:
; https://gist.github.com/gnufied/7160799

;;;;;
;; rinari
;;;;;
;; turning it on
(require 'rinari)
(global-rinari-mode)


;;;;;
;; Robe
;;;;;
;; https://github.com/dgutov/robe
(add-hook 'ruby-mode-hook 'robe-mode)

;;;;;
;; Ruby refactor
;;;;;
;; https://github.com/ajvargo/ruby-refactor
(add-hook 'ruby-mode-hook 'ruby-refactor-mode-launch)


;;;;;
;; Projectile Rails
;;;;; 
;; depends on projectile (enabled globally in navigation.el)
;; https://github.com/asok/projectile-rails
(add-hook 'projectile-mode-hook 'projectile-rails-on)


;; TODO:
; @@
; proceed with ror goodies from http://crypt.codemancers.com/posts/2013-09-26-setting-up-emacs-as-development-environment-on-osx/
; other ruby goodies from melpa?
