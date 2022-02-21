( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b482 - block
    b55 - block
    b104 - block
    b159 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b482 )
    ( on b55 b482 )
    ( on b104 b55 )
    ( on b159 b104 )
    ( clear b159 )
  )
  ( :goal
    ( and
      ( clear b482 )
      ( clear b482 )
      ( clear b482 )
      ( clear b482 )
    )
  )
)
