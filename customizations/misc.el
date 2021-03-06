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


;;;;;
;; Cask
;;;;;
;; Before using pallet, Cask needs to be installed: 
;; http://cask.readthedocs.org/en/latest/guide/installation.html
;; For example, via brew:
;; $ brew install cask # also installs emacs (currently ver.24.5.1) via brew
;; Cask should be added to the path, but brew pours it into /usr/local/bin/, so no special steps seem to be necessary
;; When installed via brew, Cask is located in /usr/local/Cellar/cask/<version 
;;;;;
;; Cask installation.
;; After adding pallet to the list of packages that must be installed,  
;;;;;
;; pallet 
;;;;;
;; https://github.com/rdallasgray/pallet
;; seems to be geared towards original GNU Emacs, so additional work for Aquamacs might be required.
;; relaxing until further opportunity


;;;;;
;; Magit 
;;;;;
(require 'magit)
