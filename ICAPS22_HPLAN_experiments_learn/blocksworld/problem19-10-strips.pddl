( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b235 - block
    b920 - block
    b457 - block
    b557 - block
    b310 - block
    b897 - block
    b98 - block
    b991 - block
    b268 - block
    b989 - block
    b509 - block
    b566 - block
    b202 - block
    b821 - block
    b333 - block
    b401 - block
    b220 - block
    b543 - block
    b47 - block
    b302 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b235 )
    ( on b920 b235 )
    ( on b457 b920 )
    ( on b557 b457 )
    ( on b310 b557 )
    ( on b897 b310 )
    ( on b98 b897 )
    ( on b991 b98 )
    ( on b268 b991 )
    ( on b989 b268 )
    ( on b509 b989 )
    ( on b566 b509 )
    ( on b202 b566 )
    ( on b821 b202 )
    ( on b333 b821 )
    ( on b401 b333 )
    ( on b220 b401 )
    ( on b543 b220 )
    ( on b47 b543 )
    ( on b302 b47 )
    ( clear b302 )
  )
  ( :goal
    ( and
      ( clear b235 )
    )
  )
)
