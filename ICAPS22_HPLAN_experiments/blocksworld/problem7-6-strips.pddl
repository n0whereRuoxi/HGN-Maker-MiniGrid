( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b763 - block
    b423 - block
    b310 - block
    b106 - block
    b333 - block
    b815 - block
    b215 - block
    b829 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b763 )
    ( on b423 b763 )
    ( on b310 b423 )
    ( on b106 b310 )
    ( on b333 b106 )
    ( on b815 b333 )
    ( on b215 b815 )
    ( on b829 b215 )
    ( clear b829 )
  )
  ( :goal
    ( and
      ( clear b763 )
    )
  )
)
