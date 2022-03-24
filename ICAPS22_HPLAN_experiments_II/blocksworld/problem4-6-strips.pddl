( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b343 - block
    b138 - block
    b263 - block
    b561 - block
    b110 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b343 )
    ( on b138 b343 )
    ( on b263 b138 )
    ( on b561 b263 )
    ( on b110 b561 )
    ( clear b110 )
  )
  ( :goal
    ( and
      ( clear b343 )
    )
  )
)
