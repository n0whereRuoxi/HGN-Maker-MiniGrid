( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b852 - block
    b274 - block
    b488 - block
    b83 - block
    b98 - block
    b661 - block
    b354 - block
    b994 - block
    b410 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b852 )
    ( on b274 b852 )
    ( on b488 b274 )
    ( on b83 b488 )
    ( on b98 b83 )
    ( on b661 b98 )
    ( on b354 b661 )
    ( on b994 b354 )
    ( on b410 b994 )
    ( clear b410 )
  )
  ( :goal
    ( and
      ( clear b852 )
    )
  )
)
