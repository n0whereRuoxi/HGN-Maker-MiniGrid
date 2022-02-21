( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b678 - block
    b3 - block
    b528 - block
    b49 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b678 )
    ( on b3 b678 )
    ( on b528 b3 )
    ( on b49 b528 )
    ( clear b49 )
  )
  ( :goal
    ( and
      ( clear b678 )
    )
  )
)
