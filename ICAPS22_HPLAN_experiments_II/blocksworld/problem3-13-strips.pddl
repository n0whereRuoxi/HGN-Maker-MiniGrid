( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b787 - block
    b125 - block
    b88 - block
    b704 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b787 )
    ( on b125 b787 )
    ( on b88 b125 )
    ( on b704 b88 )
    ( clear b704 )
  )
  ( :goal
    ( and
      ( clear b787 )
    )
  )
)
