( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b418 - block
    b7 - block
    b583 - block
    b496 - block
    b856 - block
    b972 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b418 )
    ( on b7 b418 )
    ( on b583 b7 )
    ( on b496 b583 )
    ( on b856 b496 )
    ( on b972 b856 )
    ( clear b972 )
  )
  ( :goal
    ( and
      ( clear b418 )
    )
  )
)
