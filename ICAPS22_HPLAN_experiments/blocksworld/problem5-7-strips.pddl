( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b867 - block
    b550 - block
    b652 - block
    b857 - block
    b372 - block
    b742 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b867 )
    ( on b550 b867 )
    ( on b652 b550 )
    ( on b857 b652 )
    ( on b372 b857 )
    ( on b742 b372 )
    ( clear b742 )
  )
  ( :goal
    ( and
      ( clear b867 )
    )
  )
)
