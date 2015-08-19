;;;;
;; Go
;;;;

;; Load go-mode
;; (require 'go-mode-load)

(setq gopath "/Users/suddendef/Development/Go")

;; Set GOPATH
(setenv "GOPATH" gopath)

;; Syntax check with goflymake
(require 'go-flycheck)

(defun custom-go-mode-hook()
  ;; Run goimports on save
  (setq gofmt-command "goimports")
  (add-to-list 'exec-path (concat gopath "/bin"))
  (add-hook 'before-save-hook 'gofmt-before-save)

  ;; Jump to definition key binding
  (local-set-key (kbd "M-.") 'godef-jump-other-window)

  ;; Autocompletion
  (set (make-local-variable 'company-backends) '(company-go))
  (company-mode)
)

(add-hook 'go-mode-hook 'custom-go-mode-hook)
