( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b184 - block
    b892 - block
    b900 - block
    b726 - block
    b740 - block
    b852 - block
    b544 - block
    b607 - block
    b34 - block
    b473 - block
    b536 - block
    b305 - block
    b196 - block
    b953 - block
    b526 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b184 )
    ( on b892 b184 )
    ( on b900 b892 )
    ( on b726 b900 )
    ( on b740 b726 )
    ( on b852 b740 )
    ( on b544 b852 )
    ( on b607 b544 )
    ( on b34 b607 )
    ( on b473 b34 )
    ( on b536 b473 )
    ( on b305 b536 )
    ( on b196 b305 )
    ( on b953 b196 )
    ( on b526 b953 )
    ( clear b526 )
  )
  ( :goal
    ( and
      ( clear b184 )
    )
  )
)
