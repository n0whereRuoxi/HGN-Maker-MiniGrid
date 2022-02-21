( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b903 - block
    b286 - block
    b427 - block
    b262 - block
    b574 - block
    b988 - block
    b826 - block
    b482 - block
    b256 - block
    b188 - block
    b468 - block
    b973 - block
    b20 - block
    b254 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b903 )
    ( on b286 b903 )
    ( on b427 b286 )
    ( on b262 b427 )
    ( on b574 b262 )
    ( on b988 b574 )
    ( on b826 b988 )
    ( on b482 b826 )
    ( on b256 b482 )
    ( on b188 b256 )
    ( on b468 b188 )
    ( on b973 b468 )
    ( on b20 b973 )
    ( on b254 b20 )
    ( clear b254 )
  )
  ( :goal
    ( and
      ( clear b903 )
    )
  )
)
