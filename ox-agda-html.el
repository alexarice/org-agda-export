;;; ox-agda-html.el --- Backend for exporting lagda.org files to html -*- lexical-binding: t -*-

;;; Commentary:

;; TODO

;;; Code:

;;;###autoload
(defun org-publish-lagda (plist filename pub-dir)
  "Generate lagda html"
  (with-temp-buffer
    (setq default-directory (file-name-directory filename))
    (call-process (plist-get plist :agda) nil t nil
		  "--html"
		  "--html-highlight=auto"
		  (format "--css=%s" (plist-get plist :css))
		  (format "--html-dir=%s" pub-dir)
		  filename)
    (message "%s" (buffer-string))))

(provide 'ox-agda-html)

;;; ox-agda-html.el ends here
