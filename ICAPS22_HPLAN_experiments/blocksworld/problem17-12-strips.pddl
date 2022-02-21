( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b387 - block
    b16 - block
    b345 - block
    b811 - block
    b677 - block
    b404 - block
    b267 - block
    b485 - block
    b605 - block
    b995 - block
    b963 - block
    b663 - block
    b524 - block
    b95 - block
    b468 - block
    b158 - block
    b328 - block
    b798 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b387 )
    ( on b16 b387 )
    ( on b345 b16 )
    ( on b811 b345 )
    ( on b677 b811 )
    ( on b404 b677 )
    ( on b267 b404 )
    ( on b485 b267 )
    ( on b605 b485 )
    ( on b995 b605 )
    ( on b963 b995 )
    ( on b663 b963 )
    ( on b524 b663 )
    ( on b95 b524 )
    ( on b468 b95 )
    ( on b158 b468 )
    ( on b328 b158 )
    ( on b798 b328 )
    ( clear b798 )
  )
  ( :goal
    ( and
      ( clear b387 )
    )
  )
)
