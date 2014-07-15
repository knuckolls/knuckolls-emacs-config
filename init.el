;; ;;;;;;;;;;;;;;;;;;;
;; Initial Setup
;; ;;;;;;;;;;;;;;;;;;;

(setq debug-on-error t) 

(server-start)

(mapc (lambda(mode) (when (fboundp mode) (apply mode '(-1))))
      '(tool-bar-mode
        menu-bar-mode
        scroll-bar-mode))

(setq ring-bell-function #'ignore
      inhibit-startup-screen t
      indent-tabs-mode nil)

(setq ns-command-modifier 'meta)

(winner-mode 1)

(push "/usr/local/bin" exec-path)

;; ;;;;;;;;;;;;;;;;;;
;; Set up use-package.el and package.el
;; ;;;;;;;;;;;;;;;;;;

(mapc (lambda (p) (push p load-path))
      '("~/.emacs.d/use-package/"))

(require 'package)
(require 'use-package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)
;; (package-refresh-contents)


;; ;;;;;;;;;;;;;;;;;
;; configure packages
;; ;;;;;;;;;;;;;;;;;

;; currently fucked, but works for the installation
;; (use-package color-theme-solarized
;;   :ensure t)
(load-theme 'solarized-dark t)

(use-package dockerfile-mode
  :ensure t)

(use-package google-this
  :ensure t)

(use-package magit
  :bind ("C-x g" . magit-status)
  :ensure t)

(use-package markdown-mode
  :ensure t)

(use-package paredit
  :ensure t)

(use-package powerline
  :ensure t)

(use-package projectile
  :ensure t)

(use-package ruby-mode
  :ensure t)

(use-package sbt-mode
  :ensure t)

(use-package scala-mode2
  :ensure t)

(use-package smex
  :bind (("M-x" . smex)
         ("C-c M-x" . execute-extended-command))
  :ensure t)

(use-package switch-window
  :bind ("C-x o" . switch-window)
  :ensure t)

(use-package undo-tree
  :ensure t)

(use-package yaml-mode
  :ensure t)

;; ;;;;;;;;;;;;;;;;
;; built in
;; ;;;;;;;;;;;;;;;;
(use-package files
  :config (setq backup-directory-alist `(("." . "~/.saves"))
                version-control t
                kept-new-versions 10
                kept-old-versions 0
                delete-old-versions t
                backup-by-copying t))

(use-package ido
  :init (progn (ido-mode t)))

(use-package uniquify
  :init (progn 
          (setq
           uniquify-buffer-name-style 'post-forward
           uniquify-separator ":")))


