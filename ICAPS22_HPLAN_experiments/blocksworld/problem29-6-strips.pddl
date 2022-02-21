( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b810 - block
    b516 - block
    b771 - block
    b869 - block
    b412 - block
    b329 - block
    b225 - block
    b953 - block
    b546 - block
    b247 - block
    b501 - block
    b866 - block
    b726 - block
    b163 - block
    b408 - block
    b792 - block
    b981 - block
    b518 - block
    b367 - block
    b685 - block
    b197 - block
    b657 - block
    b366 - block
    b826 - block
    b348 - block
    b815 - block
    b904 - block
    b623 - block
    b561 - block
    b145 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b810 )
    ( on b516 b810 )
    ( on b771 b516 )
    ( on b869 b771 )
    ( on b412 b869 )
    ( on b329 b412 )
    ( on b225 b329 )
    ( on b953 b225 )
    ( on b546 b953 )
    ( on b247 b546 )
    ( on b501 b247 )
    ( on b866 b501 )
    ( on b726 b866 )
    ( on b163 b726 )
    ( on b408 b163 )
    ( on b792 b408 )
    ( on b981 b792 )
    ( on b518 b981 )
    ( on b367 b518 )
    ( on b685 b367 )
    ( on b197 b685 )
    ( on b657 b197 )
    ( on b366 b657 )
    ( on b826 b366 )
    ( on b348 b826 )
    ( on b815 b348 )
    ( on b904 b815 )
    ( on b623 b904 )
    ( on b561 b623 )
    ( on b145 b561 )
    ( clear b145 )
  )
  ( :goal
    ( and
      ( clear b810 )
    )
  )
)
