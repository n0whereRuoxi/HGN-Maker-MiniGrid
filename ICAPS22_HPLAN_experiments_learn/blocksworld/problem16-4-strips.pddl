( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b539 - block
    b438 - block
    b305 - block
    b571 - block
    b545 - block
    b125 - block
    b246 - block
    b623 - block
    b583 - block
    b789 - block
    b89 - block
    b462 - block
    b505 - block
    b396 - block
    b903 - block
    b387 - block
    b721 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b539 )
    ( on b438 b539 )
    ( on b305 b438 )
    ( on b571 b305 )
    ( on b545 b571 )
    ( on b125 b545 )
    ( on b246 b125 )
    ( on b623 b246 )
    ( on b583 b623 )
    ( on b789 b583 )
    ( on b89 b789 )
    ( on b462 b89 )
    ( on b505 b462 )
    ( on b396 b505 )
    ( on b903 b396 )
    ( on b387 b903 )
    ( on b721 b387 )
    ( clear b721 )
  )
  ( :goal
    ( and
      ( clear b539 )
    )
  )
)
