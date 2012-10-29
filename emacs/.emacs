;; auto indent line when pressing ENTER
(define-key global-map (kbd "RET") 'newline-and-indent)

;; auto-complete mode
(add-to-list 'load-path "~/.emacs.d/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/ac-dict")
(ac-config-default)

;; custom config
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((encoding . utf-8) (whitespace-line-column . 80) (lexical-binding . t)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(linum ((t (:inherit (shadow default) :foreground "green")))))

;; markdown mode
(add-to-list 'load-path "~/.emacs.d/markdown-mode")
(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '("\\.mk?d$" . markdown-mode) auto-mode-alist))

;; php mode
(setq auto-mode-alist
      (cons '("\\.php$" . php-mode) auto-mode-alist))

;; show line number gracefully
(global-linum-mode 1)
(setq linum-format
      (lambda (line)
        (propertize
         (format (concat "%"
                         (number-to-string
                          (length (number-to-string
                                   (line-number-at-pos (point-max)))))
                         "d ")
                 line)
         'face 'linum)))

;; rinari mode
(require 'ido)
(ido-mode t)

(add-to-list 'load-path "~/.emacs.d/rinari")
(require 'rinari)

;; eruby mode/rhtml mode
(add-to-list 'load-path "~/.emacs.d/rhtml")
(require 'rhtml-mode)

;; flyspell mode off
(flyspell-mode nil)

;; template mode
(add-to-list 'load-path "~/.emacs.d/template-mode")
(require 'template)
(template-initialize)
(add-hook 'find-file-not-found-hooks 'new-file-from-template)

(defun new-file-from-template ()
  (template-new-file
   (buffer-file-name)
   (cdr (template-derivation (buffer-file-name) t t))))

;; turn off ruby deep indent
;; # deep indent on
;; some_object.some_function(
;;                            arg1,
;;                            arg2)
;; # deep indent off
;; some_object.some_function(
;;   arg1,
;;   arg2)
(setq ruby-deep-indent-paren nil)

;; cucumber feature mode
(add-to-list 'load-path "~/.emacs.d/cucumber")
(setq feature-detect-language "en")
(setq feature-default-i18n-file "~/.emacs.d/cucumber/i18n.yml")
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

;; show the file path in the current buffer
(defun show-file-name ()
  (interactive)
  (message (buffer-file-name)))

