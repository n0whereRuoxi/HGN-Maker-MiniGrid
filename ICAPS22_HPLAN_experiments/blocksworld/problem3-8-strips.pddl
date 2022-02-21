( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b674 - block
    b827 - block
    b57 - block
    b662 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b674 )
    ( on b827 b674 )
    ( on b57 b827 )
    ( on b662 b57 )
    ( clear b662 )
  )
  ( :goal
    ( and
      ( clear b674 )
    )
  )
)
