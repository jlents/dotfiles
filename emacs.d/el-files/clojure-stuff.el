;; clj-refactor: Use C-c C-m. See https://github.com/magnars/clj-refactor.el
(defun clj-refactor-hooks ()
  (clj-refactor-mode 1)
  (cljr-add-keybindings-with-prefix "C-c C-m"))

;; nREPL: The new Clojure network REPL. See https://github.com/kingtim/nrepl.el
;(require 'nrepl)
;(add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)
(add-to-list 'same-window-buffer-names "<em>nrepl</em>")
(setq nrepl-popup-stacktraces nil)
(setq nrepl-log-messages t)
(setq nrepl-hide-special-buffers t)


;; Autocompletion for nREPL; From https://github.com/purcell/ac-nrepl
(require 'ac-nrepl)
(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
;(add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)
(add-hook 'cider-mode-hook 'ac-nrepl-setup)
(add-hook 'cider-repl-mode-hook 'ac-nrepl-setup)

;;(add-to-list 'ac-modes 'cider-mode)
;;(add-to-list 'ac-modes 'cider-repl-mode)

;(defvar modes-ac '('(add-to-list 'ac-modes'nrepl-mode)))  
;                   '(add-to-list 'ac-modes 'cider-mode) 
;                   '(add-to-list 'ac-modes 'cider-repl-mode)))
;; (dolist (m modes-ac)
;;   (eval-after-load "auto-complete" m))
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes'nrepl-mode))  
(eval-after-load "cider"
  '(define-key cider-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc))

;; Probably gets in the way of yasnippet?
(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))

(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook 'nrepl-mode-hook 'set-auto-complete-as-completion-at-point-function)
;(add-hook 'nrepl-interaction-mode-hook 'set-auto-complete-as-completion-at-point-function)

;; Glue code: Bring it all together...
(add-hook 'cider-mode-hook #'eldoc-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook 'auto-indent-mode)
(add-hook 'clojure-mode-hook 'clj-refactor-hooks)
(add-hook 'clojure-mode-hook 'auto-complete-mode)
(add-hook 'clojure-mode-hook 'turn-on-eldoc-mode)
(add-to-list 'auto-mode-alist '("\\.cljs\\'" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljx\\'" . clojure-mode))

(setq cider-prefer-local-resources t)
(setq cider-repl-pop-to-buffer-on-connect nil)
;(setq cider-repl-display-in-current-window t) ; C-c C-z (opens repl in window)
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)
(add-hook 'cider-repl-mode-hook #'subword-mode)
(add-hook 'cider-repl-mode-hook #'paredit-mode)
(setq cider-repl-pop-to-buffer-on-connect t)





;; Popup documentation change
;(define-key nrepl-interaction-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc)

;; Show parenthesis mode
(show-paren-mode 1)

;; (global-rainbow-delimiters-mode)
