( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b107 - block
    b969 - block
    b292 - block
    b725 - block
    b125 - block
    b543 - block
    b791 - block
    b796 - block
    b284 - block
    b496 - block
    b305 - block
    b315 - block
    b599 - block
    b851 - block
    b964 - block
    b120 - block
    b978 - block
    b245 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b107 )
    ( on b969 b107 )
    ( on b292 b969 )
    ( on b725 b292 )
    ( on b125 b725 )
    ( on b543 b125 )
    ( on b791 b543 )
    ( on b796 b791 )
    ( on b284 b796 )
    ( on b496 b284 )
    ( on b305 b496 )
    ( on b315 b305 )
    ( on b599 b315 )
    ( on b851 b599 )
    ( on b964 b851 )
    ( on b120 b964 )
    ( on b978 b120 )
    ( on b245 b978 )
    ( clear b245 )
  )
  ( :goal
    ( and
      ( clear b107 )
    )
  )
)
