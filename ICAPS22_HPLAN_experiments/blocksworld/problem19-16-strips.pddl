( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b306 - block
    b885 - block
    b589 - block
    b25 - block
    b865 - block
    b465 - block
    b870 - block
    b139 - block
    b946 - block
    b260 - block
    b327 - block
    b354 - block
    b271 - block
    b694 - block
    b20 - block
    b578 - block
    b641 - block
    b854 - block
    b346 - block
    b535 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b306 )
    ( on b885 b306 )
    ( on b589 b885 )
    ( on b25 b589 )
    ( on b865 b25 )
    ( on b465 b865 )
    ( on b870 b465 )
    ( on b139 b870 )
    ( on b946 b139 )
    ( on b260 b946 )
    ( on b327 b260 )
    ( on b354 b327 )
    ( on b271 b354 )
    ( on b694 b271 )
    ( on b20 b694 )
    ( on b578 b20 )
    ( on b641 b578 )
    ( on b854 b641 )
    ( on b346 b854 )
    ( on b535 b346 )
    ( clear b535 )
  )
  ( :goal
    ( and
      ( clear b306 )
    )
  )
)
