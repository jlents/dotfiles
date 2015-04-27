(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
;; Add JS libraries to get auto-completion from a specific JS library/framework
;(add-to-list 'ac-js3-external-libraries "~/.emacs.d/js-libraries/angular.js")

;;;Add the following custom-set-variables to use 'lazy' modes
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(js3-lazy-commas t)
 '(js3-lazy-operators t)
 '(js3-lazy-dots t)
 '(js3-expr-indent-offset 2)
 '(js3-paren-indent-offset 2)
 '(js3-square-indent-offset 2)
 '(js3-curly-indent-offset 2)
)

(autoload 'js3-mode "js3-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js3-mode))

;; Supposed function to use paredit in non-lisp mode
;; (defun my-paredit-nonlisp ()
;;   "Turn on paredit mode for non-lisps."
;;   (interactive)
;;   (set (make-local-variable 'paredit-space-for-delimiter-predicates)
;;        '((lambda (endp delimiter) nil)))
;;   (paredit-mode 1))
;; Adds paredit for JS, but not working like it should
;; (add-hook 'js-mode-hook 'my-paredit-nonlisp)
;(define-key js-mode-map "{" 'paredit-open-curly)
;(define-key js-mode-map "}" 'paredit-close-curly-and-newline)

;; Adding JSHinting
;; (require 'flycheck)
;; (flycheck-define-checker javascript-jslint-reporter
;;   "A JavaScript syntax and style checker based on JSLint Reporter.
;;   See URL `https://github.com/FND/jslint-reporter'."
;;   :command ("~/.emacs.d/jslint-reporter" source)
;;   :error-patterns
;;   ((error line-start (1+ nonl) ":" line ":" column ":" (message) line-end))
;;   :modes (js-mode js2-mode js3-mode))
;; (add-hook 'js-mode-hook (lambda ()
;;                           (flycheck-select-checker 'javascript-jslint-reporter)
;;                           (flycheck-mode)))
