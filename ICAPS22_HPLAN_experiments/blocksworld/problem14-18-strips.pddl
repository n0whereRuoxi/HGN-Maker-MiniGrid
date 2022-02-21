( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b536 - block
    b657 - block
    b39 - block
    b417 - block
    b871 - block
    b623 - block
    b104 - block
    b624 - block
    b461 - block
    b263 - block
    b161 - block
    b224 - block
    b399 - block
    b633 - block
    b136 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b536 )
    ( on b657 b536 )
    ( on b39 b657 )
    ( on b417 b39 )
    ( on b871 b417 )
    ( on b623 b871 )
    ( on b104 b623 )
    ( on b624 b104 )
    ( on b461 b624 )
    ( on b263 b461 )
    ( on b161 b263 )
    ( on b224 b161 )
    ( on b399 b224 )
    ( on b633 b399 )
    ( on b136 b633 )
    ( clear b136 )
  )
  ( :goal
    ( and
      ( clear b536 )
    )
  )
)
