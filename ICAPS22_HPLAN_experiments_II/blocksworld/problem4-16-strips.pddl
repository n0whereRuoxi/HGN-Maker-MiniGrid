( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b136 - block
    b580 - block
    b778 - block
    b200 - block
    b62 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b136 )
    ( on b580 b136 )
    ( on b778 b580 )
    ( on b200 b778 )
    ( on b62 b200 )
    ( clear b62 )
  )
  ( :goal
    ( and
      ( clear b136 )
    )
  )
)
