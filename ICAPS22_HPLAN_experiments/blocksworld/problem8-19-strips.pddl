( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b521 - block
    b872 - block
    b443 - block
    b344 - block
    b363 - block
    b863 - block
    b937 - block
    b699 - block
    b944 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b521 )
    ( on b872 b521 )
    ( on b443 b872 )
    ( on b344 b443 )
    ( on b363 b344 )
    ( on b863 b363 )
    ( on b937 b863 )
    ( on b699 b937 )
    ( on b944 b699 )
    ( clear b944 )
  )
  ( :goal
    ( and
      ( clear b521 )
    )
  )
)
