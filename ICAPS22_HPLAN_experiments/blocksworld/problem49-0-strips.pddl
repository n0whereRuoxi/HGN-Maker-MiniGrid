( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b468 - block
    b630 - block
    b729 - block
    b945 - block
    b255 - block
    b912 - block
    b305 - block
    b231 - block
    b477 - block
    b565 - block
    b6 - block
    b197 - block
    b951 - block
    b213 - block
    b146 - block
    b607 - block
    b966 - block
    b624 - block
    b57 - block
    b498 - block
    b409 - block
    b883 - block
    b948 - block
    b429 - block
    b996 - block
    b560 - block
    b862 - block
    b715 - block
    b740 - block
    b475 - block
    b493 - block
    b66 - block
    b463 - block
    b208 - block
    b247 - block
    b352 - block
    b315 - block
    b895 - block
    b870 - block
    b160 - block
    b393 - block
    b277 - block
    b84 - block
    b620 - block
    b726 - block
    b114 - block
    b50 - block
    b852 - block
    b799 - block
    b959 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b468 )
    ( on b630 b468 )
    ( on b729 b630 )
    ( on b945 b729 )
    ( on b255 b945 )
    ( on b912 b255 )
    ( on b305 b912 )
    ( on b231 b305 )
    ( on b477 b231 )
    ( on b565 b477 )
    ( on b6 b565 )
    ( on b197 b6 )
    ( on b951 b197 )
    ( on b213 b951 )
    ( on b146 b213 )
    ( on b607 b146 )
    ( on b966 b607 )
    ( on b624 b966 )
    ( on b57 b624 )
    ( on b498 b57 )
    ( on b409 b498 )
    ( on b883 b409 )
    ( on b948 b883 )
    ( on b429 b948 )
    ( on b996 b429 )
    ( on b560 b996 )
    ( on b862 b560 )
    ( on b715 b862 )
    ( on b740 b715 )
    ( on b475 b740 )
    ( on b493 b475 )
    ( on b66 b493 )
    ( on b463 b66 )
    ( on b208 b463 )
    ( on b247 b208 )
    ( on b352 b247 )
    ( on b315 b352 )
    ( on b895 b315 )
    ( on b870 b895 )
    ( on b160 b870 )
    ( on b393 b160 )
    ( on b277 b393 )
    ( on b84 b277 )
    ( on b620 b84 )
    ( on b726 b620 )
    ( on b114 b726 )
    ( on b50 b114 )
    ( on b852 b50 )
    ( on b799 b852 )
    ( on b959 b799 )
    ( clear b959 )
  )
  ( :goal
    ( and
      ( clear b468 )
    )
  )
)
