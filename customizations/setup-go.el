;;;;;;;;;; GO Language Support

;; GOPATH 
(setenv "GOPATH" "~/gocode")

;; gofmt will reformat any go file before saving
(setq exec-path (cons "/usr/local/go/bin" exec-path))
(add-to-list 'exec-path "~/gocode/bin")

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
