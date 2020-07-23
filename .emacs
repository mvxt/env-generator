;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;;;;;;; Use MELPA
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

;;;;;;;; Add user plugins folders
(add-to-list 'load-path "~/.emacs.d/plugins/")
(add-to-list 'load-path "~/.emacs.d/plugins/async")
(add-to-list 'load-path "~/.emacs.d/plugins/helm")
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(add-to-list 'load-path "~/.emacs.d/plugins/helm-ls-git")

;;;;;;;; Enable mouse support
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] (lambda ()
                              (interactive)
                              (scroll-down 5)))
  (global-set-key [mouse-5] (lambda ()
                              (interactive)
                              (scroll-up 5)))
  (defun track-mouse (e))
  (setq mouse-sel-mode t)
)

;;;;;;;; Enable copy/paste to OS X clipboard
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

;;;;;;;; Enable yang-mode for .yang files
(require 'yang-mode)

;;;;;;;; Enable lux-mode for .lux files
(require 'lux-mode)

;;;;;;;; Enable tag highlighting for XML
(require 'hl-tags-mode)
(add-hook 'sgml-mode-hook (lambda () (hl-tags-mode 1)))
(add-hook 'nxml-mode-hook (lambda () (hl-tags-mode 1)))

;;;;;;;; Highlight whitespaces in buffers, delete trailing whitespaces on save
(require 'whitespace)
(setq-default whitespace-style '(tabs face trailing lines tab-mark empty indentation::space))
(setq whitespace-line-column 300)
(global-whitespace-mode 1)
(whitespace-mode 1)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;;;;;;; Enable snippets for shortcuts
(require 'yasnippet)
(yas-global-mode 1)

;;;;;;;; Add helm usage
;; (require 'helm-config)
;; (helm-mode 1)
;; ;;;; Use helm find files
;; (define-key global-map [remap find-file] 'helm-find-files)
;; ;; Use enhanced occur for one or more buffers
;; (define-key global-map [remap occur] 'helm-occur)
;; ;; Enhanced buffers listing
;; (define-key global-map [remap list-buffers] 'helm-buffers-list)
;; ;; Enhanced dabrev with helm completion
;; (define-key global-map [remap dabbrev-expand] 'helm-dabbrev)
;; ;; Enhanced etags with helm-completion, used everywhere with helm-find-files
;; (define-key global-map [remap etags-select] 'helm-etags-select)
;; ;; Helm browser for show kill ring
;; (define-key global-map [remap show-kill-ring] 'helm-show-kill-ring)
;; ;; Jump to register
;; (define-key global-map [remap jump-to-register]      'helm-register)

;; Mind M-x to helm M-X for better functionality
;; (global-set-key (kbd "M-x") 'helm-M-x)
;; (unless (boundp 'completion-in-region-function)
;;   (define-key lisp-interaction-mode-map [remap completion-at-point] 'helm-lisp-completion-at-point)
;;   (define-key emacs-lisp-mode-map       [remap completion-at-point] 'helm-lisp-completion-at-point))

;;;; Helm-adaptive plugin
;; (require 'helm-adaptive)
;; (helm-adaptive-mode 1)

;;;; Helm-ring plugin
;; (require 'helm-ring)
;; (helm-push-mark-mode 1)

;;;; Helm-sys plugin
;; (require 'helm-sys)
;; (helm-top-poll-mode 1)

;;;; Helm-LS-Git plugin
(require 'helm-ls-git)
;; Bind to Ctrl-x Ctrl-g
(global-set-key (kbd "C-x C-g") 'helm-browse-project)

;;;;;;;; Miscellaneous configs for main emacs
;;;; Stop creating backup files
(setq make-backup-files nil)

;;;; Get rid of stupid emacs tab bullshit
(setq-default indent-tabs-mode nil)
(setq indent-tabs-mode nil)
(setq default-tab-width 4)
(setq tab-width 4)

;;;; Permanently enable line nums, highlight
(global-linum-mode t)
(require 'hlinum)
(hlinum-activate)

;;;; Permanently remove splash screen
(setq inhibit-splash-screen t)

;;;; Remove emacs status line
(setq-default mode-line-format nil)

;;;; Remove messages/fanfare from emacs
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)

;;;; Custom set variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark)))
 '(package-selected-packages
   (quote
    (projectile cider cargo docker docker-compose-mode dockerfile-mode go-mode kotlin-mode rust-mode markdown-mode)))
 '(safe-local-variable-values (quote ((yas-indent-line quote auto))))
 '(tab-stop-list (number-sequence 4 200 4)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;;; Permanently map forward and previous paragraphs to M-n and M-p
(global-set-key (kbd "M-n") 'forward-paragraph) ; Alt+n
(global-set-key (kbd "M-p") 'backward-paragraph) ; Alt+p

;;;; (set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>]))
(set-frame-parameter (selected-frame) 'alpha '(85 50))
(add-to-list 'default-frame-alist '(alpha 85 50))

;;;; assign toggle to C-c t
(eval-when-compile (require 'cl))
(defun toggle-transparency ()
  (interactive)
  (if (/=
       (cadr (frame-parameter nil 'alpha))
       100)
      (set-frame-parameter nil 'alpha '(100 100))
    (set-frame-parameter nil 'alpha '(85 50))))
 (global-set-key (kbd "C-c t") 'toggle-transparency)

;;;; Set transparency of emacs
(defun transparency (value)
  "Sets the transparency of the frame window. 0=transparent/100=opaque"
  (interactive "nTransparency Value 0 - 100 opaque:")
     (set-frame-parameter (selected-frame) 'alpha value))

;; enable visual feedback on selections
(setq transient-mark-mode t)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; default to unified diffs
(setq diff-switches "-u")

;; always end a file with a newline
;(setq require-final-newline 'query)

;;; uncomment for CJK utf-8 support for non-Asian users
;; (require 'un-define)
(require 'xt-mouse)
(xterm-mouse-mode)
(require 'mouse)
(xterm-mouse-mode t)
(defun track-mouse (e))

(setq mouse-wheel-follow-mouse 't)

(defvar alternating-scroll-down-next t)
(defvar alternating-scroll-up-next t)

(defun alternating-scroll-down-line ()
  (interactive "@")
    (when alternating-scroll-down-next
;      (run-hook-with-args 'window-scroll-functions )
      (scroll-down-line))
    (setq alternating-scroll-down-next (not alternating-scroll-down-next)))

(defun alternating-scroll-up-line ()
  (interactive "@")
    (when alternating-scroll-up-next
;      (run-hook-with-args 'window-scroll-functions)
      (scroll-up-line))
    (setq alternating-scroll-up-next (not alternating-scroll-up-next)))

(global-set-key (kbd "<mouse-4>") 'alternating-scroll-down-line)
(global-set-key (kbd "<mouse-5>") 'alternating-scroll-up-line)
