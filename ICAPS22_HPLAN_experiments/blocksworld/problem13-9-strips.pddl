( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b894 - block
    b574 - block
    b449 - block
    b866 - block
    b575 - block
    b125 - block
    b482 - block
    b722 - block
    b187 - block
    b221 - block
    b436 - block
    b906 - block
    b216 - block
    b921 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b894 )
    ( on b574 b894 )
    ( on b449 b574 )
    ( on b866 b449 )
    ( on b575 b866 )
    ( on b125 b575 )
    ( on b482 b125 )
    ( on b722 b482 )
    ( on b187 b722 )
    ( on b221 b187 )
    ( on b436 b221 )
    ( on b906 b436 )
    ( on b216 b906 )
    ( on b921 b216 )
    ( clear b921 )
  )
  ( :goal
    ( and
      ( clear b894 )
    )
  )
)
