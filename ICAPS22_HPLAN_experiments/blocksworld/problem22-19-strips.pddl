( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b287 - block
    b45 - block
    b166 - block
    b727 - block
    b562 - block
    b6 - block
    b150 - block
    b582 - block
    b755 - block
    b676 - block
    b408 - block
    b359 - block
    b849 - block
    b392 - block
    b136 - block
    b177 - block
    b943 - block
    b78 - block
    b455 - block
    b824 - block
    b257 - block
    b149 - block
    b80 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b287 )
    ( on b45 b287 )
    ( on b166 b45 )
    ( on b727 b166 )
    ( on b562 b727 )
    ( on b6 b562 )
    ( on b150 b6 )
    ( on b582 b150 )
    ( on b755 b582 )
    ( on b676 b755 )
    ( on b408 b676 )
    ( on b359 b408 )
    ( on b849 b359 )
    ( on b392 b849 )
    ( on b136 b392 )
    ( on b177 b136 )
    ( on b943 b177 )
    ( on b78 b943 )
    ( on b455 b78 )
    ( on b824 b455 )
    ( on b257 b824 )
    ( on b149 b257 )
    ( on b80 b149 )
    ( clear b80 )
  )
  ( :goal
    ( and
      ( clear b287 )
    )
  )
)
