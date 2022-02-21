( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b494 - block
    b631 - block
    b51 - block
    b923 - block
    b232 - block
    b331 - block
    b78 - block
    b829 - block
    b760 - block
    b962 - block
    b157 - block
    b326 - block
    b978 - block
    b306 - block
    b41 - block
    b45 - block
    b692 - block
    b982 - block
    b202 - block
    b28 - block
    b622 - block
    b144 - block
    b76 - block
    b256 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b494 )
    ( on b631 b494 )
    ( on b51 b631 )
    ( on b923 b51 )
    ( on b232 b923 )
    ( on b331 b232 )
    ( on b78 b331 )
    ( on b829 b78 )
    ( on b760 b829 )
    ( on b962 b760 )
    ( on b157 b962 )
    ( on b326 b157 )
    ( on b978 b326 )
    ( on b306 b978 )
    ( on b41 b306 )
    ( on b45 b41 )
    ( on b692 b45 )
    ( on b982 b692 )
    ( on b202 b982 )
    ( on b28 b202 )
    ( on b622 b28 )
    ( on b144 b622 )
    ( on b76 b144 )
    ( on b256 b76 )
    ( clear b256 )
  )
  ( :goal
    ( and
      ( clear b494 )
    )
  )
)
