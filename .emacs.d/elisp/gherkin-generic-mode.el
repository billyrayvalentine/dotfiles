;; Use generic-mode to create a simple mode for Gherkin
;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Generic-Modes.html
;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Faces-for-Font-Lock.html
(require 'generic-x)
(define-generic-mode 'gherkin-generic
  '("#")
  '("Feature", "Rule", "Example", "Scenario", "Given", "When", "Then", "And", "But", "Background", "Scenario Outline", "Scenario Template", "Examples", "Scenarios")
  '(("@" . 'font-lock-builtin))
  '("\\.feature$")
  nil
  "A generic mode for Gherkin"
)
