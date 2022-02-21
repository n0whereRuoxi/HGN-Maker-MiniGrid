( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b70 - block
    b142 - block
    b91 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b70 )
    ( on b142 b70 )
    ( on b91 b142 )
    ( clear b91 )
  )
  ( :goal
    ( and
      ( clear b70 )
    )
  )
)
