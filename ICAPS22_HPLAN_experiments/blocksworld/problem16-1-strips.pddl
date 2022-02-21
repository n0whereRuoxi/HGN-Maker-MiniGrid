( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b844 - block
    b8 - block
    b228 - block
    b580 - block
    b120 - block
    b243 - block
    b670 - block
    b26 - block
    b842 - block
    b520 - block
    b35 - block
    b288 - block
    b620 - block
    b474 - block
    b295 - block
    b89 - block
    b790 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b844 )
    ( on b8 b844 )
    ( on b228 b8 )
    ( on b580 b228 )
    ( on b120 b580 )
    ( on b243 b120 )
    ( on b670 b243 )
    ( on b26 b670 )
    ( on b842 b26 )
    ( on b520 b842 )
    ( on b35 b520 )
    ( on b288 b35 )
    ( on b620 b288 )
    ( on b474 b620 )
    ( on b295 b474 )
    ( on b89 b295 )
    ( on b790 b89 )
    ( clear b790 )
  )
  ( :goal
    ( and
      ( clear b844 )
    )
  )
)
