( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b144 - block
    b181 - block
    b79 - block
    b267 - block
    b450 - block
    b862 - block
    b995 - block
    b879 - block
    b553 - block
    b551 - block
    b856 - block
    b754 - block
    b374 - block
    b311 - block
    b864 - block
    b230 - block
    b389 - block
    b94 - block
    b63 - block
    b663 - block
    b799 - block
    b494 - block
    b387 - block
    b485 - block
    b441 - block
    b343 - block
    b294 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b144 )
    ( on b181 b144 )
    ( on b79 b181 )
    ( on b267 b79 )
    ( on b450 b267 )
    ( on b862 b450 )
    ( on b995 b862 )
    ( on b879 b995 )
    ( on b553 b879 )
    ( on b551 b553 )
    ( on b856 b551 )
    ( on b754 b856 )
    ( on b374 b754 )
    ( on b311 b374 )
    ( on b864 b311 )
    ( on b230 b864 )
    ( on b389 b230 )
    ( on b94 b389 )
    ( on b63 b94 )
    ( on b663 b63 )
    ( on b799 b663 )
    ( on b494 b799 )
    ( on b387 b494 )
    ( on b485 b387 )
    ( on b441 b485 )
    ( on b343 b441 )
    ( on b294 b343 )
    ( clear b294 )
  )
  ( :goal
    ( and
      ( clear b144 )
    )
  )
)
