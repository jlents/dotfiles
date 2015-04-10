;;;; -*- mode: Emacs-Lisp; eldoc-mode:t -*-
(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(package-initialize)


;(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)

(defvar my-packages '(smart-mode-line smart-mode-line-powerline-theme idomenu smex
                      sml-modeline ido-ubiquitous better-defaults company
                      auto-complete ac-nrepl auto-indent-mode clj-refactor cljdoc
                      clojure-mode cider paredit rainbow-delimiters rainbow-mode popup
                      clojure-test-mode ac-cider))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Work-specific proxy.
(setq url-proxy-services
      '(("no_proxy" . "^\\(localhost\\|10.*\\)")
        ("http" . "gateway.tascnet.tasc.com:8080")
        ("https" . "gateway.tascnet.tasc.com:8080")))

(setq explicit-bash-args (list "--login" "-i"))
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))

;(setq load-path (cons "~./emacs.d/el-files" load-path))

;(load "~/.emacs.d/bash-completion.el")
(add-hook 'shell-dynamic-complete-functions 'bash-completion-dynamic-complete)
(add-hook 'after-init-hook 'global-company-mode)

;; Adding Custom Theme Location
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; Linking File Extenstions To Modes
(setq auto-mode-alist (cons '("README" . text-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.html$" . html-helper-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.htm$" . html-helper-mode) auto-mode-alist))

;; Emacs Display Window Configuration
(defvar t-list '(inhibit-startup-message visible-bell global-linum-mode
                 debug-on-error make-backup-files backup-by-copying
                 delete-old-versions version-control vc-follow-symlinks js3-auto-indent-p
                 js3-enter-indents-newline js3-indent-on-enter-key))
(defvar nil-list '(save-interprogram-paste-before-kill tool-bar-mode scroll-bar-mode
                   menu-bar-mode blink-cursor-mode))
(dolist (o t-list) (set o t))
(dolist (o nil-list) (set o nil))

;; Specify UTF-8 for a few addons that are too dumb to default to it.
(set-default-coding-systems 'utf-8-unix)

;; Setting Font
(set-default-font "Inconsolata-14")

;; Setting theme
;(load-theme 'cyberpunk t)
(load-theme 'light-soap t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("f0b0710b7e1260ead8f7808b3ee13c3bb38d45564e369cbe15fc6d312f0cd7a0" "930a202ae41cb4417a89bc3a6f969ebb7fcea5ffa9df6e7313df4f7a2a631434" default)))
 '(initial-frame-alist (quote ((fullscreen . maximized)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Theming & Initializing sml
(setq sml/theme 'powerline)
(sml/setup)

;; General Auto-Complete
(require 'auto-complete-config)
(setq ac-delay 0.0)
(setq ac-quick-help-delay 0.5)
(ac-config-default)

;; Note to self: Learn more about ido features/options
(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-mode t)
(setq ido-ubiquitous-mode t)

;; Enable SMEX, an enhancement for M-x completion
(global-set-key [(meta x)] (lambda ()
				 (interactive)
				 (or (boundp 'smex-cache)
				     (smex-initialize))
				 (global-set-key [(meta x)] 'smex)
 				 (smex)))
(global-set-key [(shift meta x)] (lambda ()
                                   (interactive)
                                   (or (boundp 'smex-cache)
                                       (smex-initialize))
                                   (global-set-key [(shift meta x)] 'smex-major-mode-commands)
                                   (smex-major-mode-commands)))

;; Function to delete whitespace when saving
(defun jsl-delete-ws-save ()
  (interactive)
  (progn
    (delete-trailing-whitespace)
    (save-buffer)))

;; General Convenience Remappings
(global-set-key "\C-x\C-k" 'kill-this-buffer)  ; Bypasses the C-x k prompt.
(global-set-key "\C-c;" 'comment-region)
(global-set-key "\C-c'" 'uncomment-region)
(global-set-key "\M-o" 'other-window)
(global-set-key "\C-x\C-s" 'jsl-delete-ws-save)

;; Alias to allow to type 'y' or 'n' instead of 'yes' and 'no'
(defalias 'yes-or-no-p 'y-or-n-p)

;; Set fill width to 79 (default was 70).
(setq-default fill-column 79)

;; Shift-arrow keys to move between windows.
(windmove-default-keybindings)

;; Show column number in mode line.
(setq column-number-mode t)

;; Don't echo passwords when communicating with interactive programs.
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)

;; Completion ignores case.
(setq read-buffer-completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

;; Clojure Configuration
;(load "~/.emacs.d/clojure-stuff.el")

;(defrun my-init ()
  ;; My code will go here
;)

;(add-to-list 'after-init-hook 'my-init)

(put 'downcase-region 'disabled nil)


;; Function for loading every .el file in a given directory
(defun load-directory (directory)
  "Load recursively all `.el' files in DIRECTORY."
  (dolist (element (directory-files-and-attributes directory nil nil nil))
    (let* ((path (car element))
           (fullpath (concat directory "/" path))
           (isdir (car (cdr element)))
           (ignore-dir (or (string= path ".") (string= path ".."))))
      (cond
       ((and (eq isdir t) (not ignore-dir))
        (load-directory fullpath))
       ((and (eq isdir nil) (string= (substring path -3) ".el"))
        (load (file-name-sans-extension fullpath)))))))

;; Loading all el files
;(load-directory "~/.emacs.d/el-files")

(defun kill-other-buffers ()
    "Kill all other buffers."
    (interactive)
    (mapc 'kill-buffer
          (delq (current-buffer)
                (remove-if-not 'buffer-file-name (buffer-list)))))
