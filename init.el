;; ;;;;;;;;;;;;;;;;;;;
;; Initial Setup
;; ;;;;;;;;;;;;;;;;;;;

(setq debug-on-error t) 

(server-start)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(setq ring-bell-function #'ignore
      inhibit-startup-screen t
      indent-tabs-mode nil)

(setq ns-command-modifier 'meta)

(winner-mode 1)

;; (push "/usr/local/bin" exec-path)

(add-to-list 'load-path "~/.emacs.d/lisp/")


(setenv "PATH" (concat (getenv "HOME") "/bin" ":"
                       "/usr/local/bin" ":"
                       "/usr/bin" ":"
                       "/bin" ":"
                       "/usr/sbin" ":"
                       "/sbin" ":"))

(setenv "GOROOT" (concat (getenv "HOME") "/Code/go"))
(setenv "GOPATH" (concat (getenv "HOME") "/Code/go/bin"))
 
(setq exec-path (list (concat (getenv "HOME") "/bin")
                      (concat (getenv "GOPATH") "/bin")
                      "/usr/local/bin"
                      "/usr/bin"
                      "/bin"
                      "/usr/sbin"
                      "/sbin"))

;; ;;;;;;;;;;;;;;;;;;
;; Set up use-package.el and package.el
;; ;;;;;;;;;;;;;;;;;;

(push "~/.emacs.d/use-package/" load-path)

(require 'package)
(require 'use-package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ;;("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)
;; (package-refresh-contents)


;; ;;;;;;;;;;;;;;;;;
;; configure packages
;; ;;;;;;;;;;;;;;;;;

;; currently fucked, but works for the installation
;;(use-package color-theme-solarized
;;   :ensure t)
;;(load-theme 'solarized-dark t)

(use-package molokai-theme
  :ensure t)


(use-package ag 
  :ensure t)

(use-package dockerfile-mode
  :ensure t)

(use-package helm
  :ensure t)

(use-package helm-projectile
  :ensure t)

(use-package graphviz-dot-mode
  :ensure t)

(use-package go-mode
  :config (progn (add-hook 'before-save-hook 'gofmt-before-save))
  :ensure t)

(use-package google-this
  :config (progn (google-this-mode 1))
  :ensure t)

(use-package magit
  :bind ("C-x g" . magit-status)
  :ensure t)

(use-package markdown-mode
  :ensure t)

(use-package ox-reveal
  :ensure t)

(use-package paredit
  :ensure t)

(use-package projectile
  :config (progn 
            (projectile-global-mode)
            (setq projectile-indexing-method 'native))
  :ensure t)

(use-package ruby-mode
  :ensure t)

(use-package sbt-mode
  :ensure t)

(use-package scala-mode2
  :ensure t)

(use-package smex
  :bind (("M-x" . smex))
  :ensure t)

(use-package switch-window
  :bind ("C-x o" . switch-window)
  :ensure t)

(use-package terraform-mode
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


;; ;;;;;;;;;;
;; text size hotness
;; ;;;;;;;;;;

(defvar mine-normal-font "Monaco 14" "*The main font")
(defvar mine-big-font "Monaco 20" "*The font mainly used in pairing and presentation modes")

;; display settings
(defun mine-use-normal-font ()
  (interactive)
  (set-frame-parameter (selected-frame) 'font mine-normal-font)
  (add-to-list 'default-frame-alist (cons 'font mine-normal-font)))

(defun mine-use-big-font ()
  (interactive)
  (set-frame-parameter (selected-frame) 'font mine-big-font)
  (add-to-list 'default-frame-alist (cons 'font mine-big-font)))


(global-set-key (kbd "<f12>") 'mine-toggle-fullscreen)
(defun mine-toggle-fullscreen ()
  (interactive)
  (if (frame-parameter (selected-frame) 'fullscreen)
      (set-frame-parameter (selected-frame) 'fullscreen nil)
      (set-frame-parameter (selected-frame) 'fullscreen 'fullboth)))


;; ;;;;;;;;;;
;; remove modeline toggle
;; ;;;;;;;;;;

(setq mine-default-mode-line-format mode-line-format)
 
(defun mode-line-on ()
  "Turn on mode line in all buffers."
  (interactive)
  (setq-default mode-line-format mine-default-mode-line-format))
 
(defun mode-line-off ()
  "Turn off mode line in all buffers."
  (interactive)
  (setq-default mode-line-format nil))
 
(defun mode-line-reset ()
  "Reset mode line colors and turn on mode line."
  (interactive)
  (mode-line-on))
 
(defun mode-line-toggle ()
  "Toggles mode line on/off."
  (interactive)
  (if mode-line-format
      (mode-line-off)
    (mode-line-reset)))


;; ;;;;;;;;;;
;; sbt defuns
;; ;;;;;;;;;;

(defun sbt-compile ()
  (interactive)
  (sbt-command "compile"))
