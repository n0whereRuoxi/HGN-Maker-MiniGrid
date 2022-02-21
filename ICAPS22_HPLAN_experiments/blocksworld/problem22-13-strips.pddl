( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b989 - block
    b481 - block
    b991 - block
    b330 - block
    b236 - block
    b832 - block
    b892 - block
    b12 - block
    b769 - block
    b995 - block
    b643 - block
    b741 - block
    b361 - block
    b894 - block
    b944 - block
    b463 - block
    b239 - block
    b529 - block
    b80 - block
    b2 - block
    b456 - block
    b796 - block
    b257 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b989 )
    ( on b481 b989 )
    ( on b991 b481 )
    ( on b330 b991 )
    ( on b236 b330 )
    ( on b832 b236 )
    ( on b892 b832 )
    ( on b12 b892 )
    ( on b769 b12 )
    ( on b995 b769 )
    ( on b643 b995 )
    ( on b741 b643 )
    ( on b361 b741 )
    ( on b894 b361 )
    ( on b944 b894 )
    ( on b463 b944 )
    ( on b239 b463 )
    ( on b529 b239 )
    ( on b80 b529 )
    ( on b2 b80 )
    ( on b456 b2 )
    ( on b796 b456 )
    ( on b257 b796 )
    ( clear b257 )
  )
  ( :goal
    ( and
      ( clear b989 )
    )
  )
)
