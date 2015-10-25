;;;;;;;;;; Ruby Language & Rails Support

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
; enh-ruby-mode https://github.com/zenspider/enhanced-ruby-mode
; other ruby goodies from melpa
