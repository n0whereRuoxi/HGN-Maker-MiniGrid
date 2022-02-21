( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b144 - block
    b42 - block
    b673 - block
    b792 - block
    b156 - block
    b112 - block
    b883 - block
    b936 - block
    b681 - block
    b929 - block
    b888 - block
    b289 - block
    b809 - block
    b915 - block
    b713 - block
    b850 - block
    b563 - block
    b304 - block
    b632 - block
    b737 - block
    b808 - block
    b140 - block
    b228 - block
    b636 - block
    b454 - block
    b257 - block
    b942 - block
    b22 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b144 )
    ( on b42 b144 )
    ( on b673 b42 )
    ( on b792 b673 )
    ( on b156 b792 )
    ( on b112 b156 )
    ( on b883 b112 )
    ( on b936 b883 )
    ( on b681 b936 )
    ( on b929 b681 )
    ( on b888 b929 )
    ( on b289 b888 )
    ( on b809 b289 )
    ( on b915 b809 )
    ( on b713 b915 )
    ( on b850 b713 )
    ( on b563 b850 )
    ( on b304 b563 )
    ( on b632 b304 )
    ( on b737 b632 )
    ( on b808 b737 )
    ( on b140 b808 )
    ( on b228 b140 )
    ( on b636 b228 )
    ( on b454 b636 )
    ( on b257 b454 )
    ( on b942 b257 )
    ( on b22 b942 )
    ( clear b22 )
  )
  ( :goal
    ( and
      ( clear b144 )
    )
  )
)
