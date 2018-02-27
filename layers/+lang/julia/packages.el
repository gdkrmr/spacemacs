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
    ))

(defun julia/init-julia-mode ()
  (use-package julia-mode
    :defer t
    :init
    (progn
      (spacemacs/declare-prefix-for-mode 'julia-mode "ms" "send")
      (spacemacs/declare-prefix-for-mode 'julia-mode "mh" "help")
      (spacemacs/declare-prefix-for-mode 'julia-mode "me" "eval")
      (spacemacs/declare-prefix-for-mode 'julia-mode "m=" "format")
      (spacemacs/set-leader-keys-for-major-mode 'julia-mode
        "sb" 'julia-repl-send-buffer
        "sl" 'julia-repl-send-line
        "sr" 'julia-repl-send-region-or-line
        ","  'julia-repl
        "hh" 'julia-repl-doc
        "w"  'julia-repl-workspace
        "em" 'julia-repl-macroexpand
        "el" 'julia-latexsub
        "==" 'julia-indent-line
        )
      )))

(defun julia/init-julia-repl ()
  (use-package julia-repl
    :defer t
    :init
    (progn
      (spacemacs/register-repl 'julia-repl 'julia-repl "julia")
      (add-hook 'julia-mode-hook 'julia-repl)
      (spacemacs/declare-prefix-for-mode 'julia-repl "mh" "help")
      (spacemacs/declare-prefix-for-mode 'julia-repl "me" "eval")
      (spacemacs/set-leader-keys-for-major-mode 'julia-repl
        "'"  'julia-repl-edit
        "hh" 'julia-repl-doc
        "w"  'julia-repl-workspace
        "em" 'julia-repl-macroexpand
        "el" 'julia-latexsub
        ))))
;;; packages.el ends here
