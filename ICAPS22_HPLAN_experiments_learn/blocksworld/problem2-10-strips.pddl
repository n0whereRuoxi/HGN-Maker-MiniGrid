( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b410 - block
    b724 - block
    b137 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b410 )
    ( on b724 b410 )
    ( on b137 b724 )
    ( clear b137 )
  )
  ( :goal
    ( and
      ( clear b410 )
    )
  )
)
