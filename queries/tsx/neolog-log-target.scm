; Outside of jsx element
; Not function name in call expression foo(bar)
(
  ([
    (identifier)
    (shorthand_property_identifier_pattern)
  ]) @log_target
  (#not-has-ancestor? @log_target jsx_element)
  (#not-has-ancestor? @log_target jsx_self_closing_element)
  (#not-field-of-ancestor? @log_target call_expression function)
)

; Inside of jsx expression but ignore opening and closing tags
(
  ([
    (identifier)
    (shorthand_property_identifier_pattern)
  ]) @log_target
  (#has-ancestor? @log_target jsx_expression)
  (#not-has-parent? @log_target jsx_opening_element)
  (#not-has-parent? @log_target jsx_closing_element)
  (#not-has-parent? @log_target jsx_self_closing_element)
)

(
  ([
    (member_expression)
    (subscript_expression)
  ]) @log_target
  (#not-field-of-ancestor? @log_target call_expression function)
  (#not-has-parent? @log_target jsx_opening_element)
  (#not-has-parent? @log_target jsx_closing_element)
  (#not-has-parent? @log_target jsx_self_closing_element)
)

(
  ([
    (identifier)
    (member_expression)
    (subscript_expression)
  ]) @log_target
  (#has-ancestor? @log_target arguments)
)

