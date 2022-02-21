( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b664 - block
    b51 - block
    b260 - block
    b80 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b664 )
    ( on b51 b664 )
    ( on b260 b51 )
    ( on b80 b260 )
    ( clear b80 )
  )
  ( :goal
    ( and
      ( clear b664 )
    )
  )
)
