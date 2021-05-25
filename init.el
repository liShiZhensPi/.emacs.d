(require 'package)
;; 加载新的库 M-x package-refresh-contents
(setq package-archives '(("gnu"   . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize)
;;自动更新软件包
(unless package-archive-contents
  (package-refresh-contents))

(package-install-selected-packages)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(tsdh-light))
 '(package-selected-packages
   '(unicode-escape company bing-dict baidu-translate atom-one-dark-theme))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "ADBO" :slant normal :weight normal :height 143 :width normal)))))

;;设置百度翻译插件
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
