( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b662 - block
    b687 - block
    b873 - block
    b831 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b662 )
    ( on b687 b662 )
    ( on b873 b687 )
    ( on b831 b873 )
    ( clear b831 )
  )
  ( :goal
    ( and
      ( clear b662 )
    )
  )
)
