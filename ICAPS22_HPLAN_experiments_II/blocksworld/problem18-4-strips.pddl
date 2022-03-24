( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b339 - block
    b199 - block
    b969 - block
    b414 - block
    b743 - block
    b777 - block
    b323 - block
    b229 - block
    b432 - block
    b13 - block
    b389 - block
    b507 - block
    b575 - block
    b357 - block
    b187 - block
    b756 - block
    b188 - block
    b105 - block
    b451 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b339 )
    ( on b199 b339 )
    ( on b969 b199 )
    ( on b414 b969 )
    ( on b743 b414 )
    ( on b777 b743 )
    ( on b323 b777 )
    ( on b229 b323 )
    ( on b432 b229 )
    ( on b13 b432 )
    ( on b389 b13 )
    ( on b507 b389 )
    ( on b575 b507 )
    ( on b357 b575 )
    ( on b187 b357 )
    ( on b756 b187 )
    ( on b188 b756 )
    ( on b105 b188 )
    ( on b451 b105 )
    ( clear b451 )
  )
  ( :goal
    ( and
      ( clear b339 )
    )
  )
)
