( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b836 - block
    b731 - block
    b733 - block
    b990 - block
    b128 - block
    b452 - block
    b981 - block
    b309 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b836 )
    ( on b731 b836 )
    ( on b733 b731 )
    ( on b990 b733 )
    ( on b128 b990 )
    ( on b452 b128 )
    ( on b981 b452 )
    ( on b309 b981 )
    ( clear b309 )
  )
  ( :goal
    ( and
      ( clear b836 )
    )
  )
)
