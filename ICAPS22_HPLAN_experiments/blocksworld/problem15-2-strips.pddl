( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b390 - block
    b49 - block
    b604 - block
    b861 - block
    b21 - block
    b477 - block
    b236 - block
    b580 - block
    b306 - block
    b373 - block
    b731 - block
    b619 - block
    b528 - block
    b231 - block
    b81 - block
    b215 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b390 )
    ( on b49 b390 )
    ( on b604 b49 )
    ( on b861 b604 )
    ( on b21 b861 )
    ( on b477 b21 )
    ( on b236 b477 )
    ( on b580 b236 )
    ( on b306 b580 )
    ( on b373 b306 )
    ( on b731 b373 )
    ( on b619 b731 )
    ( on b528 b619 )
    ( on b231 b528 )
    ( on b81 b231 )
    ( on b215 b81 )
    ( clear b215 )
  )
  ( :goal
    ( and
      ( clear b390 )
    )
  )
)
