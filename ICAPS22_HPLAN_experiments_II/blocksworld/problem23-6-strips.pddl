( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b408 - block
    b720 - block
    b622 - block
    b861 - block
    b958 - block
    b88 - block
    b139 - block
    b983 - block
    b929 - block
    b232 - block
    b839 - block
    b511 - block
    b938 - block
    b815 - block
    b210 - block
    b976 - block
    b378 - block
    b337 - block
    b565 - block
    b734 - block
    b414 - block
    b892 - block
    b383 - block
    b14 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b408 )
    ( on b720 b408 )
    ( on b622 b720 )
    ( on b861 b622 )
    ( on b958 b861 )
    ( on b88 b958 )
    ( on b139 b88 )
    ( on b983 b139 )
    ( on b929 b983 )
    ( on b232 b929 )
    ( on b839 b232 )
    ( on b511 b839 )
    ( on b938 b511 )
    ( on b815 b938 )
    ( on b210 b815 )
    ( on b976 b210 )
    ( on b378 b976 )
    ( on b337 b378 )
    ( on b565 b337 )
    ( on b734 b565 )
    ( on b414 b734 )
    ( on b892 b414 )
    ( on b383 b892 )
    ( on b14 b383 )
    ( clear b14 )
  )
  ( :goal
    ( and
      ( clear b408 )
    )
  )
)
