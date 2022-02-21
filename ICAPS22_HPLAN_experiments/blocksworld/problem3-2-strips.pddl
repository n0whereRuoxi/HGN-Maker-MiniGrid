( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b557 - block
    b917 - block
    b723 - block
    b965 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b557 )
    ( on b917 b557 )
    ( on b723 b917 )
    ( on b965 b723 )
    ( clear b965 )
  )
  ( :goal
    ( and
      ( clear b557 )
    )
  )
)
