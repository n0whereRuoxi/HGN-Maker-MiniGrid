( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b515 - block
    b553 - block
    b878 - block
    b772 - block
    b29 - block
    b443 - block
    b733 - block
    b939 - block
    b976 - block
    b242 - block
    b474 - block
    b502 - block
    b714 - block
    b615 - block
    b801 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b515 )
    ( on b553 b515 )
    ( on b878 b553 )
    ( on b772 b878 )
    ( on b29 b772 )
    ( on b443 b29 )
    ( on b733 b443 )
    ( on b939 b733 )
    ( on b976 b939 )
    ( on b242 b976 )
    ( on b474 b242 )
    ( on b502 b474 )
    ( on b714 b502 )
    ( on b615 b714 )
    ( on b801 b615 )
    ( clear b801 )
  )
  ( :goal
    ( and
      ( clear b515 )
    )
  )
)
