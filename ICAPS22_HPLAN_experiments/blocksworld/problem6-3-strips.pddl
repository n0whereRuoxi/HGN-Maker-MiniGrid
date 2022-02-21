( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b251 - block
    b159 - block
    b878 - block
    b790 - block
    b976 - block
    b7 - block
    b265 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b251 )
    ( on b159 b251 )
    ( on b878 b159 )
    ( on b790 b878 )
    ( on b976 b790 )
    ( on b7 b976 )
    ( on b265 b7 )
    ( clear b265 )
  )
  ( :goal
    ( and
      ( clear b251 )
    )
  )
)
