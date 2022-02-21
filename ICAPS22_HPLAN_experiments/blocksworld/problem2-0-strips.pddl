( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b547 - block
    b453 - block
    b952 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b547 )
    ( on b453 b547 )
    ( on b952 b453 )
    ( clear b952 )
  )
  ( :goal
    ( and
      ( clear b547 )
      ( clear b547 )
      ( clear b547 )
    )
  )
)
