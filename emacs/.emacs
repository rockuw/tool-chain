;; auto indent line when pressing ENTER
(define-key global-map (kbd "RET") 'newline-and-indent)

;; auto-complete mode
(add-to-list 'load-path "~/.emacs.d/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/ac-dict")
(ac-config-default)
(ac-set-trigger-key "TAB")
(setq ac-auto-start nil)
(add-to-list 'ac-modes 'rhtml-mode)
(add-to-list 'ac-modes 'coffee-mode)
(add-to-list 'ac-modes 'markdown-mode)

;; set the line number color
(custom-set-faces
 '(linum ((t (:inherit (shadow default) :foreground "green")))))

;; yaml mode
(add-to-list 'load-path "~/.emacs.d/yaml")
(require 'yaml-mode)
(setq auto-mode-alist
      (cons '("\\.ya?ml$" . yaml-mode) auto-mode-alist))

;; markdown mode
(add-to-list 'load-path "~/.emacs.d/markdown-mode")
(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '("\\.mk?d$" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.note$" . markdown-mode) auto-mode-alist))

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

;; ido mode
(require 'ido)
(ido-mode t)

;; rinari mode
(add-to-list 'load-path "~/.emacs.d/rinari")
(require 'rinari)

;; eruby mode/rhtml mode
(add-to-list 'load-path "~/.emacs.d/rhtml")
(require 'rhtml-mode)

;; template mode
(add-to-list 'load-path "~/.emacs.d/template-mode")
(require 'template)
(template-initialize)
(add-hook 'find-file-not-found-hooks 'new-file-from-template)

(defun new-file-from-template ()
  (template-new-file
   (buffer-file-name)
   (cdr (template-derivation (buffer-file-name) t t))))

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
