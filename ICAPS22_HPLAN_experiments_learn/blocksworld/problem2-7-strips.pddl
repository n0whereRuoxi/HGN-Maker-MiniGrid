( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b164 - block
    b145 - block
    b23 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b164 )
    ( on b145 b164 )
    ( on b23 b145 )
    ( clear b23 )
  )
  ( :goal
    ( and
      ( clear b164 )
    )
  )
)
