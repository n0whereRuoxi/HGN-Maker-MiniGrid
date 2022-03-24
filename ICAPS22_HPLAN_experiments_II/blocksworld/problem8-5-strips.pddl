( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b860 - block
    b675 - block
    b611 - block
    b271 - block
    b603 - block
    b631 - block
    b64 - block
    b763 - block
    b954 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b860 )
    ( on b675 b860 )
    ( on b611 b675 )
    ( on b271 b611 )
    ( on b603 b271 )
    ( on b631 b603 )
    ( on b64 b631 )
    ( on b763 b64 )
    ( on b954 b763 )
    ( clear b954 )
  )
  ( :goal
    ( and
      ( clear b860 )
    )
  )
)
