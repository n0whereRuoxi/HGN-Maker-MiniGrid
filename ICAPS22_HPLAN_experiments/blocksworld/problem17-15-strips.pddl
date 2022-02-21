( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b778 - block
    b877 - block
    b457 - block
    b315 - block
    b766 - block
    b18 - block
    b261 - block
    b208 - block
    b745 - block
    b894 - block
    b96 - block
    b881 - block
    b973 - block
    b78 - block
    b843 - block
    b677 - block
    b392 - block
    b800 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b778 )
    ( on b877 b778 )
    ( on b457 b877 )
    ( on b315 b457 )
    ( on b766 b315 )
    ( on b18 b766 )
    ( on b261 b18 )
    ( on b208 b261 )
    ( on b745 b208 )
    ( on b894 b745 )
    ( on b96 b894 )
    ( on b881 b96 )
    ( on b973 b881 )
    ( on b78 b973 )
    ( on b843 b78 )
    ( on b677 b843 )
    ( on b392 b677 )
    ( on b800 b392 )
    ( clear b800 )
  )
  ( :goal
    ( and
      ( clear b778 )
    )
  )
)
