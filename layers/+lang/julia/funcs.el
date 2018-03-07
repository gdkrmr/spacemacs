;;; funcs.el --- Julia Layer functions File for Spacemacs
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: Adam Beckmeyer <adam_git@thebeckmeyers.xyz>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defun spacemacs//set-lsp-timeout ()
  "Make sure lsp doesn't timeout during julia startup"
  (setq-local lsp-response-timeout 30))
