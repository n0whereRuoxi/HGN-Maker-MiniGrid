( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b298 - block
    b760 - block
    b635 - block
    b780 - block
    b731 - block
    b673 - block
    b851 - block
    b26 - block
    b344 - block
    b775 - block
    b790 - block
    b141 - block
    b719 - block
    b528 - block
    b730 - block
    b289 - block
    b169 - block
    b468 - block
    b56 - block
    b990 - block
    b333 - block
    b293 - block
    b156 - block
    b884 - block
    b712 - block
    b932 - block
    b860 - block
    b938 - block
    b74 - block
    b953 - block
    b834 - block
    b441 - block
    b667 - block
    b397 - block
    b623 - block
    b927 - block
    b983 - block
    b426 - block
    b573 - block
    b936 - block
    b759 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b298 )
    ( on b760 b298 )
    ( on b635 b760 )
    ( on b780 b635 )
    ( on b731 b780 )
    ( on b673 b731 )
    ( on b851 b673 )
    ( on b26 b851 )
    ( on b344 b26 )
    ( on b775 b344 )
    ( on b790 b775 )
    ( on b141 b790 )
    ( on b719 b141 )
    ( on b528 b719 )
    ( on b730 b528 )
    ( on b289 b730 )
    ( on b169 b289 )
    ( on b468 b169 )
    ( on b56 b468 )
    ( on b990 b56 )
    ( on b333 b990 )
    ( on b293 b333 )
    ( on b156 b293 )
    ( on b884 b156 )
    ( on b712 b884 )
    ( on b932 b712 )
    ( on b860 b932 )
    ( on b938 b860 )
    ( on b74 b938 )
    ( on b953 b74 )
    ( on b834 b953 )
    ( on b441 b834 )
    ( on b667 b441 )
    ( on b397 b667 )
    ( on b623 b397 )
    ( on b927 b623 )
    ( on b983 b927 )
    ( on b426 b983 )
    ( on b573 b426 )
    ( on b936 b573 )
    ( on b759 b936 )
    ( clear b759 )
  )
  ( :goal
    ( and
      ( clear b298 )
    )
  )
)
