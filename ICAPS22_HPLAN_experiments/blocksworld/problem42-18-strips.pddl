( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b355 - block
    b959 - block
    b673 - block
    b167 - block
    b629 - block
    b61 - block
    b853 - block
    b833 - block
    b104 - block
    b340 - block
    b328 - block
    b923 - block
    b254 - block
    b105 - block
    b803 - block
    b76 - block
    b357 - block
    b83 - block
    b51 - block
    b901 - block
    b957 - block
    b975 - block
    b725 - block
    b209 - block
    b705 - block
    b162 - block
    b235 - block
    b366 - block
    b293 - block
    b252 - block
    b151 - block
    b402 - block
    b131 - block
    b236 - block
    b872 - block
    b390 - block
    b603 - block
    b687 - block
    b359 - block
    b776 - block
    b685 - block
    b296 - block
    b599 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b355 )
    ( on b959 b355 )
    ( on b673 b959 )
    ( on b167 b673 )
    ( on b629 b167 )
    ( on b61 b629 )
    ( on b853 b61 )
    ( on b833 b853 )
    ( on b104 b833 )
    ( on b340 b104 )
    ( on b328 b340 )
    ( on b923 b328 )
    ( on b254 b923 )
    ( on b105 b254 )
    ( on b803 b105 )
    ( on b76 b803 )
    ( on b357 b76 )
    ( on b83 b357 )
    ( on b51 b83 )
    ( on b901 b51 )
    ( on b957 b901 )
    ( on b975 b957 )
    ( on b725 b975 )
    ( on b209 b725 )
    ( on b705 b209 )
    ( on b162 b705 )
    ( on b235 b162 )
    ( on b366 b235 )
    ( on b293 b366 )
    ( on b252 b293 )
    ( on b151 b252 )
    ( on b402 b151 )
    ( on b131 b402 )
    ( on b236 b131 )
    ( on b872 b236 )
    ( on b390 b872 )
    ( on b603 b390 )
    ( on b687 b603 )
    ( on b359 b687 )
    ( on b776 b359 )
    ( on b685 b776 )
    ( on b296 b685 )
    ( on b599 b296 )
    ( clear b599 )
  )
  ( :goal
    ( and
      ( clear b355 )
    )
  )
)
