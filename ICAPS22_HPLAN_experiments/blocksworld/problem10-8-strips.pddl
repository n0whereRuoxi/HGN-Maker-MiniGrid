( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b423 - block
    b576 - block
    b835 - block
    b982 - block
    b11 - block
    b585 - block
    b467 - block
    b501 - block
    b92 - block
    b223 - block
    b90 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b423 )
    ( on b576 b423 )
    ( on b835 b576 )
    ( on b982 b835 )
    ( on b11 b982 )
    ( on b585 b11 )
    ( on b467 b585 )
    ( on b501 b467 )
    ( on b92 b501 )
    ( on b223 b92 )
    ( on b90 b223 )
    ( clear b90 )
  )
  ( :goal
    ( and
      ( clear b423 )
    )
  )
)
