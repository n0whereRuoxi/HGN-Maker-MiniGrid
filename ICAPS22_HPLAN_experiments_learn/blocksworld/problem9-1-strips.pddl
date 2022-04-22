( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b340 - block
    b725 - block
    b354 - block
    b274 - block
    b16 - block
    b73 - block
    b159 - block
    b265 - block
    b707 - block
    b414 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b340 )
    ( on b725 b340 )
    ( on b354 b725 )
    ( on b274 b354 )
    ( on b16 b274 )
    ( on b73 b16 )
    ( on b159 b73 )
    ( on b265 b159 )
    ( on b707 b265 )
    ( on b414 b707 )
    ( clear b414 )
  )
  ( :goal
    ( and
      ( clear b340 )
    )
  )
)
