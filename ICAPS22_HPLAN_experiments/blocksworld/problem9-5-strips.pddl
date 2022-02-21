( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b744 - block
    b561 - block
    b222 - block
    b883 - block
    b44 - block
    b952 - block
    b889 - block
    b33 - block
    b754 - block
    b752 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b744 )
    ( on b561 b744 )
    ( on b222 b561 )
    ( on b883 b222 )
    ( on b44 b883 )
    ( on b952 b44 )
    ( on b889 b952 )
    ( on b33 b889 )
    ( on b754 b33 )
    ( on b752 b754 )
    ( clear b752 )
  )
  ( :goal
    ( and
      ( clear b744 )
    )
  )
)
