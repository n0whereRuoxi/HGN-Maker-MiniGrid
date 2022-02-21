( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b576 - block
    b510 - block
    b942 - block
    b407 - block
    b256 - block
    b143 - block
    b498 - block
    b728 - block
    b944 - block
    b169 - block
    b341 - block
    b479 - block
    b172 - block
    b588 - block
    b992 - block
    b72 - block
    b359 - block
    b666 - block
    b379 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b576 )
    ( on b510 b576 )
    ( on b942 b510 )
    ( on b407 b942 )
    ( on b256 b407 )
    ( on b143 b256 )
    ( on b498 b143 )
    ( on b728 b498 )
    ( on b944 b728 )
    ( on b169 b944 )
    ( on b341 b169 )
    ( on b479 b341 )
    ( on b172 b479 )
    ( on b588 b172 )
    ( on b992 b588 )
    ( on b72 b992 )
    ( on b359 b72 )
    ( on b666 b359 )
    ( on b379 b666 )
    ( clear b379 )
  )
  ( :goal
    ( and
      ( clear b576 )
    )
  )
)
