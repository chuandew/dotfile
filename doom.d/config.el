;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

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
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/org")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; max frame
;; (setq frame-resize-pixelwise t)
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(map! (:map c-mode-map :n "gh" #'ff-find-other-file))
(map! (:map cpp-mode-map :n "gh" #'ff-find-other-file))

(after! org
    ;; set the variable org-agenda-files so that org-mode will know which files to search for TODOs and scheduled items.
    (setq org-agenda-files '("~/Dropbox/org/gtd"))

    (setq org-capture-templates '(("t" "Todo [inbox]" entry
                                   (file+headline "~/Dropbox/org/gtd/inbox.org" "Tasks")
                                   "* TODO %i%?")))

    (setq org-tag-alist '(("@work" . ?w) ("@home" . ?h ) ("@notes" . ?n)))


    (setq org-refile-targets '(("~/Dropbox/org/gtd/work.org" :maxlevel . 2)
                               ("~/Dropbox/org/gtd/life.org" :maxlevel . 2)
                               ("~/Dropbox/org/gtd/study.org" :maxlevel . 2)
                               ("~/Dropbox/org/gtd/goal.org" :maxlevel . 2)))

    ;; (setq org-default-notes-file "~/Dropbox/org/gtd/notes.org")

    ;; TODO keywords.
    (setq org-todo-keywords
          '((sequence "TODO(t)" "INPROGRESS(i)" "WAITING(p)" "|" "DONE(d)" "CANCELLED(c)")))

    (setq org-log-done 'time)

    (setq org-log-done 'note)


    ;; Show the daily agenda by default.
    ;; (setq org-agenda-span 'day)

    ;; Hide tasks that are scheduled in the future.
    ;; (setq org-agenda-todo-ignore-scheduled 'future)

    ;; Use "second" instead of "day" for time comparison.
    ;; It hides tasks with a scheduled time like "<2020-11-15 Sun 11:30>"
    ;; (setq org-agenda-todo-ignore-time-comparison-use-seconds t)

    ;; Hide the deadline prewarning prior to scheduled date.
    ;; (setq org-agenda-skip-deadline-prewarning-if-scheduled 'pre-scheduled)

    ;; Customized view for the daily workflow. (Command: "C-c a n")
    ;; (setq org-agenda-custom-commands
    ;;       '(("n" "Agenda / INTR / PROG / NEXT"
    ;;          ((agenda "" nil)
    ;;           (todo "INTR" nil)
    ;;           (todo "PROG" nil)
    ;;           (todo "NEXT" nil))
    ;;          nil)))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CC
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(use-package! bazel-mode
;;  :defer t
;;  :commands bazel-mode
;;  :init
;;  (add-to-list 'auto-mode-alist '("BUILD\\(\\.bazel\\)?\\'" . bazel-mode))
;;  (add-to-list 'auto-mode-alist '("WORKSPACE\\'" . bazel-mode))
;;  :config
;;  ;; disable format-all becuase it doesn't sort BUILD list variables
;;  (setq bazel-mode-buildifier-before-save t)
;;  (appendq! +format-on-save-enabled-modes '(bazel-mode)))
;;
;;(add-to-list 'auto-mode-alist '("\\.inl\\'" . +cc-c-c++-objc-mode))
;;(add-to-list 'auto-mode-alist '("\\.inc\\'" . +cc-c-c++-objc-mode))

(setq-default c-basic-offset 2)

(after! cc-mode
  (c-add-style
   "my-cc" '("user"
             (c-basic-offset . 2)
             (c-tab-always-indent . nil)
             (tab-width . 2)
             (indent-tabs-mode . nil)
             (c-offsets-alist
              . ((innamespace . 0)
                 (access-label . 0)
                 (label . 0)
                 (case-label . 0)
                 (member-init-intro . +)
                 (topmost-intro . 0)
                 (arglist-cont-nonempty . +)))))
(setq c-default-style "my-cc"))

(setq lsp-clients-clangd-args '("-j=3"
                                "--background-index"
                                "--clang-tidy"
                                "--completion-style=detailed"
                                "--header-insertion=never"
                                "--header-insertion-decorators=0"))
(after! lsp-clangd (set-lsp-priority! 'clangd 2))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Chinese Input
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; note! not turn on chinese in init.el
(setq default-input-method "rime"
      rime-show-candidate 'posframe)
(setq rime-user-data-dir "~/.config/fcitx/rime")

