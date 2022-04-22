( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b342 - block
    b387 - block
    b552 - block
    b991 - block
    b865 - block
    b714 - block
    b16 - block
    b662 - block
    b199 - block
    b920 - block
    b975 - block
    b91 - block
    b45 - block
    b373 - block
    b627 - block
    b903 - block
    b692 - block
    b329 - block
    b33 - block
    b238 - block
    b981 - block
    b491 - block
    b854 - block
    b693 - block
    b557 - block
    b252 - block
    b287 - block
    b983 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b342 )
    ( on b387 b342 )
    ( on b552 b387 )
    ( on b991 b552 )
    ( on b865 b991 )
    ( on b714 b865 )
    ( on b16 b714 )
    ( on b662 b16 )
    ( on b199 b662 )
    ( on b920 b199 )
    ( on b975 b920 )
    ( on b91 b975 )
    ( on b45 b91 )
    ( on b373 b45 )
    ( on b627 b373 )
    ( on b903 b627 )
    ( on b692 b903 )
    ( on b329 b692 )
    ( on b33 b329 )
    ( on b238 b33 )
    ( on b981 b238 )
    ( on b491 b981 )
    ( on b854 b491 )
    ( on b693 b854 )
    ( on b557 b693 )
    ( on b252 b557 )
    ( on b287 b252 )
    ( on b983 b287 )
    ( clear b983 )
  )
  ( :goal
    ( and
      ( clear b342 )
    )
  )
)
