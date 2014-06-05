#!/usr/local/bin/emacs --script
;; 
;; Usage:
;;    publish.el


;; Mark org-related variables as safe local variables,
;; regardless of their value.
(defun my/always-safe-local-variable (val) t)
(dolist (sym '(org-export-publishing-directory
               org-export-html-preamble
               org-export-html-postamble))
  (put sym 'safe-local-variable 'my/always-safe-local-variable))

(load "~/.emacs.d/init.el")

(setq org-publish-project-alist '(
	("site-content"
	 :base-directory "~/Repos/www"
	 :base-extension "org"
	 :publishing-directory "~/Public/"
	 :recursive t
	 :publishing-function org-html-publish-to-html
	 :exclude "level-0.org\\|nav.org"
	 )

	("site-static"
         :base-directory "~/Repos/www"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|ico\\|bib"
         :publishing-directory "~/Public/"
         :recursive t
         :publishing-function org-publish-attachment)

	("site" :components ("site-content" "site-static"))))

(defun tm/site-preamble (options)
  "The function that creates the preamble (sidebar) for the blog.
OPTIONS contains the property list from the org-mode export."
  (let ((base-directory (plist-get options :base-directory)))
    (org-babel-with-temp-filebuffer (expand-file-name "html/preamble.html" base-directory) (buffer-string))))

(defun tm/site-postamble (options)
  "The function that creates the preamble (sidebar) for the blog.
OPTIONS contains the property list from the org-mode export."
  (let ((base-directory (plist-get options :base-directory)))
    (org-babel-with-temp-filebuffer (expand-file-name "html/postamble.html" base-directory) (buffer-string))))

(shell-command "find ~/Repos/www -name \"*.org\" -exec touch '{}' \;")

(org-publish-project "site" t)
