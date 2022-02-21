( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b598 - block
    b881 - block
    b13 - block
    b842 - block
    b127 - block
    b500 - block
    b287 - block
    b930 - block
    b677 - block
    b869 - block
    b269 - block
    b704 - block
    b377 - block
    b705 - block
    b533 - block
    b55 - block
    b356 - block
    b530 - block
    b48 - block
    b760 - block
    b180 - block
    b487 - block
    b996 - block
    b91 - block
    b230 - block
    b151 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b598 )
    ( on b881 b598 )
    ( on b13 b881 )
    ( on b842 b13 )
    ( on b127 b842 )
    ( on b500 b127 )
    ( on b287 b500 )
    ( on b930 b287 )
    ( on b677 b930 )
    ( on b869 b677 )
    ( on b269 b869 )
    ( on b704 b269 )
    ( on b377 b704 )
    ( on b705 b377 )
    ( on b533 b705 )
    ( on b55 b533 )
    ( on b356 b55 )
    ( on b530 b356 )
    ( on b48 b530 )
    ( on b760 b48 )
    ( on b180 b760 )
    ( on b487 b180 )
    ( on b996 b487 )
    ( on b91 b996 )
    ( on b230 b91 )
    ( on b151 b230 )
    ( clear b151 )
  )
  ( :goal
    ( and
      ( clear b598 )
    )
  )
)
