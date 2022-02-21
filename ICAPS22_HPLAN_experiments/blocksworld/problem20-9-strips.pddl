( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b782 - block
    b872 - block
    b430 - block
    b486 - block
    b615 - block
    b212 - block
    b177 - block
    b260 - block
    b214 - block
    b442 - block
    b8 - block
    b871 - block
    b934 - block
    b680 - block
    b447 - block
    b299 - block
    b926 - block
    b432 - block
    b120 - block
    b273 - block
    b849 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b782 )
    ( on b872 b782 )
    ( on b430 b872 )
    ( on b486 b430 )
    ( on b615 b486 )
    ( on b212 b615 )
    ( on b177 b212 )
    ( on b260 b177 )
    ( on b214 b260 )
    ( on b442 b214 )
    ( on b8 b442 )
    ( on b871 b8 )
    ( on b934 b871 )
    ( on b680 b934 )
    ( on b447 b680 )
    ( on b299 b447 )
    ( on b926 b299 )
    ( on b432 b926 )
    ( on b120 b432 )
    ( on b273 b120 )
    ( on b849 b273 )
    ( clear b849 )
  )
  ( :goal
    ( and
      ( clear b782 )
    )
  )
)
