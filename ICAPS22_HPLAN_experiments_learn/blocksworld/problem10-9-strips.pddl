( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b430 - block
    b424 - block
    b212 - block
    b142 - block
    b208 - block
    b788 - block
    b116 - block
    b89 - block
    b902 - block
    b507 - block
    b447 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b430 )
    ( on b424 b430 )
    ( on b212 b424 )
    ( on b142 b212 )
    ( on b208 b142 )
    ( on b788 b208 )
    ( on b116 b788 )
    ( on b89 b116 )
    ( on b902 b89 )
    ( on b507 b902 )
    ( on b447 b507 )
    ( clear b447 )
  )
  ( :goal
    ( and
      ( clear b430 )
    )
  )
)
