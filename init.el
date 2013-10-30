
;; nao mostrar splash screen
(setq inhibit-startup-message t)

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
