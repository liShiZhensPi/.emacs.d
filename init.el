(require 'package)
;; 加载新的库 M-x package-refresh-contents
;; (setq package-archives '(("gnu"   . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
;; 			 ("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(setq package-archives '(("gnu" . "http://mirrors.ustc.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.ustc.edu.cn/elpa/melpa/")
                         ("melpa-stable" . "http://mirrors.ustc.edu.cn/elpa/melpa-stable/")
                         ("org" . "http://mirrors.ustc.edu.cn/elpa/org/")))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes (quote (atom-one-dark)))
 '(custom-safe-themes
   (quote
    ("171d1ae90e46978eb9c342be6658d937a83aaa45997b1d7af7657546cae5985b" default)))
 '(display-time-mode t)
 '(global-display-line-numbers-mode t)
 '(org-babel-python-command "python3")
 '(package-selected-packages
   (quote
    (racket-mode doom-modeline ctable deferred epc s all-the-icons unicode-escape company bing-dict baidu-translate atom-one-dark-theme)))
 '(scroll-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "ADBO" :slant normal :weight semi-bold :height 128 :width normal)))))

;; 自动更新软件包
;; (unless package-archive-contents
;;   (package-refresh-contents))
;; (package-install-selected-packages)


;;基础设置
(global-set-key (kbd "C-;") 'comment-line)


;; 设置百度翻译插件
(require 'baidu-translate)
(global-set-key (kbd "C-c m") 'baidu-translate-zh-mark)
(global-set-key (kbd "C-c M") 'baidu-translate-zh-whole-buffer)

;;需要去百度申请API
;;设置你的百度翻译APPID
(setq baidu-translate-appid "20190721000319870")
;;设置你的秘钥
(setq baidu-translate-security "2tLWskfOWIyxSevGkU4L")

;;必应词典
(require 'bing-dict)
(defun bing-translate-selected-word ()
  (interactive)
  (bing-dict-brief (word-at-point)))
(global-set-key (kbd "C-c w") 'bing-translate-selected-word)

;;company-mode
(add-hook 'after-init-hook 'global-company-mode)

;;eaf emacs application framework
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/emacs-application-framework/")
;; (require 'eaf)

;;(require 'all-the-icons)

;;(require 'doom-modeline)
;;(doom-modeline-init)

;;org-mode 解决中文换行问题
(add-hook 'org-mode-hook
	  (lambda () (setq truncate-lines nil)))

;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (ruby . t)
   (ditaa . t)
   (python . t)
   (latex . t)
   (plantuml . t)
   (R . t)))
