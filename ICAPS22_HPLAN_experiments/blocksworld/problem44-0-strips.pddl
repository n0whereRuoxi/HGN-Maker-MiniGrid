( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b613 - block
    b272 - block
    b174 - block
    b715 - block
    b452 - block
    b418 - block
    b245 - block
    b255 - block
    b587 - block
    b29 - block
    b115 - block
    b913 - block
    b588 - block
    b476 - block
    b774 - block
    b544 - block
    b939 - block
    b130 - block
    b187 - block
    b57 - block
    b181 - block
    b185 - block
    b126 - block
    b486 - block
    b355 - block
    b62 - block
    b954 - block
    b250 - block
    b685 - block
    b763 - block
    b97 - block
    b958 - block
    b871 - block
    b311 - block
    b226 - block
    b688 - block
    b327 - block
    b842 - block
    b398 - block
    b136 - block
    b999 - block
    b663 - block
    b25 - block
    b30 - block
    b480 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b613 )
    ( on b272 b613 )
    ( on b174 b272 )
    ( on b715 b174 )
    ( on b452 b715 )
    ( on b418 b452 )
    ( on b245 b418 )
    ( on b255 b245 )
    ( on b587 b255 )
    ( on b29 b587 )
    ( on b115 b29 )
    ( on b913 b115 )
    ( on b588 b913 )
    ( on b476 b588 )
    ( on b774 b476 )
    ( on b544 b774 )
    ( on b939 b544 )
    ( on b130 b939 )
    ( on b187 b130 )
    ( on b57 b187 )
    ( on b181 b57 )
    ( on b185 b181 )
    ( on b126 b185 )
    ( on b486 b126 )
    ( on b355 b486 )
    ( on b62 b355 )
    ( on b954 b62 )
    ( on b250 b954 )
    ( on b685 b250 )
    ( on b763 b685 )
    ( on b97 b763 )
    ( on b958 b97 )
    ( on b871 b958 )
    ( on b311 b871 )
    ( on b226 b311 )
    ( on b688 b226 )
    ( on b327 b688 )
    ( on b842 b327 )
    ( on b398 b842 )
    ( on b136 b398 )
    ( on b999 b136 )
    ( on b663 b999 )
    ( on b25 b663 )
    ( on b30 b25 )
    ( on b480 b30 )
    ( clear b480 )
  )
  ( :goal
    ( and
      ( clear b613 )
    )
  )
)
