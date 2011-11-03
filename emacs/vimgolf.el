;;; vimgolf.el --- VimGolf interface for the One True Editor

;; Copyright (C) never, by no one

;; Author: Tim Visher <tim.visher@gmail.com>
;; Maintainer: Tim Visher <tim.visher@gmail.com>
;; Created: 2011-11-02
;; Version: 0.1
;; Package-Version: 6a616502
;; Keywords: games vimgolf vim

;; This file is not part of GNU Emacs

;;; Commentary:

;; This is a simple package that allows Emacs users to compete on [VimGolf][1]
;; using the One True Editor. Competition can be commenced utilizing `M-x
;; vimgolf`. When finished with a challenge, `C-c C-v C-c` should finish your
;; editing, ensure correctness, and submit your score and keystrokes to
;; [VimGolf][1].
;;
;; On second thought, let's not go to Camelot. It's a silly place.

;;; Installation:

;; Use package.el. You'll need to add Marmalade to your archives:

;; (require 'package)
;; (add-to-list 'package-archives
;;              '("marmalade" . "http://marmalade-repo.org/packages/"))

;; If you use a version of Emacs prior to 24 that doesn't include
;; package.el, you can get it from http://bit.ly/pkg-el23. If you have
;; an older package.el installed from tromey.com, you should upgrade
;; in order to support installation from multiple sources.

;;; License:

;; [CC BY-NC-SA 3.0](http://creativecommons.org/licenses/by-nc-sa/3.0/)

;;; Code:

(let* ((challenge-id "4ea9bc988b36f70001000008")
       (vimgolf-yaml-buffer (url-retrieve-synchronously (concat "http://vimgolf.com/challenges/" challenge-id ".yaml"))))
  (save-current-buffer
    (set-buffer vimgolf-yaml-buffer)
    (goto-char (point-min))
    (search-forward "data: |+\n" nil t)
    (let ((vimgolf-start-buffer (get-buffer-create "*vimgolf-start*"))
          (vimgolf-work-buffer (get-buffer-create "*vimgolf-work*"))
          (vimgolf-end-buffer (get-buffer-create "*vimgolf-end*")))
      (progn
        (append-to-buffer vimgolf-start-buffer (point) (point-max))
        (append-to-buffer vimgolf-work-buffer (point) (point-max))
        (save-current-buffer
          (set-buffer vimgolf-start-buffer)
          (goto-char (point-min))
          (search-forward "    \n  type: input" nil t)
          (delete-region (match-beginning 0) (point-max))
          (decrease-left-margin (point-min) (point-max) 4)
          (goto-char (point-min)))
        (save-current-buffer
          (set-buffer vimgolf-work-buffer)
          (goto-char (point-min))
          (search-forward "    \n  type: input" nil t)
          (delete-region (match-beginning 0) (point-max))
          (decrease-left-margin (point-min) (point-max) 4)
          (goto-char (point-min)))
        (search-forward "data: |+\n" nil t)
        (append-to-buffer vimgolf-end-buffer (point) (point-max))
        (save-current-buffer
          (set-buffer vimgolf-end-buffer)
          (goto-char (point-min))
          (search-forward "    \n  type: output")
          (delete-region (match-beginning 0) (point-max))
          (decrease-left-margin (point-min) (point-max) 4)
          (goto-char (point-min)))
        (delete-other-windows)
        (display-buffer vimgolf-end-buffer 'display-buffer-pop-up-window)
        (set-window-buffer (selected-window) vimgolf-work-buffer)))))

;; Use dribble file to allow for running from within emacs
;; Main interface should be `M-x vimgolf Challenge ID: <Enter ID> RET <Do Your Editing> C-c C-v C-c`
;; Could also use C-c C-v o to get the challenge ID prompt

;; We don't load up a vanilla mode. This could be used for sharing useful general code snippets that

;; Important to emphasis a 'good sport' attitude where the community enforces an anti-special solution attitude

;; Load up two buffers. One with the solution, one with the start.
;; Open a dribble file
;; Make your edits
;; Press C-c C-v C-c
;; Close dribble file

;; Diff files

;; If different
;;   Echo fail!
;;   Pop open ediff
;; else
;;   Chomp off the last 3 keychords
;;   Parse dribble file
;;   Count keystrokes
;;   Echo You solved <Challenge> in <Strokes> keystrokes!
;;   Submit? (yes or no predicate):

;;   Echo w00t!
;;   

;;; vimgolf.el ends here