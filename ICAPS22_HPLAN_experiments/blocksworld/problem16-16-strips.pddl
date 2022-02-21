( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b298 - block
    b47 - block
    b253 - block
    b58 - block
    b711 - block
    b337 - block
    b349 - block
    b269 - block
    b840 - block
    b291 - block
    b418 - block
    b767 - block
    b242 - block
    b63 - block
    b959 - block
    b993 - block
    b209 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b298 )
    ( on b47 b298 )
    ( on b253 b47 )
    ( on b58 b253 )
    ( on b711 b58 )
    ( on b337 b711 )
    ( on b349 b337 )
    ( on b269 b349 )
    ( on b840 b269 )
    ( on b291 b840 )
    ( on b418 b291 )
    ( on b767 b418 )
    ( on b242 b767 )
    ( on b63 b242 )
    ( on b959 b63 )
    ( on b993 b959 )
    ( on b209 b993 )
    ( clear b209 )
  )
  ( :goal
    ( and
      ( clear b298 )
    )
  )
)
