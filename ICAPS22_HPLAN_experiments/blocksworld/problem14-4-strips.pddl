( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b59 - block
    b807 - block
    b735 - block
    b341 - block
    b424 - block
    b680 - block
    b840 - block
    b453 - block
    b926 - block
    b971 - block
    b329 - block
    b979 - block
    b645 - block
    b994 - block
    b752 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b59 )
    ( on b807 b59 )
    ( on b735 b807 )
    ( on b341 b735 )
    ( on b424 b341 )
    ( on b680 b424 )
    ( on b840 b680 )
    ( on b453 b840 )
    ( on b926 b453 )
    ( on b971 b926 )
    ( on b329 b971 )
    ( on b979 b329 )
    ( on b645 b979 )
    ( on b994 b645 )
    ( on b752 b994 )
    ( clear b752 )
  )
  ( :goal
    ( and
      ( clear b59 )
    )
  )
)
