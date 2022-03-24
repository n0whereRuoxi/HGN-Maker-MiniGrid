( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b504 - block
    b143 - block
    b643 - block
    b846 - block
    b586 - block
    b557 - block
    b847 - block
    b812 - block
    b550 - block
    b477 - block
    b210 - block
    b250 - block
    b187 - block
    b907 - block
    b503 - block
    b343 - block
    b671 - block
    b831 - block
    b991 - block
    b34 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b504 )
    ( on b143 b504 )
    ( on b643 b143 )
    ( on b846 b643 )
    ( on b586 b846 )
    ( on b557 b586 )
    ( on b847 b557 )
    ( on b812 b847 )
    ( on b550 b812 )
    ( on b477 b550 )
    ( on b210 b477 )
    ( on b250 b210 )
    ( on b187 b250 )
    ( on b907 b187 )
    ( on b503 b907 )
    ( on b343 b503 )
    ( on b671 b343 )
    ( on b831 b671 )
    ( on b991 b831 )
    ( on b34 b991 )
    ( clear b34 )
  )
  ( :goal
    ( and
      ( clear b504 )
    )
  )
)
