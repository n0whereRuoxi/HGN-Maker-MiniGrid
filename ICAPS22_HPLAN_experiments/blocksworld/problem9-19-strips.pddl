( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b857 - block
    b903 - block
    b540 - block
    b174 - block
    b949 - block
    b780 - block
    b973 - block
    b144 - block
    b651 - block
    b264 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b857 )
    ( on b903 b857 )
    ( on b540 b903 )
    ( on b174 b540 )
    ( on b949 b174 )
    ( on b780 b949 )
    ( on b973 b780 )
    ( on b144 b973 )
    ( on b651 b144 )
    ( on b264 b651 )
    ( clear b264 )
  )
  ( :goal
    ( and
      ( clear b857 )
    )
  )
)
