;;; packages.el --- julia layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: Adam Beckmeyer <adam_git@thebeckmeyers.xyz>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst julia-packages
  '(
    (julia-mode :location elpa)
    (julia-repl :location elpa)
    (lsp-julia :location (recipe :fetcher github
                                 :repo "non-Jedi/lsp-julia"))
    flycheck
    company-lsp
    ess
    ))

(defun julia/init-julia-mode ()
  (use-package julia-mode
    :defer t
    :init (add-hook 'julia-mode-hook #'spacemacs//julia-setup-buffer)
    :config (progn
              (spacemacs/declare-prefix-for-mode 'julia-mode
                "mh" "help")
              (spacemacs/declare-prefix-for-mode 'julia-mode
                "me" "eval")
              (spacemacs/declare-prefix-for-mode 'julia-mode
                "m=" "format")
              (spacemacs/set-leader-keys-for-major-mode 'julia-mode
                "el" 'julia-latexsub
                "==" 'julia-indent-line))))

(defun julia/init-julia-repl ()
  (use-package julia-repl
    :defer t
    :init (progn
            (spacemacs/register-repl 'julia-repl 'julia-repl
                                     "julia-repl"))
    :config (progn
              (spacemacs/declare-prefix-for-mode 'julia-repl
                "mh" "help")
              (spacemacs/declare-prefix-for-mode 'julia-repl
                "me" "eval")
              (spacemacs/set-leader-keys-for-major-mode
                'julia-repl
                "'" 'julia-repl-edit
                "hh" 'julia-repl-doc
                "w" 'julia-repl-workspace
                "em" 'julia-repl-macroexpand
                ;; this command comes from julia-mode
                "el" 'julia-latexsub)
              (spacemacs/declare-prefix-for-mode 'julia-mode
                "ms" "send")
              (spacemacs/set-leader-keys-for-major-mode
                'julia-mode
                "r" 'julia-repl
                "sb" 'julia-repl-send-buffer
                "sl" 'julia-repl-send-line
                "sr" 'julia-repl-send-region-or-line
                "'" 'julia-repl-edit
                "hh" 'julia-repl-doc
                "w" 'julia-repl-workspace
                "em" 'julia-repl-macroexpand))))

(defun julia/init-lsp-julia ()
  (use-package lsp-julia
    :config (progn
              (push 'xref-find-definitions spacemacs-jump-handlers-julia-mode))
    :commands lsp-julia-enable))

(defun julia/post-init-company-lsp ()
  (spacemacs|add-company-backends
    :backends company-lsp
    :modes julia-mode
    :variables
    company-minimum-prefix-length 0
    company-idle-delay 0.5)
  (spacemacs|add-company-backends
    :backends company-capf
    :modes julia-repl
    :variables
    company-minimum-prefix-length 0
    company-idle-delay 0.5))

(defun julia/post-init-flycheck ()
  (spacemacs/enable-flycheck 'julia-mode))

(defun julia/post-init-ess ()
  (spacemacs/register-repl 'ess-site 'julia))
;;; packages.el ends here
