( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b474 - block
    b25 - block
    b101 - block
    b304 - block
    b709 - block
    b49 - block
    b318 - block
    b979 - block
    b225 - block
    b338 - block
    b679 - block
    b284 - block
    b230 - block
    b429 - block
    b772 - block
    b260 - block
    b247 - block
    b760 - block
    b226 - block
    b624 - block
    b467 - block
    b515 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b474 )
    ( on b25 b474 )
    ( on b101 b25 )
    ( on b304 b101 )
    ( on b709 b304 )
    ( on b49 b709 )
    ( on b318 b49 )
    ( on b979 b318 )
    ( on b225 b979 )
    ( on b338 b225 )
    ( on b679 b338 )
    ( on b284 b679 )
    ( on b230 b284 )
    ( on b429 b230 )
    ( on b772 b429 )
    ( on b260 b772 )
    ( on b247 b260 )
    ( on b760 b247 )
    ( on b226 b760 )
    ( on b624 b226 )
    ( on b467 b624 )
    ( on b515 b467 )
    ( clear b515 )
  )
  ( :goal
    ( and
      ( clear b474 )
    )
  )
)
