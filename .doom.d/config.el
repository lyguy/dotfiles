;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(setq deft-recursive t)

;; BibTex Setup
;; The gist is: I use Zotero wit hbetter bibtex to manage the bibtex db,
;; and files. All of the db management is left to Zotero, excpet notes,
;; which we keep in the orgs.
(defvar bibliographies (list "Online_Pajak.bib" "Math Books.bib"))
(defvar research-path "~/org/research/")

(setq bibtex-completion-additional-search-fields '(tags keywords))
(setq bibtex-completion-pdf-field "File")
;; BibTex settings to help coordinate w/ Zotero
;; Optionally specifying a location for the corresponding PDFs
(setq  bibtex-completion-bibliography
       (mapcar(lambda (bib) (concat research-path bib)) bibliographies))
(setq bibtex-completion-notes-path (concat research-path "notes"))


(when (memq window-system '((message "")ac ns))
  (setq exec-path-from-shell-check-startup-files nil)
  (exec-path-from-shell-initialize))

(setq doom-theme 'doom-solarized-light)

(setq doom-font (font-spec :family "Menlo" :size 13))
