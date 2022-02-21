( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b879 - block
    b210 - block
    b966 - block
    b126 - block
    b341 - block
    b287 - block
    b815 - block
    b643 - block
    b368 - block
    b361 - block
    b147 - block
    b789 - block
    b582 - block
    b658 - block
    b734 - block
    b904 - block
    b972 - block
    b168 - block
    b347 - block
    b328 - block
    b657 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b879 )
    ( on b210 b879 )
    ( on b966 b210 )
    ( on b126 b966 )
    ( on b341 b126 )
    ( on b287 b341 )
    ( on b815 b287 )
    ( on b643 b815 )
    ( on b368 b643 )
    ( on b361 b368 )
    ( on b147 b361 )
    ( on b789 b147 )
    ( on b582 b789 )
    ( on b658 b582 )
    ( on b734 b658 )
    ( on b904 b734 )
    ( on b972 b904 )
    ( on b168 b972 )
    ( on b347 b168 )
    ( on b328 b347 )
    ( on b657 b328 )
    ( clear b657 )
  )
  ( :goal
    ( and
      ( clear b879 )
    )
  )
)
