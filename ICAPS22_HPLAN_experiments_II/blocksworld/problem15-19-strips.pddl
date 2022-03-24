( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b788 - block
    b569 - block
    b341 - block
    b459 - block
    b73 - block
    b967 - block
    b735 - block
    b53 - block
    b364 - block
    b475 - block
    b804 - block
    b365 - block
    b898 - block
    b410 - block
    b769 - block
    b36 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b788 )
    ( on b569 b788 )
    ( on b341 b569 )
    ( on b459 b341 )
    ( on b73 b459 )
    ( on b967 b73 )
    ( on b735 b967 )
    ( on b53 b735 )
    ( on b364 b53 )
    ( on b475 b364 )
    ( on b804 b475 )
    ( on b365 b804 )
    ( on b898 b365 )
    ( on b410 b898 )
    ( on b769 b410 )
    ( on b36 b769 )
    ( clear b36 )
  )
  ( :goal
    ( and
      ( clear b788 )
    )
  )
)
