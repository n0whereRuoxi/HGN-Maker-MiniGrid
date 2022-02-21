( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b1 - block
    b65 - block
    b293 - block
    b560 - block
    b12 - block
    b244 - block
    b206 - block
    b985 - block
    b798 - block
    b64 - block
    b854 - block
    b245 - block
    b963 - block
    b809 - block
    b195 - block
    b806 - block
    b156 - block
    b506 - block
    b438 - block
    b614 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b1 )
    ( on b65 b1 )
    ( on b293 b65 )
    ( on b560 b293 )
    ( on b12 b560 )
    ( on b244 b12 )
    ( on b206 b244 )
    ( on b985 b206 )
    ( on b798 b985 )
    ( on b64 b798 )
    ( on b854 b64 )
    ( on b245 b854 )
    ( on b963 b245 )
    ( on b809 b963 )
    ( on b195 b809 )
    ( on b806 b195 )
    ( on b156 b806 )
    ( on b506 b156 )
    ( on b438 b506 )
    ( on b614 b438 )
    ( clear b614 )
  )
  ( :goal
    ( and
      ( clear b1 )
    )
  )
)
