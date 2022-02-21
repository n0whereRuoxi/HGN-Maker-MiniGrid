( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b318 - block
    b851 - block
    b206 - block
    b439 - block
    b609 - block
    b262 - block
    b961 - block
    b901 - block
    b738 - block
    b797 - block
    b373 - block
    b778 - block
    b947 - block
    b153 - block
    b210 - block
    b41 - block
    b782 - block
    b838 - block
    b915 - block
    b472 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b318 )
    ( on b851 b318 )
    ( on b206 b851 )
    ( on b439 b206 )
    ( on b609 b439 )
    ( on b262 b609 )
    ( on b961 b262 )
    ( on b901 b961 )
    ( on b738 b901 )
    ( on b797 b738 )
    ( on b373 b797 )
    ( on b778 b373 )
    ( on b947 b778 )
    ( on b153 b947 )
    ( on b210 b153 )
    ( on b41 b210 )
    ( on b782 b41 )
    ( on b838 b782 )
    ( on b915 b838 )
    ( on b472 b915 )
    ( clear b472 )
  )
  ( :goal
    ( and
      ( clear b318 )
    )
  )
)
