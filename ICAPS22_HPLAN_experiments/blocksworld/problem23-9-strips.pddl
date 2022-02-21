( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b518 - block
    b374 - block
    b937 - block
    b965 - block
    b145 - block
    b406 - block
    b163 - block
    b314 - block
    b619 - block
    b544 - block
    b482 - block
    b260 - block
    b718 - block
    b248 - block
    b573 - block
    b666 - block
    b767 - block
    b702 - block
    b636 - block
    b292 - block
    b554 - block
    b29 - block
    b737 - block
    b766 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b518 )
    ( on b374 b518 )
    ( on b937 b374 )
    ( on b965 b937 )
    ( on b145 b965 )
    ( on b406 b145 )
    ( on b163 b406 )
    ( on b314 b163 )
    ( on b619 b314 )
    ( on b544 b619 )
    ( on b482 b544 )
    ( on b260 b482 )
    ( on b718 b260 )
    ( on b248 b718 )
    ( on b573 b248 )
    ( on b666 b573 )
    ( on b767 b666 )
    ( on b702 b767 )
    ( on b636 b702 )
    ( on b292 b636 )
    ( on b554 b292 )
    ( on b29 b554 )
    ( on b737 b29 )
    ( on b766 b737 )
    ( clear b766 )
  )
  ( :goal
    ( and
      ( clear b518 )
    )
  )
)
