( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b713 - block
    b376 - block
    b110 - block
    b109 - block
    b899 - block
    b545 - block
    b207 - block
    b844 - block
    b783 - block
    b659 - block
    b228 - block
    b263 - block
    b492 - block
    b144 - block
    b650 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b713 )
    ( on b376 b713 )
    ( on b110 b376 )
    ( on b109 b110 )
    ( on b899 b109 )
    ( on b545 b899 )
    ( on b207 b545 )
    ( on b844 b207 )
    ( on b783 b844 )
    ( on b659 b783 )
    ( on b228 b659 )
    ( on b263 b228 )
    ( on b492 b263 )
    ( on b144 b492 )
    ( on b650 b144 )
    ( clear b650 )
  )
  ( :goal
    ( and
      ( clear b713 )
    )
  )
)
