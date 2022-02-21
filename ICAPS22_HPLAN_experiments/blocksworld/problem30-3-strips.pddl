( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b985 - block
    b874 - block
    b847 - block
    b205 - block
    b444 - block
    b350 - block
    b566 - block
    b52 - block
    b487 - block
    b365 - block
    b839 - block
    b223 - block
    b238 - block
    b12 - block
    b275 - block
    b710 - block
    b95 - block
    b134 - block
    b313 - block
    b545 - block
    b520 - block
    b395 - block
    b984 - block
    b841 - block
    b28 - block
    b961 - block
    b530 - block
    b954 - block
    b750 - block
    b39 - block
    b326 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b985 )
    ( on b874 b985 )
    ( on b847 b874 )
    ( on b205 b847 )
    ( on b444 b205 )
    ( on b350 b444 )
    ( on b566 b350 )
    ( on b52 b566 )
    ( on b487 b52 )
    ( on b365 b487 )
    ( on b839 b365 )
    ( on b223 b839 )
    ( on b238 b223 )
    ( on b12 b238 )
    ( on b275 b12 )
    ( on b710 b275 )
    ( on b95 b710 )
    ( on b134 b95 )
    ( on b313 b134 )
    ( on b545 b313 )
    ( on b520 b545 )
    ( on b395 b520 )
    ( on b984 b395 )
    ( on b841 b984 )
    ( on b28 b841 )
    ( on b961 b28 )
    ( on b530 b961 )
    ( on b954 b530 )
    ( on b750 b954 )
    ( on b39 b750 )
    ( on b326 b39 )
    ( clear b326 )
  )
  ( :goal
    ( and
      ( clear b985 )
    )
  )
)
