( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b304 - block
    b896 - block
    b611 - block
    b392 - block
    b370 - block
    b291 - block
    b851 - block
    b62 - block
    b422 - block
    b535 - block
    b695 - block
    b162 - block
    b880 - block
    b946 - block
    b731 - block
    b99 - block
    b972 - block
    b314 - block
    b969 - block
    b329 - block
    b255 - block
    b829 - block
    b636 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b304 )
    ( on b896 b304 )
    ( on b611 b896 )
    ( on b392 b611 )
    ( on b370 b392 )
    ( on b291 b370 )
    ( on b851 b291 )
    ( on b62 b851 )
    ( on b422 b62 )
    ( on b535 b422 )
    ( on b695 b535 )
    ( on b162 b695 )
    ( on b880 b162 )
    ( on b946 b880 )
    ( on b731 b946 )
    ( on b99 b731 )
    ( on b972 b99 )
    ( on b314 b972 )
    ( on b969 b314 )
    ( on b329 b969 )
    ( on b255 b329 )
    ( on b829 b255 )
    ( on b636 b829 )
    ( clear b636 )
  )
  ( :goal
    ( and
      ( clear b304 )
    )
  )
)
