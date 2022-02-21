( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b336 - block
    b390 - block
    b591 - block
    b318 - block
    b25 - block
    b136 - block
    b706 - block
    b175 - block
    b750 - block
    b984 - block
    b414 - block
    b455 - block
    b196 - block
    b207 - block
    b242 - block
    b452 - block
    b460 - block
    b405 - block
    b323 - block
    b171 - block
    b225 - block
    b432 - block
    b766 - block
    b349 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b336 )
    ( on b390 b336 )
    ( on b591 b390 )
    ( on b318 b591 )
    ( on b25 b318 )
    ( on b136 b25 )
    ( on b706 b136 )
    ( on b175 b706 )
    ( on b750 b175 )
    ( on b984 b750 )
    ( on b414 b984 )
    ( on b455 b414 )
    ( on b196 b455 )
    ( on b207 b196 )
    ( on b242 b207 )
    ( on b452 b242 )
    ( on b460 b452 )
    ( on b405 b460 )
    ( on b323 b405 )
    ( on b171 b323 )
    ( on b225 b171 )
    ( on b432 b225 )
    ( on b766 b432 )
    ( on b349 b766 )
    ( clear b349 )
  )
  ( :goal
    ( and
      ( clear b336 )
    )
  )
)
