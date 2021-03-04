;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Andres Lowrie"
      user-mail-address "")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Fira Code Retina" :size 20 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Fira Code" :size 16))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-nord)

(custom-set-faces!
  `(font-lock-comment-face :foreground ,(doom-darken 'cyan .25))
  `(font-lock-doc-face     :foreground ,(doom-darken 'cyan .25)))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; Disable prompt when killing
(setq confirm-kill-emacs nil)

;; Frequent Keys
(map! :desc "faster brace"
      :i "C-k" "{")

(map! :desc "faster paren"
      :i "C-j" "(")

(map! :desc "faster bracket"
      :i "C-l" "[")

;; Projectile
(setq projectile-project-search-path '("~/Projects"))


;; Windows
(map! :desc "split window horizontally"
      :leader
      "w |" #'split-window-horizontally)

(map! :desc "split window horizontally"
      :leader
      "w /" #'split-window-horizontally)

(map! :desc "split window vertically"
      :leader
      "w -" #'split-window-vertically)


;; Straigt to dired
(map! :desc "dired jump"
      :n "-" #'dired-jump)


;; Deft
(setq deft-directory "~/Documents/org"
      deft-extensions '("org" "md" "txt")
      deft-recursive t)


;; Avy
(setq avy-all-windows t)
(map! :desc "jump to word"
      :leader
      "j w" #'avy-goto-word-1)


;; Evil Stuff
(use-package! evil-lion
  :config
  (evil-lion-mode))


;; Magit
(after! magit
  (transient-append-suffix 'magit-log "-A"
    '("-1" "first parent" "--first-parent")))


;; Org
(after! org
  (setq org-sticky-header-full-path 'full)

  (add-hook! org-mode
             (org-sticky-header-mode 1)))
