( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b394 - block
    b599 - block
    b886 - block
    b625 - block
    b686 - block
    b951 - block
    b487 - block
    b260 - block
    b946 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b394 )
    ( on b599 b394 )
    ( on b886 b599 )
    ( on b625 b886 )
    ( on b686 b625 )
    ( on b951 b686 )
    ( on b487 b951 )
    ( on b260 b487 )
    ( on b946 b260 )
    ( clear b946 )
  )
  ( :goal
    ( and
      ( clear b394 )
    )
  )
)
