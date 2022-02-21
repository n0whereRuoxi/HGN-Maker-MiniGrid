( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b84 - block
    b485 - block
    b294 - block
    b395 - block
    b994 - block
    b378 - block
    b611 - block
    b369 - block
    b426 - block
    b990 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b84 )
    ( on b485 b84 )
    ( on b294 b485 )
    ( on b395 b294 )
    ( on b994 b395 )
    ( on b378 b994 )
    ( on b611 b378 )
    ( on b369 b611 )
    ( on b426 b369 )
    ( on b990 b426 )
    ( clear b990 )
  )
  ( :goal
    ( and
      ( clear b84 )
    )
  )
)
