( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b319 - block
    b639 - block
    b246 - block
    b347 - block
    b791 - block
    b804 - block
    b114 - block
    b47 - block
    b274 - block
    b948 - block
    b408 - block
    b957 - block
    b405 - block
    b398 - block
    b192 - block
    b74 - block
    b552 - block
    b774 - block
    b991 - block
    b787 - block
    b905 - block
    b4 - block
    b57 - block
    b400 - block
    b686 - block
    b622 - block
    b605 - block
    b152 - block
    b445 - block
    b67 - block
    b909 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b319 )
    ( on b639 b319 )
    ( on b246 b639 )
    ( on b347 b246 )
    ( on b791 b347 )
    ( on b804 b791 )
    ( on b114 b804 )
    ( on b47 b114 )
    ( on b274 b47 )
    ( on b948 b274 )
    ( on b408 b948 )
    ( on b957 b408 )
    ( on b405 b957 )
    ( on b398 b405 )
    ( on b192 b398 )
    ( on b74 b192 )
    ( on b552 b74 )
    ( on b774 b552 )
    ( on b991 b774 )
    ( on b787 b991 )
    ( on b905 b787 )
    ( on b4 b905 )
    ( on b57 b4 )
    ( on b400 b57 )
    ( on b686 b400 )
    ( on b622 b686 )
    ( on b605 b622 )
    ( on b152 b605 )
    ( on b445 b152 )
    ( on b67 b445 )
    ( on b909 b67 )
    ( clear b909 )
  )
  ( :goal
    ( and
      ( clear b319 )
    )
  )
)
