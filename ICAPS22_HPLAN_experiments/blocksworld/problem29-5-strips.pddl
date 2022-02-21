( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b762 - block
    b885 - block
    b178 - block
    b650 - block
    b741 - block
    b456 - block
    b640 - block
    b71 - block
    b708 - block
    b810 - block
    b19 - block
    b738 - block
    b371 - block
    b906 - block
    b842 - block
    b427 - block
    b59 - block
    b157 - block
    b771 - block
    b412 - block
    b347 - block
    b155 - block
    b180 - block
    b58 - block
    b216 - block
    b206 - block
    b420 - block
    b900 - block
    b854 - block
    b944 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b762 )
    ( on b885 b762 )
    ( on b178 b885 )
    ( on b650 b178 )
    ( on b741 b650 )
    ( on b456 b741 )
    ( on b640 b456 )
    ( on b71 b640 )
    ( on b708 b71 )
    ( on b810 b708 )
    ( on b19 b810 )
    ( on b738 b19 )
    ( on b371 b738 )
    ( on b906 b371 )
    ( on b842 b906 )
    ( on b427 b842 )
    ( on b59 b427 )
    ( on b157 b59 )
    ( on b771 b157 )
    ( on b412 b771 )
    ( on b347 b412 )
    ( on b155 b347 )
    ( on b180 b155 )
    ( on b58 b180 )
    ( on b216 b58 )
    ( on b206 b216 )
    ( on b420 b206 )
    ( on b900 b420 )
    ( on b854 b900 )
    ( on b944 b854 )
    ( clear b944 )
  )
  ( :goal
    ( and
      ( clear b762 )
    )
  )
)
