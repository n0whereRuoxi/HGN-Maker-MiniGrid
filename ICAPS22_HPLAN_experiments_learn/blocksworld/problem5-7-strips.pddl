( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b930 - block
    b893 - block
    b718 - block
    b262 - block
    b495 - block
    b487 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b930 )
    ( on b893 b930 )
    ( on b718 b893 )
    ( on b262 b718 )
    ( on b495 b262 )
    ( on b487 b495 )
    ( clear b487 )
  )
  ( :goal
    ( and
      ( clear b930 )
    )
  )
)
