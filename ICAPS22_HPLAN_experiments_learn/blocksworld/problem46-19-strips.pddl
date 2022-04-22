( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b822 - block
    b195 - block
    b83 - block
    b995 - block
    b560 - block
    b347 - block
    b533 - block
    b55 - block
    b747 - block
    b838 - block
    b796 - block
    b28 - block
    b871 - block
    b497 - block
    b978 - block
    b704 - block
    b9 - block
    b149 - block
    b518 - block
    b302 - block
    b706 - block
    b96 - block
    b349 - block
    b593 - block
    b670 - block
    b71 - block
    b888 - block
    b367 - block
    b759 - block
    b606 - block
    b741 - block
    b829 - block
    b645 - block
    b49 - block
    b958 - block
    b842 - block
    b644 - block
    b673 - block
    b176 - block
    b44 - block
    b901 - block
    b933 - block
    b539 - block
    b138 - block
    b199 - block
    b718 - block
    b545 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b822 )
    ( on b195 b822 )
    ( on b83 b195 )
    ( on b995 b83 )
    ( on b560 b995 )
    ( on b347 b560 )
    ( on b533 b347 )
    ( on b55 b533 )
    ( on b747 b55 )
    ( on b838 b747 )
    ( on b796 b838 )
    ( on b28 b796 )
    ( on b871 b28 )
    ( on b497 b871 )
    ( on b978 b497 )
    ( on b704 b978 )
    ( on b9 b704 )
    ( on b149 b9 )
    ( on b518 b149 )
    ( on b302 b518 )
    ( on b706 b302 )
    ( on b96 b706 )
    ( on b349 b96 )
    ( on b593 b349 )
    ( on b670 b593 )
    ( on b71 b670 )
    ( on b888 b71 )
    ( on b367 b888 )
    ( on b759 b367 )
    ( on b606 b759 )
    ( on b741 b606 )
    ( on b829 b741 )
    ( on b645 b829 )
    ( on b49 b645 )
    ( on b958 b49 )
    ( on b842 b958 )
    ( on b644 b842 )
    ( on b673 b644 )
    ( on b176 b673 )
    ( on b44 b176 )
    ( on b901 b44 )
    ( on b933 b901 )
    ( on b539 b933 )
    ( on b138 b539 )
    ( on b199 b138 )
    ( on b718 b199 )
    ( on b545 b718 )
    ( clear b545 )
  )
  ( :goal
    ( and
      ( clear b822 )
    )
  )
)
