( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b631 - block
    b591 - block
    b929 - block
    b238 - block
    b882 - block
    b669 - block
    b144 - block
    b628 - block
    b903 - block
    b235 - block
    b678 - block
    b768 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b631 )
    ( on b591 b631 )
    ( on b929 b591 )
    ( on b238 b929 )
    ( on b882 b238 )
    ( on b669 b882 )
    ( on b144 b669 )
    ( on b628 b144 )
    ( on b903 b628 )
    ( on b235 b903 )
    ( on b678 b235 )
    ( on b768 b678 )
    ( clear b768 )
  )
  ( :goal
    ( and
      ( clear b631 )
    )
  )
)
