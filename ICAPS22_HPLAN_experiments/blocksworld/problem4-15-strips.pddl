( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b138 - block
    b241 - block
    b429 - block
    b500 - block
    b418 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b138 )
    ( on b241 b138 )
    ( on b429 b241 )
    ( on b500 b429 )
    ( on b418 b500 )
    ( clear b418 )
  )
  ( :goal
    ( and
      ( clear b138 )
      ( clear b138 )
      ( clear b138 )
      ( clear b138 )
      ( clear b138 )
    )
  )
)
