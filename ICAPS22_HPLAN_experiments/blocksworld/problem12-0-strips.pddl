( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b121 - block
    b183 - block
    b25 - block
    b582 - block
    b271 - block
    b619 - block
    b283 - block
    b3 - block
    b508 - block
    b569 - block
    b624 - block
    b630 - block
    b175 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b121 )
    ( on b183 b121 )
    ( on b25 b183 )
    ( on b582 b25 )
    ( on b271 b582 )
    ( on b619 b271 )
    ( on b283 b619 )
    ( on b3 b283 )
    ( on b508 b3 )
    ( on b569 b508 )
    ( on b624 b569 )
    ( on b630 b624 )
    ( on b175 b630 )
    ( clear b175 )
  )
  ( :goal
    ( and
      ( clear b121 )
    )
  )
)
