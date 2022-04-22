( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b53 - block
    b962 - block
    b692 - block
    b413 - block
    b191 - block
    b904 - block
    b118 - block
    b833 - block
    b404 - block
    b781 - block
    b911 - block
    b94 - block
    b462 - block
    b396 - block
    b788 - block
    b321 - block
    b449 - block
    b779 - block
    b461 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b53 )
    ( on b962 b53 )
    ( on b692 b962 )
    ( on b413 b692 )
    ( on b191 b413 )
    ( on b904 b191 )
    ( on b118 b904 )
    ( on b833 b118 )
    ( on b404 b833 )
    ( on b781 b404 )
    ( on b911 b781 )
    ( on b94 b911 )
    ( on b462 b94 )
    ( on b396 b462 )
    ( on b788 b396 )
    ( on b321 b788 )
    ( on b449 b321 )
    ( on b779 b449 )
    ( on b461 b779 )
    ( clear b461 )
  )
  ( :goal
    ( and
      ( clear b53 )
    )
  )
)
