( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b55 - block
    b140 - block
    b422 - block
    b793 - block
    b102 - block
    b410 - block
    b961 - block
    b208 - block
    b860 - block
    b290 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b55 )
    ( on b140 b55 )
    ( on b422 b140 )
    ( on b793 b422 )
    ( on b102 b793 )
    ( on b410 b102 )
    ( on b961 b410 )
    ( on b208 b961 )
    ( on b860 b208 )
    ( on b290 b860 )
    ( clear b290 )
  )
  ( :goal
    ( and
      ( clear b55 )
    )
  )
)
