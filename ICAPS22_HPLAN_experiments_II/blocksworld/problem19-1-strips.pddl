( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b221 - block
    b724 - block
    b967 - block
    b663 - block
    b545 - block
    b382 - block
    b841 - block
    b412 - block
    b754 - block
    b577 - block
    b79 - block
    b561 - block
    b985 - block
    b464 - block
    b640 - block
    b809 - block
    b307 - block
    b870 - block
    b916 - block
    b995 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b221 )
    ( on b724 b221 )
    ( on b967 b724 )
    ( on b663 b967 )
    ( on b545 b663 )
    ( on b382 b545 )
    ( on b841 b382 )
    ( on b412 b841 )
    ( on b754 b412 )
    ( on b577 b754 )
    ( on b79 b577 )
    ( on b561 b79 )
    ( on b985 b561 )
    ( on b464 b985 )
    ( on b640 b464 )
    ( on b809 b640 )
    ( on b307 b809 )
    ( on b870 b307 )
    ( on b916 b870 )
    ( on b995 b916 )
    ( clear b995 )
  )
  ( :goal
    ( and
      ( clear b221 )
    )
  )
)
