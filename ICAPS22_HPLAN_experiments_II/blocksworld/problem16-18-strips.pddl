( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b100 - block
    b217 - block
    b845 - block
    b44 - block
    b499 - block
    b287 - block
    b679 - block
    b441 - block
    b548 - block
    b33 - block
    b78 - block
    b147 - block
    b352 - block
    b124 - block
    b26 - block
    b859 - block
    b460 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b100 )
    ( on b217 b100 )
    ( on b845 b217 )
    ( on b44 b845 )
    ( on b499 b44 )
    ( on b287 b499 )
    ( on b679 b287 )
    ( on b441 b679 )
    ( on b548 b441 )
    ( on b33 b548 )
    ( on b78 b33 )
    ( on b147 b78 )
    ( on b352 b147 )
    ( on b124 b352 )
    ( on b26 b124 )
    ( on b859 b26 )
    ( on b460 b859 )
    ( clear b460 )
  )
  ( :goal
    ( and
      ( clear b100 )
    )
  )
)
