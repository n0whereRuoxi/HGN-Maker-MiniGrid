( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b687 - block
    b112 - block
    b280 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b687 )
    ( on b112 b687 )
    ( on b280 b112 )
    ( clear b280 )
  )
  ( :goal
    ( and
      ( clear b687 )
    )
  )
)
