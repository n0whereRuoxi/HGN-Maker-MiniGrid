( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b649 - block
    b124 - block
    b283 - block
    b188 - block
    b231 - block
    b569 - block
    b65 - block
    b843 - block
    b449 - block
    b874 - block
    b549 - block
    b612 - block
    b272 - block
    b731 - block
    b780 - block
    b512 - block
    b844 - block
    b586 - block
    b899 - block
    b840 - block
    b171 - block
    b473 - block
    b798 - block
    b215 - block
    b146 - block
    b399 - block
    b767 - block
    b591 - block
    b880 - block
    b486 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b649 )
    ( on b124 b649 )
    ( on b283 b124 )
    ( on b188 b283 )
    ( on b231 b188 )
    ( on b569 b231 )
    ( on b65 b569 )
    ( on b843 b65 )
    ( on b449 b843 )
    ( on b874 b449 )
    ( on b549 b874 )
    ( on b612 b549 )
    ( on b272 b612 )
    ( on b731 b272 )
    ( on b780 b731 )
    ( on b512 b780 )
    ( on b844 b512 )
    ( on b586 b844 )
    ( on b899 b586 )
    ( on b840 b899 )
    ( on b171 b840 )
    ( on b473 b171 )
    ( on b798 b473 )
    ( on b215 b798 )
    ( on b146 b215 )
    ( on b399 b146 )
    ( on b767 b399 )
    ( on b591 b767 )
    ( on b880 b591 )
    ( on b486 b880 )
    ( clear b486 )
  )
  ( :goal
    ( and
      ( clear b649 )
    )
  )
)
