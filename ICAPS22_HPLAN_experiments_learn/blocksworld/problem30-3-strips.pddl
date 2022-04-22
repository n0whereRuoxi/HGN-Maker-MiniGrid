( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b955 - block
    b920 - block
    b487 - block
    b746 - block
    b23 - block
    b966 - block
    b455 - block
    b626 - block
    b102 - block
    b640 - block
    b845 - block
    b80 - block
    b238 - block
    b607 - block
    b617 - block
    b522 - block
    b755 - block
    b603 - block
    b963 - block
    b486 - block
    b107 - block
    b869 - block
    b245 - block
    b731 - block
    b712 - block
    b734 - block
    b908 - block
    b841 - block
    b424 - block
    b842 - block
    b350 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b955 )
    ( on b920 b955 )
    ( on b487 b920 )
    ( on b746 b487 )
    ( on b23 b746 )
    ( on b966 b23 )
    ( on b455 b966 )
    ( on b626 b455 )
    ( on b102 b626 )
    ( on b640 b102 )
    ( on b845 b640 )
    ( on b80 b845 )
    ( on b238 b80 )
    ( on b607 b238 )
    ( on b617 b607 )
    ( on b522 b617 )
    ( on b755 b522 )
    ( on b603 b755 )
    ( on b963 b603 )
    ( on b486 b963 )
    ( on b107 b486 )
    ( on b869 b107 )
    ( on b245 b869 )
    ( on b731 b245 )
    ( on b712 b731 )
    ( on b734 b712 )
    ( on b908 b734 )
    ( on b841 b908 )
    ( on b424 b841 )
    ( on b842 b424 )
    ( on b350 b842 )
    ( clear b350 )
  )
  ( :goal
    ( and
      ( clear b955 )
    )
  )
)
