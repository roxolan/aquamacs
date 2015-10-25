;;;;;;;;;; Ruby Language & Rails Support

;;;;;
;; Enhanced Ruby Mode
;;;;;
;; https://github.com/zenspider/Enhanced-Ruby-Mode 
(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))

;;;;;
;; Robe
;;;;;
;; https://github.com/dgutov/robe
(add-hook 'enh-ruby-mode-hook 'robe-mode)

;;;;;
;; Ruby refactor
;;;;;
;; https://github.com/ajvargo/ruby-refactor
(add-hook 'enh-ruby-mode-hook 'ruby-refactor-mode-launch)


;;;;;
;; Projectile Rails
;;;;; 
;; depends on projectile (enabled globally in navigation.el)
;; https://github.com/asok/projectile-rails
(add-hook 'projectile-mode-hook 'projectile-rails-on)


;; TODO:
; enh-ruby-mode https://github.com/zenspider/enhanced-ruby-mode
; fix yasnippets for enh-ruby-mode
; proceed with ror goodies from http://crypt.codemancers.com/posts/2013-09-26-setting-up-emacs-as-development-environment-on-osx/
; other ruby goodies from melpa?
