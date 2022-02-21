( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b387 - block
    b710 - block
    b88 - block
    b842 - block
    b551 - block
    b758 - block
    b665 - block
    b225 - block
    b681 - block
    b569 - block
    b498 - block
    b271 - block
    b494 - block
    b174 - block
    b970 - block
    b613 - block
    b828 - block
    b963 - block
    b614 - block
    b323 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b387 )
    ( on b710 b387 )
    ( on b88 b710 )
    ( on b842 b88 )
    ( on b551 b842 )
    ( on b758 b551 )
    ( on b665 b758 )
    ( on b225 b665 )
    ( on b681 b225 )
    ( on b569 b681 )
    ( on b498 b569 )
    ( on b271 b498 )
    ( on b494 b271 )
    ( on b174 b494 )
    ( on b970 b174 )
    ( on b613 b970 )
    ( on b828 b613 )
    ( on b963 b828 )
    ( on b614 b963 )
    ( on b323 b614 )
    ( clear b323 )
  )
  ( :goal
    ( and
      ( clear b387 )
    )
  )
)
