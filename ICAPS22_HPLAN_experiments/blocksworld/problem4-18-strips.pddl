( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b596 - block
    b921 - block
    b643 - block
    b96 - block
    b29 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b596 )
    ( on b921 b596 )
    ( on b643 b921 )
    ( on b96 b643 )
    ( on b29 b96 )
    ( clear b29 )
  )
  ( :goal
    ( and
      ( clear b596 )
    )
  )
)
