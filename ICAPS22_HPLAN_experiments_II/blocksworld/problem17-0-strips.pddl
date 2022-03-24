( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b798 - block
    b904 - block
    b151 - block
    b699 - block
    b395 - block
    b731 - block
    b647 - block
    b769 - block
    b611 - block
    b100 - block
    b922 - block
    b282 - block
    b148 - block
    b805 - block
    b526 - block
    b382 - block
    b711 - block
    b348 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b798 )
    ( on b904 b798 )
    ( on b151 b904 )
    ( on b699 b151 )
    ( on b395 b699 )
    ( on b731 b395 )
    ( on b647 b731 )
    ( on b769 b647 )
    ( on b611 b769 )
    ( on b100 b611 )
    ( on b922 b100 )
    ( on b282 b922 )
    ( on b148 b282 )
    ( on b805 b148 )
    ( on b526 b805 )
    ( on b382 b526 )
    ( on b711 b382 )
    ( on b348 b711 )
    ( clear b348 )
  )
  ( :goal
    ( and
      ( clear b798 )
    )
  )
)
