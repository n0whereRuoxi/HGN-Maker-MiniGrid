( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b327 - block
    b216 - block
    b144 - block
    b265 - block
    b224 - block
    b300 - block
    b775 - block
    b140 - block
    b234 - block
    b447 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b327 )
    ( on b216 b327 )
    ( on b144 b216 )
    ( on b265 b144 )
    ( on b224 b265 )
    ( on b300 b224 )
    ( on b775 b300 )
    ( on b140 b775 )
    ( on b234 b140 )
    ( on b447 b234 )
    ( clear b447 )
  )
  ( :goal
    ( and
      ( clear b327 )
    )
  )
)
