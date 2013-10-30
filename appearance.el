;; remove menu, toolbar, scrollbar
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Highlight current line
(global-hl-line-mode 1)

;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

(provide 'appearance)
