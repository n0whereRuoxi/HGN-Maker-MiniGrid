( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b582 - block
    b408 - block
    b9 - block
    b665 - block
    b955 - block
    b413 - block
    b34 - block
    b972 - block
    b510 - block
    b305 - block
    b976 - block
    b497 - block
    b417 - block
    b763 - block
    b23 - block
    b256 - block
    b187 - block
    b35 - block
    b358 - block
    b944 - block
    b209 - block
    b881 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b582 )
    ( on b408 b582 )
    ( on b9 b408 )
    ( on b665 b9 )
    ( on b955 b665 )
    ( on b413 b955 )
    ( on b34 b413 )
    ( on b972 b34 )
    ( on b510 b972 )
    ( on b305 b510 )
    ( on b976 b305 )
    ( on b497 b976 )
    ( on b417 b497 )
    ( on b763 b417 )
    ( on b23 b763 )
    ( on b256 b23 )
    ( on b187 b256 )
    ( on b35 b187 )
    ( on b358 b35 )
    ( on b944 b358 )
    ( on b209 b944 )
    ( on b881 b209 )
    ( clear b881 )
  )
  ( :goal
    ( and
      ( clear b582 )
    )
  )
)
