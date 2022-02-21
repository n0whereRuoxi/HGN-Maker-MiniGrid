( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b544 - block
    b189 - block
    b964 - block
    b786 - block
    b635 - block
    b744 - block
    b731 - block
    b663 - block
    b102 - block
    b844 - block
    b737 - block
    b203 - block
    b604 - block
    b679 - block
    b998 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b544 )
    ( on b189 b544 )
    ( on b964 b189 )
    ( on b786 b964 )
    ( on b635 b786 )
    ( on b744 b635 )
    ( on b731 b744 )
    ( on b663 b731 )
    ( on b102 b663 )
    ( on b844 b102 )
    ( on b737 b844 )
    ( on b203 b737 )
    ( on b604 b203 )
    ( on b679 b604 )
    ( on b998 b679 )
    ( clear b998 )
  )
  ( :goal
    ( and
      ( clear b544 )
    )
  )
)
