;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Dũng (Trần Đình)"
      user-mail-address "dungtd@trobz.com")

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
;; (setq doom-font (font-spec :family "monospace" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

(load-theme 'gruvbox-dark-hard t)

(global-font-lock-mode 1)
;; (add-hook 'org-mode-hook 'font-lock-mode)

;; Treat words with _
(modify-syntax-entry ?_ "w")

(setq org-export-with-section-numbers nil)

;; always use system clipboard
(remove-hook 'doom-post-init-hook #'osx-clipboard-mode)

;; yank to system clipboard
(defun copy-from-osx () (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((plantuml . t))) ; this line activates dot

(setq org-plantuml-jar-path
      (expand-file-name "~/org/contrib/scripts/plantuml.jar"))

(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))

;;----------------------------------------------------------------------------
;; Theme
;;----------------------------------------------------------------------------
;; (load! theme)
;; (use-package theme
;;   :demand
;;   ;; :bind (("C-c y" . zp/variable-pitch-mode)
;;   ;;        ("C-c T" . zp/switch-emacs-theme)
;;   ;;        :map zp/toggle-map
;;   ;;        (("t" . zp/switch-emacs-theme)
;;   ;;         ("y" . zp/helm-select-font-dwim)))
;;   :config
;;   ;; ;; Fonts
;;   ;; (zp/set-font "sarasa")
;;   ;; (zp/set-font-variable "warung-kopi")

;;   ;; Day/night cycle
;;   (setq zp/time-of-day-sections '("05:00" "08:00" "16:00" "20:00" "00:00"))
;;   (zp/switch-theme-auto)
;;   )
