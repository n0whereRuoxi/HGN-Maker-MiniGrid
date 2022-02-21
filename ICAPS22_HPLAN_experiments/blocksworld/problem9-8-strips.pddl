( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b461 - block
    b165 - block
    b334 - block
    b216 - block
    b353 - block
    b4 - block
    b574 - block
    b836 - block
    b601 - block
    b721 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b461 )
    ( on b165 b461 )
    ( on b334 b165 )
    ( on b216 b334 )
    ( on b353 b216 )
    ( on b4 b353 )
    ( on b574 b4 )
    ( on b836 b574 )
    ( on b601 b836 )
    ( on b721 b601 )
    ( clear b721 )
  )
  ( :goal
    ( and
      ( clear b461 )
    )
  )
)
