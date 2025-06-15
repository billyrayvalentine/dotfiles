;;; m68k-mode.el --- mode for editing m688k assembler code  -*- lexical-binding:

;; Copyright (C) 2025, Ben Sampson <github.com/billyrayvalentine>

;; This work is free. You can redistribute it and/or modify it under the
;; terms of the Do What The Fuck You Want To Public License, Version 2,
;; as published by Sam Hocevar. See the COPYING file for more details.

;; Commentary:
;; This mode will suck
;; Expects comments to be * not # but can be change easily
(define-derived-mode m68k-mode prog-mode "M68K"
  "A major mode for editing M68K assembly"

  ;; Set up indentation rules
  (setq indent-tabs-mode nil)  ;; Use spaces instead of tabs
  (setq tab-width 4)           ;; Set tab width to 4 spaces
  (setq-local comment-start "*") ;; comment-line, comment-region etc will use this value

  (let ((syntax-table (make-syntax-table)))
    ;; Single line comment in syntax table are "<" ">" (start and end)
    (modify-syntax-entry ?* "<" syntax-table)  ;; Start of comment with #
    (modify-syntax-entry ?\n ">" syntax-table)  ;; End of comment with #
    (set-syntax-table syntax-table))

  (setq font-lock-defaults '(m68k-fontlock)))

;; Test with regex builder
(setq m68k-fontlock
      '(("^[ \t]*[a-zA-Z0-9_]+:" . 'font-lock-function-name-face)
        ("\\b\\(move\\|MOVE\\|jsr\\|jmp\\|JMP\\|bra\\|BRA\\|bsr\\|BSR\\|bne\\|BNE\\|beq\\|BEQ\\|bge\\|BGE\\|blt\\|BLT\\|bgt\\|BGT\\|ble\\|BLE\\|bhi\\|BHI\\|bls\\|BLS\\|bcc\\|BCC\\|bcs\\|BCS\\|bpl\\|BPL\\|bmi\\|BMI\\|bvs\\|BVS\\|bvc\\|BVC\\|bhs\\|BHS\\|blo\\|BLO\\|dbra\\|DBRA\\|add\\|ADD\\|addq\\|ADDQ\\|sub\\|SUB\\|mul\\|MUL\\|div\\|DIV\\|and\\|AND\\|or\\|OR\\|eor\\|EOR\\|asl\\|ASL\\|asr\\|ASR\\|lsr\\|LSR\\|lsl\\|LSL\\|rol\\|ROL\\|ror\\|ROR\\|roxl\\|ROXL\\|roxr\\|ROXR\\|clr\\|CLR\\|set\\|SET\\|not\\|NOT\\|neg\\|NEG\\|ext\\|EXT\\|swap\\|SWAP\\|link\\|LINK\\|unlink\\|UNLINK\\|moveq\\|MOVEQ\\|movea\\|MOVEA\\|movem\\|MOVEM\\|lea\\|LEA\\|pea\\|PEA\\|tst\\|TST\\|cmp\\|CMP\\|cmpa\\|CMPA\\|cmpm\\|CMPM\\|cmpi\\|CMPI\\|adda\\|ADDA\\|addi\\|ADDI\\|suba\\|SUBA\\|subi\\|SUBI\\|subq\\|SUBQ\\|subx\\|SUBX\\|muls\\|muls\\|mulu\\|MULU\\|divs\\|DIVS\\|divu\\|DIVU\\|nbcd\\|NBCD\\|sbcd\\|SBCD\\|or\\|OR\\|ori\\|ORI\\|and\\|AND\\|andi\\|ANDI\\|eor\\|EOR\\|eori\\|EORI\\|as\\|AS\\|asr\\|ASR\\|asri\\|ASRI\\|lsr\\|LSR\\|lsri\\|LSRI\\|lsl\\|lsl\\|lsli\\|LSLI\\|rol\\|ROL\\|roli\\|ROLI\\|ror\\|ror\\|rori\\|RORI\\|roxl\\|ROXL\\|roxli\\|ROXLI\\|roxr\\|ROXR\\|roxi\\|ROXI\\|btst\\|BTST\\|btst\\|BTST\\|bchg\\|BCHG\\|bclr\\|BCLR\\|bset\\|BSET\\|tas\\|TAS\\|exg\\|EXG\\|ext\\|EXT\\|extb\\|EXTB\\|extl\\|EXTL\\|extw\\|EXTW\\|illeg\\|ILLEG\\|movep\\|MOVEP\\|movem\\|MOVEM\\|cas\\|CAS\\|cas2\\|CAS2\\|nop\\|NOP\\|rts\\|RTS\\)\\b" . 'font-lock-keyword-face)
        ("\\<\\d[0-7]\\|a[0-7]\\|pc\\|sp\\|sr\\|ccr\\>" . 'font-lock-builtin-face)))


;; Add a hook to automatically activate your mode for specific file extensions
(add-to-list 'auto-mode-alist '("\\.asm\\'" . m68k-mode))
(provide 'm68k-mode)
