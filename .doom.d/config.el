;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Lyman Gillispie"
      user-mail-address "lyman@lygi.me")

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
(setq doom-variable-pitch-font "New York Medium-15")
;; (setq doom-font (font-spec :family "monospace" :size 16 :weight 'semi-light)
;;     doom-variable-pitch-font (font-spec :family "New York" :weight 'medium :size 15))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-solarized-light)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(setq deft-directory "~/org")
(setq deft-recursive t)

;; BibTex Setup
;; The gist is: I use Zotero with better bibtex to manage the bibtex db,
;; and files. All of the db management is left to Zotero, excpet notes,
;; which we keep in the orgs.
                                        ; (defvar bibliographies (list "Online_Pajak.bib" "Math Books.bib"))
                                        ; (defvar research-path "~/org/research/")
                                        ;
                                        ; (setq bibtex-completion-additional-search-fields '(tags keywords))
                                        ; (setq bibtex-completion-pdf-field "File")
                                        ; ;; BibTex settings to help coordinate w/ Zotero
                                        ; ;; Optionally specifying a location for the corresponding PDFs
                                        ; (setq  bibtex-completion-bibliography
                                        ;        (mapcar(lambda (bib) (concat research-path bib)) bibliographies))
                                        ; (setq bibtex-completion-notes-path (concat research-path "notes"))


(setq bibtex-completion-bibliography  "/Users/lygi/org/bibtex/my-library.bib")

  (use-package! org-ref
    :after org-mode
    :config
    (setq reftex-default-bibliography "/Users/lygi/org/bibtex/my-library.bib")
    (setq org-ref-default-bibliography "/Users/lygi/org/bibtex/my-library.bib"))

(use-package! org-roam-bibtex
  :after org-roam
  :hook (org-roam-mode . org-roam-bibtex-mode)
  :config
  (require 'org-ref))

(use-package! org-preview-html-mode
  :after org-mode)

(add-hook! org-mode  +org-pretty-mode)


(setq auto-save-visited-mode t)
(auto-save-visited-mode +1)


;; org-roam templates

(after!
  org-roam
  (setq org-roam-capture-templates
        '(("d" "default" plain (function org-roam--capture-get-point)
           "%?"
           :file-name "%<%Y%m%d%H%M%S>-${slug}"
           :head "#+title: ${title}\n* ${title}\n%?"
           :unnarrowed t)
          ("c" "contact" plain (function org-roam--capture-get-point)
           "* ${title}
 :PROPERTIES:
 :EMAIL: ${email}
 :PHONE: ${phone}
 :ALIAS: ${nickname}
 :ADDRESS: ${address}
 :PHONE: ${phone}
 :roam_alias: ${nickname}
 :END:
"
           :file-name "contacts/${slug}"
           :head "#+title: ${title}\n"
           :unnarrowed t)
          ("m" "meeting" plain (function org-roam--capture-get-point)
           "* %<%A, %d %B %Y %H:%M> - ${title}\n** Attendees:\n  - \n** Notes\n%?"
           :file-name "meetings/%<%Y%m%d%H%M%S>-${slug}"
           :head "#+title: %<%Y-%m-%d %H:%M> - ${title}\n#+date: %<%Y-%m-%d %H:%M>\n"
           :unnarrowed t )
          ("f" "film" plain (function org-roam--capture-get-point)
           :file-name "media/movies/%<%Y%m%d%H%M%S>-${slug}"
           :head "#+title: ${title} (${year})
* [[${wikipedia-page}][${title} (${year})]]
:PROPERTIES:
:CATEGORY: Film
:END:
Year: ${year}
** Notes:
%?
"
           :unnarrowed t)
          ("b" "book" plain  (function org-roam--capture-get-point)
           :file-name "media/books/%<%Y%m%d%H%M%S>-${slug}"
           :head"* ${title}
:PROPERTIES:
:CATEGORY: Book
:END:
- Author: [[roam:${author}]]
- Year: ${year}
- Date finished:
** Notes:
%?
" ))))

(use-package! org-roam-server
  :ensure t
  :config
  (setq org-roam-server-host "127.0.0.1"
        org-roam-server-port 8080
        org-roam-server-authenticate nil
        org-roam-server-export-inline-images t
        org-roam-server-serve-files nil
        org-roam-server-served-file-extensions '("pdf" "mp4" "ogv")
        org-roam-server-network-poll t
        org-roam-server-network-arrows nil
        org-roam-server-network-label-truncate t
        org-roam-server-network-label-truncate-length 60
        org-roam-server-network-label-wrap-length 20))

(defun org-roam-server-open ()
    "Ensure the server is active, then open the roam graph."
    (interactive)
    (smartparens-global-mode -1)
    (org-roam-server-mode 1)
    (smartparens-global-mode 1))


(use-package! org-contacts
  ;; if you omit :defer, :hook, :commands, or :after, then the package is loaded
  ;; immediately. By using :hook here, the `hl-todo` package won't be loaded
  ;; until prog-mode-hook is triggered (by activating a major mode derived from
  ;; it, e.g. python-mode)
  :after org
  :init
  ;; code here will run immediately
  :config
  ;; code here will run after the package is loaded
  (setq org-contacts-files (directory-files-recursively (expand-file-name "~/org/roam/contacts")  "^[^\.][^#].+\.org$")))

(use-package! git-auto-commit-mode
  :config
  (setq gac-silent-message-p t)
  (setq gac-debounce-interval 10))




;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
