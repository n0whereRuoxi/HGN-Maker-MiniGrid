( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b848 - block
    b234 - block
    b327 - block
    b693 - block
    b878 - block
    b459 - block
    b416 - block
    b568 - block
    b148 - block
    b306 - block
    b716 - block
    b114 - block
    b899 - block
    b817 - block
    b401 - block
    b972 - block
    b324 - block
    b103 - block
    b48 - block
    b962 - block
    b642 - block
    b229 - block
    b466 - block
    b62 - block
    b530 - block
    b963 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b848 )
    ( on b234 b848 )
    ( on b327 b234 )
    ( on b693 b327 )
    ( on b878 b693 )
    ( on b459 b878 )
    ( on b416 b459 )
    ( on b568 b416 )
    ( on b148 b568 )
    ( on b306 b148 )
    ( on b716 b306 )
    ( on b114 b716 )
    ( on b899 b114 )
    ( on b817 b899 )
    ( on b401 b817 )
    ( on b972 b401 )
    ( on b324 b972 )
    ( on b103 b324 )
    ( on b48 b103 )
    ( on b962 b48 )
    ( on b642 b962 )
    ( on b229 b642 )
    ( on b466 b229 )
    ( on b62 b466 )
    ( on b530 b62 )
    ( on b963 b530 )
    ( clear b963 )
  )
  ( :goal
    ( and
      ( clear b848 )
    )
  )
)
