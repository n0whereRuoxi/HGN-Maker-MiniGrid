( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b761 - block
    b180 - block
    b617 - block
    b978 - block
    b427 - block
    b89 - block
    b711 - block
    b308 - block
    b189 - block
    b231 - block
    b392 - block
    b323 - block
    b328 - block
    b141 - block
    b566 - block
    b695 - block
    b211 - block
    b517 - block
    b758 - block
    b257 - block
    b903 - block
    b379 - block
    b783 - block
    b131 - block
    b719 - block
    b496 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b761 )
    ( on b180 b761 )
    ( on b617 b180 )
    ( on b978 b617 )
    ( on b427 b978 )
    ( on b89 b427 )
    ( on b711 b89 )
    ( on b308 b711 )
    ( on b189 b308 )
    ( on b231 b189 )
    ( on b392 b231 )
    ( on b323 b392 )
    ( on b328 b323 )
    ( on b141 b328 )
    ( on b566 b141 )
    ( on b695 b566 )
    ( on b211 b695 )
    ( on b517 b211 )
    ( on b758 b517 )
    ( on b257 b758 )
    ( on b903 b257 )
    ( on b379 b903 )
    ( on b783 b379 )
    ( on b131 b783 )
    ( on b719 b131 )
    ( on b496 b719 )
    ( clear b496 )
  )
  ( :goal
    ( and
      ( clear b761 )
    )
  )
)
