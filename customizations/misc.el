;; No need for ~ files when editing
(setq create-lockfiles nil)

;; Go straight to scratch buffer on startup
(setq inhibit-startup-message t)

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; shell scripts configurated
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)

;;;;;
;; The Silver Searcher / Ag
;;;;;
;; Various ways to install it are listed here:
;; https://github.com/ggreer/the_silver_searcher
;; http://geoff.greer.fm/ag/
;;;;;
;; On OS X needs primary installation via brew: 
;; $ brew link pcre # may be asked to do that
;; $ brew install the_silver_searcher
;;;;;
;; More about Ag:
;; https://github.com/Wilfred/ag.el
;; There is also helm plugin:
;; https://github.com/syohex/emacs-helm-ag



