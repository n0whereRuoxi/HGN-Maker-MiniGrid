( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b658 - block
    b11 - block
    b283 - block
    b255 - block
    b32 - block
    b754 - block
    b600 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b658 )
    ( on b11 b658 )
    ( on b283 b11 )
    ( on b255 b283 )
    ( on b32 b255 )
    ( on b754 b32 )
    ( on b600 b754 )
    ( clear b600 )
  )
  ( :goal
    ( and
      ( clear b658 )
    )
  )
)
