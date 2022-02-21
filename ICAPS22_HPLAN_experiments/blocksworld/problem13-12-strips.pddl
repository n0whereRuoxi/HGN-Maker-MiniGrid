( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b482 - block
    b461 - block
    b308 - block
    b47 - block
    b194 - block
    b995 - block
    b584 - block
    b211 - block
    b553 - block
    b276 - block
    b367 - block
    b340 - block
    b417 - block
    b263 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b482 )
    ( on b461 b482 )
    ( on b308 b461 )
    ( on b47 b308 )
    ( on b194 b47 )
    ( on b995 b194 )
    ( on b584 b995 )
    ( on b211 b584 )
    ( on b553 b211 )
    ( on b276 b553 )
    ( on b367 b276 )
    ( on b340 b367 )
    ( on b417 b340 )
    ( on b263 b417 )
    ( clear b263 )
  )
  ( :goal
    ( and
      ( clear b482 )
    )
  )
)
