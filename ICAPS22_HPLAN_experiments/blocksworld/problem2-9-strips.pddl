( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b26 - block
    b864 - block
    b594 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b26 )
    ( on b864 b26 )
    ( on b594 b864 )
    ( clear b594 )
  )
  ( :goal
    ( and
      ( clear b26 )
      ( clear b26 )
      ( clear b26 )
    )
  )
)
