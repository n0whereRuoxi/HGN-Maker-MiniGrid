( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b509 - block
    b396 - block
    b366 - block
    b470 - block
    b947 - block
    b354 - block
    b696 - block
    b413 - block
    b809 - block
    b219 - block
    b100 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b509 )
    ( on b396 b509 )
    ( on b366 b396 )
    ( on b470 b366 )
    ( on b947 b470 )
    ( on b354 b947 )
    ( on b696 b354 )
    ( on b413 b696 )
    ( on b809 b413 )
    ( on b219 b809 )
    ( on b100 b219 )
    ( clear b100 )
  )
  ( :goal
    ( and
      ( clear b509 )
    )
  )
)
