( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b50 - block
    b484 - block
    b916 - block
    b896 - block
    b757 - block
    b486 - block
    b832 - block
    b61 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b50 )
    ( on b484 b50 )
    ( on b916 b484 )
    ( on b896 b916 )
    ( on b757 b896 )
    ( on b486 b757 )
    ( on b832 b486 )
    ( on b61 b832 )
    ( clear b61 )
  )
  ( :goal
    ( and
      ( clear b50 )
    )
  )
)
