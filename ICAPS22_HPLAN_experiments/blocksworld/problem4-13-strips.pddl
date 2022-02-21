( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b164 - block
    b674 - block
    b883 - block
    b87 - block
    b487 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b164 )
    ( on b674 b164 )
    ( on b883 b674 )
    ( on b87 b883 )
    ( on b487 b87 )
    ( clear b487 )
  )
  ( :goal
    ( and
      ( clear b164 )
    )
  )
)
