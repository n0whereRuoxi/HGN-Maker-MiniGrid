( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b701 - block
    b328 - block
    b329 - block
    b803 - block
    b717 - block
    b6 - block
    b201 - block
    b979 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b701 )
    ( on b328 b701 )
    ( on b329 b328 )
    ( on b803 b329 )
    ( on b717 b803 )
    ( on b6 b717 )
    ( on b201 b6 )
    ( on b979 b201 )
    ( clear b979 )
  )
  ( :goal
    ( and
      ( clear b701 )
    )
  )
)
