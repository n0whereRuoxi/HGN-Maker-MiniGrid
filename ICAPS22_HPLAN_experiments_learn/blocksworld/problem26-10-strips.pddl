( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b588 - block
    b986 - block
    b63 - block
    b367 - block
    b484 - block
    b125 - block
    b693 - block
    b188 - block
    b399 - block
    b51 - block
    b102 - block
    b7 - block
    b159 - block
    b428 - block
    b267 - block
    b256 - block
    b708 - block
    b92 - block
    b838 - block
    b12 - block
    b25 - block
    b892 - block
    b48 - block
    b519 - block
    b235 - block
    b624 - block
    b721 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b588 )
    ( on b986 b588 )
    ( on b63 b986 )
    ( on b367 b63 )
    ( on b484 b367 )
    ( on b125 b484 )
    ( on b693 b125 )
    ( on b188 b693 )
    ( on b399 b188 )
    ( on b51 b399 )
    ( on b102 b51 )
    ( on b7 b102 )
    ( on b159 b7 )
    ( on b428 b159 )
    ( on b267 b428 )
    ( on b256 b267 )
    ( on b708 b256 )
    ( on b92 b708 )
    ( on b838 b92 )
    ( on b12 b838 )
    ( on b25 b12 )
    ( on b892 b25 )
    ( on b48 b892 )
    ( on b519 b48 )
    ( on b235 b519 )
    ( on b624 b235 )
    ( on b721 b624 )
    ( clear b721 )
  )
  ( :goal
    ( and
      ( clear b588 )
    )
  )
)
