;; This is the Aquamacs Preferences file.
;; Add Emacs-Lisp code here that should be executed whenever
;; you start Aquamacs Emacs. If errors occur, Aquamacs will stop
;; evaluating this file and print errors in the *Messags* buffer.
;; Use this file in place of ~/.emacs (which is loaded as well.)

(require 'package)
;;;;
;; Packages
;;;;
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t) ; Org-mode's repository
(add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
;; (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
;;                         ("marmalade" . "https://marmalade-repo.org/packages/")
;;			   ("melpa" . "http://melpa-stable.milkbox.net/packages/")))

;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.
(package-initialize)

;; Download the ELPA archive description if needed.
;; This informs Emacs about the latest versions of all packages, and
;; makes them available for download.
(when (not package-archive-contents)
  (package-refresh-contents))

 
;; The packages to be installed.
;; Also possible to install manually with M-x package-install

(defvar my-packages
  '(;; Package management helper, requires Cask to be installed in the system:
    pallet

    ;; makes handling lisp expressions much easier
    ;; Cheatsheet: http://www.emacswiki.org/emacs/PareditCheatsheet
    paredit

    ;; key bindings and code colorization for Clojure
    ;; https://github.com/clojure-emacs/clojure-mode
    clojure-mode

    ;; extra syntax highlighting for clojure
    clojure-mode-extra-font-locking

    ;; integration with a Clojure REPL
    ;; https://github.com/clojure-emacs/cider
    cider

    ;; allow ido usage in as many contexts as possible. see
    ido-ubiquitous

    ;; Enhances M-x to allow easier execution of commands. Provides
    ;; a filterable list of possible commands in the minibuffer
    ;; http://www.emacswiki.org/emacs/Smex
    smex

    ;; project navigation
    projectile

    ;; colorful parenthesis matching
    rainbow-delimiters

    ;; edit html tags like sexps
    tagedit

    ;; git integration
    magit

    ;; web-mode for editing templates:
    ;; http://web-mode.org/
    web-mode

    ;; coffeescript mode
    coffee-mode

    ;; Yasnippets for React
    react-snippets

    ;; On-the-fly syntax checking
    ;; https://github.com/flycheck/flycheck
    flycheck

    js2-mode

    ;; JS2 refactor plugin
    ;; Desctiption, including refactoring functions keywords:
    ;; https://github.com/magnars/js2-refactor.el
    js2-refactor

    ;; Tern.js
    tern
    tern-auto-complete

    ;; Gradle support
    gradle-mode
    ;; Java support
    java-snippets

    ;; Ruby & Rails support
    enh-ruby-mode
    robe
    ruby-refactor
    projectile-rails

    ;; The Silver Searcher / Ag (more about it in misc.el)
    ag))


;; On OS X, an Emacs instance started from the graphical user
;; interface will have a different environment than a shell in a
;; terminal window, because OS X does not run a shell during the
;; login. This will lead to unexpected results when
;; calling external utilities like make from Emacs.
;; This library works around this problem by copying important
;; environment variables from the user's shell.
;; https://github.com/purcell/exec-path-from-shell
(if (eq system-type 'darwin)
  (add-to-list 'my-packages 'exec-path-from-shell))


;; solution for automatic package installation is taken from:
;; http://wikemacs.org/wiki/Package.el :
(require 'cl)

(defun my-packages-installed-p ()
  (loop for p in my-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(unless (my-packages-installed-p)
  ;; check for new packages (package versions)
  (package-refresh-contents)
  ;; install the missing packages
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))

;; ECB
(require 'ecb)

;;;;
;; Customization
;;;;

;; Add a directory to our load path so that when you `load` things
;; below, Emacs knows where to look for the corresponding file.
(add-to-list 'load-path "~/Library/Preferences/Aquamacs Emacs/customizations")

;; Customizations making it easier to navigate files,
;; switch buffers, and choose options from the minibuffer.
(load "navigation.el")

;; Customizations changin the way Emacs looks and disabling/enabling some user interface elements
(load "ui.el")

;; Sets up exec-path-from-shell so that Emacs will use the correct
;; environment variables. This makes more sense for non-aquamacs types of Emacs
(load "shell-integration.el")

;; Hard-to-categorize customizations
(load "misc.el")

;; Language-specific
(load "setup-elisp.el")
(load "setup-ruby.el")
(load "setup-clojure.el")
(load "setup-js.el")
(load "setup-go.el")
(load "setup-csharp.el")
(load "setup-java.el")

;; Customizations that make editing nicer
;; They include connecting paredit to work with non-lisp mode, so this is moved to be loaded after setup-js
(load "editing.el")

;; Autocomplete
(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)


;; TODO work more on discover mode:
;; https://www.masteringemacs.org/article/discoverel-discover-emacs-context-menus

;; TODO engage with helm & ctags, maybe:
;; https://github.com/emacs-helm/helm
;; https://truongtx.me/2014/04/20/emacs-javascript-completion-and-refactoring/

;; TODO proceed with https://www.masteringemacs.org/article/beginners-guide-to-emacs
