;; setup all scala lang tools

(require 'scala-mode2)

(add-to-list 'load-path "~/ensime/elisp")
(require 'ensime)
;; This step causes the ensime-mode to be started whenever
;; scala-mode is started for a buffer. You may have to customize this step
;; if you're not using the standard scala mode.
(add-hook 'scala-mode-hook '(lambda ()

  (ensime-scala-mode-hook)
  
  (local-set-key (kbd "RET") 'newline-and-indent)
  (local-set-key (kbd "M-RET") 'join-line)
  (local-set-key (kbd "<backtab>") 'scala-indent:indent-with-reluctant-strategy)
;  (require 'whitespace)

  ;; clean-up whitespace at save
 ; (make-local-variable 'before-save-hook)
  ;(add-hook 'before-save-hook 'whitespace-cleanup)))

  ;; turn on highlight. To configure what is highlighted, customize
  ;; the *whitespace-style* variable. A sane set of things to
  ;; highlight is: face, tabs, trailing
  ;; (whitespace-mode)))
))
(provide 'setup-scala)
