(require 'cl)

;; auto-generated customizations go in ".emacs-custom.el"
(setq custom-file (concat user-emacs-directory ".emacs-custom.el"))
(load custom-file 'noerror)

(add-to-list 'load-path (concat user-emacs-directory "emacs lisp/"))

;; load these .el files if necessary
(load "erc-settings.el")
(load "org-settings.el")
(load "stumpwm.el")
(load "adoc-mode.el")


;; load cedet early to insure it is loaded before pre-installed
;; versions
;; See cedet/common/cedet.info for config details
;; (load-file (concat user-emacs-directory "emacs lisp/" "cedet.el"))

;; prepare jde
;; (require 'jde)



;; ;; ensure that packages are installed
;; ;; (require 'package)
;; ;; ;;(package-initialize)
;; ;; (add-to-list 'package-archives
;; ;; 	     '("marmalade" . "http://marmalade-repo.org/packages/") t)

;; ;; (add-to-list 'package-archives
;; ;;              '("ELPA" . "http://tromey.com/elpa/") t)

;; ;; (add-to-list 'package-archives
;; ;;              '("gnu" . "http://elpa.gnu.org/packages/") t)
;; ;; (package-initialize)

;; ;; (when (not package-archive-contents)
;; ;;   (package-refresh-contents))

;; ;; ;; ergoemacs-keybindings
;; ;; (defvar my-packages '(starter-kit starter-kit-lisp starter-kit-eshell erc zenburn)
;; ;;   "A list of packages to ensure are installed at launch.")

;; ;; (dolist (p my-packages)
;; ;;   (when (not (package-installed-p p))
;; ;;     (package-install p)))



;; load bongo
(add-to-list 'load-path (concat user-emacs-directory "emacs lisp//home/erik/.emacs.d/emacs lisp/bongo"))
(autoload 'bongo "bongo"
  "Start Bongo by switching to a Bongo buffer." t)



;; load zenburn
;;(load-theme 'solarized-dark)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'zenburn)
;; line numbers
(load "linum+.el")
(autoload 'linum-mode "linum" "toggle line numbers on/off" t)
(global-set-key (kbd "C-<f5>") 'linum-mode)
;;(global-rainbow-delimiters-mode)


(defun run-kawa ()
  "Run Kawa Scheme in an Emacs buffer."
  (interactive)
  (run-scheme "kawa"))

;; load slime
(add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
     (setq slime-net-coding-system 'utf-8-unix)  
(setq slime-lisp-implementations
           '((sbcl ("/usr/bin/sbcl") :coding-system utf-8-unix)))
(load (expand-file-name "~/code/quicklisp/slime-helper.el"))
 (setq inferior-lisp-program "sbcl" 
       lisp-indent-function 'common-lisp-indent-function
       slime-complete-symbol-function 'slime-fuzzy-complete-symbol
       common-lisp-hyperspec-root "file:///home/erik/code/lisp/HyperSpec/"
       slime-startup-animation t)


(add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1)))
 "Stop SLIME's REPL from grabbing DEL,
 which is annoying when backspacing over a '('"
 (defun override-slime-repl-bindings-with-paredit ()
   (define-key slime-repl-mode-map
       (read-kbd-macro paredit-backward-delete-key) nil))

(add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit)
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)


;; load scheme
;;(setq scheme-program-name "kawa")
;;(require 'quack)

;; load ergoemacs
(setenv "ERGOEMACS_KEYBOARD_LAYOUT" "colemak")
(add-to-list 'load-path "/home/erik/emacs_settings/emacs lisp/ergoemacs-keybindings")
(load "~/.emacs.d/emacs lisp/ergoemacs-keybindings/ergoemacs-mode")
;; turn off ergoemacs keybindings
(ergoemacs-mode 0)

;; Single char cursor movement. (assuming you are on qwerty)
(global-set-key (kbd "M-n") 'backward-char)
(global-set-key (kbd "M-i") 'forward-char)
(global-set-key (kbd "M-u") 'previous-line)
(global-set-key (kbd "M-e") 'next-line)
(global-set-key (kbd "M-SPC") 'set-mark-command)

;; kicking the habit
(global-unset-key (kbd "C-b")) ; backward-char
(global-unset-key (kbd "C-f")) ; forward-char
(global-unset-key (kbd "C-p")) ; previous-line
(global-unset-key (kbd "C-n")) ; next-line
(global-unset-key (kbd "C-SPC")) ; set-mark-command

; kicking the habit
(global-unset-key (kbd "M-f")) ; forward-word
(global-unset-key (kbd "M-b")) ; backward-word
(global-unset-key (kbd "M-d")) ; kill-word
(global-unset-key (kbd "C-<backspace>")) ; backward-kill-word
(global-unset-key (kbd "C-d")) ; delete-char

;; move by word
(global-set-key (kbd "M-l") 'backward-word)
(global-set-key (kbd "M-y") 'forward-word) ; was (prefix)

;; Delete previous/next char.
(global-set-key (kbd "M-s") 'delete-backward-char)
(global-set-key (kbd "M-t") 'delete-char)

; Delete previous/next word.
(global-set-key (kbd "M-f") 'backward-kill-word)
(global-set-key (kbd "M-p") 'kill-word)

(setq next-line-add-newlines t)

;; a minor mode to keep keybindings from being overridden
;;(global-unset-key (kbd "M-n"))
;;(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode-keymap.")

;;(define-key my-keys-minor-mode-map (kbd "M-n") 'backward-char)

(eshell)




