( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b119 - block
    b167 - block
    b452 - block
    b2 - block
    b538 - block
    b243 - block
    b417 - block
    b338 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b119 )
    ( on b167 b119 )
    ( on b452 b167 )
    ( on b2 b452 )
    ( on b538 b2 )
    ( on b243 b538 )
    ( on b417 b243 )
    ( on b338 b417 )
    ( clear b338 )
  )
  ( :goal
    ( and
      ( clear b119 )
    )
  )
)
