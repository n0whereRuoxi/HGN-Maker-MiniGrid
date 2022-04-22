( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b49 - block
    b493 - block
    b437 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b49 )
    ( on b493 b49 )
    ( on b437 b493 )
    ( clear b437 )
  )
  ( :goal
    ( and
      ( clear b49 )
    )
  )
)
