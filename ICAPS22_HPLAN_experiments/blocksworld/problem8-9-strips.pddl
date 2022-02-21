( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b108 - block
    b832 - block
    b140 - block
    b201 - block
    b236 - block
    b348 - block
    b457 - block
    b939 - block
    b365 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b108 )
    ( on b832 b108 )
    ( on b140 b832 )
    ( on b201 b140 )
    ( on b236 b201 )
    ( on b348 b236 )
    ( on b457 b348 )
    ( on b939 b457 )
    ( on b365 b939 )
    ( clear b365 )
  )
  ( :goal
    ( and
      ( clear b108 )
    )
  )
)
