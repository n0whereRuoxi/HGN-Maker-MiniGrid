( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b572 - block
    b156 - block
    b197 - block
    b44 - block
    b836 - block
    b647 - block
    b135 - block
    b263 - block
    b289 - block
    b527 - block
    b281 - block
    b718 - block
    b832 - block
    b437 - block
    b238 - block
    b429 - block
    b878 - block
    b818 - block
    b472 - block
    b183 - block
    b693 - block
    b108 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b572 )
    ( on b156 b572 )
    ( on b197 b156 )
    ( on b44 b197 )
    ( on b836 b44 )
    ( on b647 b836 )
    ( on b135 b647 )
    ( on b263 b135 )
    ( on b289 b263 )
    ( on b527 b289 )
    ( on b281 b527 )
    ( on b718 b281 )
    ( on b832 b718 )
    ( on b437 b832 )
    ( on b238 b437 )
    ( on b429 b238 )
    ( on b878 b429 )
    ( on b818 b878 )
    ( on b472 b818 )
    ( on b183 b472 )
    ( on b693 b183 )
    ( on b108 b693 )
    ( clear b108 )
  )
  ( :goal
    ( and
      ( clear b572 )
    )
  )
)
