( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b792 - block
    b160 - block
    b998 - block
    b494 - block
    b107 - block
    b353 - block
    b886 - block
    b20 - block
    b254 - block
    b929 - block
    b93 - block
    b427 - block
    b414 - block
    b422 - block
    b441 - block
    b515 - block
    b972 - block
    b320 - block
    b824 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b792 )
    ( on b160 b792 )
    ( on b998 b160 )
    ( on b494 b998 )
    ( on b107 b494 )
    ( on b353 b107 )
    ( on b886 b353 )
    ( on b20 b886 )
    ( on b254 b20 )
    ( on b929 b254 )
    ( on b93 b929 )
    ( on b427 b93 )
    ( on b414 b427 )
    ( on b422 b414 )
    ( on b441 b422 )
    ( on b515 b441 )
    ( on b972 b515 )
    ( on b320 b972 )
    ( on b824 b320 )
    ( clear b824 )
  )
  ( :goal
    ( and
      ( clear b792 )
    )
  )
)
