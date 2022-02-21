( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b40 - block
    b829 - block
    b392 - block
    b206 - block
    b235 - block
    b128 - block
    b599 - block
    b11 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b40 )
    ( on b829 b40 )
    ( on b392 b829 )
    ( on b206 b392 )
    ( on b235 b206 )
    ( on b128 b235 )
    ( on b599 b128 )
    ( on b11 b599 )
    ( clear b11 )
  )
  ( :goal
    ( and
      ( clear b40 )
    )
  )
)
