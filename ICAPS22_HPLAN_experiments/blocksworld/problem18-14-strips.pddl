( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b324 - block
    b169 - block
    b389 - block
    b295 - block
    b741 - block
    b249 - block
    b394 - block
    b498 - block
    b100 - block
    b609 - block
    b532 - block
    b782 - block
    b881 - block
    b519 - block
    b946 - block
    b690 - block
    b635 - block
    b42 - block
    b524 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b324 )
    ( on b169 b324 )
    ( on b389 b169 )
    ( on b295 b389 )
    ( on b741 b295 )
    ( on b249 b741 )
    ( on b394 b249 )
    ( on b498 b394 )
    ( on b100 b498 )
    ( on b609 b100 )
    ( on b532 b609 )
    ( on b782 b532 )
    ( on b881 b782 )
    ( on b519 b881 )
    ( on b946 b519 )
    ( on b690 b946 )
    ( on b635 b690 )
    ( on b42 b635 )
    ( on b524 b42 )
    ( clear b524 )
  )
  ( :goal
    ( and
      ( clear b324 )
    )
  )
)
