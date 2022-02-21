( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b314 - block
    b674 - block
    b224 - block
    b227 - block
    b386 - block
    b107 - block
    b19 - block
    b719 - block
    b375 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b314 )
    ( on b674 b314 )
    ( on b224 b674 )
    ( on b227 b224 )
    ( on b386 b227 )
    ( on b107 b386 )
    ( on b19 b107 )
    ( on b719 b19 )
    ( on b375 b719 )
    ( clear b375 )
  )
  ( :goal
    ( and
      ( clear b314 )
    )
  )
)
