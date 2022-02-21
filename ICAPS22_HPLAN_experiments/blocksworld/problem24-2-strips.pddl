( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b177 - block
    b728 - block
    b769 - block
    b542 - block
    b729 - block
    b750 - block
    b632 - block
    b695 - block
    b727 - block
    b8 - block
    b300 - block
    b146 - block
    b264 - block
    b125 - block
    b347 - block
    b375 - block
    b655 - block
    b957 - block
    b361 - block
    b134 - block
    b983 - block
    b128 - block
    b95 - block
    b945 - block
    b537 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b177 )
    ( on b728 b177 )
    ( on b769 b728 )
    ( on b542 b769 )
    ( on b729 b542 )
    ( on b750 b729 )
    ( on b632 b750 )
    ( on b695 b632 )
    ( on b727 b695 )
    ( on b8 b727 )
    ( on b300 b8 )
    ( on b146 b300 )
    ( on b264 b146 )
    ( on b125 b264 )
    ( on b347 b125 )
    ( on b375 b347 )
    ( on b655 b375 )
    ( on b957 b655 )
    ( on b361 b957 )
    ( on b134 b361 )
    ( on b983 b134 )
    ( on b128 b983 )
    ( on b95 b128 )
    ( on b945 b95 )
    ( on b537 b945 )
    ( clear b537 )
  )
  ( :goal
    ( and
      ( clear b177 )
    )
  )
)
