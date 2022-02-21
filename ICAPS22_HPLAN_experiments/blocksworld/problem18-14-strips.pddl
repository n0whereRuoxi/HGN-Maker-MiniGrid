( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b10 - block
    b363 - block
    b252 - block
    b321 - block
    b391 - block
    b421 - block
    b826 - block
    b234 - block
    b880 - block
    b456 - block
    b264 - block
    b400 - block
    b75 - block
    b9 - block
    b203 - block
    b691 - block
    b581 - block
    b981 - block
    b257 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b10 )
    ( on b363 b10 )
    ( on b252 b363 )
    ( on b321 b252 )
    ( on b391 b321 )
    ( on b421 b391 )
    ( on b826 b421 )
    ( on b234 b826 )
    ( on b880 b234 )
    ( on b456 b880 )
    ( on b264 b456 )
    ( on b400 b264 )
    ( on b75 b400 )
    ( on b9 b75 )
    ( on b203 b9 )
    ( on b691 b203 )
    ( on b581 b691 )
    ( on b981 b581 )
    ( on b257 b981 )
    ( clear b257 )
  )
  ( :goal
    ( and
      ( clear b10 )
    )
  )
)
