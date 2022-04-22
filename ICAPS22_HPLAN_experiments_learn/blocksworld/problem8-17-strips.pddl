( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b970 - block
    b611 - block
    b54 - block
    b148 - block
    b143 - block
    b453 - block
    b246 - block
    b154 - block
    b935 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b970 )
    ( on b611 b970 )
    ( on b54 b611 )
    ( on b148 b54 )
    ( on b143 b148 )
    ( on b453 b143 )
    ( on b246 b453 )
    ( on b154 b246 )
    ( on b935 b154 )
    ( clear b935 )
  )
  ( :goal
    ( and
      ( clear b970 )
    )
  )
)
