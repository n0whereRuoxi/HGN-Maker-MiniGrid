( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b85 - block
    b807 - block
    b883 - block
    b755 - block
    b56 - block
    b401 - block
    b546 - block
    b907 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b85 )
    ( on b807 b85 )
    ( on b883 b807 )
    ( on b755 b883 )
    ( on b56 b755 )
    ( on b401 b56 )
    ( on b546 b401 )
    ( on b907 b546 )
    ( clear b907 )
  )
  ( :goal
    ( and
      ( clear b85 )
    )
  )
)
