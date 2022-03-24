( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b254 - block
    b951 - block
    b286 - block
    b678 - block
    b423 - block
    b361 - block
    b279 - block
    b368 - block
    b181 - block
    b317 - block
    b510 - block
    b204 - block
    b116 - block
    b196 - block
    b111 - block
    b982 - block
    b332 - block
    b803 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b254 )
    ( on b951 b254 )
    ( on b286 b951 )
    ( on b678 b286 )
    ( on b423 b678 )
    ( on b361 b423 )
    ( on b279 b361 )
    ( on b368 b279 )
    ( on b181 b368 )
    ( on b317 b181 )
    ( on b510 b317 )
    ( on b204 b510 )
    ( on b116 b204 )
    ( on b196 b116 )
    ( on b111 b196 )
    ( on b982 b111 )
    ( on b332 b982 )
    ( on b803 b332 )
    ( clear b803 )
  )
  ( :goal
    ( and
      ( clear b254 )
    )
  )
)
