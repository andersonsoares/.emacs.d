
;; nao mostrar splash screen
(setq inhibit-startup-message t)

 ;; responder 'yes' ou 'no' apenas com 'y' ou 'n'
(defalias 'yes-or-no-p 'y-or-n-p)


(add-to-list 'load-path user-emacs-directory)

;; emacs custom settings em um arquivo especifico
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(require 'appearance)

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

(require 'setup-package)
;; Install extensions if they're missing
(defun init--install-packages ()
  (packages-install
   '(magit
     paredit
     move-text
     god-mode
     gist
     htmlize
     visual-regexp
     flycheck
     flx
     flx-ido
     css-eldoc
     yasnippet
     smartparens
     ido-vertical-mode
     ido-at-point
     guide-key
     nodejs-repl
     highlight-escape-sequences
     whitespace-cleanup-mode
     git-commit-mode
     gitconfig-mode
     gitignore-mode
     )))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

;; setup shell envroments to emacs
(require-package 'exec-path-from-shell)
  (exec-path-from-shell-initialize)


