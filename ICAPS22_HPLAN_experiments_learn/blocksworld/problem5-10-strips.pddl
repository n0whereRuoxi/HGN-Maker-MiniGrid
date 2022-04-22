( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b69 - block
    b899 - block
    b500 - block
    b537 - block
    b16 - block
    b118 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b69 )
    ( on b899 b69 )
    ( on b500 b899 )
    ( on b537 b500 )
    ( on b16 b537 )
    ( on b118 b16 )
    ( clear b118 )
  )
  ( :goal
    ( and
      ( clear b69 )
    )
  )
)
