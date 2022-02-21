( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b548 - block
    b106 - block
    b519 - block
    b239 - block
    b100 - block
    b827 - block
    b418 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b548 )
    ( on b106 b548 )
    ( on b519 b106 )
    ( on b239 b519 )
    ( on b100 b239 )
    ( on b827 b100 )
    ( on b418 b827 )
    ( clear b418 )
  )
  ( :goal
    ( and
      ( clear b548 )
      ( clear b548 )
      ( clear b548 )
      ( clear b548 )
      ( clear b548 )
      ( clear b548 )
      ( clear b548 )
    )
  )
)
