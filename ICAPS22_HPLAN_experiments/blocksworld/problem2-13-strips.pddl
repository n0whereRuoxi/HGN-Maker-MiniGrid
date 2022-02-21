( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b370 - block
    b340 - block
    b174 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b370 )
    ( on b340 b370 )
    ( on b174 b340 )
    ( clear b174 )
  )
  ( :goal
    ( and
      ( clear b370 )
      ( clear b370 )
      ( clear b370 )
    )
  )
)
