;;; hydra-examples.el --- Some applications for Hydra

;; Copyright (C) 2015  Free Software Foundation, Inc.

;; Author: Oleh Krehel

;; This file is part of GNU Emacs.

;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; These are the sample Hydras that you can use.
;;
;; Note that the better way to create Hydras is with `defhydra':
;;
;; (defhydra hydra-zoom (global-map "<f2>")
;;   "zoom"
;;   ("g" text-scale-increase "in")
;;   ("l" text-scale-decrease "out"))
;;
;; This way, you have more options, and everything is in one place.

;;; Code:

(require 'hydra)

(defvar hydra-example-text-scale
  '(("g" text-scale-increase "zoom in")
    ("l" text-scale-decrease "zoom out"))
  "A two-headed hydra for text scale manipulation.")

(require 'windmove)

(defun hydra-move-splitter-left (arg)
  "Move window splitter left."
  (interactive "p")
  (if (let ((windmove-wrap-around))
        (windmove-find-other-window 'right))
      (shrink-window-horizontally arg)
    (enlarge-window-horizontally arg)))

(defun hydra-move-splitter-right (arg)
  "Move window splitter right."
  (interactive "p")
  (if (let ((windmove-wrap-around))
        (windmove-find-other-window 'right))
      (enlarge-window-horizontally arg)
    (shrink-window-horizontally arg)))

(defun hydra-move-splitter-up (arg)
  "Move window splitter up."
  (interactive "p")
  (if (let ((windmove-wrap-around))
        (windmove-find-other-window 'up))
      (enlarge-window arg)
    (shrink-window arg)))

(defun hydra-move-splitter-down (arg)
  "Move window splitter down."
  (interactive "p")
  (if (let ((windmove-wrap-around))
        (windmove-find-other-window 'up))
      (shrink-window arg)
    (enlarge-window arg)))

(defvar hydra-example-move-window-splitter
  '(("h" hydra-move-splitter-left)
    ("j" hydra-move-splitter-down)
    ("k" hydra-move-splitter-up)
    ("l" hydra-move-splitter-right))
  "A four-headed hydra for the window splitter manipulation.
Works best if you have not more than 4 windows.")

(defvar hydra-example-goto-error
  '(("h" first-error "first")
    ("j" next-error "next")
    ("k" previous-error "prev"))
  "A three-headed hydra for jumping between \"errors\".
Useful for e.g. `occur', `rgrep' and the like.")

(defvar hydra-example-windmove
  '(("h" windmove-left)
    ("j" windmove-down)
    ("k" windmove-up)
    ("l" windmove-right))
  "A four-headed hydra for `windmove'.")

(provide 'hydra-examples)
;;; hydra-examples.el ends here
