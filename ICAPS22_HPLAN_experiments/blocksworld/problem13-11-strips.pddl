( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b135 - block
    b346 - block
    b565 - block
    b656 - block
    b326 - block
    b33 - block
    b494 - block
    b109 - block
    b578 - block
    b308 - block
    b77 - block
    b991 - block
    b189 - block
    b285 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b135 )
    ( on b346 b135 )
    ( on b565 b346 )
    ( on b656 b565 )
    ( on b326 b656 )
    ( on b33 b326 )
    ( on b494 b33 )
    ( on b109 b494 )
    ( on b578 b109 )
    ( on b308 b578 )
    ( on b77 b308 )
    ( on b991 b77 )
    ( on b189 b991 )
    ( on b285 b189 )
    ( clear b285 )
  )
  ( :goal
    ( and
      ( clear b135 )
    )
  )
)
