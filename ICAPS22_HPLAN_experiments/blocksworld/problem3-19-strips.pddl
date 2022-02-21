( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b887 - block
    b661 - block
    b480 - block
    b488 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b887 )
    ( on b661 b887 )
    ( on b480 b661 )
    ( on b488 b480 )
    ( clear b488 )
  )
  ( :goal
    ( and
      ( clear b887 )
    )
  )
)
