( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b432 - block
    b251 - block
    b508 - block
    b202 - block
    b797 - block
    b27 - block
    b147 - block
    b423 - block
    b814 - block
    b152 - block
    b315 - block
    b62 - block
    b459 - block
    b583 - block
    b781 - block
    b870 - block
    b901 - block
    b659 - block
    b888 - block
    b259 - block
    b831 - block
    b620 - block
    b495 - block
    b437 - block
    b447 - block
    b611 - block
    b479 - block
    b4 - block
    b631 - block
    b69 - block
    b320 - block
    b386 - block
    b889 - block
    b991 - block
    b872 - block
    b480 - block
    b89 - block
    b643 - block
    b285 - block
    b406 - block
    b173 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b432 )
    ( on b251 b432 )
    ( on b508 b251 )
    ( on b202 b508 )
    ( on b797 b202 )
    ( on b27 b797 )
    ( on b147 b27 )
    ( on b423 b147 )
    ( on b814 b423 )
    ( on b152 b814 )
    ( on b315 b152 )
    ( on b62 b315 )
    ( on b459 b62 )
    ( on b583 b459 )
    ( on b781 b583 )
    ( on b870 b781 )
    ( on b901 b870 )
    ( on b659 b901 )
    ( on b888 b659 )
    ( on b259 b888 )
    ( on b831 b259 )
    ( on b620 b831 )
    ( on b495 b620 )
    ( on b437 b495 )
    ( on b447 b437 )
    ( on b611 b447 )
    ( on b479 b611 )
    ( on b4 b479 )
    ( on b631 b4 )
    ( on b69 b631 )
    ( on b320 b69 )
    ( on b386 b320 )
    ( on b889 b386 )
    ( on b991 b889 )
    ( on b872 b991 )
    ( on b480 b872 )
    ( on b89 b480 )
    ( on b643 b89 )
    ( on b285 b643 )
    ( on b406 b285 )
    ( on b173 b406 )
    ( clear b173 )
  )
  ( :tasks
    ( Make-40Pile b251 b508 b202 b797 b27 b147 b423 b814 b152 b315 b62 b459 b583 b781 b870 b901 b659 b888 b259 b831 b620 b495 b437 b447 b611 b479 b4 b631 b69 b320 b386 b889 b991 b872 b480 b89 b643 b285 b406 b173 )
  )
)
