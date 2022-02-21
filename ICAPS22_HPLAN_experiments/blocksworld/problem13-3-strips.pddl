( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b485 - block
    b398 - block
    b501 - block
    b884 - block
    b660 - block
    b731 - block
    b655 - block
    b757 - block
    b541 - block
    b210 - block
    b905 - block
    b951 - block
    b748 - block
    b737 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b485 )
    ( on b398 b485 )
    ( on b501 b398 )
    ( on b884 b501 )
    ( on b660 b884 )
    ( on b731 b660 )
    ( on b655 b731 )
    ( on b757 b655 )
    ( on b541 b757 )
    ( on b210 b541 )
    ( on b905 b210 )
    ( on b951 b905 )
    ( on b748 b951 )
    ( on b737 b748 )
    ( clear b737 )
  )
  ( :goal
    ( and
      ( clear b485 )
    )
  )
)
