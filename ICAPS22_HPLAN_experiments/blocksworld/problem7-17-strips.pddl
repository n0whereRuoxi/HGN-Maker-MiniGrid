( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b29 - block
    b74 - block
    b666 - block
    b372 - block
    b882 - block
    b133 - block
    b825 - block
    b747 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b29 )
    ( on b74 b29 )
    ( on b666 b74 )
    ( on b372 b666 )
    ( on b882 b372 )
    ( on b133 b882 )
    ( on b825 b133 )
    ( on b747 b825 )
    ( clear b747 )
  )
  ( :goal
    ( and
      ( clear b29 )
    )
  )
)
