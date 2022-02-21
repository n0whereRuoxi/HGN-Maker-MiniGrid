( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b618 - block
    b451 - block
    b511 - block
    b71 - block
    b27 - block
    b290 - block
    b78 - block
    b876 - block
    b104 - block
    b295 - block
    b223 - block
    b833 - block
    b608 - block
    b841 - block
    b531 - block
    b143 - block
    b845 - block
    b51 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b618 )
    ( on b451 b618 )
    ( on b511 b451 )
    ( on b71 b511 )
    ( on b27 b71 )
    ( on b290 b27 )
    ( on b78 b290 )
    ( on b876 b78 )
    ( on b104 b876 )
    ( on b295 b104 )
    ( on b223 b295 )
    ( on b833 b223 )
    ( on b608 b833 )
    ( on b841 b608 )
    ( on b531 b841 )
    ( on b143 b531 )
    ( on b845 b143 )
    ( on b51 b845 )
    ( clear b51 )
  )
  ( :goal
    ( and
      ( clear b618 )
    )
  )
)
