( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b365 - block
    b123 - block
    b448 - block
    b759 - block
    b911 - block
    b347 - block
    b49 - block
    b83 - block
    b614 - block
    b775 - block
    b957 - block
    b162 - block
    b681 - block
    b131 - block
    b192 - block
    b329 - block
    b264 - block
    b376 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b365 )
    ( on b123 b365 )
    ( on b448 b123 )
    ( on b759 b448 )
    ( on b911 b759 )
    ( on b347 b911 )
    ( on b49 b347 )
    ( on b83 b49 )
    ( on b614 b83 )
    ( on b775 b614 )
    ( on b957 b775 )
    ( on b162 b957 )
    ( on b681 b162 )
    ( on b131 b681 )
    ( on b192 b131 )
    ( on b329 b192 )
    ( on b264 b329 )
    ( on b376 b264 )
    ( clear b376 )
  )
  ( :goal
    ( and
      ( clear b365 )
    )
  )
)
