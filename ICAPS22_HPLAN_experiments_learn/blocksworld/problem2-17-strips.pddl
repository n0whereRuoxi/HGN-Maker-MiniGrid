( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b424 - block
    b799 - block
    b193 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b424 )
    ( on b799 b424 )
    ( on b193 b799 )
    ( clear b193 )
  )
  ( :goal
    ( and
      ( clear b424 )
    )
  )
)
