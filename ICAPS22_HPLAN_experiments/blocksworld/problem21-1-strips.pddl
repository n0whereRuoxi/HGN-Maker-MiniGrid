( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b912 - block
    b748 - block
    b944 - block
    b223 - block
    b652 - block
    b654 - block
    b326 - block
    b824 - block
    b946 - block
    b516 - block
    b19 - block
    b248 - block
    b57 - block
    b556 - block
    b829 - block
    b755 - block
    b667 - block
    b967 - block
    b561 - block
    b793 - block
    b218 - block
    b421 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b912 )
    ( on b748 b912 )
    ( on b944 b748 )
    ( on b223 b944 )
    ( on b652 b223 )
    ( on b654 b652 )
    ( on b326 b654 )
    ( on b824 b326 )
    ( on b946 b824 )
    ( on b516 b946 )
    ( on b19 b516 )
    ( on b248 b19 )
    ( on b57 b248 )
    ( on b556 b57 )
    ( on b829 b556 )
    ( on b755 b829 )
    ( on b667 b755 )
    ( on b967 b667 )
    ( on b561 b967 )
    ( on b793 b561 )
    ( on b218 b793 )
    ( on b421 b218 )
    ( clear b421 )
  )
  ( :goal
    ( and
      ( clear b912 )
    )
  )
)
