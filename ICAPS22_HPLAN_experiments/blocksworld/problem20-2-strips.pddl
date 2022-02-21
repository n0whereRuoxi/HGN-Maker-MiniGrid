( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b873 - block
    b778 - block
    b331 - block
    b610 - block
    b190 - block
    b998 - block
    b450 - block
    b260 - block
    b582 - block
    b234 - block
    b724 - block
    b551 - block
    b123 - block
    b61 - block
    b81 - block
    b841 - block
    b834 - block
    b969 - block
    b498 - block
    b17 - block
    b309 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b873 )
    ( on b778 b873 )
    ( on b331 b778 )
    ( on b610 b331 )
    ( on b190 b610 )
    ( on b998 b190 )
    ( on b450 b998 )
    ( on b260 b450 )
    ( on b582 b260 )
    ( on b234 b582 )
    ( on b724 b234 )
    ( on b551 b724 )
    ( on b123 b551 )
    ( on b61 b123 )
    ( on b81 b61 )
    ( on b841 b81 )
    ( on b834 b841 )
    ( on b969 b834 )
    ( on b498 b969 )
    ( on b17 b498 )
    ( on b309 b17 )
    ( clear b309 )
  )
  ( :goal
    ( and
      ( clear b873 )
    )
  )
)
