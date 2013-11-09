
;; nao mostrar splash screen
(setq inhibit-startup-message t)


(add-to-list 'load-path user-emacs-directory)


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
     ace-jump-mode
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


;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))

;; Setup environment variables from the user's shell.
(when is-mac
  (require-package 'exec-path-from-shell)
  (exec-path-from-shell-initialize))

(require 'sane-defaults)


;; guide-key
(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-x v" "C-x 8"))
(guide-key-mode 1)
(setq guide-key/recursive-key-sequence-flag t)
(setq guide-key/popup-window-position 'bottom)

(require 'ace-jump-mode)
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;; you can select the key you prefer to
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; Setup extensions
(ido-mode)                              
(eval-after-load 'ido '(require 'setup-ido))
;(eval-after-load 'dired '(require 'setup-dired))

;; Functions (load all files in defuns-dir)
(setq defuns-dir (expand-file-name "defuns" user-emacs-directory))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

(require 'expand-region)


;; Smart M-x is smart
(require 'smex)
(smex-initialize)

(require 'key-bindings)

;; move-text (mover o texto selecionado para cima e para baixo M-seta)
(require 'move-text)
(move-text-default-bindings)
;; comand logs
;(require 'show-keys)
;(show-keys-mode)
;;(require 'flymake)

(require 'setup-yasnippet)


;;setup for scala
(require 'setup-scala)

;;setup dirtree ( tree view of projects )
(add-to-list 'load-path "~/.emacs.d/vendor/dirtree")
(autoload 'dirtree "dirtree" "Add directory to tree view" t)
(require 'dirtree)

;; Annoying arrows mode
(require 'annoying-arrows-mode)
(global-annoying-arrows-mode)

;; emacs custom settings em um arquivo especifico
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)
