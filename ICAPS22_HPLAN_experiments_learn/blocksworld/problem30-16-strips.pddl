( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b405 - block
    b737 - block
    b475 - block
    b381 - block
    b328 - block
    b978 - block
    b194 - block
    b453 - block
    b603 - block
    b136 - block
    b39 - block
    b18 - block
    b363 - block
    b816 - block
    b907 - block
    b241 - block
    b49 - block
    b385 - block
    b291 - block
    b29 - block
    b100 - block
    b209 - block
    b179 - block
    b717 - block
    b199 - block
    b771 - block
    b847 - block
    b238 - block
    b175 - block
    b88 - block
    b520 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b405 )
    ( on b737 b405 )
    ( on b475 b737 )
    ( on b381 b475 )
    ( on b328 b381 )
    ( on b978 b328 )
    ( on b194 b978 )
    ( on b453 b194 )
    ( on b603 b453 )
    ( on b136 b603 )
    ( on b39 b136 )
    ( on b18 b39 )
    ( on b363 b18 )
    ( on b816 b363 )
    ( on b907 b816 )
    ( on b241 b907 )
    ( on b49 b241 )
    ( on b385 b49 )
    ( on b291 b385 )
    ( on b29 b291 )
    ( on b100 b29 )
    ( on b209 b100 )
    ( on b179 b209 )
    ( on b717 b179 )
    ( on b199 b717 )
    ( on b771 b199 )
    ( on b847 b771 )
    ( on b238 b847 )
    ( on b175 b238 )
    ( on b88 b175 )
    ( on b520 b88 )
    ( clear b520 )
  )
  ( :goal
    ( and
      ( clear b405 )
    )
  )
)
