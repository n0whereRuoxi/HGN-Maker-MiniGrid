( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b826 - block
    b327 - block
    b855 - block
    b660 - block
    b232 - block
    b24 - block
    b539 - block
    b436 - block
    b555 - block
    b494 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b826 )
    ( on b327 b826 )
    ( on b855 b327 )
    ( on b660 b855 )
    ( on b232 b660 )
    ( on b24 b232 )
    ( on b539 b24 )
    ( on b436 b539 )
    ( on b555 b436 )
    ( on b494 b555 )
    ( clear b494 )
  )
  ( :goal
    ( and
      ( clear b826 )
    )
  )
)
