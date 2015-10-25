;;;;;;;;;; Ruby Language & Rails Support

;;;;;
;; Robe
;;;;;
;; https://github.com/dgutov/robe
(add-hook 'ruby-mode-hook 'robe-mode)

;;;;;
;; Projectile Rails
;;;;; 
;; depends on projectile (enabled globally in navigation.el)
;; https://github.com/asok/projectile-rails
(add-hook 'projectile-mode-hook 'projectile-rails-on)


;; TODO:
; enh-ruby-mode https://github.com/zenspider/enhanced-ruby-mode
; ruby-refactor https://github.com/ajvargo/ruby-refactor
; other ruby goodies from melpa
