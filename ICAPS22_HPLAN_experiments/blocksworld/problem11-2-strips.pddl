( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b773 - block
    b827 - block
    b82 - block
    b441 - block
    b791 - block
    b879 - block
    b558 - block
    b17 - block
    b230 - block
    b414 - block
    b904 - block
    b394 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b773 )
    ( on b827 b773 )
    ( on b82 b827 )
    ( on b441 b82 )
    ( on b791 b441 )
    ( on b879 b791 )
    ( on b558 b879 )
    ( on b17 b558 )
    ( on b230 b17 )
    ( on b414 b230 )
    ( on b904 b414 )
    ( on b394 b904 )
    ( clear b394 )
  )
  ( :goal
    ( and
      ( clear b773 )
    )
  )
)
