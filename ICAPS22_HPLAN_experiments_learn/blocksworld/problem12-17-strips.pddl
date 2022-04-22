( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b277 - block
    b109 - block
    b826 - block
    b147 - block
    b457 - block
    b778 - block
    b613 - block
    b853 - block
    b508 - block
    b130 - block
    b352 - block
    b127 - block
    b800 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b277 )
    ( on b109 b277 )
    ( on b826 b109 )
    ( on b147 b826 )
    ( on b457 b147 )
    ( on b778 b457 )
    ( on b613 b778 )
    ( on b853 b613 )
    ( on b508 b853 )
    ( on b130 b508 )
    ( on b352 b130 )
    ( on b127 b352 )
    ( on b800 b127 )
    ( clear b800 )
  )
  ( :goal
    ( and
      ( clear b277 )
    )
  )
)
