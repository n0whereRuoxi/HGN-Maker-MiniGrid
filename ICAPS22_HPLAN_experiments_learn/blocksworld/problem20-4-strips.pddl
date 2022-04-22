( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b706 - block
    b438 - block
    b544 - block
    b739 - block
    b398 - block
    b190 - block
    b948 - block
    b120 - block
    b610 - block
    b924 - block
    b834 - block
    b659 - block
    b265 - block
    b83 - block
    b242 - block
    b174 - block
    b72 - block
    b533 - block
    b786 - block
    b270 - block
    b67 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b706 )
    ( on b438 b706 )
    ( on b544 b438 )
    ( on b739 b544 )
    ( on b398 b739 )
    ( on b190 b398 )
    ( on b948 b190 )
    ( on b120 b948 )
    ( on b610 b120 )
    ( on b924 b610 )
    ( on b834 b924 )
    ( on b659 b834 )
    ( on b265 b659 )
    ( on b83 b265 )
    ( on b242 b83 )
    ( on b174 b242 )
    ( on b72 b174 )
    ( on b533 b72 )
    ( on b786 b533 )
    ( on b270 b786 )
    ( on b67 b270 )
    ( clear b67 )
  )
  ( :goal
    ( and
      ( clear b706 )
    )
  )
)
