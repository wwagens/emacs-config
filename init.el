(setq inhibit-startup-message 1) ;desactiva la startup window

(tool-bar-mode -1) ;desactiva la toolbar

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



(setq visible-bell 1)

;; Initialize packages sources

(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))


(require 'use-package)
(setq use-package-always-ensure t)

(setq custom-safe-themes t)
(load-theme 'doom-nord)

;;set up evil mode

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Enable Evil
(require 'evil)
(evil-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("c4063322b5011829f7fdd7509979b5823e8eea2abf1fe5572ec4b7af1dd78519" "f6665ce2f7f56c5ed5d91ed5e7f6acb66ce44d0ef4acfaa3a42c7cfe9e9a9013" "cf922a7a5c514fad79c483048257c5d8f242b21987af0db813d3f0b138dfaf53" "d47f868fd34613bd1fc11721fe055f26fd163426a299d45ce69bef1f109e1e71" "1d5e33500bc9548f800f9e248b57d1b2a9ecde79cb40c0b1398dec51ee820daf" "47db50ff66e35d3a440485357fb6acb767c100e135ccdf459060407f8baea7b2" "1704976a1797342a1b4ea7a75bdbb3be1569f4619134341bd5a4c1cfb16abad4" "a7b20039f50e839626f8d6aa96df62afebb56a5bbd1192f557cb2efb5fcfb662" default)))
 '(package-selected-packages
   (quote
    (all-the-icons-ivy yasnippet-classic-snippets doom-themes rainbow-delimiters doom-modeline ggtags yasnippet flycheck auto-complete which-key cmake-ide evil use-package))))

;; Auto completion
(use-package auto-complete
:ensure t
:init
(progn
(ac-config-default)
(global-auto-complete-mode t)
))

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)	
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))

;; on the fly syntax checking
(use-package flycheck
:ensure t
:init
(global-flycheck-mode t))

;; snippets and snippet expansion
(use-package yasnippet
:ensure t
:init
(yas-global-mode 1))


;; tags for code navigation
(use-package ggtags
:ensure t
:config
(add-hook 'c-mode-common-hook
(lambda ()
(when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
  (ggtags-mode 1))))
)

(column-number-mode)
(global-display-line-numbers-mode)

(dolist (mode '(org-mode-hook term-mode-hook shell-mode-hook eshell-mode-hook))
(add-hook mode (lambda () (display-line-numbers-mode 0))))

(use-package rainbow-delimiters :hook(prog-mode . rainbow-delimiters-mode))

(load-theme 'doom-gruvbox)

(electric-pair-mode 1)
(setq electric-pair-preserve-balance nil)

(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))
    ;; golang
    (el-get-bundle go-mode)(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))
    ;; golang
    (el-get-bundle go-mode)

